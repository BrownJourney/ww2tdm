SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "Mosin-Nagant 1891"
SWEP.TrueName = "Mosin-Nagant 1891"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Bolt-Action"
SWEP.Trivia_Country = "USSR"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 2


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_mosin_1891.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_mosin_1891.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "rifle"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 31
SWEP.ManualAction = true
SWEP.ShotgunReload = true -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 110 -- damage
SWEP.DamageMin = 60 -- damage done at maximum range
SWEP.Range = 700 -- in METRES effective range
SWEP.Penetration = 6 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 760 
SWEP.MuzzleVelocity = 760  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET


--- MELEE

SWEP.CanBash = true
SWEP.PrimaryBash = false -- primary attack triggers melee attack

SWEP.MeleeDamage = 25
SWEP.MeleeRange = 16
SWEP.MeleeDamageType = DMG_CLUB
SWEP.MeleeTime = 1
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
SWEP.Primary.ClipSize = 5 -- DefaultClip is automatically set. /n //ClipSize = 5 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 5 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "rus_rifle" -- what ammo type the gun uses
--
SWEP.Delay = 60 / 300 -- 60 / RPM.

--RECOIL
-----------
SWEP.Recoil = 6 -- общий рекоил
SWEP.RecoilSide = 0 -- рекоил в стороны
SWEP.RecoilRise = 2 -- рекоил вверх
SWEP.MaxRecoilBlowback = -1 -- хз
SWEP.VisualRecoilMult = 1 -- увеличение рекоила для первого лица. Визуальный эффект 
SWEP.RecoilPunch = 0 -- Насколько шатает камеру. 
SWEP.RecoilPunchBackMax = 2 -- насколько оружие отходит к камере при стрельбе. Визуальный эффект.
SWEP.RecoilVMShake = 0 -- насколько сильно вью модель тресется

-- Направления отдачи
SWEP.RecoilDirection = Angle(1, 0, 0) -- Насколько уводит камеру. 1 число - вверх, 2 число - в сторону. 3 трогать нильзя 
SWEP.RecoilDirectionSide = Angle(1, 1, 0) -- Насколько шатает оружие 1 число - вверх\вниз, 2 число - право\лево. 3 трогать нильзя


SWEP.Sway = 1 -- Насколько сильно дрожат руки при прицеливание

--Разброс влияет на полет самой пули после выстрела, даже если рекоил 0, если установлен разброс он все равно будет
SWEP.AccuracyMOA = 0.2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 450 -- Базовый разброс при стрельбе от бедра
SWEP.MoveDispersion = 150 -- Разброс при движении + к базовому
SWEP.SightsDispersion = 0 -- Разброс при прицельной стрельбе
SWEP.JumpDispersion = 3000 -- прыгуны сука пошли нахуй


SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 10,
     [HITGROUP_CHEST] = 1,
     [HITGROUP_STOMACH] = 0.9,
     [HITGROUP_LEFTARM] = 0.7,
     [HITGROUP_RIGHTARM] = 0.7,
     [HITGROUP_LEFTLEG] = 0.7,
     [HITGROUP_RIGHTLEG] = 0.7
 }




--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/mosin/mosin_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/mosin/mosin_dist.wav"

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
SWEP.MuzzleEffect = { "barrel_smoke", "muzzle_smoke_c", "muzzleflash_k98_1p_core"}
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



SWEP.BulletBGs = {
}

SWEP.CaseBGs = {
}

SWEP.StripperClipBGs = {

}



SWEP.ActivePos = Vector(2, 2, -0.5)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintPos = Vector(2, 2, -2)

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
    Pos = Vector(0, 0, 0),
    Ang = Angle(0.05, 0.009, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(6, 1.5, -1),
    ang = Angle(-10, 4, 180),
	scale = 1
}

SWEP.PreviewOffset = {
    pos = Vector(3, 0, 2.5),
    ang = Angle(-5, 0, 0)
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "BOLT"
    },
}

SWEP.AttachmentElements = {
    ["mosin_sniper_bolt"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
    },
    ["bayonet_mosins"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
    }
}	

SWEP.Hook_TranslateAnimation = function(wep, anim)
    local cap = wep.Attachments[1].Installed
    if anim and cap == "mosin_sniper_bolt" then
        return anim .. "_sniper"
    end
