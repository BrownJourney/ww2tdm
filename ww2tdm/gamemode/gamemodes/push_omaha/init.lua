CVAR_WIN_TICKETS = 200
CVAR_TIME_PREPARE = 30
CVAR_TIME_ENDING = 30
CVAR_TIME_DURATION = 480
CVAR_MAX_ROUNDS = 1
CVAR_ZONE_TIME = 25
CVAR_TIME_RESPAWN = 20
CVAR_TIME_DEFEND_HOLD = 5
CVAR_DEFEND_BENEFIT = 50
CVAR_FIRST_STAGE_DEFEND_RESPAWN_TIME = 120
CVAR_NO_FLAG_TICKETS = true

local TRIGGER_POS = Vector(-1758, -12552, -1625)

local GATE_LOCATION = Vector(-1717, -11652, -1598)

CVAR_STAGES = {
	[2] = "A",
	[3] = "B",
	[4] = "C",
	[5] = "D",
	[6] = "E",
	[7] = "F"
}

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

		if gamestate.GetRound() > 0 then
			self:SwapTeams()
		end

		gamestate.SetStage(1)

		self:DoBalance()
		self:PreparePlayers(true)

		gamestate.SetWinner(0)
		gamestate.SetReason('')
		gamestate.SetTickets(TEAM_AXIS, CVAR_WIN_TICKETS)
		gamestate.SetTickets(TEAM_ALLIES, CVAR_WIN_TICKETS)
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_PREPARE)
		gamestate.SetRound(gamestate.GetRound() + 1)

		for k, v in pairs(ents.FindInSphere(GATE_LOCATION, 250)) do
			v:Fire("Use")
			v.UsedByServer = true
		end
	elseif newState == GS_ROUND_PRE_PLAYING then
		self:DisableGodPlayers()
		self:TeamFreeze(false, TEAM_ATTACK)
		self:TeamFreeze(false, TEAM_DEFEND)
		self:LaunchTickets(true)

		self:LaunchSpawns(TEAM_ATTACK, CVAR_TIME_RESPAWN)
		self:LaunchSpawns(TEAM_DEFEND, CVAR_TIME_RESPAWN + CVAR_FIRST_STAGE_DEFEND_RESPAWN_TIME)

		CFG.Spawns[TEAM_ATTACK] = nil;

		gamestate.SetRoundTime(CurTime() + CVAR_DEFEND_BENEFIT)

		for k, v in pairs(ents.FindInSphere(TRIGGER_POS, 3000)) do
			if v.UsedByServer then continue end
			v:Fire("Use", nil, 0, Entity(1))
		end

		timer.Simple(0.5, function()
			for k, v in pairs(ents.FindInSphere(TRIGGER_POS, 3000)) do
				if v.UsedByServer then continue end
				v:Fire("Use", nil, 0, Entity(1))
			end
		end)
	elseif newState == GS_ROUND_PLAYING then
		gamestate.SetRoundTime(CurTime() + CVAR_TIME_DURATION)
		CFG.Spawns[TEAM_ATTACK] = {
			Vector(-4395, -6866, -1745),
			Vector(-4316, -6892, -1754),
			Vector(-2715, -6703, -1772),
			Vector(-2657, -6687, -1772),
			Vector(-855, -6936, -1778),
			Vector(-784, -6937, -1777),
			Vector(764, -6866, -1742),
			Vector(886, -6869, -1773)
		}
	elseif newState == GS_ROUND_END then		
		if gamestate.GetWinner() == WINNER_NONE then
			gamestate.SetWinner(TEAM_DEFEND)
			gamestate.SetReason(REASON_TIMEOVER)
		end

		team.AddScore(gamestate.GetWinner(), 1)

		self:FreezePlayers(true, true, true)
		self:LaunchTickets(false)

		gamestate.SetRoundTime(CurTime() + CVAR_TIME_ENDING)

		ShowPlayerRewards()
	elseif newState == GS_GAME_OVER then
		MapSelection()
	end
end

