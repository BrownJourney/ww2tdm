ZONE = ZONE or {}

ZONE.stored = ZONE.stored or {}

local PLAYER = FindMetaTable("Player")

function PLAYER:IsOOB()

	return self:GetNWBool("SetToKilled")

end

function PLAYER:ActivateCountdown(uniqID)

	if timer.Exists(uniqID) then

		return

	end

	local time = CVAR_ZONE_TIME
	if TEAM_ATTACK and (self:Team() == TEAM_ATTACK or !self:GetNWBool('isFallingBack')) then

		time = 5

	end

	timer.Create(uniqID, time, 1, function()

		if !IsValid(self) then

			return

		end

		if self:GetMoveType() != MOVETYPE_NOCLIP then
			
			self:Kill()

		end

	end)

	self:SetNetBool("SetToKilled", true)

end

function PLAYER:StopCountdown(uniqID)

	if self:GetNWBool("InZone") then

		self:SetNetBool("InZone", false)

	end

	if timer.Exists(uniqID) then

		timer.Remove(uniqID)

		self:SetNetBool("SetToKilled", false)

	end

end

function ZONE.Init()

	-- do nothing

end

function ZONE:Create(boxMin, boxMax, team)

	local tbl = {bmin = boxMin, bmax = boxMax, team = team}

	table.insert(self.stored, tbl)

end

function ZONE:Clear(teamID)

	if teamID then

		local saveZones = self.stored

		self.stored = {}

		for k, v in pairs(saveZones) do

			if v.team != teamID then

				table.insert(self.stored, v)

			end

		end

	else

		self.stored = {}

	end

end

function ZONE:Check()

	for i, pl in pairs(player.GetAll()) do

		if not pl:IsAlive() then

			continue

		end

		local uniqID = "ww2_permitted"..pl:SteamID64()

		local pArea = CFG.PlayableArea
		if pArea then

			local isPlayerInZone;
			if istable(pArea.origin) then

				isPlayerInZone = not pl:GetPos():WithinAABox(pArea.origin.min, pArea.origin.max)

			else

				isPlayerInZone = pl:GetPos():Distance(pArea.origin) > pArea.radius

			end

			if isPlayerInZone then

				pl:ActivateCountdown(uniqID)

			else

				pl:StopCountdown(uniqID)

			end

			continue

		end

		pl.inRestrictedZone = pl.inRestrictedZone or -1

		for k, v in pairs(self.stored) do

			if pl:GetPos():WithinAABox(v.bmin, v.bmax) then

				pl.inRestrictedZone = k

				if pl:Team() == v.team or !v.team then

					pl:ActivateCountdown(uniqID)

				else

					if !pl:GetNWBool("InZone") then

						pl:SetNetBool("InZone", true)

					end

				end

			else

				if pl.inRestrictedZone == k or pl.inRestrictedZone == -1 then

					pl:StopCountdown(uniqID)

				end

			end

		end

	end

end

timer.Create("ZONES.Think", 0.1, 0, function()

	ZONE:Check()

end)

hook.Add('PlayerDeath', 'zones_removePlayerFlag', function(pl)

	pl:SetNetBool("SetToKilled", false)

end)

hook.Add("Initialize", "zones_initialize", function()

	ZONE.Init()

end)
