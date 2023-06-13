
local PLAYER = FindMetaTable('Player')
	
local TEAM_AUTOBALANCE_MIN_TICKETS = 100

PLAYER._SetTeam = PLAYER._SetTeam or PLAYER.SetTeam
function PLAYER:SetTeam(teamID)

	teamID = tonumber(teamID) or TEAM_SPECTATOR

	self:_SetTeam(teamID)

	if teamID == TEAM_SPECTATOR then

		return

	end

	if self:IsBot() then

		return

	end

	-- local standartLoad = self:LoadClassData()

	-- if !standartLoad then

	self:SelectClass(BASE_CLASS, false)
	
	-- end

	self.initClassSpawn = false

	self:UpdateClassInfo()

end

util.AddNetworkString('ShowTeamSelection')
function teams.PlayerInitialSpawn(ply)

	ply:UpdateGameInfo()
	teams.SetSpectator(ply, true)

	local classes = ply:GetPerm("classBought")
	if classes and !classes[CLASS_GENERAL] and (classes[FACTION_USSR] or classes[FACTION_GERMANY]) then
		ply:ShowUI("general_progression")
		return
	end

	net.Start('ShowTeamSelection')
		net.WriteBool(ply:CanSpectate())
	net.Send(ply)

end

function teams.DefinePlayerMovement(ply)

	if ply.IsSpectator then

		ply:Spectate(OBS_MODE_ROAMING)
		ply:GodEnable()
		ply:SetMoveType(MOVETYPE_NOCLIP)
		ply:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		ply:SetNetInt('Confusion', 0)

		if ply:Team() == TEAM_SPECTATOR or !CVAR_TIME_RESPAWN then

			ply:Freeze(false)
			ply:StripWeapons()

		else

			ply:Freeze(true)

		end

	else

		ply:UnSpectate()
		ply:SetMoveType(MOVETYPE_WALK)
		ply:SetObserverMode(OBS_MODE_NONE)

	end

	ply:CrosshairDisable()
	ply:SetCanZoom(false)


end

function teams.SetSpectator(ply, isFirstSpawn)

	ply:ExitVehicle()

	ply.IsSpectator = true
	ply:Spawn()

	ply:SetDeathStatus(true)

	ply:SetPos(CFG.View.pos or Vector(0, 0, 0))
	ply:SetEyeAngles(CFG.View.ang or Angle(0, 0, 0))

	if isFirstSpawn then

		ply:SetTeam(TEAM_SPECTATOR)

	else

		if ply.scheduledTeam then

			ply:SetTeam(ply.scheduledTeam)

		end

		ply:SetNetInt('i_SpawnCooldown', CurTime() + CFG.Teams.SpawnDelay)

		if CVAR_TIME_RESPAWN then
			ply:ShowUI('deploy_menu')
			timer.Simple(0.25, function()
				if !IsValid(ply) then
					return
				end
				ply:ShowUI('deploy_menu_points')
			end)
		end

	end

	timer.Remove('DisableNoCollide_'..ply:SteamID())

	ply:StripWeapons()

end

function teams.MakeBalance()

	if CVAR_NOTEAMS then

		return

	end

	if gamestate.GetTickets(TEAM_AXIS) <= TEAM_AUTOBALANCE_MIN_TICKETS or gamestate.GetTickets(TEAM_ALLIES) <= TEAM_AUTOBALANCE_MIN_TICKETS then

		return

	end

	local axisCount = #team.GetPlayers(TEAM_AXIS)
	local alliesCount = #team.GetPlayers(TEAM_ALLIES)
	local balanceAllies = alliesCount > axisCount
	local balanceAxis = axisCount > alliesCount

	if balanceAxis or balanceAllies then

		local balance = math.floor(math.abs((axisCount / 2) - (alliesCount / 2)))

		teams.ChangeRandomPlayers(balanceAllies and TEAM_ALLIES or TEAM_AXIS, balance)

	end
	
end


local INT_AFK_TIME_SECONDS = 15
local INT_AFK_CHECKS = 4

function teams.CheckAFK()

	for k, v in pairs(player.GetAll()) do

		if v:IsPremium() then

			continue

		end

		if v:IsBot() then

			continue

		end

		if v:GetPos() == (v.LastPos or vector_origin) then

			v.AFKCheck = (v.AFKCheck or 0) + 1

			v.LastPos = v:GetPos()

			if v.AFKCheck >= INT_AFK_CHECKS * (60 / INT_AFK_TIME_SECONDS) then

				v:Kick("AFK is not tolerated!")

			end

		else

			v.AFKCheck = 0

		end

	end

end

function teams.ChangeRandomPlayers(teamID, amount)

	for i = 1, amount do

		local teamTable = {}
		for k, v in pairs(teams.GetPlayers(teamID)) do

			if v.scheduledTeam then

				continue

			end

			if v:IsBot() then

				continue

			end

			table.insert(teamTable, v)

		end

		local randomPlayer = table.Random(teamTable)

		if !IsValid(randomPlayer) then

			return

		end

		if teamID == TEAM_AXIS then

			randomPlayer.scheduledTeam = TEAM_ALLIES

			Print(CLR_MSG_PINK, 'autobalanced player to TEAM_ALLIES')

		else

			randomPlayer.scheduledTeam = TEAM_AXIS

			Print(CLR_MSG_PINK, 'autobalanced player to TEAM_AXIS')

		end

		Print(CLR_MSG_PINK, randomPlayer:Name())

		notify.Add(randomPlayer, 'You have been autobalanced to another team!', 'You will become spectator in 15 seconds')

		timer.Simple(15, function()

			if !IsValid(randomPlayer) then

				return

			end

			if !randomPlayer.scheduledTeam then

				return

			end

			randomPlayer.freeLeave = true
			randomPlayer.autobalanced = true

			teams.SetSpectator(randomPlayer)

			randomPlayer.NextChoose = CurTime() + CFG.Teams.ChangeDelay

		end)


	end

