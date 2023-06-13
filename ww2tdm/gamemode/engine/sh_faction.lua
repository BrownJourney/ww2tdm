faction = faction or {}

local GM = GM and GM or GAMEMODE

local stored = faction.stored or {}
local loaded = faction.loaded or {}
faction.stored = stored
faction.loaded = loaded

local factionClass = {}
factionClass.Id = nil
factionClass.Parent = nil
factionClass.Name = "Unknown"
factionClass.FactionID = "unk"
factionClass.Limit = 0
factionClass.Cost = 0
factionClass.MDL = "" -- Use Model() for precache
factionClass.Skin = nil
factionClass.Bodygroups = {}

CLASS_ASSAULT 			= "assault"
CLASS_SUPPORT 			= "support"
CLASS_LOGISTIC 			= "logistic"

CLASS_ELITEASSAULT 		= "eliteassault"
CLASS_ELITESUPPORT 		= "elitesupport"
CLASS_ELITELOGISTIC 	= "elitelogistic"

TRAIT_TACSPRINT 		= "sprint"
TRAIT_QUICKRELOAD 		= "reload"
TRAIT_BLASTPROTECTION 	= "blast"
TRAIT_SUPPRESSION 		= "suppress"
TRAIT_AMMO 				= "ammo"
TRAIT_GRENADES 			= "nades"
TRAIT_DEPLOY 			= "deploy"
TRAIT_AMMODROP 			= "ammodrop"
TRAIT_MOBILITY 			= "mobility"
TRAIT_SUPPLYCRATE 		= "supply"
TRAIT_HEALTH 			= "health"
TRAIT_BEACON 			= "beacon"

faction.levels = {
	["shooter"] 			= 0,
	["ammo"] 				= 0,
	["antitank"] 			= 10,
	["eliteshooter"] 		= 18,
	["elitestormtrooper"] 	= 25,
	["engineer"] 			= 0,
	["marksman"] 			= 15,
	["medic"] 				= 0,
	["mgunner"] 			= 2,
	["sniper"] 				= 4,
	["stormtrooper"] 		= 8,
	["officer"] 			= 6
}

function factionClass:Faction()
	return self._faction
end

function factionClass:GetName()
	return self.Name or "Unknown"
end

function factionClass:GetFaction()
	return self.FactionID or "unk"
end

function factionClass:GetLimit()
	local limit = self.Limit
	if self:GetBase() then
		local class =  self:Faction():Class(self:GetBase())
		limit = class.Limit
	end

	return math.Round( game.MaxPlayers() * ( limit or 0 ) )
end

function factionClass:GetCost()
	return self.Cost or 0
end

function factionClass:GetBase()
	return self.Based
end

function factionClass:GetTrait()
	if self:GetBase() then
		local class =  self:Faction():Class(self:GetBase())
		return class.Trait
	end

	return self.Trait
end

function factionClass:GetIcon()
	if self:GetBase() then
		local class =  self:Faction():Class(self:GetBase())
		return class.Icon
	end
	return self.Icon
end

function factionClass:GetLevel()
	return self.Level or faction.levels[self.Id]
end

function factionClass:NumPlayers(team, ply)
	local i = 0

	for k, v in pairs(player.GetAll()) do
		local plFaction = v:GetFaction()
		local clFaction = self:Faction()
		if plFaction and plFaction.Name == clFaction.Name and v:Team() == team then
			if v:GetClass() == self.Id or (clFaction:Class(v:GetClass()) and clFaction:Class(v:GetClass()):GetBase() == self.Id and v != ply) or (v:GetClass() == self:GetBase() and v != ply) then
				i = i + 1
			end
		end
	end

	return i
end

function factionClass:Limited(team, ply)
	if self:GetLimit() <= 0 then
		return false
	end

	return self:NumPlayers(team, ply) >= self:GetLimit()
end

function factionClass:Has(ply)
	if self:Faction().DefaultClass == self.Id then
		return true
	end

	if self:GetCost() <= 0 then
		return true
	end

	local unlocks = ply:ClassUnlocks()

	return unlocks[self.FactionID] and (unlocks[self.FactionID][self.Id] or false) or false
end

function factionClass:CreateBonemerges(client)
	client:clearBonemerges()

	local tBonemerge = self.Bonemerge or {}

	if CFG.SnowMap and self.SnowBonemerge then
		tBonemerge = self.SnowBonemerge
	end

	for bmtype, v in pairs(tBonemerge) do
		client:createBonemerge(v.model, bmtype, v.skin, v.bodygroups)
	end
end

function factionClass:OnInitialSpawn(client)
	self:CreateBonemerges(client)

	client.initClassSpawn = true
end

function factionClass:OnRespawn(client, soft)
	if soft then
		if self.Weapons then
			for k, v in pairs(self.Weapons) do
				if istable(v) then
					client:GiveWeapon(tostring(v.weapon), v.attachments)
				else
					local wepClass = tostring(v)
					if wepClass == '' then continue end
					if wepClass == "beacon_placer" and maploader.Gamemode() != "war" then continue end
					client:GiveWeapon(wepClass)
				end
			end
		end
	else
		if self.HP then
			client:SetHealth(self.HP)
			client:SetMaxHealth(self.HP)
		end

		if self.AP then
			client:SetArmor(self.AP)
		end

		if self.RunSpeed then
			client:SetRunSpeed(self.RunSpeed)
		end
		
		if self.Weapons and not CVAR_GAMEMODE_KITS and not CVAR_CVAR_CUSTOM_LOADOUT then
			for k, v in pairs(self.Weapons) do
				if istable(v) then
					local wepClass = tostring(v.weapon)
					client:GiveWeapon(wepClass, v.attachments, true)
				else
					local wepClass = tostring(v)
					if wepClass == '' then continue end
					if wepClass == "beacon_placer" and maploader.Gamemode() != "war" then continue end
					client:GiveWeapon(wepClass, nil, true)
				end
			end
		end

		if self.Ammo then
			for k, v in pairs(self.Ammo) do
				client:GiveAmmo(tonumber(v), tostring(k), true)
			end
		end
	end

	if not IsValid(client:getBonemergeEntity("body")) or not IsValid(client:getBonemergeEntity("helmet")) then
		self:CreateBonemerges(client)
	end

	if !client.HandsInit then
		client.HandsInit = true
		client:SetupHands()
	end

	hook.Run("PlayerSetHandsModel", client, client:GetHands())
