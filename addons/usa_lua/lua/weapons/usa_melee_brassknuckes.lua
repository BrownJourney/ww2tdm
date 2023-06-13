SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USA"
SWEP.AdminOnly = false

SWEP.PrintName = "Brassknuckes"
SWEP.TrueName = "Brassknuckes"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Melee"
SWEP.Trivia_Country = "USA"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 0


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_brassknuckles.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_brassknuckles.mdl"
SWEP.ViewModelFOV = 60

SWEP.PrimaryBash = true
SWEP.CanBash = true
SWEP.MeleeDamage = 50
SWEP.MeleeRange = 32
SWEP.MeleeDamageType = DMG_CLUB
SWEP.ShootWhileSprint = true

SWEP.MeleeSwingSound = {"weapons/cultist/brassknuckles/brassknuckle_melee_01.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_02.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_03.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_04.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_05.wav"}
SWEP.MeleeHitSound = {"weapons/cultist/brassknuckles/brassknuckle_melee_flesh_01.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_flesh_02.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_flesh_03.wav", "weapons/cultist/brassknuckles/brassknuckle_melee_flesh_04.wav"}
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
SWEP.HoldtypeActive = "etool"

SWEP.Primary.ClipSize = -1

SWEP.Animations = {
    ["draw"] = {
        Source = {"draw_1", "draw_2"},
    },
    ["holster"] = {
        Source = "holster",
    },	
    ["ready"] = {
        Source = {"ready_1", "ready_2"},
    },
    ["idle"] = {
        Source = {"idle", "idle_fidget"}
    },	
	
    ["bash"] = {
	   Source = {"swing1", "swing2", "swing3"}
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