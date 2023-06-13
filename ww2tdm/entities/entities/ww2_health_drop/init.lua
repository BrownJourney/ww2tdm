AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/bf1/gadgets/medicine crate.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetTrigger(true)
	self:SetAngles(Angle(0, 0, math.random(0, 360)))
	self:SetModelScale(0.75)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end

	timer.Create(self:GetCreationID()..'_physicsDisable', 2, 1, function()
		if !IsValid(self) then
			return
		end
		self:SetMoveType(MOVETYPE_NONE)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	end)

	timer.Simple(60, function()
		SafeRemoveEntity(self)
	end)

end

function ENT:Touch(ply)
	if !ply:IsPlayer() then
		return
	end

	if !ply:IsAlive() then
		return
	end

	ply:SetHealth(math.min(ply:Health() + ply:GetMaxHealth() * 0.5, ply:GetMaxHealth()))

	self:Remove()
end