end

SWEP.Attachments = {
    [1] = {
        PrintName = "Sniper Bolt",
        DefaultAttName = "Sniper Bolt",
        Slot = "mosin_sniper_bolt",
    },	
    [2] = {
        PrintName = "Optic", -- print name
        DefaultAttName = "Iron Sights",
        Slot = {"optic_mosins"}, -- what kind of attachments can fit here, can be string or table
        Bone = "sights_9130", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-8, 0.2, 0), -- offset that the attachment will be relative to the bone
            vang = Angle(0, 0, 0),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0)
        },
        BoneMerge = false,
        InstalledEles = {},
        KeepBaseIrons = false,
        ExtraSightDist = 4
    },
    [3] = {
        PrintName = "Bayonet",
        DefaultAttName = "none",
        Slot = "mosin_bayonet",
    },
    [5] = {
        PrintName = "Stripper Clip",
        DefaultAttName = "none",
        Slot = "mag_mosins",
    }
}

SWEP.Animations = {
-- BASE
    ["ready"] = {
    Source = "base_ready",
	MinProgress = 2.8,	
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
	
    ["fire_last"] = {
    Source = "base_fire",
    },	
	

    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },

    ["reload_clip"] = {
        Source = "base_reload_empty_clip",
        MinAmmo = 1,
        MinProgress = 3.6,
    },


--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
		
    ["fire_iron"] = {
        Source = {"iron_fire"},
    },
	
    ["fire_iron_last"] = {
        Source = "iron_fire",
    },

--IRON_EMPTY

	
    ["fire_iron_empty"] = {
        Source = {"iron_dryfire"},
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },


-- RIFLE

	["sgreload_start"] = {
        Source = "base_reload_start",
		RestoreAmmo = 0,
    },

    ["sgreload_insert"] = {
    Source = "base_reload_insert",
	MinProgress = 0.6,
    },	
	
    ["sgreload_finish"] = {
    Source = "base_reload_end",
	},
	
	["cycle"] = {
    Source = "base_fire_end",
	ShellEjectAt = 0.5,
	MinProgress = 1.3,
    },

	["cycle_iron"] = {
    Source = "iron_fire_end",
	ShellEjectAt = 0.5,
	MinProgress = 1.3,
    },
	
	["bash"] = {
    Source = "base_stab",
    },
	
-------------------

-- BASE
    ["ready_sniper"] = {
    Source = "sniper_ready",
	MinProgress = 2.8,	
    },

    ["draw_sniper"] = {
        Source = "sniper_draw",
    },
	
    ["holster_sniper"] = {
        Source = "sniper_holster",
    },

    ["idle_sniper"] = {
        Source = "sniper_idle",
    },

    ["fire_sniper"] = {
    Source = {"sniper_fire"},
    },
	
    ["fire_last_sniper"] = {
    Source = "sniper_fire",
    },	
	

    ["fire_empty_sniper"] = {
    Source = {"sniper_dryfire"},
    },


--IRON

    ["idle_iron_sniper"] = {
        Source = "sniper_iron_idle",
    },
		
    ["fire_iron_sniper"] = {
        Source = {"sniper_iron_fire"},
    },
	
    ["fire_iron_last_sniper"] = {
        Source = "sniper_iron_fire",
    },

--IRON_EMPTY

	
    ["fire_iron_empty_sniper"] = {
        Source = {"sniper_iron_dryfire"},
    },

--SPRINT	
			
    ["idle_sprint_sniper"] = {
        Source = "sniper_sprint",
    },


-- RIFLE

	["sgreload_start_sniper"] = {
        Source = "sniper_reload_start",
		RestoreAmmo = 0,
    },

    ["sgreload_insert_sniper"] = {
    Source = "sniper_reload_insert",
	MinProgress = 0.6,
    },	
	
    ["sgreload_finish_sniper"] = {
    Source = "sniper_reload_end",
	},
	
	["cycle_sniper"] = {
    Source = "sniper_fire_end",
	ShellEjectAt = 0.5,
	MinProgress = 1.3,
    },

	["cycle_iron_sniper"] = {
    Source = "sniper_iron_fire_end",
	ShellEjectAt = 0.5,
	MinProgress = 1.3,
    },

}