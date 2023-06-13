SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "Knife"
SWEP.TrueName = "Knife"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Melee"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 0


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_soviet_knife.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_soviet_knife.mdl"
SWEP.ViewModelFOV = 60

SWEP.PrimaryBash = true
SWEP.CanBash = true
SWEP.MeleeDamage = 50
SWEP.MeleeRange = 32
SWEP.MeleeDamageType = DMG_SLASH

SWEP.MeleeSwingSound = "weapons/arccw/knife/knife_slash1.wav"
SWEP.MeleeHitSound = "weapons/arccw/knife/knife_hitwall3.wav"
SWEP.MeleeHitNPCSound = "weapons/arccw/knife/knife_hit2.wav"

SWEP.MeleeGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE

SWEP.NotForNPCs = true

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "MELEE"
    },
}

SWEP.MeleeTime = 0.5

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "knife"

SWEP.Primary.ClipSize = -1

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
    ["idle"] = {
        Source = {"idle", "idle_fidget"}
    },	
	
    ["bash"] = {
	Source = {"slash_1", "slash_2"}
    },
    ["sprint"] = {
	Source = {"sprint"}
    },	
}

SWEP.IronSightStruct = false

SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.BashPos = Vector(0, 0, 0)
SWEP.BashAng = Angle(10, -10, 0)

SWEP.HolsterPos = Vector(0, -1, 2)
SWEP.HolsterAng = Angle(-15, 0, 0)