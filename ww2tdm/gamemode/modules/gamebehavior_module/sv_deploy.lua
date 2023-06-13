
local PLAYER = FindMetaTable('Player')
local GM = GM and GM or GAMEMODE

local function findPointByWord(word)

	for k, v in pairs(ents.FindByClass("ww2_point_flag")) do

		if v:GetPoint() == word then

			return v

		end

	end

end

local function ActivateNoCollision(target, min)

	target:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

	if (min and (tonumber(min) > 0)) then 

		timer.Simple(min, function()

			timer.Create(target:SteamID64().."_checkBounds_cycle", 0.5, 0, function()

				local penetrating = ( IsValid(target:GetPhysicsObject()) and target:GetPhysicsObject():IsPenetrating() ) or false
				local tooNearPlayer = false

				for i, ply in ipairs( player.GetAll() ) do

					if ply == target then

						continue

					end

					if target:GetPos():DistToSqr(ply:GetPos()) <= (150*150) then

						tooNearPlayer = true

					end

				end

				if not (penetrating and tooNearPlayer) then --if both false then

					target:SetCollisionGroup(COLLISION_GROUP_PLAYER)
					timer.Destroy(target:SteamID64().."_checkBounds_cycle")

				end

			end)

		end)

	end

end

function PLAYER:InitStats()

	self:SetViewOffsetDucked(Vector(0, 0, 45))
	self:SetWalkSpeed(CFG.WalkSpeed)
	self:SetLadderClimbSpeed(100)
	self:SetDuckSpeed(0.5)
	self:SetCrouchedWalkSpeed(0.5)
	self:SetNetBool('DeathScreen', false)
	self:SetNetBool('b_SpawnReady', false)
	self:SetNetBool('b_PassedWave', false)
	self:SetNetBool('b_NotDeployed', false)
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self:SetColor(Color(255, 255, 255, 0))

end

function PLAYER:CheckGameState()

	local gs = gamestate.Get()

	if gs == GS_ROUND_PREPARE then

		self:SetFreezed(true)

		for k, v in pairs(team.GetPlayers(self:Team())) do

			if v._Voiced then

				return

			end

		end
	
		self:Voice("firstspawn", 100)
		self._Voiced = true

	elseif gs == GS_ROUND_PRE_PLAYING and self:Team() == TEAM_ATTACK then

		self:SetFreezed(true)

	elseif gs == GS_ROUND_PLAYING then

		self:SetFreezed(false)

		if (self.NextRespawnVoice or 0) < CurTime() and !CVAR_NOTEAMS then

			self:Voice('respawn', 100)
			self.NextRespawnVoice = CurTime() + 60 * 5

		end

	end

end

function PLAYER:CameraLoaded()

	if self.CameraReady then

		return

	end

	self.CameraReady = true
	self:SetColor(Color(255, 255, 255, 255))
	self:RespawnClass()
	self:Freeze(false)

	timer.Create('DisableGodMode_'..self:SteamID(), 1, 1, function()

		if IsValid(self) then

			self:GodDisable()

		end

	end)

	if CFG.SpawnAng and CFG.SpawnAng[self:Team()] then

		self:SetEyeAngles(CFG.SpawnAng[self:Team()])

	end

	self:CheckGameState()

end

function PLAYER:SelectFFASpawn(ffaSpawns)

	local spawnsRating = {}

	-- print("selecting spawn for", self)

	for id, pos in pairs(ffaSpawns) do

		-- print("spawn", id)

		local foundPlayer;

		for k, ply in pairs(player.GetAll()) do

			if ply == self then continue end
			if !ply:IsAlive() then continue end

			local maxLookoutDistance = 0xF4240
			local minLookoutDistance = 0x3D090

			if ply:GetPos():DistToSqr(pos) < minLookoutDistance then
				
				foundPlayer = true
				break;

			end

			-- print("distance", ply)
			-- print(ply:GetPos():DistToSqr(pos))

			if ply:GetPos():DistToSqr(pos) < maxLookoutDistance then

				foundPlayer = true

				local newKoeff = ply:GetPos():DistToSqr(pos) / maxLookoutDistance

				local newID = #spawnsRating + 1
				if !spawnsRating[newID] then
					spawnsRating[newID] = {}
				end

				if !spawnsRating[newID].koeff or spawnsRating[newID].koeff > newKoeff then

					spawnsRating[newID] = {id = id, koeff = newKoeff}

				end

			end

		end

		if !foundPlayer then

			return pos

		end

	end

	if !selectedSpawnPos then

		table.sort(spawnsRating, function(a, b) return a.koeff > b.koeff end)

		-- print("selecting most rated spawn")
		return ffaSpawns[spawnsRating[1].id]

	end

