AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/Items/BoxSRounds.mdl")
	self:EnablePhysics()
	self:SetUseType(SIMPLE_USE)
	self:SetCollisionGroup(COLLISION_GROUP_DISSOLVING)

	timer.Simple(60, function()
		SafeRemoveEntity(self)
	end)

end

function ENT:EnablePhysics()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetAngles(Angle(0, 0, math.random(0, 360)))
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use(act, call)
	if !IsValid(call) then
		return
	end

	if !call:IsPlayer() then
		return
	end

	if !call:IsAlive() then
		return
	end

	if call:GetPos():Distance(self:GetPos()) > 100 then
		return
	end

	if (call.nextWepSwitch or 0) >= CurTime() then
		return
	end

	local currentEquipment = self:GetEquipment()

	local stripWep = call:GetWeapons()[1]

	if IsValid(stripWep) then
		call:StripWeapon(stripWep:GetClass())
	end

	call.nextWepSwitch = CurTime() + 6
	local wep = call:GiveWeapon(currentEquipment, self.attachments)
	call:SelectWeapon(currentEquipment)
	wep:SetClip1(self.clip1)
	wep.UBGL_Used = self.UBGL_Used

	if IsValid(stripWep) then
		self:SetPos(self:GetPos() + Vector(0, 0, 20))
		self:ChangeEquipment(stripWep)
	else
		self:Remove()
	end
end

function ENT:ChangeEquipment(wep)
	local wepClass = wep:GetClass()
	local wepStored = weapons.Get(wepClass)
	if !wepStored then
		self:Remove()
		return
	end
	self:SetModel(wepStored.WorldModel)
	self:SetEquipment(wepClass)
	self:EnablePhysics()
	self.clip1 = wep:Clip1()
	self.attachments = {}
	self.UBGL_Used = wep.UBGL_Used
	for k, v in pairs(wep.Attachments or {}) do
		self.attachments[k] = v.Installed
	end

	timer.Create(self:GetCreationID()..'_physicsDisable', 2, 1, function()
		if !IsValid(self) then
			return
		end
		self:SetMoveType(MOVETYPE_NONE)
	end)
end
