CVAR_WIN_TICKETS = 1300
CVAR_TIME_PREPARE = 30
CVAR_TIME_ENDING = 30
CVAR_MAX_ROUNDS = 1
CVAR_ZONE_TIME = 10
CVAR_TIME_RESPAWN = 10
CVAR_MULT_SPAWNS = true

function MODE:GamemodeInitialize()
	gamestate.Init()
end

function MODE:OnGameState(oldState, newState)
	if newState == GS_WAITING_PLAYERS then
		self:LaunchTickets(false)

		gamestate.SetRound(0)
		gamestate.SetRoundTime(0)
		gamestate.SetWinner(0)
	elseif newState == GS_ROUND_PREPARE then
		self:PrepareEntities()

		--xp.ResetRoundXP()
		self:DoBalance()
		self:PreparePlayers(true)

		gamestate.SetWinner(0)
		gamestate.SetTickets(TEAM_AXIS, CFG.Tickets or CVAR_WIN_TICKETS)
		gamestate.SetTickets(TEAM_ALLIES, CFG.Tickets or CVAR_WIN_TICKETS)
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_PREPARE)
		gamestate.SetRound(gamestate.GetRound() + 1)
	elseif newState == GS_ROUND_PLAYING then
		self:DisableGodPlayers()
		self:FreezePlayers(false)
		self:LaunchTickets(true)
		self:LaunchSpawns()

		gamestate.SetRoundTime(CurTime())
	elseif newState == GS_ROUND_END then
		local winner = gamestate.GetWinner()
		
		if winner != WINNER_NONE then
			team.AddScore(gamestate.GetWinner(), 1)
		end

		self:FreezePlayers(true, true, true)
		self:LaunchTickets(false)

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

function MODE:PreparePlayers(freeze)
	for k, ply in pairs(player.GetAll()) do
		ply:Freeze(false)
		
		ply._Voiced = false
		ply.Killed = 0
		ply:SetFrags(0)
		ply:SetDeaths(0)

		if ply:IsAlive() then
			ply:Deploy(true)
		end
	end
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
		ply:SetNoCollideWithTeammates(false)
	end
end

function MODE:FreezePlayers(bool, all, full)
	for k, ply in pairs(player.GetAll()) do
		if !all and (ply:Team() != TEAM_AXIS and ply:Team() != TEAM_ALLIES) then continue end
		
		ply:SetFreezed(bool)
		if full then
			ply:Freeze(true)
		end
	end
end

function MODE:DoBalance()
	teams.MakeBalance()
end

function MODE:GoIntermission()
end

function MODE:GetPoints(teamID)
	local points = 0

	for k, v in pairs(ents.FindByClass("ww2_point_flag")) do
		if v:GetControlledBy() == teamID then
			points = points + 1
		end
	end

	return points
end

function MODE:LaunchTickets(bool)
	gamestate.Capture.LaunchTickets(self, bool)
end

function MODE:LaunchSpawns()
	timer.Create("WW2_SpawnWaves", CVAR_TIME_RESPAWN, 0, function()
		if gamestate.Get() != GS_ROUND_PLAYING then
			return
		end

		SetWorldInt('NextSpawnWave', CurTime() + CVAR_TIME_RESPAWN)

		for k, v in pairs(player.GetAll()) do
			if v:GetNWBool('b_SpawnReady') and !v:IsAlive() then
				v:SetNetBool("b_PassedWave", true)
				v:Deploy()
			else
				if !v:GetNWBool('DeathScreen') and !v:IsAlive() then
					v:SetNetBool('b_PassedWave', true)
				end
			end
		end
	end)
end

function MODE:CanStart()
	return gamestate.CanStart(MODE)
end

function MODE:CheckWinConditions()
	gamestate.Capture.CheckWinConditions(self)
end