end

util.AddNetworkString('DeploySpawnPos')
util.AddNetworkString("ShowGamemodeInfo")
function PLAYER:Deploy(bForce, deployTo, loadoutInfo)

	local gs = gamestate.Get()

	if self:Team() == TEAM_SPECTATOR then

		return

	end

	if !bForce then

		if self:IsAlive() then
			
			return

		end

		if gs == GS_ROUND_END then

			return
	
		end

		if (!self:GetNWBool('b_PassedWave') and self:GetNWBool('b_InitSpawned')) or !CVAR_TIME_RESPAWN then

			return

		end

	end

	local faction = self:GetFaction()
	if !faction then

		return

	end

	local class = faction:Class(self:GetClass())

	if !class then

		return

	end

	deployTo = utf8upper(tostring(deployTo)) or ""

	if CVAR_MULT_SPAWNS then

		if !deployTo or deployTo == "" then

			notify.Add(self, "deploy_invalid", nil, 3)
			return

		end

		local expectedPoint = findPointByWord(deployTo)

		if IsValid(expectedPoint) and expectedPoint:GetControlledBy() == self:Team() then

			if expectedPoint:GetStatus() == FLAGSTATUS_CAPTURING_ALLIES or expectedPoint:GetStatus() == FLAGSTATUS_CAPTURING_AXIS or expectedPoint:GetStatus() == FLAGSTATUS_PREVENTED then

				notify.Add(self, "deploy_failed", "deploy_failed_desc", 4)
				return

			end

		end

	end

	local ffaSpawns = CFG.Spawns[-1]
	local spawnTable = CFG.Spawns[self:Team()] or ffaSpawns

	if !spawnTable then

		if gs == GS_WAITING_PLAYERS then

			if CFG.BaseSpawns[self:Team()] then

				spawnTable = CFG.BaseSpawns[self:Team()]

			else

				notify.Add(self, "cant_deploy_right")
				return

			end

		else

			notify.Add(self, "cant_deploy_right")
			return

		end

	end

	self.CameraReady = false
	self.IsSpectator = false
	self.Revived  	 = false

	self.LoadoutInfo = loadoutInfo

	self:Spawn()
	self:StripWeapons()
	self:GodEnable()

	if gs == GS_ROUND_PREPARE then

		ActivateNoCollision(self, 30)

	else

		ActivateNoCollision(self, 5)
		
	end

	self:CloseUI('deploy_menu')

	local WAIT_TIME = 4

	if self:IsBot() then

		WAIT_TIME = WAIT_TIME / 2

	end

	timer.Simple(WAIT_TIME, function()

		if IsValid(self) then

			self:CameraLoaded()

		end

	end)

	if CFG.SpawnAng and CFG.SpawnAng[self:Team()] then

		self:SetEyeAngles(CFG.SpawnAng[self:Team()])

	end

	if !self:GetNWBool("b_InitSpawned") and gs != GS_WAITING_PLAYERS then

		SOUNDS.PlayTeam(self:Team(), "firstSpawn", 80, {self})
		net.Start("ShowGamemodeInfo")
		net.Send(self)

	end

	self:SetDeathStatus(false)

	timer.Simple(0.2, function() -- нужно немножко подождать, прежде чем выставлять флаги

		if IsValid(self) then

			if !self:IsBot() then

				self:Freeze(true)

			end

			self:AddEFlags(EFL_NO_DAMAGE_FORCES)

		end
	end)

	local selectedSpawnPos = table.Random(spawnTable)

	if ffaSpawns then

		selectedSpawnPos = self:SelectFFASpawn(ffaSpawns)

	end

	if isentity(selectedSpawnPos) then

		selectedSpawnPos = selectedSpawnPos:GetPos()

	end

	local largeScale = maploader.Gamemode() == "war"

	if largeScale then

		local canDeployToPoint = deployTo != "HQ" and deployTo != "" and deployTo != "BEACON"
		
		if canDeployToPoint then

			local expectedPoint = findPointByWord(deployTo)

			if IsValid(expectedPoint) and expectedPoint:GetControlledBy() == self:Team() and CFG.FlagSpawns[deployTo] then

				local pointPos = expectedPoint:GetPos()

				selectedSpawnPos = table.Random(CFG.FlagSpawns[deployTo])

			end

		elseif deployTo == "BEACON" then

			for k, v in pairs(ents.FindByClass("ww2_spawn_beacon")) do

				if v:GetTeam() != self:Team() then continue end

				selectedSpawnPos = v:GetPos()

				v.SpawnsLeft = (v.SpawnsLeft or CFG.BeaconSpawns) - 1

				if IsValid(v:GetOwner()) then
					v:GetOwner():AddXP("beacon_spawn")
				end

				if v.SpawnsLeft <= 0 then

					v:Remove()

				end

			end

			if !selectedSpawnPos then

				notify.Add("no_beacons", "tp_to_spawn", 6)

			end

		end

	end

	hook.Run("PlayerDeployed", self)

	net.Start("DeploySpawnPos")
		net.WriteVector(selectedSpawnPos)
	net.Send(self)

	self:SetPos(selectedSpawnPos)

	self:InitStats()

	if self:GetInternalTrait() == TRAIT_DEPLOY then

		self.ParachutesLeft = CFG.TraitParachutesAmount or 1

	else

		self.ParachutesLeft = 0

	end

	self.FortsLeft = CFG.SpawnForts

	self.spawnProtection = CurTime() + CFG.SpawnProtectionTime

	if gamestate.Get() != GS_WAITING_PLAYERS then

		self:SetNetBool('b_InitSpawned', true)

	end

	self:CheckGameState()

	self:UpdateLastWeapon()

