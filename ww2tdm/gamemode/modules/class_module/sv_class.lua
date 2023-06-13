
local PLAYER = FindMetaTable('Player')

function PLAYER:LoadClassData()

	local cl, ld = self:GetPerm('classSaved'), self:GetPerm('loadoutSaved')
	local faction = self:GetFaction()
	local factionName = faction.Name

	if !cl then

		return false

	end

	if !cl[factionName] then

		return false

	end

	local class, loadout = cl[factionName], ld[factionName]

	local clData = faction:Class(class)
	if !clData then

		return

	end

	if clData:Limited() then
		self:SelectClass(BASE_CLASS, false)
	end

	self:SelectClass(class, false, true)
	self:SelectLoadout(loadout, true)

	return true

end

util.AddNetworkString('ClearClassInfo')
util.AddNetworkString('UpdateClassInfo')
function PLAYER:UpdateClassInfo()

	local faction = self:GetFaction()

	if !faction then

		return

	end

	local classes = self:GetClassesTable()

	net.Start("ClearClassInfo")
	net.Send(self)

	for classid, loadouts in pairs(classes) do

		net.Start("UpdateClassInfo")

			net.WriteString(classid)
			net.WriteTable(loadouts)

		net.Send(self)

	end

end

function PLAYER:GetClassesTable()

	local classes = self:GetPerm("classBought") or {}
	local factionClasses = classes[self:GetFaction().Name] or {}
	for k, v in pairs(classes[CLASS_GENERAL] or {}) do
		if !factionClasses[k] then
			factionClasses[k] = {}
		end
	end

	return factionClasses

end

function PLAYER:AddClassToStruct(struct, id)

	local classes = self:GetPerm("classBought") or {}

	if !classes[struct] then

		classes[struct] = {}

	end

	classes[struct][id] = {}

	self:SetPerm("classBought", classes)

end

function PLAYER:BuyClass(id)

	local faction = self:GetFaction()

	if !faction then

		return

	end

	local class = faction:Class(id)

	if !class then

		return

	end

	if self:IsClassBought(id) then

		return

	end

	if self:GetLevel() < (class:GetLevel() or 0) then

		return

	end

	if class:GetBase() then

		if self:GetEliteCoins() < class.Cost then

			notify.Add(self, "notenough_elitecoins")
			return

		end

		self:AddEliteCoins(-class.Cost)

	else

		if self:GetCoins() < class.Cost then

			notify.Add(self, "notenough_coins")
			return

		end

		self:AddCoins(-class.Cost)

	end

	self:AddClassToStruct(faction.Name, id)
	self:AddClassToStruct(CLASS_GENERAL, id)

	self:SelectClass(id)

	notify.Add(self, 'hud/ico_soldier.png', nil, 3)
	notify.Custom(self, "unlocked_class", class.Name)

end

function PLAYER:BuyLoadout(id)

	local faction = self:GetFaction()

	if !faction then

		return

	end

	local classid = self:GetClass()

	local classLoadout = faction:Class(classid, id)

	if !classLoadout then

		return

	end

	if !self:IsClassBought(classid) then

		return

	end

	if self:IsLoadoutBought(id) then

		return

	end

	local cost = self:GetLoadoutCost(classid, id)

	if self:GetCoins() < cost then

		notify.Add(self, "notenough_coins")
		return

	end

	self:AddCoins(-cost)

	local classes = self:GetPerm("classBought") or {}
	local facname = faction.Name

	if !classes[facname] then

		classes[facname] = {}

	end

	if !classes[facname][classid] then

		classes[facname][classid] = {}

	end

	table.insert(classes[facname][classid], id)
	table.insert(classes[CLASS_GENERAL][classid], id)

	self:SetPerm("classBought", classes)

	notify.Custom(self, "unlocked_loadout", classLoadout.Name)

end

function PLAYER:IsClassBought(id)

	local faction = self:GetFaction()
	if !faction then

		return false

	end

	if id == BASE_CLASS then

		return true

	end

	if self:HasUnlockedEverything() then

		return true

	end

	local classes = self:GetClassesTable()

	return classes[id]

end

function PLAYER:GetLoadoutCost(classid, loadoutid, faction)

	faction = faction or self:GetFaction()

	if !faction then

		return

	end

	local baseCost = faction:Class(classid, loadoutid):GetCost()

	local classData = self:GetPerm("classBought", {})[CLASS_GENERAL]

	if classData and classData[classid] then

		if table.HasValue(classData[classid], loadoutid) then

			return baseCost - math.floor(baseCost * CFG.LoadoutDiscount)

		end

	end

	return baseCost

end

