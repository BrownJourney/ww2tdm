SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "MG34"
SWEP.TrueName = "MG34"
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
SWEP.ViewModel = "models/weapons/cultist/v_mg34.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_mg34.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "heavy"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 24.7
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 60 -- damage
SWEP.DamageMin = 20 -- damage done at maximum range
SWEP.Range = 200 -- in METRES effective range
SWEP.Penetration = 5 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 765 
SWEP.MuzzleVelocity = 765  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 2,
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
SWEP.Primary.ClipSize = 50 -- DefaultClip is automatically set.
SWEP.Primary.ClipSize = 50 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 50 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "ger_mg" -- what ammo type the gun uses
--
SWEP.Delay = 60 / 900 -- 60 / RPM.

--RECOIL
-----------
SWEP.Recoil = 5 -- общий рекоил
SWEP.RecoilSide = 1.4 -- рекоил в стороны
SWEP.RecoilRise = 1.4 -- рекоил вверх
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


-- If Jamming is enabled, a heat meter will gradually build up until it reaches HeatCapacity.
-- Once that happens, the gun will overheat, playing an animation. If HeatLockout is true, it cannot be fired until heat is 0 again.
SWEP.Jamming = true
SWEP.HeatCapacity = 60 -- rounds that can be fired non-stop before the gun jams, playing the "fix" animation
SWEP.HeatDissipation = 8 -- rounds' worth of heat lost per second
SWEP.HeatLockout = true -- overheating means you cannot fire until heat has been fully depleted
SWEP.HeatDelayTime = 0.5
SWEP.HeatFix = false -- when the "fix" animation is played, all heat is restored.


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
SWEP.MuzzleEffect = {"muzzleflash_mg34_1p_core", "muzzleflash_smoke_small_variant_5", "muzzle_smoke_b", "muzzleflash_mg42_1p_sparks", "muzzleflash_mg42_1p_spark_trail"}
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
[0] = {ind = 1, bg = 0},
[1] = {ind = 1, bg = 1},
[2] = {ind = 1, bg = 2},
[3] = {ind = 1, bg = 3},
[4] = {ind = 1, bg = 4},
[5] = {ind = 1, bg = 5},
[6] = {ind = 1, bg = 6},
[7] = {ind = 1, bg = 7},
[8] = {ind = 1, bg = 8},
[9] = {ind = 1, bg = 9},
[10] = {ind = 1, bg = 10},
[11] = {ind = 1, bg = 11},
[12] = {ind = 1, bg = 12},
[13] = {ind = 1, bg = 13},
[14] = {ind = 1, bg = 14},
[15] = {ind = 1, bg = 15},
[16] = {ind = 1, bg = 16},
[17] = {ind = 1, bg = 17},
[18] = {ind = 1, bg = 18},
[19] = {ind = 1, bg = 19},
[20] = {ind = 1, bg = 20},
[21] = {ind = 1, bg = 21},
[22] = {ind = 1, bg = 22},
[23] = {ind = 1, bg = 23},
[24] = {ind = 1, bg = 24},
[25] = {ind = 1, bg = 25},
[26] = {ind = 1, bg = 26},
[27] = {ind = 1, bg = 27},
[28] = {ind = 1, bg = 28},
[29] = {ind = 1, bg = 29},
[30] = {ind = 1, bg = 30},
[31] = {ind = 1, bg = 31},
[32] = {ind = 1, bg = 32},
[33] = {ind = 1, bg = 33},
[34] = {ind = 1, bg = 34},
[35] = {ind = 1, bg = 35},
[36] = {ind = 1, bg = 36},
[37] = {ind = 1, bg = 37},
[38] = {ind = 1, bg = 38},
[39] = {ind = 1, bg = 39},
[40] = {ind = 1, bg = 40},
[41] = {ind = 1, bg = 41},
[42] = {ind = 1, bg = 42},
[43] = {ind = 1, bg = 43},
[44] = {ind = 1, bg = 44},
[45] = {ind = 1, bg = 45},
[46] = {ind = 1, bg = 46},
[47] = {ind = 1, bg = 47},
[48] = {ind = 1, bg = 48},
[49] = {ind = 1, bg = 49},
[50] = {ind = 1, bg = 50}
}

SWEP.CaseBGs = {
}

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

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.1 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.2 -- Bipod recoil for Integral bipods

SWEP.InBipodPos = Vector(-1, 0, -3)
SWEP.InBipodMult = Vector(1, 1, 1)

--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35


SWEP.IronSightStruct = {
    Pos = Vector(-3.656, 0, 2.16),
    Ang = Angle(0, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(14, 0, 3),
    ang = Angle(5, -4, 0),
	scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(9, -2, -3),
    ang = Angle(10, 0, 0)
}

SWEP.Firemodes = {
    {
        Mode = 2,
        PrintName = "AUTO"
    },
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
    Source = {"base_fire_1", "base_fire_2"},
	ShellEjectAt = 0,
    },
	

    ["reload"] = {
    Source = "base_reload",
	LastClip1OutTime = 3
    },
	

--BASE_EMPTY



    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },

    ["reload_empty"] = {
    Source = "base_reload_empty",
	LastClip1OutTime = 4.22
    },


--IRON

    ["idle_iron"] = {
        Source = "base_idle",
    },
		
    ["fire_iron"] = {
        Source = {"iron_fire_1", "iron_fire_2"},
    },

    -- ["fire_iron_last"] = {
    --     Source = "iron_firelast",
    -- },

--IRON_EMPTY

		
    ["fire_iron_empty"] = {
        Source = {"iron_dryfire"},
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
	
    ["idle_sprint_empty"] = {
        Source = "base_sprint_empty",
    },	
	
	

--MELEE
	["bash"] = {
        Source = "base_melee_bash",
    },

	["bash_empty"] = {
        Source = "base_melee_bash_empty",
    },
	
	
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
    Source = {"deployed_fire_1", "deployed_fire_2"},
	ShellEjectAt = 0,
    },
	

    ["reload_bipod"] = {
        Source = "deployed_reload",
	LastClip1OutTime = 3
    },
	
	
	
	--BIPOD_EMPTY

    ["fire_bipod_empty"] = {
        Source = "deployed_dryfire",
    },
    ["reload_bipod_empty"] = {
    Source = "deployed_reload_empty",
	LastClip1OutTime = 4.22
    },
	
--IRON_BIPOD

    ["idle_iron_bipod"] = {
        Source = "deployed_iron_idle",
    },
		
    ["fire_iron_bipod"] = {
        Source = {"deployed_iron_fire_1", "deployed_iron_fire_2"},
    },

	
--IRON_BIPOD_EMPTY

		
    ["fire_iron_bipod_empty"] = {
        Source = {"deployed_iron_dryfire"},
    }
}