SWEP.PrintName              = "Beacon placer"
SWEP.Author                 = ""
SWEP.Purpose                = ''
SWEP.Instructions           = ""

SWEP.Category               = "WW2 SWEPS"
SWEP.Spawnable              = true

SWEP.Primary.ClipSize        = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic        = true
SWEP.Primary.Ammo            = "none"

SWEP.Secondary.ClipSize        = -1
SWEP.Secondary.DefaultClip    = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo            = "none"

SWEP.Weight                    = 5
SWEP.AutoSwitchTo            = false
SWEP.AutoSwitchFrom            = false

SWEP.Slot                    = 5
SWEP.SlotPos                = 1
SWEP.DrawAmmo                = false
SWEP.DrawCrosshair            = true

--[[-------------------------------------------------------------------------
SWEP-DATA
---------------------------------------------------------------------------]]
SWEP.ViewModel                = "models/cultist/bags/spawnpoint.mdl"
SWEP.WorldModel                = "models/cultist/bags/spawnpoint.mdl"
--[[-------------------------------------------------------------------------
SWEP-DATA
---------------------------------------------------------------------------]]

function SWEP:Initialize()
    self:SetHoldType( "unility" )
end

function SWEP:Holster()
    return true
end

function SWEP:PrimaryAttack()
    if CLIENT then return end
    if self.used then return end

    local tr = util.GetPlayerTrace(self.Owner)
    local trace = util.TraceLine(tr)

    if (!trace.Hit) then return end
    if (trace.HitNormal.z <= 0.03) then return end
    if IsValid(trace.Entity) then return end
    if trace.HitPos:DistToSqr(self.Owner:GetPos()) > 22500 then return end

    local ang = self.Owner:GetAimVector():Angle() - Angle(0, 180, 0)
    local pos = Vector(trace.HitPos.X, trace.HitPos.Y, trace.HitPos.Z)

    local beacon = ents.Create("ww2_spawn_beacon")
    beacon:SetPos(pos)
    beacon:SetAngles(Angle(0, ang.Yaw, 0))
    beacon:SetTeam(self.Owner:Team())
    beacon:SetOwner(self.Owner)
    beacon:Spawn()

    self.used = true
    self:Remove()
end

function SWEP:Think()
    self:DrawGhostEntity()
end

function SWEP:SecondaryAttack()
    return
end

function SWEP:Reload()
    return
end

function SWEP:DrawGhostEntity()

    if SERVER then return end

    local model = self.ViewModel
    local lp = self.Owner

    if IsValid(lp.GhostEntity) then

        local tr = util.GetPlayerTrace(self.Owner)
        local trace = util.TraceLine(tr)

        if (!trace.Hit) then return end

        local ang = self.Owner:GetAimVector():Angle() - Angle(0, 180, 0)
        local BBMin, BBCenter, BBMax = lp.GhostEntity:OBBMins(), lp.GhostEntity:OBBCenter(), lp.GhostEntity:OBBMaxs()
        local pos = Vector(trace.HitPos.X, trace.HitPos.Y, trace.HitPos.Z - (trace.HitNormal.z * BBMin.z))

        local goodSpawn = trace.HitNormal.z > 0.03

        if goodSpawn then

        	lp.GhostEntity:SetColor(Color(0, 255, 0, 100))

        else

        	lp.GhostEntity:SetColor(Color(255, 0, 0, 100))

        end

        lp.GhostEntity:SetModel( model )
	    lp.GhostEntity:SetPos(pos)
	    lp.GhostEntity:SetAngles(Angle(0, ang.Yaw, 0))

    else

    	util.PrecacheModel( model )

    	lp.GhostEntity = ents.CreateClientProp()

        lp.GhostEntity:SetModel( model )
        lp.GhostEntity:SetPos( Vector(0, 0, 0) )
        lp.GhostEntity:SetAngles( Angle(0, 0, 0) )
        lp.GhostEntity:Spawn()

        lp.GhostEntity:SetBodyGroups(self:GetBodyGroups())
        
        lp.GhostEntity:SetSolid( SOLID_VPHYSICS );
        lp.GhostEntity:SetMoveType( MOVETYPE_NONE )
        lp.GhostEntity:SetNotSolid( true );
        lp.GhostEntity:SetRenderMode( RENDERMODE_TRANSALPHA )
        lp.GhostEntity:SetColor( Color( 255, 255, 255, 150 ) )

    end

end

function SWEP:DrawWorldModel()
    if not IsValid( self.Owner ) then return end

    local pos, ang = self.Owner:GetBonePosition( self.Owner:LookupBone( "ValveBiped.Bip01_R_Hand" ) )
    local offsetPos = ang:Right() * 5 + ang:Forward() * 3 + ang:Up() * -1

    if self.Owner:Team() == TEAM_ALLIES then
        self:SetBodygroup(0, 1)
    end

    ang:RotateAroundAxis( ang:Right(), 0 )
    ang:RotateAroundAxis( ang:Forward(), 170 )
    ang:RotateAroundAxis( ang:Up(), 0 )

    self:SetRenderOrigin( pos + offsetPos )
    self:SetRenderAngles( ang )

    local scale = 0.7

    self:SetModelScale(scale)

    self:DrawModel()
end

function SWEP:GetViewModelPosition( pos, ang )
    local vm = self.Owner:GetViewModel()

    if self.Owner:Team() == TEAM_ALLIES then
        vm:SetBodygroup(0, 1)
    end

    pos = pos + ang:Right() * 10 + ang:Forward() * 20 + ang:Up() * -20

    ang:RotateAroundAxis( ang:Up(), -45 )
    ang:RotateAroundAxis( ang:Forward(), 0 )
    ang:RotateAroundAxis( ang:Right(), 0 )

    return pos, ang
end