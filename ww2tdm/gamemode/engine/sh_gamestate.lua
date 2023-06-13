gamestate = gamestate or {}

GS_WAITING_PLAYERS = 0
GS_ROUND_PREPARE = 1
GS_ROUND_PRE_PLAYING = 2
GS_ROUND_PLAYING = 3
GS_ROUND_END = 4
GS_GAME_OVER = 5

WINNER_NONE = 0
WINNER_ALLIES = 1
WINNER_AXIS = 2

REASON_DRAW = 'reason_draw'
REASON_TICKETS = 'reason_tickets'
REASON_TIMEOVER = 'reason_timeover'
REASON_PUSH_TICKETS = 'reason_push_tickets'
REASON_PUSH = 'reason_push'
REASON_DEATH = 'reason_death'
REASON_CAPTURE = 'reason_capture'

gamestate.stages = gamestate.stages or {}
gamestate.areas = gamestate.areas or {}

local lastGS = -1
if SERVER then
	util.AddNetworkString("gamestate.Update")
	util.AddNetworkString("gamestate.Stage")

	function gamestate.Init(noTickets)
		gamestate.SetRound(0)
		gamestate.SetRoundTime(0)
		gamestate.SetWinner(0)

		SetWorldInt("GS_CURRENT", -1)

		if !noTickets then
			hook.Run("OnInitTickets")
		end
	end

	function gamestate.SetTickets(teamID, int)
		SetWorldInt("GS_TICKETS"..teamID, int)
	end

	function gamestate.TakeTickets(teamID, int)
		SetWorldInt("GS_TICKETS"..teamID, gamestate.GetTickets(teamID) - int)

		for k, ply in pairs(team.GetPlayers(teamID)) do
			ply.TicketsTaken[teamID] = (ply.TicketsTaken[teamID] or 0) + int
		end
	end

	function gamestate.GetInitialTickets()
		return CFG.Tickets or CVAR_WIN_TICKETS
	end

	function gamestate.SetWinner(int)
		SetWorldInt("GS_WINNER", int)

		if faction.GetID(int) then
			if CVAR_NO_FLAG_TICKETS then
				for k, v in pairs(team.GetPlayers(int)) do
					v:AddXP("winner")
				end
			else
				for k, v in pairs(player.GetAll()) do
					local ticketsEarned = v.TicketsTaken[int] or 0
					if v:Team() == int then
						if ticketsEarned / gamestate.GetInitialTickets() < 0.45 then
							continue
						end
					else
						if !v.autobalanced then
							continue
						end
						
						if ticketsEarned / gamestate.GetInitialTickets() < 0.85 then
							continue
						end
					end

					v:AddXP("winner")
				end
			end
		end
	end

	function gamestate.SetRound(int)
		SetWorldInt("GS_ROUND", int)
	end

	function gamestate.SetRoundTime(float)
		SetWorldFloat("GS_ROUNDTIME", float)
	end

	function gamestate.SetReason(str)
		SetWorldString("GS_REASON", str)
	end

	function gamestate.SetArea(int)
		if int > #gamestate.areas then
			int = 1
		end

		SetWorldInt("GS_AREA", int)
		hook.Run("OnGameArea", int)
	end

	function gamestate.TerminateRound(winner, reason)
		gamestate.SetWinner(winner)
		gamestate.SetReason(reason or '')
		gamestate.Switch(GS_ROUND_END)

		faction.SendVoice("game_won", winner, true)
		faction.SendVoice("game_lost", winner == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS, true)
	end

	function gamestate.SetStage(int)
		SetWorldInt("GS_STAGE", int)

		hook.Run("OnGameStage", int)

		net.Start("gamestate.Stage")
		net.Broadcast()
	end

	function gamestate.Switch(gamestate)
		SetWorldInt("GS_CURRENT", gamestate)

		hook.Run("OnGameState", lastGS, gamestate)
		lastGS = gamestate

		net.Start("gamestate.Update")
		net.Broadcast()
	end
else
	net.Receive("gamestate.Update", function()
		local GS = gamestate.Get()
		hook.Run("OnGameState", lastGS, GS)

		lastGS = GS
	end)

	net.Receive("gamestate.Stage", function()
		hook.Run("OnGameStage", gamestate.GetStage())
	end)
