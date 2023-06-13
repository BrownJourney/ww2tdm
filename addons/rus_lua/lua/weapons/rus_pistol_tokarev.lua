SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_USSR"
SWEP.AdminOnly = false

SWEP.PrintName = "Tokarev 33"
SWEP.TrueName = "Tokarev 33"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Automatic"
SWEP.Trivia_Country = "USSR"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 1


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_tokarev.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_tokarev.mdl"


SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "pistol"
SWEP.HoldtypeSights = "ar2"
SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG
SWEP.BarrelLength = 4.6


SWEP.ViewModelFOV = 80
SWEP.NoLastCycle = false

-- DAMAGE --

SWEP.Damage = 50 -- damage
SWEP.DamageMin = 20 -- damage done at maximum range
SWEP.Range = 50 -- in METRES effective range
SWEP.Penetration = 2 -- penetration
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.PhysBulletMuzzleVelocity = 450 
SWEP.MuzzleVelocity = 450  -- projectile or phys bullet muzzle velocity
SWEP.DamageType = DMG_BULLET-- DMG_BULLET


SWEP.BodyDamageMults = {
     [HITGROUP_HEAD] = 4,
     [HITGROUP_CHEST] = 0.6,
     [HITGROUP_STOMACH] = 0.6,
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
SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 9 -- DefaultClip is automatically set. /n //ClipSize = 7 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 9 -- extended mag
SWEP.ReducedClipSize = 1 -- smaller mag
SWEP.Primary.Ammo = "rus_pistol" -- what ammo type the gun uses
--

SWEP.Delay = 60 / 300 -- 60 / RPM.

--RECOIL
SWEP.Recoil = 2
SWEP.RecoilSide = 1
SWEP.RecoilRise = 1
SWEP.VisualRecoilMult = 1.25
SWEP.MaxRecoilBlowback = -1

SWEP.AccuracyMOA = 18 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
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

SWEP.ShootSound = "weapons/cultist/tt/makarov_fp.wav"
SWEP.ShootSoundSilenced = "weapons/hunting/sup.wav"
SWEP.DistantShootSound = "weapons/cultist/tt/makarov_dist.wav"

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
SWEP.MuzzleEffect = {"port_smoke", "muzzleflash_1911_1p_core", "muzzleflash_luger_1p_spark_trail", "barrel_smoke_trail"}
SWEP.MuzzleFlashColor = Color(244, 209, 66)
SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.ShellModel = "models/weapons/cultist/shells/9x19.mdl"
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

SWEP.IronSightsPos = Vector(-2.306, 0, 0.689)
SWEP.IronSightsAng = Vector(0, 0, 0)



SWEP.IronSightStruct = {
    Pos = Vector(-2.211, 0, 0.4),
    Ang = Angle(0.839, 0, 6.5),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(2, 6, 1),
    ang = Angle(-5, -90, 0),
	scale = 0.9
}


SWEP.PreviewOffset = {
    pos = Vector(-1.5, 3.5, -1),
    ang = Angle(0, 90, -180)
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
        Source = "iron_idle",
    },

    ["fire"] = {
    Source = {"base_fire", "base_fire2", "base_fire3"},
	ShellEjectAt = 0,
    },
	
    ["fire_last"] = {
    Source = "base_firelast",
	 ShellEjectAt = 0,
    },	

    ["reload"] = {
        Source = "base_reload",
    },
	
	
--BASE_EMPTY

    ["draw_empty"] = {
        Source = "empty_draw",
    },
	
    ["holster_empty"] = {
        Source = "empty_holster",
    },

    ["idle_empty"] = {
        Source = "iron_empty",
    },

    ["fire_empty"] = {
    Source = {"base_dryfire"},
    },

    ["reload_empty"] = {
        Source = "base_reloadempty",
    },



--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
		
    ["fire_iron"] = {
        Source = {"iron_fire", "iron_fire2", "iron_fire3"},
    },

    ["fire_iron_last"] = {
        Source = "iron_firelast",
    },
	
--IRON_EMPTY

    ["idle_iron_empty"] = {
        Source = "iron_empty",
    },
	
    ["fire_iron_last"] = {
        Source = {"base_firelast"},
    },	
		
    ["fire_iron_empty"] = {
        Source = {"iron_dryfire"},
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
	
    ["idle_sprint_empty"] = {
        Source = "empty_sprint",
    },	
	
	

--MELEE
	["bash"] = {
        Source = "base_melee_bash",
    },

	["bash_empty"] = {
        Source = "empty_melee_bash",
    },

	
}