AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:SetModel("models/cultist/bags/spawnpoint.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end

	for k, v in pairs(ents.FindByClass("ww2_spawn_beacon")) do

		if v:GetTeam() == self:GetTeam() and v != self then

			v:Remove()

		end

	end

	if self:GetTeam() == TEAM_ALLIES then
        self:SetBodygroup(0, 1)
    end

end

function ENT:Think()

	local oppositeTeam = self:GetTeam() == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS

	for k, v in pairs(team.GetPlayers(oppositeTeam)) do

		if v:GetPos():DistToSqr(self:GetPos()) < 585225 then

			self:Remove()
			return

		end

	end

end

function ENT:TakeDamage()

	self:Remove()

end