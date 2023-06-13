SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "PanzerSchreck"
SWEP.TrueName = "PanzerSchreck"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Explosive"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 5


--MAIN

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_panzerschreck.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_panzerschreck.mdl"

SWEP.ShootEntity = "arccw_rpg7_heat" -- entity to fire, if any
SWEP.MuzzleVelocity = 100000 -- projectile or phys bullet muzzle velocity
-- IN M/S

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 1 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 1
SWEP.ReducedClipSize = 1

SWEP.Recoil = 2
SWEP.RecoilSide = 0.175
SWEP.RecoilRise = 2

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 1,
    },

}

SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 150

SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 500

SWEP.Primary.Ammo = "RPG_Round" -- what ammo type the gun uses
SWEP.MagID = "rpg7" -- the magazine pool this gun draws from

SWEP.ShootVol = 130 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "weapons/cultist/panzerschreck/panzerschreck_fp.wav"
SWEP.DistantShootSound = "weapons/cultist/panzerschreck/panzerschreck_dist.wav"

SWEP.MuzzleEffect = {"muzzleflash_smoke_medium_variant_1", "muzzleflash_sparks_variant_6"}

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.BarrelLength = 40

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35


SWEP.IronSightStruct = {
    Pos = Vector(-3, 6.23, -0.202),
    Ang = Angle(8.442, -6.801, 20),


    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "smg"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL

SWEP.ActivePos = Vector(5.427, 0, 0)
SWEP.ActiveAng = Angle(9.145, -6.332, 18.995)

SWEP.HolsterPos = Vector(1, 4, -14)
SWEP.HolsterAng = Angle(40, 0, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(0, 0, 0)

SWEP.ExtraSightDist = 20


SWEP.Animations = {
-- BASE
    ["ready"] = {
        Source = "base_ready",
	MinProgress = 3.3	
    },

    ["draw"] = {
        Source = "base_draw",
	MinProgress = 1.3,				
    },
	
    ["holster"] = {
        Source = "base_holster",
    },

    ["idle"] = {
        Source = "iron_idle",
    },

    ["fire"] = {
    Source = {"base_fire"},
	MinProgress = 1,			
    },

    ["reload"] = {
        Source = "base_reload",
    },
	
--BASE_EMPTY

    ["fire_empty"] = {
    Source = {"base_dryfire"},
	MinProgress = 0.33,				
    },


--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
		
    ["fire_iron"] = {
    Source = {"iron_fire"},
	MinProgress = 1,			
    },

    ["fire_iron_last"] = {
        Source = "iron_firelast",
    },

--IRON_EMPTY
		
    ["fire_iron_empty"] = {
    Source = {"iron_dryfire"},
	MinProgress = 0.33,		
    },

--SPRINT	
			
    ["idle_sprint"] = {
        Source = "base_sprint",
    },
	
--MELEE
	["bash"] = {
        Source = "base_melee",
    }
}	
	