end

function teams.ChooseTeam(ply, teamID)

	if (ply.NextChoose or 0) >= CurTime() and ply != Bro() then

		notify.Custom(ply, 'team_timeout', math.floor(ply.NextChoose - CurTime()))
		return

	end

	if teamID == ply:Team() then

		return

	end

	if teamID != TEAM_AXIS and teamID != TEAM_ALLIES and !ply:IsAdmin() then

		return

	end

	local limitBarrier = 1
	if ply:IsPremium() then

		limitBarrier = 3

	end

	if !CVAR_NOTEAMS and teams.GetDifferenceDirect(teamID) >= limitBarrier and teamID != TEAM_SPECTATOR then
		
		notify.Add(ply, 'team_limit', 'team_limit_desc', 2)
		return

	end

	local changeDelay = ply:IsAdmin() and 5 or CFG.Teams.ChangeDelay

	ply.NextChoose = CurTime() + changeDelay

	Print(CLR_MSG_PINK, 'setting team ' .. teamID .. ' to player ' .. ply:Name())

	local oldTeam = ply:Team()

	ply:SetTeam(teamID)

	if ply:IsAlive() then

		if gamestate.Get() == GS_ROUND_PLAYING then

			ply.oldTeam = oldTeam
			ply:Kill()

		else

			teams.SetSpectator(ply)
				
		end

	else

		ply:ShowUI('deploy_menu')

	end

	if not CVAR_TIME_RESPAWN and gamestate.Get() == GS_ROUND_PREPARE then

		ply:Deploy(true)

	end

end

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

util.AddNetworkString('ChooseTeam')
net.Receive('ChooseTeam', function(len, ply)
	local teamID = net.ReadUInt(3)

	teams.ChooseTeam(ply, teamID)
end)

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]


function player.GetActive()

	local tbl = {}
	for k, v in pairs(player.GetAll()) do

		if v:Team() != TEAM_SPECTATOR and v:IsAlive() then

			table.insert(tbl, v)

		end

	end

	return tbl

end

hook.Add("PlayerButtonDown", "SpectatorMode", function(ply, key)
	if ply:Team() != TEAM_SPECTATOR then
		return
	end

	local function getID(id)
		local t = player.GetActive()
		if id > #player.GetActive() then
			id = 1
		elseif id < 1 then
			id = #player.GetActive()
		end

		if t[id] == ply then
			id = id + 1
		end

		return id
	end

	if !ply.SpectateID then
		ply.SpectateID = 1
	end

	local obsMode = ply:GetObserverMode()
	local canObserve = obsMode == OBS_MODE_IN_EYE or obsMode == OBS_MODE_CHASE

	if key == KEY_ENTER then
		if obsMode == OBS_MODE_CHASE then
			-- ply:SetObserverMode(OBS_MODE_IN_EYE)
			ply:SetObserverMode(OBS_MODE_ROAMING)
			ply:SpectateEntity(nil)
		elseif obsMode == OBS_MODE_IN_EYE then
			ply:SetObserverMode(OBS_MODE_ROAMING)
			ply:SpectateEntity(nil)
		elseif obsMode == OBS_MODE_ROAMING then
			ply.SpectateID = getID(ply.SpectateID)
			ply:SetObserverMode(OBS_MODE_CHASE)
		end
	elseif key == KEY_R then
		ply.SpectateID = getID(ply.SpectateID + 1)
	elseif key == KEY_E then
		ply.SpectateID = getID(ply.SpectateID - 1)
	end

	local observeTarget = ply:GetObserverTarget()
	local newTarget = player.GetActive()[ply.SpectateID]
	if (not IsValid(observeTarget) or observeTarget != newTarget) and canObserve then
		ply:SpectateEntity(newTarget)
	end
end)

hook.Add('PlayerInitialSpawn', 'teams_playerInitialSpawn', function(ply)
	timer.Simple(0, function() -- delay to prepare all information for client
		teams.PlayerInitialSpawn(ply)
	end)
end)

hook.Add('PlayerSpawn', 'teams_playerSpawn', function(ply)
	timer.Simple(0, function()
		teams.DefinePlayerMovement(ply)
	end)

	ply.oldTeam = nil;
end)

hook.Add('OnGameState', 'teams_startTimer', function(oldState, newState)
	if newState == GS_ROUND_PLAYING then
		timer.Create('CheckTeamBalance', 120, 0, function()
 			teams.MakeBalance()
		end)
		timer.Create('CheckAFK', INT_AFK_TIME_SECONDS, 0, function()
			teams.CheckAFK()
		end)
	end
end)

hook.Add('PlayerChangedTeam', 'teams_playerChangedTeam', function(ply)
	if ply.scheduledTeam then
		ply.autobalanced = true
	end

	ply.scheduledTeam = nil
	ply:ApplyHead()
	ply:SetNetBool('DeathScreen', false)
	teams.DefinePlayerMovement(ply)
end)