SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "Binoculars"
SWEP.TrueName = "Binoculars"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Bolt-Action"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 6


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_binoculars_german.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_binoculars_german.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "shotgun"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 306 -- damage
SWEP.DamageMin = 200 -- damage done at maximum range
SWEP.Range = 35 -- in METRES effective range
SWEP.Penetration = 2 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 700
SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BUCKSHOT -- DMG_BULLET


--- MELEE

SWEP.CanBash = true
SWEP.PrimaryBash = false -- primary attack triggers melee attack

SWEP.MeleeDamage = 25
SWEP.MeleeRange = 16
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 0.5
--SWEP.MeleeGesture = nil
SWEP.MeleeAttackTime = 0.2

SWEP.Melee2 = false
SWEP.Melee2Damage = 25
SWEP.Melee2Range = 16
SWEP.Melee2Time = 0.5
--SWEP.Melee2Gesture = nil
SWEP.Melee2AttackTime = 0.2

-- MAG
SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set.
SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 5 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
--

--RECOIL
SWEP.Recoil = 2
SWEP.RecoilSide = 1
SWEP.RecoilRise = 1
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = -1
SWEP.Delay = 60 / 300 -- 60 / RPM.

SWEP.AccuracyMOA = 0.2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 220 --inaccuracy added by movement.

SWEP.RecoilPunch = 1.5
SWEP.RecoilPunchBackMax = 1
SWEP.RecoilVMShake = 1 -- random viewmodel offset when shooty

SWEP.Sway = 0.4






--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/hunting/fire.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/hunting/dist.wav"

SWEP.FiremodeSound = "weapons/arccw/firemode.wav"
SWEP.MeleeSwingSound = "weapons/arccw/melee_lift.wav"
SWEP.MeleeMissSound = "weapons/arccw/melee_miss.wav"
SWEP.MeleeHitSound = "weapons/arccw/melee_hitworld.wav"
SWEP.MeleeHitNPCSound = "weapons/arccw/melee_hitbody.wav"
SWEP.EnterBipodSound = "weapons/arccw/bipod_down.wav"
SWEP.ExitBipodSound = "weapons/arccw/bipod_up.wav"
SWEP.SelectUBGLSound =  "weapons/arccw/ubgl_select.wav"
SWEP.ExitUBGLSound = "weapons/arccw/ubgl_exit.wav"



--MUZZLEFLASH
SWEP.NoFlash = false -- disable light flash
SWEP.GMMuzzleEffect = false -- Use Gmod muzzle effects rather than particle effects
SWEP.MuzzleEffect = "muzzleflash_3"
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/shells/shell_762nato.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 3
SWEP.ShellRotateAngle = Angle(0, 0, 0)
SWEP.CaseEffectAttachment = 3 -- which attachment to put the case effect on

--IMPACTS
--SWEP.ImpactEffect = nil
--SWEP.ImpactDecal = nil

--//
--BULLET RELOAD

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}
SWEP.CaseBones = {}
-- Unlike BulletBones, these bones are determined by the missing bullet amount when reloading
SWEP.StripperClipBones = {}

-- the same as the bone versions but works via bodygroups.
-- bodygroups work the same as in attachmentelements.
-- [0] = {ind = 0, bg = 1}
SWEP.BulletBGs = {}
SWEP.CaseBGs = {}
SWEP.StripperClipBGs = {}


SWEP.ActivePos = Vector(0, 0, 0)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(0, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -16)

SWEP.HolsterPos = Vector(1, 0, 2)
SWEP.HolsterAng = Angle(-5, 5, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(6, -1, -1)
SWEP.CustomizeAng = Angle(10, 15, 15)

--- BIPOD

SWEP.Bipod_Integral = false -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 1 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 1 -- Bipod recoil for Integral bipods



--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35

SWEP.IronSightStruct = {
    Pos = Vector(-3.12, 0, 1.84),
    Ang = Angle(-0.301, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(-6, 5.1, -6),
    ang = Angle(-5, 2, 180),
	scale = 0.9
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "BOLT"
    },
    {
        Mode = 0
    }
}


SWEP.Animations = {
    ["draw"] = {
        Source = "base_draw",
    },
	
    ["idle"] = {
        Source = "base_idle",
        LHIK = false,
    },
	
    ["holster"] = {
        Source = "base_holster",
    },
	
    ["ready"] = {
        Source = "base_ready",
    },
///	

    ["fire"] = {
        Source = "base_fire_start",
        MinProgress = 0.15,
    },
	

    ["fire_iron"] = {
        Source = "iron_fire_start",
        MinProgress = 0.15,
    },
	
	
///	
	
    ["cycle"] = {
        Source = "base_fire_end",
        ShellEjectAt = 0.35,
        MinProgress = 0.95,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
    },
	
    ["cycle_iron"] = {
        Source = "iron_fire_end",
        ShellEjectAt = 0.35,
        MinProgress = 0.95,
        TPAnim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
    },

///

    ["sgreload_start"] = {
        Source = "base_reload_start",
        MinProgress = 0.95,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },

    ["sgreload_insert"] = {
        Source = "base_reload_insert",
        MinProgress = 0.6,
		Time = 0.7,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },	
	
    ["sgreload_finish"] = {
        Source = "base_reload_end",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        LHIK = false,
        LHIKIn = 0.5,
		},
	
	   ["sgreload_start_empty"] = {
        Source = "base_reload_start_empty",
        MinProgress = 0.95,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
    },
	
    ["sgreload_finish_empty"] = {
        Source = "reload_end",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 1,
    },
	
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
}