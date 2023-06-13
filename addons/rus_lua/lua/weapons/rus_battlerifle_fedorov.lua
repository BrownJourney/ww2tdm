SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "Fedorov Avtomat"
SWEP.TrueName = "Fedorov Avtomat"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = "7.92×33"
SWEP.Trivia_Mechanism = "Automatic"
SWEP.Trivia_Country = "USSR"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 2


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_fedorov.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_fedorov.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 20 
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 90 -- damage
SWEP.DamageMin = 50 -- damage done at maximum range
SWEP.Range = 350 -- in METRES effective range
SWEP.Penetration = 5 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 654
SWEP.MuzzleVelocity = 654  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 10,
     [HITGROUP_CHEST] = 1,
     [HITGROUP_STOMACH] = 0.9,
     [HITGROUP_LEFTARM] = 0.4,
     [HITGROUP_RIGHTARM] = 0.4,
     [HITGROUP_LEFTLEG] = 0.4,
     [HITGROUP_RIGHTLEG] = 0.4
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
SWEP.Primary.ClipSize = 25 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 25 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "rus_battlerifle" -- what ammo type the gun uses
--
SWEP.Delay = 60 / 350 -- 60 / RPM.

--RECOIL
-----------
SWEP.Recoil = 3.5 -- общий рекоил
SWEP.RecoilSide = 1 -- рекоил в стороны
SWEP.RecoilRise = 3 -- рекоил вверх
SWEP.MaxRecoilBlowback = -1 -- хз
SWEP.VisualRecoilMult = 0 -- увеличение рекоила для первого лица. Визуальный эффект 
SWEP.RecoilPunch = 0 -- Насколько шатает камеру. 
SWEP.RecoilPunchBackMax = 0 -- насколько оружие отходит к камере при стрельбе. Визуальный эффект.
SWEP.RecoilVMShake = 0 -- насколько сильно вью модель тресется

-- Направления отдачи
SWEP.RecoilDirection = Angle(1, 0, 0) -- Насколько уводит камеру. 1 число - вверх, 2 число - в сторону. 3 трогать нильзя 
SWEP.RecoilDirectionSide = Angle(1, 1, 0) -- Насколько шатает оружие 1 число - вверх\вниз, 2 число - право\лево. 3 трогать нильзя


SWEP.Sway = 0.5 -- Насколько сильно дрожат руки при прицеливание

--Разброс влияет на полет самой пули после выстрела, даже если рекоил 0, если установлен разброс он все равно будет
SWEP.AccuracyMOA = 2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 450 -- Базовый разброс при стрельбе от бедра
SWEP.MoveDispersion = 150 -- Разброс при движении + к базовому
SWEP.SightsDispersion = 0 -- Разброс при прицельной стрельбе
SWEP.JumpDispersion = 3000 -- прыгуны сука пошли нахуй




--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/fedorov/sks_fp.wav"
SWEP.ShootSoundSilenced = "weapons/cultist/fg42/fg42_tp.wav"
SWEP.DistantShootSound = "weapons/cultist/fedorov/sks_dist.wav"

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
SWEP.MuzzleEffect = {"muzzleflash_stg44_1p_core", "muzzle_smoke_b", "muzzleflash_spark_trail", "muzzleflash_tracer", "barrel_smoke"}
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/weapons/cultist/shells/762x39.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.5
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
SWEP.BulletBGs = {}
SWEP.CaseBGs = {}
SWEP.StripperClipBGs = {}


SWEP.ActivePos = Vector(0, 2, 0)
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

SWEP.InBipodPos = Vector(-1, 0, -3)
SWEP.InBipodMult = Vector(1, 1, 1)


--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35


SWEP.IronSightStruct = {
    Pos = Vector(-3.231, 2, 2.2),
    Ang = Angle(-0.271, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}



SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(10, -1, 0.5),
    ang = Angle(0, -4, 0),
}

SWEP.PreviewOffset = {
    pos = Vector(7, -2.5, 0),
    ang = Angle(-5, 0, -180)
}

SWEP.Firemodes = {
    {
        Mode = 2,
        PrintName = "AUTO"
    },
	{
        Mode = 1,
        PrintName = "SEMI-AUTO"
    }
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
    Source = "empty_idle",
    },
	
    ["fire"] = {
    Source = {"base_fire"},
	ShellEjectAt = 0,
    },

    ["fire_last"] = {
    Source = {"base_firelast"},
	ShellEjectAt = 0,
    },


    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },
	
    ["reload"] = {
    Source = "base_reload",
    },
	
    ["reload_empty"] = {
    Source = "base_reloadempty",
    },

	
--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
	
    ["idle_iron_empty"] = {
        Source = "iron_idle_empty",
    },	
	
    ["fire_iron"] = {
        Source = {"fire_iron"},
    },
	
    ["fire_iron_empty"] = {
        Source = {"base_dryfire"},
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },

    ["idle_sprint_empty"] = {
        Source = "base_sprint_empty",
    },

}