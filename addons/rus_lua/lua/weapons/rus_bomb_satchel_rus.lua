SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "Satchel Charge"
SWEP.TrueName = "Satchel Charge"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Explosive"
SWEP.Trivia_Country = "USSR"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 5


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_rus_satchel.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_rus_satchel.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "grenade"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24


SWEP.Throwing = true

SWEP.ShootWhileSprint = false


SWEP.ViewModelFOV = 80

SWEP.FuseTime = 15
SWEP.PullPinTime = 1.8

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 300
SWEP.ShootEntity = "ww2_bomb_rus_satchel"


SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -16)

SWEP.HolsterPos = Vector(1, 0, 2)
SWEP.HolsterAng = Angle(-5, 5, 0)

SWEP.WorldModelOffset = {
    pos = Vector(4.5, 4, 0),
    ang = Angle(10, 2, 180),
	scale = 0.9
}

SWEP.Animations = {
 
    ["draw"] = {
        Source = "base_draw",
    },
    ["base_idle"] = {
        Source = "base_idle",
    },	
	
    ["holster"] = {
        Source = "base_holster",
    },		
    ["ready"] = {
        Source = "base_draw",
    },
    ["pre_throw"] = {
        Source = "pullbackhigh",
    },
    ["throw"] = {
        Source = "throw",
		--Time = 0.5,
    },
    ["low_throw"] = {
        Source = "lowthrow",
		--Time = 0.5,
    }

}