AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/bf1/gadgets/ammo pouch.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetTrigger(true)
	self:SetAngles(Angle(0, 0, math.random(0, 360)))
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

	local wep = ply:GetActiveWeapon()
	if !IsValid(wep) then
		return
	end

	local clip = wep.Primary.ClipSize
	ply:GiveAmmo(math.min(clip / 1.5, 80), wep:GetPrimaryAmmoType(), true)

	self:EmitSound("items/ammo_pickup.wav", 80)

	self:Remove()
end