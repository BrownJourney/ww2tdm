SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USA"
SWEP.AdminOnly = false

SWEP.PrintName = "Itachi"
SWEP.TrueName = "Itachi"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Bolt-Action"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 2


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_ithaca.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_ithaca.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ass"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 25


SWEP.ViewModelFOV = 80

-- DAMAGE --

SWEP.Damage = 45 -- damage
SWEP.DamageMin = 5 -- damage done at maximum range
SWEP.Range = 25 -- in METRES effective range
SWEP.Penetration = 3 -- penetration
SWEP.Num = 10 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 150
SWEP.MuzzleVelocity = 150 -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BUCKSHOT-- DMG_BULLET
SWEP.ShotgunSpreadDispersion = true -- dispersion will cause pattern to increase instead of shifting
SWEP.ShotgunSpreadPattern = true

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 0.9,
     [HITGROUP_CHEST] = 0.9,
     [HITGROUP_STOMACH] = 0.9,
     [HITGROUP_LEFTARM] = 0.2,
     [HITGROUP_RIGHTARM] = 0.2,
     [HITGROUP_LEFTLEG] = 0.2,
     [HITGROUP_RIGHTLEG] = 0.2
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
SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 2 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "buckshot" -- what ammo type the gun uses
--

--RECOIL
SWEP.Recoil = 2
SWEP.RecoilSide = 1
SWEP.RecoilRise = 1
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = -1
SWEP.Delay = 60 / 100 -- 60 / RPM.

SWEP.AccuracyMOA = 150 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 600 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150

SWEP.RecoilPunch = 1.5
SWEP.RecoilPunchBackMax = 1
SWEP.RecoilVMShake = 1 -- random viewmodel offset when shooty

SWEP.Sway = 0.4

--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/ithaca/ithaca_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/ithaca/ithaca_dist.wav"

SWEP.FiremodeSound = "weapons/arccw/firemode.wav"
SWEP.MeleeSwingSound = "weapons/arccw/melee_lift.wav"
SWEP.MeleeMissSound = "weapons/arccw/melee_miss.wav"
SWEP.MeleeHitSound = "weapons/arccw/melee_hitworld.wav"
SWEP.MeleeHitNPCSound = "weapons/arccw/melee_hitbody.wav"
SWEP.EnterBipodSound = "weapons/arccw/bipod_down.wav"
SWEP.ExitBipodSound = "weapons/arccw/bipod_up.wav"
SWEP.SelectUBGLSound =  "weapons/arccw/ubgl_select.wav"
SWEP.ExitUBGLSound = "weapons/arccw/ubgl_exit.wav"

SWEP.ManualAction = true
SWEP.ShotgunReload = true -- manual bullet insert
SWEP.NoLastCycle = true
SWEP.RevolverReload = false

--MUZZLEFLASH
SWEP.NoFlash = false -- disable light flash
SWEP.GMMuzzleEffect = false -- Use Gmod muzzle effects rather than particle effects
SWEP.MuzzleEffect = {"muzzleflash_shotgun", "muzzleflash_ithica_1p_sparks", "muzzle_smoke_shot_b", "muzzleflash_ithica_1p_spark_trail", "muzzleflash_shotgun", "muzzleflash_ithica_1p_flame"}
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/weapons/cultist/shells/9x19.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 0
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

SWEP.Attachments = {
    [1] =  {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights",
        Installed = "optic_ithaca",
        Slot = {"ithaca_optic"}, -- what kind of attachments can fit here, can be string or table
        Bone = "A_Optic", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-3.089, 1.406, 1.879), -- offset that the attachment will be relative to the bone
            vang = Angle(0.3, 0, 0),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0)
        },
        BoneMerge = true,
        InstalledEles = {},
        KeepBaseIrons = false,
        ExtraSightDist = 4
    }
}



SWEP.ActivePos = Vector( 0, -1, 1 )
SWEP.ActiveAng = Angle( 0, 0, 0 )

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

--RIFLE
-- Vector(-3.405, 0, 0.49)
-- Angle(0, 0, 0)

SWEP.IronSightStruct = {
    Pos = Vector(-2.54, 0, 1.79),
    Ang = Angle(-0, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(12, -1, -1),
    ang = Angle(0, 10, 0),
	scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(8, -3, 0),
    ang = Angle(0, -5, 0)
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "SHOTGUN"
    },
    {
        Mode = 0
    }
}




SWEP.Animations = {
--BASE

    ["draw"] = {
        Source = "base_draw",
    },
	
	
    ["holster"] = {
        Source = "base_holster",
    },

    ["ready"] = {
        Source = "base_ready",
    },


--IDLE

    ["idle"] = {
        Source = "base_idle",
    },

-- FIRE	

    ["fire"] = {
        Source = {"base_fire_1", "base_fire_2"},
    },
	
    ["fire_iron"] = {
        Source = {"iron_fire_1", "iron_fire_2"},
    },

    -- SHOTGUN

    ["sgreload_insert"] = {
        Source = "base_reload_insert",
        MinProgress = 0.6,
    },  
    
    ["sgreload_finish"] = {
        Source = "base_reload_end",
        MinProgress = 1.35,
    },

    ["sgreload_start"] = {
        Source = "base_reload_start",
        RestoreAmmo = 0,
    },
    
    ["sgreload_start_empty"] = {
        Source = "base_reload_start_empty",
        RestoreAmmo = 1,
    },
    
    ["sgreload_finish_empty"] = {
        Source = "reload_end",
        MinProgress = 1.35,
    },
    
    ["cycle"] = {
        Source = {"base_fire_cock_1", "base_fire_cock_2"},
        ShellEjectAt = 0.5,
        MinProgress = 0.5,
    },

    ["cycle_iron"] = {
        Source = {"iron_fire_cock_1", "iron_fire_cock_2"},
        ShellEjectAt = 0.5,
        MinProgress = 0.5,
    },

--MELEE
	["bash"] = {
        Source = "base_melee_bash",
    },


--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
	
}