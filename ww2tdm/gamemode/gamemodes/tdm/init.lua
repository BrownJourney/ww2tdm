CVAR_WIN_TICKETS = 200
CVAR_TIME_PREPARE = 20
CVAR_TIME_ENDING = 15
CVAR_TIME_DURATION = 300
CVAR_MAX_ROUNDS = 5
CVAR_ZONE_TIME = 5
CVAR_NO_FLAG_TICKETS = true
-- CVAR_GAMEMODE_KITS = {
-- 	{
-- 		[FACTION_USSR] = "rus_rifle_mosin_carbine",
-- 		[FACTION_GERMANY] = "ger_rifle_kar98",
-- 		[FACTION_USA] = "usa_rifle_springfield"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_smg_pps43",
-- 		[FACTION_GERMANY] = "ger_smg_mp40",
-- 		[FACTION_USA] = "usa_smg_greasegun"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_battlerifle_as44",
-- 		[FACTION_GERMANY] = "ger_battlerifle_fg42",
-- 		[FACTION_USA] = "usa_mg_bar"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_smg_korovin",
-- 		[FACTION_GERMANY] = "ger_battlerifle_mkb42",
-- 		[FACTION_USA] = "usa_battlerifle_m1a1"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_semiauto_svt40",
-- 		[FACTION_GERMANY] = "ger_semiauto_g41",
-- 		[FACTION_USA] = "usa_battlerifle_garand"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_pistol_tokarev",
-- 		[FACTION_GERMANY] = "ger_pistol_p38",
-- 		[FACTION_USA] = "usa_pistol_m1911"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_revolver_nagan",
-- 		[FACTION_GERMANY] = "ger_revolver_reichrevolver",
-- 		[FACTION_USA] = "usa_revolver_sw1917"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_smg_ppsh41",
-- 		[FACTION_GERMANY] = "ger_smg_mp41",
-- 		[FACTION_USA] = "usa_smg_thompson"
-- 	},
-- 	{
-- 		[FACTION_USSR] = "rus_rifle_mosin_obrez",
-- 		[FACTION_GERMANY] = "ger_sniperrifle_sdk",
-- 		[FACTION_USA] = "usa_rifle_winchester94"
-- 	}
-- }

function MODE:GamemodeInitialize()
	gamestate.Init()
end

function MODE:OnGameState(oldState, newState)
	if newState == GS_WAITING_PLAYERS then
		gamestate.SetRound(0)
		gamestate.SetRoundTime(0)
		gamestate.SetWinner(0)
	elseif newState == GS_ROUND_PREPARE then
		self:PrepareEntities()

		gamestate.SetArea(gamestate.GetArea() + 1)

		self:DoBalance()
		-- self:SetRandomKit()
		self:PreparePlayers(true)

		gamestate.SetWinner(0)
		gamestate.SetReason('')
		gamestate.SetTickets(TEAM_AXIS, CVAR_WIN_TICKETS)
		gamestate.SetTickets(TEAM_ALLIES, CVAR_WIN_TICKETS)
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_PREPARE)
		gamestate.SetRound(gamestate.GetRound() + 1)
	elseif newState == GS_ROUND_PLAYING then
		self:FreezePlayers(false, true, false)
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_DURATION)
	elseif newState == GS_ROUND_END then
		if gamestate.GetWinner() == WINNER_NONE then
			if self:CountAlivePlayers(TEAM_AXIS) > self:CountAlivePlayers(TEAM_ALLIES) then
				gamestate.TerminateRound(TEAM_AXIS, REASON_DEATH)
			elseif self:CountAlivePlayers(TEAM_ALLIES) > self:CountAlivePlayers(TEAM_AXIS) then
				gamestate.TerminateRound(TEAM_ALLIES, REASON_DEATH)
			end
		end

		team.AddScore(gamestate.GetWinner(), 1)

		self:FreezePlayers(true, true, true)

		gamestate.SetRoundTime(CurTime() + CVAR_TIME_ENDING)

		ShowPlayerRewards()
	elseif newState == GS_GAME_OVER then
		MapSelection()
	end
end

