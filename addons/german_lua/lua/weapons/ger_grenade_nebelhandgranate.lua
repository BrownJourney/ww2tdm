SWEP.Base = "arccw_base_nade"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "Nebelhandgranate"
SWEP.TrueName = "Nebelhandgranate"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Explosive"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 3


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_nebelhandgranate.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_nebelhandgranate.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "grenade"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24


SWEP.Throwing = true

SWEP.ShootWhileSprint = false


SWEP.ViewModelFOV = 80
SWEP.PullPinTime = 1.4

SWEP.FuseTime = 4

SWEP.Primary.ClipSize = 1

SWEP.MuzzleVelocity = 1300
SWEP.ShootEntity = "ww2_nade_german_nebelhandgranate"


SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -16)

SWEP.HolsterPos = Vector(1, 0, 2)
SWEP.HolsterAng = Angle(-5, 5, 0)

SWEP.WorldModelOffset = {
    pos = Vector(0, 0, 0),
    ang = Angle(-5, 2, 0),
    scale = 0.9
}


SWEP.Animations = {
   
    ["draw"] = {
        Source = "draw",
    },
    ["holster"] = {
        Source = "holster",
    },		
    ["ready"] = {
        Source = "draw",
    },
    ["pre_throw"] = {
        Source = "pullbackhigh",
    },
    ["throw"] = {
        Source = "throw",
		Time = 0.5,
    }
}