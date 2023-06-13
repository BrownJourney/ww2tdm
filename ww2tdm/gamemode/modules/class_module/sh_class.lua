
local PLAYER = FindMetaTable('Player')

BASE_CLASS = "shooter"

BASE_CLASS_LEVEL_XP = 5000

CLASS_GENERAL = "general"

function PLAYER:SelectClass(id, shouldNotify, noloadout)

	if SERVER then

		if id == self:GetClass() then

			return

		end

		local faction = self:GetFaction()

		if !faction then

			return

		end

		local class = faction:Class(id)

		if class then

			if !self:IsClassBought(id) and class.Cost > 0 then

				return

			end

			if shouldNotify and (self.NextClass or 0) >= CurTime() then

				return

			end

			self.NextClass = CurTime() + 0.1

			if class:Limited(self:Team(), self) then

				notify.Add(self, "К сожалению, данный класс уже занят другим человеком!", "Информация на клиенте могла не успеть загрузиться на данный момент", 7)
				return

			end

			if faction:Class(self:GetClass()) and self:IsAlive() then
				if gamestate.Get() == GS_ROUND_PLAYING then
					self:Kill()
				else
					self:RespawnClass()
				end
			end

			local factionSaved = self:GetPerm('classSaved') or {}
			factionSaved[faction.Name] = id
			self:SetNetString("selectedClass", id)
			self:SetPerm('classSaved', factionSaved)

			self.initClassSpawn = false

			if shouldNotify then

				notify.Add(self, 'changed_class', 'nil', 2)

			end

		end

		if !noloadout then

			self:SelectLoadout(0)

		end

	else

		self:SetNWString("selectedClass", id)

		net.Start('SelectClass')
			net.WriteString(id)
		net.SendToServer()

	end

end

function PLAYER:SelectLoadout(id, silent)

	if SERVER then

		if (self.NextLoadout or 0) >= CurTime() then

			return

		end

		self.NextLoadout = CurTime() + 0.1

		local faction = self:GetFaction()

		if !faction then

			return

		end


		local class = faction:Class(self:GetClass())

		if !class then

			return

		end

		if id != 0 then
			
			if !class.Variants or !class.Variants[id] or !self:IsLoadoutBought(id) then

				return

			end

		end

		local factionSaved = self:GetPerm('loadoutSaved') or {}
		factionSaved[faction.Name] = id
		self:SetNetInt('selectedLoadout', id)
		self:SetPerm('loadoutSaved', factionSaved)

		if self:IsAlive() and gamestate.Get() == GS_ROUND_PREPARE then

			self:RespawnClass()

		end

		if id != 0 and !silent then

			notify.Add(self, 'changed_loadout', 'nil', 2)

		end

	else

		self:SetNWInt("selectedLoadout", id)

		net.Start('SelectLoadout')
			net.WriteUInt(id, 5)
		net.SendToServer()

	end

end

function PLAYER:HasUnlockedEverything()

	if SERVER then

		return self:GetPerm("warrior_package") == 1

	end

	return self:GetNWInt("warrior_package") == 1

end

function PLAYER:GetClass()
	
	return self:GetNWString("selectedClass")

end

function PLAYER:GetDeriveClass()

	local class = self:GetClass()
	if self:GetClassInfo("Based") then
		
		class = self:GetClassInfo("Based")

	end
	
	return class

end

function PLAYER:GetLoadout()

	return self:GetNWInt('selectedLoadout') 

end

function PLAYER:GetClassInfo(id, forceClass)

	local faction = self:GetFaction()
	local class = faction:Class(forceClass or self:GetClass(), self:GetLoadout())

	if class then

		return class[id]

	end

end

function GetXPForLevel(level)

	if !CFG.ClassLevelXP[level] then

		return BASE_CLASS_LEVEL_XP

	end

	return CFG.ClassLevelXP[level]

end