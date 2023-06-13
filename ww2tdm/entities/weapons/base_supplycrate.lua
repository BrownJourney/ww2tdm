SWEP.PrintName              = "Supply crate"
SWEP.Author                 = ""
SWEP.Purpose                = ''
SWEP.Instructions           = ""

SWEP.Category               = "WW2 SWEPS"
SWEP.Spawnable              = false

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

SWEP.Slot                    = 2
SWEP.SlotPos                = 1
SWEP.DrawAmmo                = false
SWEP.DrawCrosshair            = true

--[[-------------------------------------------------------------------------
SWEP-DATA
---------------------------------------------------------------------------]]
SWEP.ViewModel                = "models/ammo/ammo_us.mdl"
SWEP.WorldModel                = "models/ammo/ammo_us.mdl"
SWEP.SupplyType = "health"
SWEP.Amount = 1
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
    if gamestate.Get() != GS_ROUND_PLAYING and gamestate.Get() != GS_WAITING_PLAYERS then
        return
    end

    if (self.NextThrow or 0) >= CurTime() then
        return
    end

    self.NextThrow = CurTime() + 2

    if self.Amount <= 0 then
        notify.Add("no_crates", "nil", 2)
        return
    end

    self.RestoreSupply = CurTime() + CFG.SupplyCrateRestore
    self.Amount = self.Amount - 1

    self.Owner:DoCustomAnimEvent(PLAYERANIMEVENT_ATTACK_PRIMARY, 3003)

    if SERVER then
        local crate = ents.Create('ww2_supply_crate')
        crate:SetPos(self.Owner:EyePos() + self.Owner:GetAimVector() * 30)
        crate:SetModel(self.WorldModel)
        crate.team = self.Owner:Team()
        crate.owner = self.Owner
        crate.SupplyType = self.SupplyType
        crate:SetModelScale(1)
        crate:Spawn()

        local phys = crate:GetPhysicsObject()
        if IsValid(phys) then
            phys:ApplyForceCenter(self.Owner:GetAimVector() * 2000 + self.Owner:GetVelocity())
        end
    end
end

function SWEP:Think()
    if !self.RestoreSupply then
        return
    end

    if self.RestoreSupply - CurTime() >= 0 then
        return
    end

    self.RestoreSupply = nil;
    self.Amount = self.Amount + 1
    notify.Add("added_crates", "nil", 2)

    if self.Amount >= CFG.MaxSupplyCrates then
        return
    end

    self.RestoreSupply = CurTime() + CFG.SupplyCrateRestore
end

function SWEP:SecondaryAttack()
    return
end

function SWEP:Reload()
    return
end

function SWEP:DrawWorldModel()
    if not IsValid( self.Owner ) then return end

    local pos, ang = self.Owner:GetBonePosition( self.Owner:LookupBone( "ValveBiped.Bip01_R_Hand" ) )
    local offsetPos = ang:Right() * 5 + ang:Forward() * 3 + ang:Up() * -1

    ang:RotateAroundAxis( ang:Right(), 0 )
    ang:RotateAroundAxis( ang:Forward(), 170 )
    ang:RotateAroundAxis( ang:Up(), 0 )

    self:SetRenderOrigin( pos + offsetPos )
    self:SetRenderAngles( ang )

    local scale = 0.7
    if self.SupplyType == "health" then
        scale = 0.5
    end

    self:SetModelScale(scale)

    self:DrawModel()
end

function SWEP:GetViewModelPosition( pos, ang )
    local vm = self.Owner:GetViewModel()

    pos = pos + ang:Right() * 10 + ang:Forward() * 20 + ang:Up() * -20

    ang:RotateAroundAxis( ang:Up(), -45 )
    ang:RotateAroundAxis( ang:Forward(), 0 )
    ang:RotateAroundAxis( ang:Right(), 0 )

    return pos, ang
end