end

local basefaction = {}
basefaction.Name = nil
basefaction.Team = nil
basefaction.Classes = {}

function basefaction:GetName()
	if CLIENT then
		if !self._tName then
			self._tName = T(self.Name)	-- I think caching this ONE TIME is G O O D
		end

		return self._tName
	end
	
	return self.Name
end

function basefaction:GetID()
	if FACTION_REPLACE_ID[self.Name] then
		return FACTION_REPLACE_ID[self.Name]
	end

	return self.Name
end

function basefaction:GetVoice(id)
	if !self.Voices then 
		return 
	end

	if self.Voices[id] then
		return self.Voices[id][math.random(1, #self.Voices[id])]
	end
end

function basefaction:Class(id, loadout)
	if !self.Classes[id] then 
		return 
	end

	local classTable = table.Copy(self.Classes[id])
	if loadout and loadout != 0 and classTable.Variants then

		local loadoutInfo = classTable.Variants[loadout] or {}
		table.SafeMerge(classTable, loadoutInfo)

	end

	return classTable
end

function basefaction:LoadClasses()
	self.Classes = {}

	local strDir = GM.FolderName.."/gamemode/classes/"..self.Id.."/"
	local files, _ = file.Find(strDir.."*.lua", "LUA", "namedesc")

	local baseClass = {}
	setmetatable(baseClass, factionClass)
	table.SafeMerge(baseClass, factionClass)

	for k, v in ipairs(files) do
		local id = v:StripExtension()
		local new = {}

		setmetatable(new, factionClass)
		table.SafeMerge(new, factionClass)

		new._faction = self
		new.FactionID = self.Id
		new.BaseClass = baseClass
		new.Id = id

		CLASS = new
			Include(strDir..v)
			self.Classes[id] = CLASS
		CLASS = nil
	end

	if CLIENT then
		faction.ParseClasses(self)
	end
end

if CLIENT then
	function faction.ParseClasses(f)
		local JSONClasses = {}

		for k, v in pairs(f.Classes or {}) do
			table.insert(JSONClasses, {i = k, n = v:GetName(), r = (v.Parent or "")})
		end

		f.JSONClasses = util.TableToJSON(JSONClasses)
	end
end

function faction.New()
	local new = {}

	setmetatable(new, basefaction)
	table.SafeMerge(new, basefaction)

	return new
end

function faction.Add(id, data)
	if !id or !data then return end
	if !data.Team then return end

	data.Id = id
	data.Name = data.Name or "Unknown"

	stored[data.Id] = data
end

function faction.All()
	return stored
end

function faction.Get(id)
	return stored[id] or false
end

function faction.Load()
	local strDir = GM.FolderName.."/gamemode/factions/"
	local files, _ = file.Find(strDir.."*.lua", "LUA", "namedesc")

	for k, v in ipairs(files) do
		FACTION = faction.New()
			local id = v:StripExtension()
			local enum = Include(strDir..v)
			faction.Add(id, FACTION)
			if enum and !_G[enum] then
				_G[enum] = id
			end
			FACTION:LoadClasses()
		FACTION = nil
	end

	FACTION_REPLACE_ID = {
		[FACTION_GERMANYWEST] = FACTION_GERMANY
	}
end

function faction.Team(team)
	local id = faction.loaded[team]

	if !id then
		return
	end

	return faction.stored[id]
end

function faction.GetID(team)
	return faction.loaded[team]
end

function faction.Axis()
	return faction.Team(TEAM_AXIS)
end

function faction.Allies()
	return faction.Team(TEAM_ALLIES)
end

function faction.Launch(axisFaction, alliesFaction)
	faction.loaded = {
		[TEAM_AXIS] = axisFaction,
		[TEAM_ALLIES] = alliesFaction
	}
end

function faction.GetHead(id)
	if id == FACTION_USSR then
		return "models/soviet/main_head/head_sov.mdl"
	end

	return "models/german/main_head/head_german.mdl"
end

if CLIENT then

end

if SERVER then
	util.AddNetworkString('PlayGlobalSound')
	function faction.SendVoice(voice, teamID, ignore)
		ignore = tobool(ignore) or false

		local filter = RecipientFilter()
		if isnumber(teamID) then
			filter:AddRecipientsByTeam(teamID)
		else
			filter:AddRecipientsByTeam(TEAM_AXIS)
			filter:AddRecipientsByTeam(TEAM_ALLIES)
		end

		net.Start("PlayGlobalSound")
			net.WriteString(voice)
			net.WriteBool(ignore)
		net.Send(filter)
	end
end

if player.GetCount() > 0 then
	faction.Load()
end

hook.Add('Initialize', 'faction.Initialize', function()
	faction.Load()
end)