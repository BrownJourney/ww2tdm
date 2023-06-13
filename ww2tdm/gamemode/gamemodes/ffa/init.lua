CVAR_TIME_PREPARE = 20
CVAR_TIME_ENDING = 15
CVAR_TIME_DURATION = 600
CVAR_MAX_ROUNDS = 1
CVAR_NOTEAMS = true
CVAR_NO_FLAG_TICKETS = true
CVAR_TIME_RESPAWN = 7
CVAR_DROP_MEDICINE = true
CVAR_CUSTOM_LOADOUT = true

function MODE:GamemodeInitialize()
	gamestate.Init()
end

util.AddNetworkString("DeclareWinner")
function MODE:OnGameState(oldState, newState)
	if newState == GS_WAITING_PLAYERS then
		gamestate.SetRound(0)
		gamestate.SetRoundTime(0)
		gamestate.SetWinner(0)
	elseif newState == GS_ROUND_PREPARE then
		self:PrepareEntities()

		self:PreparePlayers(true)

		gamestate.SetWinner(0)
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_PREPARE)
		gamestate.SetRound(gamestate.GetRound() + 1)
	elseif newState == GS_ROUND_PLAYING then
		self:DisableGodPlayers()
		self:FreezePlayers(false)

		gamestate.SetRoundTime(CurTime() + CVAR_TIME_DURATION)
	elseif newState == GS_ROUND_END then
		local sorted = table.Copy(player.GetAll())
		table.sort(sorted, function(a, b) return a:GetNWInt("PlayerKills") > b:GetNWInt("PlayerKills") end)
		local winner = sorted[1]
		net.Start("DeclareWinner")
			net.WriteEntity(winner)
		net.Broadcast()
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
			print("NOW PLAYING")
		end
	elseif gamestate.Get() == GS_ROUND_END then
		if CurTime() >= gamestate.GetRoundTime() then
			if gamestate.GetRound() == CVAR_MAX_ROUNDS then
				gamestate.Switch(GS_GAME_OVER)
			else
				gamestate.Switch(-1)
			end
		end
	end
end

function MODE:PreparePlayers()
	for k, ply in pairs(player.GetAll()) do
		if ply:IsAlive() then
			ply:KillSilent()
			teams.SetSpectator(ply)
		end
		
		ply:Freeze(false)
		
		ply._Voiced = false
		ply.Killed = 0

		ply:SetFrags(0)
		ply:SetDeaths(0)
		ply:CloseAllUI({'noclose'})
		ply:InitProgression()
	end
end

function MODE:PrepareEntities()
end

function MODE:DisableGodPlayers()
	for k, ply in pairs(player.GetAll()) do
		if ply:Team() != TEAM_AXIS and ply:Team() != TEAM_ALLIES then continue end
		
		ply:GodDisable()
		timer.Simple(10, function()
			if IsValid(ply) then
				ply:SetNoCollideWithTeammates(false)
			end
		end)
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
end

function MODE:PlayerDeath(ply, attacker)
	ply:SetNetInt("NextSpawnWave", CurTime() + CVAR_TIME_RESPAWN)

	timer.Create("PlayerNextSpawn_"..ply:SteamID64(), CVAR_TIME_RESPAWN, 1, function()
		if !IsValid(ply) then return end

		ply:SetNetBool("b_PassedWave", true)
	end)
end

function MODE:CanStart()
	return gamestate.CanStart(MODE)
end

function MODE:CheckWinConditions()
	return false
end