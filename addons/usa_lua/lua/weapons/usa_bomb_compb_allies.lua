SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USA"
SWEP.AdminOnly = false

SWEP.PrintName = "Explosive Charge"
SWEP.TrueName = "Explosive Charge"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Explosive"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 5


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_compb_allied.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_compb_allied.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "grenade"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24


SWEP.Throwing = true
SWEP.Sticky = true

SWEP.ShootWhileSprint = false


SWEP.ViewModelFOV = 80

SWEP.FuseTime = 15
SWEP.PullPinTime = 1.3

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 350


SWEP.ShootEntity = "ww2_nade_usa_compb_allies"


SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -16)

SWEP.HolsterPos = Vector(1, 0, 2)
SWEP.HolsterAng = Angle(-5, 5, 0)

SWEP.WorldModelOffset = {
    pos = Vector(7, 2, 0),
    ang = Angle(10, 2, -90),
    scale = 0.9
}

SWEP.Animations = {
   
    ["draw"] = {
        Source = "base_draw",
    },
    ["holster"] = {
        Source = "base_holster",
    },		
    ["ready"] = {
        Source = "base_draw",
    },
    ["pre_throw"] = {
        Source = "base_pullback",
    },
    ["throw"] = {
        Source = "base_throw",
    },
	["plant"] = {
        Source = "base_plant",
    }
}