function PLAYER:IsLoadoutBought(id)

	local faction = self:GetFaction()

	if !faction then

		return false

	end

	local class = faction:Class(self:GetClass())

	if !class then

		return false

	end

	if self:HasUnlockedEverything() then

		return true

	end

	if class:GetCost() == 0 then

		return true

	end

	if id == 0 then

		return true

	end

	local classes = self:GetPerm("classBought") or {}
	local facname = self:GetFaction().Name

	if !classes[facname] then

		return false

	end

	if !classes[facname][self:GetClass()] then

		return false

	end

	return table.ContainValue(classes[facname][self:GetClass()], id)


end

function PLAYER:GetCurrentClass()

	return self.wasClass or self:GetClass()

end

--[[-------------------------------------------------------------------------
CLASS LEVELING
---------------------------------------------------------------------------]]

function PLAYER:GetClassProgression(class)

	local clProgression = self:GetPerm("clProgression") or {}

	local classid = class or self:GetCurrentClass()

	if !clProgression[classid] then

		clProgression[classid] = {level = 0, xp = 0}

	end

	return clProgression[classid]

end

function PLAYER:GetClassLevel(class)

	return self:GetClassProgression(class).level

end

function PLAYER:GetClassXP(class)

	return self:GetClassProgression(class).xp

end

function PLAYER:ChangeClassStat(stat, val, class)

	local clProgression = self:GetPerm("clProgression") or {}

	local classid = class or self:GetCurrentClass()

	if !clProgression[classid] then

		clProgression[classid] = {level = 0, xp = 0}

	end

	clProgression[classid][stat] = val

	self:SetPerm("clProgression", clProgression)

end

function PLAYER:AddClassLevel(amount, class, silent)

	if self:GetClassLevel(class) >= CFG.ClassMaxLevel then

		return

	end

	local newLevel = self:GetClassLevel(class) + (amount or 1)

	self:ChangeClassStat("level", newLevel, class)

	-- stop right there you criminal scum!
	if silent then return end

	notify.Add(self, "class_levelup", nil, 5, 'ww2/ui/levelup.ogg')

	if newLevel == CFG.ClassMaxLevel then

		notify.Add(self, "trait_unlocked")
		self:AddEliteCoins(CFG.EliteCoinsForLevel)

	end

end

function PLAYER:AddClassXP(xp, class)

	local newXP = self:GetClassXP(class) + xp
	local xpForLevel = GetXPForLevel(self:GetClassLevel(class))

	if newXP >= xpForLevel then

		newXP = newXP - xpForLevel
		self:AddClassLevel(1, class)

	end

	self:ChangeClassStat("xp", newXP, class)

end

function PLAYER:UnlockEverything()

	self:SetPerm("warrior_package", 1)
	self:SetNetInt("warrior_package", 1)

	self:UpdateClassTopLevels()

end

function PLAYER:UpdateClassTopLevels()

	for classid, level in pairs(faction.levels) do

		self:AddClassLevel(10, classid, true)

	end

end

function PLAYER:_TestBreak()

	local classes = self:GetPerm("classBought") or {}

	classes[CLASS_GENERAL] = nil;

	self:SetPerm("classBought", classes)

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add("PlayerFullyLoaded", "InitUnlockStatus", function(ply)
	local warrior_package = ply:GetPerm("warrior_package", 0)
	ply:SetNetInt("warrior_package", warrior_package)
	-- in case if there's some new classes added
	if warrior_package == 1 then
		ply:UpdateClassTopLevels()
	end
end)

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

util.AddNetworkString('SelectClass')
net.Receive('SelectClass', function(len, ply)

	local id = net.ReadString()
	ply:SelectClass(id, true)

end)

util.AddNetworkString('SelectLoadout')
net.Receive('SelectLoadout', function(len, ply)
	
	local id = net.ReadUInt(5)
	ply:SelectLoadout(id)

end)

util.AddNetworkString('BuyClass')
net.Receive('BuyClass', function(len, ply)

	local id = net.ReadString()
	ply:BuyClass(id)

end)

util.AddNetworkString('BuyLoadout')
net.Receive('BuyLoadout', function(len, ply)

	local id = net.ReadUInt(5)
	ply:BuyLoadout(id)

end)

util.AddNetworkString("FactionSetGeneral")
net.Receive("FactionSetGeneral", function(len, ply)

	local facid = net.ReadString()
	local classes = ply:GetPerm("classBought") or {}
	if classes[CLASS_GENERAL] then return end

	local oppositeid = facid == FACTION_GERMANY and FACTION_USSR or FACTION_GERMANY
	local faction = faction.Get(oppositeid)

	classes[CLASS_GENERAL] = classes[facid] or {}

	local coins = 0
	for id, loadouts in pairs(classes[oppositeid] or {}) do
		coins = coins + faction:Class(id).Cost
		for k, v in pairs(loadouts) do
			coins = coins + ply:GetLoadoutCost(id, v, faction)
		end
	end

	ply:AddCoins(coins)

	classes[oppositeid] = {}
	
	ply:SetPerm("classBought", classes)

	notify.Add(ply, "Процедура обновления стандартна хранения информации завершена успешна!", "Вам было возвращено " .. coins .. " монет!")

end)