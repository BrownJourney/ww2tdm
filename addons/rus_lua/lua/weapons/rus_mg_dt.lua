SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "DT-37"
SWEP.TrueName = "DT-37"
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
SWEP.ViewModel = "models/weapons/cultist/v_dt.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_dt.mdl"

SWEP.ROBroken = true


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "heavy"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 23.8
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 50 -- damage
SWEP.DamageMin = 20 -- damage done at maximum range
SWEP.Range = 150 -- in METRES effective range
SWEP.Penetration = 5 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 840
SWEP.MuzzleVelocity = 840  -- projectile or phys bullet muzzle velocity
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
SWEP.Primary.ClipSize = 63 -- DefaultClip is automatically set. /n //ClipSize = 100 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 63 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "rus_mg" -- what ammo type the gun uses
--
SWEP.Delay = 60 / 600 -- 60 / RPM.


--RECOIL
-----------
SWEP.Recoil = 9 -- общий рекоил
SWEP.RecoilSide = 3 -- рекоил в стороны
SWEP.RecoilRise = 2 -- рекоил вверх
SWEP.MaxRecoilBlowback = -1 -- хз
SWEP.VisualRecoilMult = 1 -- увеличение рекоила для первого лица. Визуальный эффект 
SWEP.RecoilPunch = 1 -- Насколько шатает камеру. 
SWEP.RecoilPunchBackMax = 0.4 -- насколько оружие отходит к камере при стрельбе. Визуальный эффект.
SWEP.RecoilVMShake = 0.3 -- насколько сильно вью модель тресется

-- Направления отдачи
SWEP.RecoilDirection = Angle(0.7, 0.2, 0) -- Насколько уводит камеру. 1 число - вверх, 2 число - в сторону. 3 трогать нильзя 
SWEP.RecoilDirectionSide = Angle(1, 0, 0) -- Насколько шатает оружие 1 число - вверх\вниз, 2 число - право\лево. 3 трогать нильзя

SWEP.Sway = 5 -- Насколько сильно дрожат руки при прицеливание

--Разброс влияет на полет самой пули после выстрела, даже если рекоил 0, если установлен разброс он все равно будет
SWEP.AccuracyMOA = 4 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
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

SWEP.ShootSound = "weapons/cultist/dt/lewis_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/dt/lewis_dist.wav"

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
}
SWEP.CaseBGs = {}
SWEP.StripperClipBGs = {}


SWEP.ActivePos = Vector(3.992, 3.624, -1.16)
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
SWEP.BipodDispersion = 0.18 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.18 -- Bipod recoil for Integral bipods

SWEP.InBipodPos = Vector(-1, 0, -3)
SWEP.InBipodMult = Vector(1, 1, 1)

--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35


SWEP.IronSightStruct = {
    Pos = Vector(0, 0, 0.02),
    Ang = Angle(0, 0.1, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(6, 1.5, -2),
    ang = Angle(-5, 0, 180),
    scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(2, -1, 3),
    ang = Angle(0, 0, 0)
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
        Source = "base_ready",
    },

    ["draw"] = {
        Source = "base_draw",
    },
    ["draw_empty"] = {
        Source = "base_draw_empty",
    },
		
    ["holster"] = {
        Source = "base_holster",
    },
    ["holster_empty"] = {
        Source = "base_holster_empty",
    },
    ["idle"] = {
        Source = "base_idle",
    },
	
    ["idle_empty"] = {
        Source = "base_idle_empty",
    },
	
    ["fire"] = {
    Source = {"base_fire"},
	ShellEjectAt = 0,
    },

    ["fire_last"] = {
    Source = {"base_fire_last"},
	ShellEjectAt = 0,
    },

    ["base_fire_empty"] = {
    Source = {"base_dryfire"},
	ShellEjectAt = 0,
    },	
	
    ["reload"] = {
        Source = "base_reload",
        Mult = 2
    },
	
    ["reload_empty"] = {
        Source = "base_reloadempty",
        Mult = 2
    },	
	
--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
	
    ["idle_iron_empty"] = {
        Source = "iron_empty_idle",
    },		


--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
	
    ["idle_sprint_empty"] = {
        Source = "base_sprint_empty",
    },	
	
	

	
--- BIPOD

    ["enter_bipod"] = {
        Source = "deployed_in",
    },
	
    ["enter_bipod_empty"] = {
        Source = "deployed_in_empty",
    },	
	
    ["exit_bipod"] = {
        Source = "deployed_out",
    },
	
    ["exit_bipod_empty"] = {
        Source = "deployed_out_empty",
    },	
	
    ["idle_bipod"] = {
        Source = "deployed_idle",
    },
	
    ["idle_bipod_empty"] = {
        Source = "deployed_idle_empty",
    },

    ["fire_bipod"] = {
    Source = {"deployed_fire"},
	ShellEjectAt = 0,
    },
	
    ["fire_bipod_last"] = {
    Source = {"deployed_fire_last"},
	ShellEjectAt = 0,
    },
	
    ["fire_bipod_empty"] = {
    Source = {"deployed_dryfire"},
	ShellEjectAt = 0,
    },
				

    ["reload_bipod"] = {
        Source = "deployed_reload",
        Mult = 2
    },
	
    ["reload_bipod_empty"] = {
        Source = "deployed_reload_empty",
        Mult = 2
    },	

}