function MODE:OnGameStage(newStage)
	local callback = gamestate.stages[newStage]

	local sector = CVAR_STAGES[newStage] or "BOBCOOL"
	notify.Custom(team.GetPlayers(TEAM_ATTACK), "notify_push_attack", sector)
	notify.Custom(team.GetPlayers(TEAM_DEFEND), "notify_push_defend", sector)

	if CFG.MapSoundtrack and newStage == 2 then
		SOUNDS.PlaySound(CFG.MapSoundtrack, "midmusic", player.GetAll(), SOUNDS.MaxMusicVolume)
	end

	if newStage == #gamestate.stages then
		SOUNDS.StopSound("midmusic", true)
		SOUNDS.PlayTeam(TEAM_AXIS, "winning", SOUNDS.MaxMusicVolume)
		SOUNDS.PlayTeam(TEAM_ALLIES, "winning", SOUNDS.MaxMusicVolume)
	end

	if !callback then
		gamestate.TerminateRound(TEAM_ATTACK, REASON_PUSH)
		return
	end

	self:LaunchSpawns(TEAM_DEFEND, CVAR_TIME_RESPAWN + CVAR_TIME_DEFEND_HOLD)

	if newStage > 1 then
		self:DeployTeam(TEAM_DEFEND, true)
	end

	gamestate.SetTickets(TEAM_ATTACK, gamestate.GetTickets(TEAM_ATTACK) + 30)

	local pointsCleaned = callback()
	local pointsCurrent = #ents.FindByClass("ww2_point_flag")
	local points = math.max(pointsCurrent - pointsCleaned - 1, 0)
	local addTime = CVAR_TIME_DURATION + points * CFG.Points.PushBonus
	gamestate.SetRoundTime(gamestate.GetRoundTime() + addTime)
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
			gamestate.Switch(GS_ROUND_PRE_PLAYING)
			print("NOW DEFEND PREPARE")
		end
	elseif gamestate.Get() == GS_ROUND_PRE_PLAYING then
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
			if gamestate.GetRound() >= CVAR_MAX_ROUNDS and team.GetScore(TEAM_ATTACK) != team.GetScore(TEAM_DEFEND) then
				gamestate.Switch(GS_GAME_OVER)
			else
				gamestate.Switch(-1)
			end
		end
	end
end

function MODE:PlayerDeath(ply)
	-- if ply:Team() == TEAM_DEFEND and gamestate.GetStage() == 1 then
	-- 	notify.Add(ply, "player_died_stage", "player_died_stage_desc", 10)
	-- end
end

function MODE:PreparePlayers(freeze)
	for k, ply in pairs(player.GetAll()) do
		ply:Freeze(false)
		
		ply._Voiced = false
		ply.Killed = 0
		ply:SetFrags(0)
		ply:SetDeaths(0)
		ply:CloseAllUI({'noclose'})
		ply:InitProgression()

		if ply:IsAlive() then
			ply:Deploy(true)
		end
	end
end

function MODE:Fallback()
	for k, v in pairs(team.GetPlayers(TEAM_DEFEND)) do
		v:SetNetBool("isFallingBack", true)
	end

	timer.Create("DisableFallBack", CVAR_ZONE_TIME, 1, function()
		for k, v in pairs(team.GetPlayers(TEAM_DEFEND)) do
			v:SetNetBool("isFallingBack", false)
		end
	end)
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
	teams.MakeBalance()
end

function MODE:ChangeTeam(teamPlayers)
	for k, ply in pairs(teamPlayers) do
		ply:SetTeam(ply:Team() == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS)
	end
end

function MODE:SwapTeams()
	TEAM_ATTACK, TEAM_DEFEND = TEAM_DEFEND, TEAM_ATTACK
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

function MODE:OnPointCaptured()
	local pointsAmount = #ents.FindByClass("ww2_point_flag")
	if self:GetPoints(TEAM_ATTACK) == pointsAmount then
		self:Fallback()
		gamestate.SetStage(gamestate.GetStage() + 1)
	end
end

function MODE:LaunchTickets(bool)
	hook.Add("PlayerDeath", "ChangeTicketsOnDeath", function(ply)
		if ply:Team() == TEAM_ATTACK then
			gamestate.TakeTickets(TEAM_ATTACK, 1)
		elseif ply:Team() == TEAM_DEFEND and ply:IsOOB() then
			gamestate.SetTickets(TEAM_ATTACK, gamestate.GetTickets(TEAM_ATTACK) + 3)
		end

		self:CheckWinConditions()
	end)
end

function MODE:LaunchSpawns(teamID, time)
	local timerID = "WW2_SpawnWaves"..teamID

	SetWorldInt('NextSpawnWave'..teamID, CurTime() + time)
	timer.Create(timerID, time, 0, function()
		if gamestate.Get() == GS_WAITING_PLAYERS then
			return
		end

		SetWorldInt('NextSpawnWave'..teamID, CurTime() + time)

		self:DeployTeam(teamID)
	end)
end

function MODE:DeployTeam(teamID, force)
	for k, v in pairs(teamID and team.GetPlayers(teamID) or player.GetAll()) do
		if force then
			v:SetNetBool("b_PassedWave", true)
			v:Deploy()
		else
			if !v:GetNWBool('DeathScreen') and !v:IsAlive() then
				v:SetNetBool('b_PassedWave', true)
			end
		end
	end
end

function MODE:CanStart()
	return gamestate.CanStart(MODE)
end

function MODE:CheckWinConditions()
	if gamestate.Get() != GS_ROUND_PLAYING then 
		return false 
	end
	
	local winner = WINNER_NONE
	local ticketsAttack = gamestate.GetTickets(TEAM_ATTACK) <= 0

	if ticketsAttack then
		gamestate.TerminateRound(TEAM_DEFEND, REASON_PUSH_TICKETS)
		return true
	end

	return false
end