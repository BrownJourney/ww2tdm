SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "LAD"
SWEP.TrueName = "LAD"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Automatic"
SWEP.Trivia_Country = "USSR"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 2


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_lad.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_lad.mdl"

SWEP.ROBroken = true


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "heavy"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 60 -- damage
SWEP.DamageMin = 20 -- damage done at maximum range
SWEP.Range = 70 -- in METRES effective range
SWEP.Penetration = 5 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 705
SWEP.MuzzleVelocity = 705  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 10,
     [HITGROUP_CHEST] = 1,
     [HITGROUP_STOMACH] = 1,
     [HITGROUP_LEFTARM] = 0.8,
     [HITGROUP_RIGHTARM] = 0.8,
     [HITGROUP_LEFTLEG] = 0.8,
     [HITGROUP_RIGHTLEG] = 0.8
 }

 

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
SWEP.Primary.ClipSize = 150 -- DefaultClip is automatically set. /n //ClipSize = 100 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 150 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "rus_mg" -- what ammo type the gun uses
--
SWEP.Delay = 60 / 600 -- 60 / RPM.


--RECOIL
-----------
SWEP.Recoil = 8 -- общий рекоил
SWEP.RecoilSide = 2 -- рекоил в стороны
SWEP.RecoilRise = 2.5 -- рекоил вверх
SWEP.MaxRecoilBlowback = -1 -- хз
SWEP.VisualRecoilMult = 1 -- увеличение рекоила для первого лица. Визуальный эффект 
SWEP.RecoilPunch = 1 -- Насколько шатает камеру. 
SWEP.RecoilPunchBackMax = 2 -- насколько оружие отходит к камере при стрельбе. Визуальный эффект.
SWEP.RecoilVMShake = 1 -- насколько сильно вью модель тресется

-- Направления отдачи
SWEP.RecoilDirection = Angle(1, 0, 0) -- Насколько уводит камеру. 1 число - вверх, 2 число - в сторону. 3 трогать нильзя 
SWEP.RecoilDirectionSide = Angle(1, 1, 0) -- Насколько шатает оружие 1 число - вверх\вниз, 2 число - право\лево. 3 трогать нильзя


SWEP.Sway = 5 -- Насколько сильно дрожат руки при прицеливание

--Разброс влияет на полет самой пули после выстрела, даже если рекоил 0, если установлен разброс он все равно будет
SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- Базовый разброс при стрельбе от бедра
SWEP.MoveDispersion = 450 -- Разброс при движении + к базовому
SWEP.SightsDispersion = 0 -- Разброс при прицельной стрельбе
SWEP.JumpDispersion = 3000 -- прыгуны сука пошли нахуй




--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/mg81/mg42_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/mg81/mg42_tp.wav"

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
SWEP.MuzzleEffect = {"muzzleflash_mg42_1p_core", "muzzleflash_smoke_small_variant_5", "muzzle_smoke_b", "muzzleflash_mg42_1p_sparks", "muzzleflash_mg42_1p_spark_trail"}
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
[0] = {ind = 1, bg = 21},
[1] = {ind = 1, bg = 20},
[2] = {ind = 1, bg = 19},
[3] = {ind = 1, bg = 18},
[4] = {ind = 1, bg = 17},
[5] = {ind = 1, bg = 16},
[6] = {ind = 1, bg = 15},
[7] = {ind = 1, bg = 14},
[8] = {ind = 1, bg = 13},
[9] = {ind = 1, bg = 12},
[10] = {ind = 1, bg = 11},
[11] = {ind = 1, bg = 10},
[12] = {ind = 1, bg = 9},
[13] = {ind = 1, bg = 8},
[14] = {ind = 1, bg = 7},
[15] = {ind = 1, bg = 6},
[16] = {ind = 1, bg = 5},
[17] = {ind = 1, bg = 4},
[18] = {ind = 1, bg = 3},
[19] = {ind = 1, bg = 2},
[20] = {ind = 1, bg = 1},
[21] = {ind = 1, bg = 0}
}
SWEP.CaseBGs = {}
SWEP.StripperClipBGs = {}

SWEP.InversedBulletBGs = true

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

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.1 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.1 -- Bipod recoil for Integral bipods

SWEP.InBipodPos = Vector(-1, 0, -3)
SWEP.InBipodMult = Vector(1, 1, 1)

--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35



SWEP.IronSightStruct = {
    Pos = Vector(-2.75, 0, -0.3),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.BipodSights = {
    Pos = Vector(-2.65, 0, -0.06),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}


SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(14, -1, 3),
    ang = Angle(5, 2, 0),
	scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(9, -3, -3),
    ang = Angle(5, 0, -180)
}

SWEP.Firemodes = {
    {
        Mode = 2,
        PrintName = "AUTO"
    },
}



SWEP.Animations = {
-- BASE
    ["ready"] = {
        Source = "pullout_first",
    },

    ["draw"] = {
        Source = "pullout",
    },
	
    ["holster"] = {
        Source = "pullout",
    },

    ["idle"] = {
        Source = "idle",
    },

    ["fire"] = {
    Source = {"fire"},
	ShellEjectAt = 0,
    },

    ["fire_last"] = {
    Source = {"fire_last"},
	ShellEjectAt = 0,
    },
	
    ["reload"] = {
    Source = "reload",
	LastClip1OutTime = 2.25
    },
	
    ["reload_empty"] = {
    Source = "reload_empty",
	LastClip1OutTime = 2.25
    },	

    ["fire_empty"] = {
    Source = {"idle"},
    },


    ["fire_iron"] = {
        Source = {"fire_ads"},
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "sprint",
    },

	

--MELEE
	["bash"] = {
        Source = "melee",
    },
	
--- BIPOD

    ["enter_bipod"] = {
        Source = "deploy_pullout",
    },
	
    ["exit_bipod"] = {
        Source = "deploy_putaway",
    },
	
    ["idle_bipod"] = {
        Source = "deploy_idle",
    },

    ["fire_bipod"] = {
    Source = {"deploy_fire"},
	ShellEjectAt = 0,
    },
	

    ["reload_bipod"] = {
        Source = "deploy_reload",
		LastClip1OutTime = 2.25
    },
	
   ["reload_bipod_empty"] = {
        Source = "deploy_reload_empty",
		LastClip1OutTime = 2.25
    },	
	


--IRON_BIPOD

    ["idle_iron_bipod"] = {
        Source = "deploy_fire_ads",
    },

	
}