end


function BotDeploy(teamID)

	RunConsoleCommand('bot')

	local lastBot;

	timer.Simple(1, function()

		for k, bot in pairs(player.GetBots()) do

			lastBot = bot

		end

		lastBot:SetTeam(teamID)
		lastBot:SelectClass(BASE_CLASS)
		lastBot:Deploy()
		lastBot:SetPos(Bro():GetPos() + Vector(0, 0, 100))
		bonemerge.test(lastBot)

	end)

end

function KickBots()

	for k, v in pairs(player.GetBots()) do

		v:Kick()

	end

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add("PlayerLoadout", "StripWeapons", function(ply)
	ply:StripWeapons()

	return true
end)

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]
util.AddNetworkString('DeployPlayer')

net.Receive('DeployPlayer', function(len, ply)

	if (ply.NextDeployInteract or 0) >= CurTime() then
		return
	end

	ply.NextDeployInteract = CurTime() + 0.1

	local deployTo = net.ReadString()
	local loadoutInfo = net.ReadTable()

	if ply:IsAlive() then

		if (ply.spawnProtection or 0) >= CurTime() then

			return

		end

		ply:Kill()
		ply:CloseUI("deploy_menu")

	else

		if ply:GetNWBool('b_PassedWave') or !ply:GetNWBool('b_InitSpawned') then

			ply:Deploy(false, deployTo, loadoutInfo)

		else

			if maploader.Gamemode():find("capture") then

				ply:SetNetBool('b_SpawnReady', !ply:GetNWBool('b_SpawnReady'))

			end

		end

	end

end)


util.AddNetworkString('DeployCameraReady')
net.Receive('DeployCameraReady', function(len, ply)

	ply:CameraLoaded()

end)

util.AddNetworkString("ChangeHeadSkin")
net.Receive("ChangeHeadSkin", function(len, ply)

	if !ply:IsPremium() then

		return

	end

	local factionData = ply:GetFaction()

	if !factionData then return end

	local selectedSkin = math.min(net.ReadUInt(6), ply:SkinCount() - 1)
	local headsInfo = ply:GetPerm("heads") or {}

	headsInfo[factionData.Name] = selectedSkin

	ply:SetSkin(selectedSkin)
	ply:SetPerm("heads", headsInfo)

	notify.Add(ply, "Вы успешно сменили внешность своего персонажа!", nil, 5)

end)

util.AddNetworkString("ChangeCharPitch")
net.Receive("ChangeCharPitch", function(len, ply)

	if !ply:IsPremium() then

		return

	end

	local newPitch = math.Clamp(net.ReadUInt(16), CFG.VoicePitch.min, CFG.VoicePitch.max)

	ply:SetPerm("voicePitch", newPitch)

end)

util.AddNetworkString("EliteCoinsExchange")
net.Receive("EliteCoinsExchange", function(len, ply)

	local amount = net.ReadUInt(32)
	amount = math.ceil(amount)

	local takeCoins = amount * CFG.CoinsToElite

	if ply:GetCoins() < takeCoins then

		return

	end


	ply:AddCoins(-takeCoins)
	ply:AddEliteCoins(amount)

end)