end

function gamestate.GetWinner()
	return GetGlobalInt("GS_WINNER")
end

function gamestate.GetTickets(teamID)
	return math.max(GetGlobalInt("GS_TICKETS"..teamID) or 0, 0)
end

function gamestate.GetRound()
	return GetGlobalInt("GS_ROUND")
end

function gamestate.GetRoundTime()
	return GetGlobalInt("GS_ROUNDTIME")
end

function gamestate.GetStage()
	return GetGlobalInt("GS_STAGE")
end

function gamestate.Get()
	return GetGlobalInt("GS_CURRENT")
end

function gamestate.GetReason()
	return GetGlobalString("GS_REASON")
end

function gamestate.GetArea()
	return GetGlobalInt("GS_AREA", 0)
end

--[[-------------------------------------------------------------------------
BASE FUNCTIONS
---------------------------------------------------------------------------]]

function gamestate.CanStart(self)
	local axisCount = #team.GetPlayers(TEAM_AXIS)
	local alliesCount = #team.GetPlayers(TEAM_ALLIES)

	if CVAR_NOTEAMS then
		return player.GetCount() > 2
	else
		return (axisCount > 1 and alliesCount > 1)
	end
end

gamestate.Capture = {}

local b_MidMusic = false
local b_EndMusic = false
function gamestate.Capture.CheckWinConditions(self)
	if gamestate.Get() != GS_ROUND_PLAYING then 
		return false 
	end
	
	local winner = WINNER_NONE
	local ticketsAxis = gamestate.GetTickets(TEAM_AXIS) <= 0
	local ticketsAllies = gamestate.GetTickets(TEAM_ALLIES) <= 0

	if CFG.MapSoundtrack and !b_MidMusic then
		if gamestate.GetTickets(TEAM_AXIS) <= CVAR_WIN_TICKETS / 2 or gamestate.GetTickets(TEAM_ALLIES) <= CVAR_WIN_TICKETS / 2 then
			b_MidMusic = true
			SOUNDS.PlaySound(CFG.MapSoundtrack, "midmusic", player.GetAll(), SOUNDS.MaxMusicVolume)
		end
	end

	if gamestate.GetTickets(TEAM_AXIS) <= 100 or gamestate.GetTickets(TEAM_ALLIES) <= 100 then
		if !b_EndMusic then
			SOUNDS.StopSound("midmusic", true)
			b_EndMusic = true
			SOUNDS.PlayTeam(TEAM_AXIS, "winning", SOUNDS.MaxMusicVolume)
			SOUNDS.PlayTeam(TEAM_ALLIES, "winning", SOUNDS.MaxMusicVolume)
		end
	end

	if ticketsAxis or ticketsAllies then
		if gamestate.GetTickets(TEAM_AXIS) == gamestate.GetTickets(TEAM_ALLIES) then
			gamestate.TerminateRound(winner, REASON_DRAW)
			return
		end

		if ticketsAxis then
			print("WINNER_ALLIES")
			winner = TEAM_ALLIES
		else
			print("WINNER_AXIS")
			winner = TEAM_AXIS
		end

		gamestate.TerminateRound(winner, REASON_TICKETS)
		return true
	end

	return false
end

function gamestate.Capture.LaunchTickets(self, bool)
	if bool then
		local maxFlags = #ents.FindByClass('ww2_point_flag')
		local defaultTimerLength = 7
		timer.Create("WW2_ticket", defaultTimerLength / math.max(defaultTimerLength - maxFlags, 1), 0, function()
			local allies = self:GetPoints(TEAM_ALLIES)
			local axis = self:GetPoints(TEAM_AXIS)

			if allies == maxFlags then
				axis = -maxFlags * 2
			elseif axis == maxFlags then
				allies = -maxFlags * 2
			end

			gamestate.TakeTickets(TEAM_AXIS, maxFlags - axis)
			gamestate.TakeTickets(TEAM_ALLIES, maxFlags - allies)

			self:CheckWinConditions()
		end)
	else
		if timer.Exists("WW2_ticket") then
			timer.Destroy("WW2_ticket")
		end
	end
end