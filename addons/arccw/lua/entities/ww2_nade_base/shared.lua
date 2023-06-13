ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Base Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_stielhandgranate.mdl"
ENT.FuseTime = 4.5
ENT.ArmTime = 0
ENT.ImpactFuse = false
ENT.SoundTable = {}
AddCSLuaFile()

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()

        if self.FuseTime <= 0 then
            self:Detonate()
        end

        timer.Simple(0.1, function()
            if !IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(self:GetSound("ImpactHard") or Sound("physics/metal/metal_grenade_impact_hard" .. math.random(1,3) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(self:GetSound("ImpactSoft") or Sound("physics/metal/metal_grenade_impact_soft" .. math.random(1,3) .. ".wav"))
        end

        if (CurTime() - self.SpawnTime >= self.ArmTime) and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
        self:Detonate()
    end
end

function ENT:GetSound(id)
    if istable(self.SoundTable[id]) then
        return table.Random(self.SoundTable[id])
    end

    return self.SoundTable[id]
end

function ENT:Detonate()
    if SERVER then
        if !self:IsValid() then return end
        local effectdata = EffectData()
            effectdata:SetOrigin( self:GetPos() )

        if self:WaterLevel() >= 1 then
            util.Effect("WaterSurfaceExplosion", effectdata, true, true)
            self:EmitSound(self:GetSound("WaterExplode") or "weapons/underwater_explode3.wav", 120, 100, 1, CHAN_AUTO)
        else
            util.Effect("Explosion", effectdata, true, true)
            self:EmitSound(self:GetSound("Explode") or "phx/kaboom.wav", 125, 100, 1, CHAN_AUTO)
        end

        local attacker = self

        if self.Owner:IsValid() then
            attacker = self.Owner
        end
        util.BlastDamage(self, attacker, self:GetPos(), self.DamageRadius or 400, self.DamageAmount or 150)
            
        local Pos = self:GetPos()
        for k, v in pairs(self.ExplosionEffects or {}) do
            ParticleEffect(v, Pos, Angle(-90, 0, 0), nil)
        end

        if self.Decal then
            local tr = util.TraceLine({start = Pos, endpos = Pos + Vector(0,0,-32), mask=MASK_SHOT_HULL, filter = self})
            util.Decal(self.Decal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
        end

        self:Remove()

    end
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end