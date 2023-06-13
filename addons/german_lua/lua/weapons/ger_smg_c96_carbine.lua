SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "C96 Carabine"
SWEP.TrueName = "C96 Carabine"
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
SWEP.ViewModel = "models/weapons/cultist/v_c96_carbine.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_c96_carbine.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ass"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 4
SWEP.ManualAction = false
SWEP.ShotgunReload = false -- manual bullet insert


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 50 -- damage
SWEP.DamageMin = 15 -- damage done at maximum range
SWEP.Range = 100 -- in METRES effective range
SWEP.Penetration = 2 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 350 
SWEP.MuzzleVelocity = 350  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET


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
SWEP.Primary.ClipSize = 20   -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 40   -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "ger_smg" -- what ammo type the gun uses
--

--RECOIL
SWEP.Recoil = 2
SWEP.RecoilSide = 1
SWEP.RecoilRise = 1
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = -1
SWEP.Delay = 60 / 500 -- 60 / RPM.

SWEP.AccuracyMOA = 0.2 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 220 --inaccuracy added by movement.

SWEP.RecoilPunch = 1.5
SWEP.RecoilPunchBackMax = 1
SWEP.RecoilVMShake = 1 -- random viewmodel offset when shooty

SWEP.Sway = 0.4

SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 10,
     [HITGROUP_CHEST] = 0.8,
     [HITGROUP_STOMACH] = 0.8,
     [HITGROUP_LEFTARM] = 0.4,
     [HITGROUP_RIGHTARM] = 0.4,
     [HITGROUP_LEFTLEG] = 0.4,
     [HITGROUP_RIGHTLEG] = 0.4
 }





--SOUNDS
SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound
SWEP.ShootPitchVariation = 0.05

SWEP.ShootSound = "weapons/cultist/c96carbine/c96carbine_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/c96carbine/c96carbine_dist.wav"

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
SWEP.MuzzleEffect = {"muzzleflash_3", "barrel_smoke_trail_b", "muzzle_smoke_d"}
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/weapons/cultist/shells/9x19.mdl"
SWEP.ShellPitch = 100
SWEP.ShellScale = 1.1
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


SWEP.ActivePos = Vector( 0, 1, 1 )
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




SWEP.IronSightStruct = {
    Pos = Vector(-2.79, 5, 1.2),
    Ang = Angle(1, 0, 0),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(4, -1, 0.5),
    ang = Angle(10, -4, 0),
	scale = 0.9
}

SWEP.PreviewOffset = {
    pos = Vector(1, -2, 0),
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

SWEP.Attachments = {
    [1] =  {
        PrintName = "Barrels", -- print name
        DefaultAttName = "Short barrel",
        Installed = "barrel_c96_short",
        Slot = {"barrel_c96"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ValveBiped.Bip01_R_UpperArm", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-3.089, 1.406, 1.879), -- offset that the attachment will be relative to the bone
            vang = Angle(0.3, 0, 0),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0)
        },
        BoneMerge = true,
        InstalledEles = {},
    },
    [2] =  {
        PrintName = "Magazines", -- print name
        DefaultAttName = "Default mag",
        Installed = "mag_c96carabine_default",
        Slot = {"mag_c96carabine"}, -- what kind of attachments can fit here, can be string or table
        Bone = "ValveBiped.Bip01_R_UpperArm", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(-3.089, 1.406, 1.879), -- offset that the attachment will be relative to the bone
            vang = Angle(0.3, 0, 0),
            wpos = Vector(0, 0, 0),
            wang = Angle(0, 0, 0)
        },
        BoneMerge = true,
        InstalledEles = {},
    },
}

SWEP.Animations = {
-- BASE
    ["ready"] = {
        Source = "base_ready",
	MinProgress = 0.6,				
    },

    ["draw"] = {
        Source = "base_draw",
	MinProgress = 0.6,				
    },
	
    ["holster"] = {
        Source = "base_holster",
    },

    ["idle"] = {
        Source = "base_idle",
    },

    ["fire"] = {
    Source = {"base_fire_1", "base_fire_2", "base_fire_3"},
	ShellEjectAt = 0,
    },
	
    ["fire_last"] = {
    Source = "base_firelast",
	 ShellEjectAt = 0,
    },	

    ["reload"] = {
        Source = "base_reload",
    	MinProgress = 3.05
    },
    ["reload_ext"] = {
        Source = "base_reload_ext",
        MinProgress = 3.05
    },
	
    ["1_to_2"] = {
        Source = "base_fireselect",
    },	
    ["2_to_1"] = {
        Source = "base_fireselect",
    },	
--BASE_EMPTY

    ["draw_empty"] = {
    Source = "base_draw_empty",
	MinProgress = 0.6,				
    },
	
    ["holster_empty"] = {
        Source = "base_holster_empty",
    },

    ["idle_empty"] = {
        Source = "empty_idle",
    },

    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },

    ["reload_empty"] = {
    Source = "base_reloadempty",
	MinProgress = 4.3
    },
    ["reload_empty_ext"] = {
        Source = "base_reloadempty_ext",
        MinProgress = 4.3
    },

    ["1_to_2_empty"] = {
        Source = "base_fireselect_empty",
    },	
    ["2_to_1_empty"] = {
        Source = "base_fireselect_empty",
    },	

--IRON

    ["idle_iron"] = {
        Source = "base_idle",
    },
		
    ["fire_iron"] = {
        Source = {"iron_fire_1", "iron_fire_2", "iron_fire_3"},
    },

    ["fire_iron_last"] = {
        Source = "iron_firelast",
    },
    ["1_to_2_iron"] = {
        Source = "iron_fireselect",
    },		
    ["2_to_1_iron"] = {
        Source = "iron_fireselect",
    },	
--IRON_EMPTY

    ["idle_iron_empty"] = {
        Source = "iron_idle_empty",
    },
		
    ["fire_iron_empty"] = {
        Source = {"iron_dryfire"},
    },
    ["1_to_2_iron_empty"] = {
        Source = "iron_fireselect_empty",
    },	
    ["2_to_1_iron_empty"] = {
        Source = "iron_fireselect_empty",
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
	
	
}