function MODE:OneSecond()
	if !self:CanStart() and gamestate.Get() != GS_WAITING_PLAYERS then
		gamestate.Switch(GS_WAITING_PLAYERS)
		print("WAIT FOR PLAYERS")
	elseif gamestate.Get() == GS_WAITING_PLAYERS or gamestate.Get() == -1 then
		if self:CanStart() then
			gamestate.Switch(GS_ROUND_PREPARE)
			print("START PREPARE")
		end
	elseif gamestate.Get() == GS_ROUND_PREPARE then
		if CurTime() >= gamestate.GetRoundTime() then
			gamestate.Switch(GS_ROUND_PLAYING)
			print("NOW PLAYING")
		end
	elseif gamestate.Get() == GS_ROUND_PLAYING then
		if CurTime() >= gamestate.GetRoundTime() then
			gamestate.Switch(GS_ROUND_END)
			print("NOW ENDING")
		end
	elseif gamestate.Get() == GS_ROUND_END then
		if CurTime() >= gamestate.GetRoundTime() then
			if team.GetScore(TEAM_ALLIES) >= CVAR_MAX_ROUNDS or team.GetScore(TEAM_AXIS) >= CVAR_MAX_ROUNDS then
				gamestate.Switch(GS_GAME_OVER)
			else
				gamestate.Switch(-1)
			end
		end
	end
end

function MODE:PreparePlayers(freeze)
	for k, ply in pairs(player.GetAll()) do
		if ply:IsAlive() then
			ply:KillSilent()
		end
		
		ply:Freeze(false)
		
		ply._Voiced = false
		ply.Killed = 0

		ply:SetFrags(0)
		ply:SetDeaths(0)
		ply:CloseAllUI({'noclose'})
		ply:InitProgression()

		ply:Deploy(true)
	end
end

function MODE:PlayerDeployed(ply)
	-- ply.SelectedKit = self.SelectedKit
end

function MODE:PrepareEntities()
	for k, v in pairs(ents.FindByClass("ww2_point_flag")) do
		v:SetControlledBy(0)
	end

	game.CleanUpMap(false, {"ww2_point_flag"})
end

function MODE:DisableGodPlayers()
	for k, ply in pairs(player.GetAll()) do
		if ply:Team() != TEAM_AXIS and ply:Team() != TEAM_ALLIES then continue end
		
		ply:GodDisable()
	end
end

function MODE:FreezePlayers(bool, all, full)
	for k, ply in pairs(player.GetAll()) do
		if !all and (ply:Team() != TEAM_AXIS and ply:Team() != TEAM_ALLIES) then continue end
		
		ply:SetFreezed(bool)
		if full then
			ply:Freeze(true)
		else
			ply:Freeze(false)
		end
	end
end

function MODE:TeamFreeze(bool, teamID)
	for k, ply in pairs(player.GetAll()) do
		if ply:Team() != teamID then continue end
		
		ply:SetFreezed(bool)
	end
end

function MODE:DoBalance()
	teams.MakeBalance()
end

function MODE:OnGameArea(area)
	local callback = gamestate.areas[area]
	if !callback then
		callback = gamestate.areas[1]
	end

	callback()
end

function MODE:ChangeTeam(teamPlayers)
	for k, ply in pairs(teamPlayers) do
		ply:SetTeam(ply:Team() == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS)
	end
end

function MODE:CountAlivePlayers(teamID)
	local count = 0
	for k, v in pairs(team.GetPlayers(teamID)) do
		if v:IsAlive() then
			count = count + 1
		end
	end
	return count
end

function MODE:OnPointCaptured(playersList, teamID)
	gamestate.TerminateRound(teamID, REASON_CAPTURE)
end

function MODE:SetRandomKit()
	if CFG.MandatoryEquipment then
		self.SelectedKit = CFG.MandatoryEquipment
		self.LastID = -1
		CFG.MandatoryEquipment = nil;
		return
	end

	local randomID = math.random(1, #CVAR_GAMEMODE_KITS)
	if randomID == self.LastID then
		randomID = randomID + 1
		if randomID > #CVAR_GAMEMODE_KITS then
			randomID = 1
		end
	end

	self.SelectedKit = CVAR_GAMEMODE_KITS[randomID]
	self.LastID = randomID
end

function MODE:PlayerDeath(ply)
	local teamID = ply:Team()
	local oppositeTeam = teamID == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS
	if self:CountAlivePlayers(teamID) == 0 then
		gamestate.TerminateRound(oppositeTeam, REASON_DEATH)
	end
end

function MODE:DeployTeam(teamID)
	for k, v in pairs(teamID and team.GetPlayers(teamID) or player.GetAll()) do
		if v:GetNWBool('b_SpawnReady') and !v:IsAlive() and !teamID then
			v:SetNetBool("b_PassedWave", true)
			v:Deploy()
		else
			if (!v:GetNWBool('DeathScreen') and !v:IsAlive()) or teamID then
				v:SetNetBool('b_PassedWave', true)
			end
		end
	end
end

function MODE:CanStart()
	return gamestate.CanStart(MODE)
end

function MODE:CheckWinConditions()
	return false
end