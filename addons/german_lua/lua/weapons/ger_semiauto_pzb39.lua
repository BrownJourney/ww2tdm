SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "PzB-39"
SWEP.TrueName = "PzB-39"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Automatic"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 2


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_pzb39.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_pzb39.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "heavy"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 43
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 1000 -- damage
SWEP.DamageMin = 500 -- damage done at maximum range
SWEP.Range = 500 -- in METRES effective range
SWEP.Penetration = 9 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 1210  
SWEP.MuzzleVelocity = 1210   -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 10,
     [HITGROUP_CHEST] = 1,
     [HITGROUP_STOMACH] = 1,
     [HITGROUP_LEFTARM] = 1,
     [HITGROUP_RIGHTARM] = 1,
     [HITGROUP_LEFTLEG] = 1,
     [HITGROUP_RIGHTLEG] = 1
 }

--- MELEE

SWEP.CanBash = false
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
SWEP.Primary.ClipSize = 1 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 1 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "ger_semiauto" -- what ammo type the gun uses
--

--RECOIL
SWEP.Recoil = 20
SWEP.RecoilSide = 20
SWEP.RecoilRise = 20
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = 200
SWEP.Delay = 60 / 900 -- 60 / RPM.

SWEP.AccuracyMOA = 0.5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 220 --inaccuracy added by movement.

SWEP.RecoilPunch = 1.5
SWEP.RecoilPunchBackMax = 1
SWEP.RecoilVMShake = 1 -- random viewmodel offset when shooty

SWEP.Sway = 0.7






--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/mg34/mg34_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/mg34/mg34_dist.wav"

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
SWEP.MuzzleEffect = {"muzzleflash_shotgun", "muzzleflash_ithica_1p_sparks", "muzzle_smoke_shot_b", "muzzleflash_ithica_1p_spark_trail", "muzzleflash_shotgun", "muzzleflash_ithica_1p_flame"}
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/weapons/cultist/shells/762x54.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.1
SWEP.ShellRotateAngle = Angle(0, 0, 0)
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

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
SWEP.BulletBGs = {
}

SWEP.CaseBGs = {
}

SWEP.StripperClipBGs = {}



SWEP.ActivePos = Vector(5.84, 0, -1.8)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(5.84, 0, -1.8)

SWEP.CrouchPos = Vector(0, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -16)

SWEP.HolsterPos = Vector(1, 0, 2)
SWEP.HolsterAng = Angle(-5, 5, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(6, -1, -1)
SWEP.CustomizeAng = Angle(10, 15, 15)

--- BIPOD

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 1 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.4 -- Bipod recoil for Integral bipods

SWEP.InBipodPos = Vector(-1, 0, -3)
SWEP.InBipodMult = Vector(1, 1, 1)

--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35


SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(5.5, 1, -2),
    ang = Angle(-5, 0, 180),
    scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(3, 0, 2),
    ang = Angle(-10, 0, -180)
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "SEMI-AUTO"
    },	
}



SWEP.Animations = {
-- BASE
    ["ready"] = {
        Source = "base_ready",
    },

    ["draw"] = {
        Source = "base_draw",
    },
	
    ["holster"] = {
        Source = "base_holster",
    },

    ["idle"] = {
        Source = "base_idle",
    },

    ["fire"] = {
    Source = {"base_fire"},
    },
	

    ["reload"] = {
    Source = "base_reload",
	Time = 4.5
    },
	

--BASE_EMPTY

    ["draw_empty"] = {
        Source = "base_draw_empty",
    },
	
    ["holster_empty"] = {
        Source = "base_holster_empty",
    },

    ["idle_empty"] = {
        Source = "base_idle_empty",
    },

    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },


--SPRINT	
			
    -- ["idle_sprint"] = {
    --     Source = "base_sprint",
    -- },
	
    -- ["idle_sprint_empty"] = {
    --     Source = "base_sprint_empty",
    -- },	
	
	
--- BIPOD

    ["enter_bipod"] = {
        Source = "deployed_in",
    },
	
    ["exit_bipod"] = {
        Source = "deployed_out",
    },
	
    ["idle_bipod"] = {
        Source = "deployed_idle",
    },

    ["fire_bipod"] = {
    Source = {"deployed_fire"},
    },
	

    ["reload_bipod"] = {
        Source = "deployed_reload",
		Time = 2.5
    },
	
	
	
	--BIPOD_EMPTY

    ["fire_bipod_empty"] = {
        Source = "deployed_dryfire",
    },
}