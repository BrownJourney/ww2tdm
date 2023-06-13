SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "WW2_GERMAN"
SWEP.AdminOnly = false

SWEP.PrintName = "Panzerfaust"
SWEP.TrueName = "Panzerfaust"
SWEP.Trivia_Class = ""
SWEP.Trivia_Desc = ""
SWEP.Trivia_Manufacturer = ""
SWEP.Trivia_Calibre = ""
SWEP.Trivia_Mechanism = "Explosive"
SWEP.Trivia_Country = "Germany"


if GetConVar("arccw_truenames"):GetBool() then SWEP.PrintName = SWEP.TrueName end

SWEP.Slot = 5


--MAIN

SWEP.Disposable = true
SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/cultist/v_panzerfaust.mdl"
SWEP.WorldModel = "models/weapons/cultist/w_panzerfaust.mdl"

SWEP.ShootEntity = "ww2_pjojectile_panzerfaust" -- entity to fire, if any
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


SWEP.NPCWeaponType = "weapon_rpg"
SWEP.NPCWeight = 150

SWEP.AccuracyMOA = 10 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 500

SWEP.Primary.Ammo = "Faust" -- what ammo type the gun uses
SWEP.MagID = "rpg7" -- the magazine pool this gun draws from

SWEP.ShootVol = 130 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "weapons/cultist/panzerfaust/panzerfaust_fp.wav"
SWEP.DistantShootSound = "weapons/cultist/panzerfaust/panzerfaust_dist.wav"

SWEP.MuzzleEffect = {"muzzleflash_smoke_medium_variant_1", "muzzleflash_sparks_variant_6"}

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on

SWEP.BarrelLength = 5

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}

SWEP.ProceduralRegularFire = false
SWEP.ProceduralIronFire = false

SWEP.CaseBones = {}

SWEP.HoldtypeHolstered = "normal"
SWEP.HoldtypeActive = "heavy"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL


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


--IRON

SWEP.SpeedMult = 0.88
SWEP.SightedSpeedMult = 0.5
SWEP.SightTime = 0.35



SWEP.IronSightStruct = {
    Pos = Vector(-3.181, 0, 0.2),
    Ang = Angle(0.6, 0, 6.331),
    Magnification = 1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}



SWEP.ExtraSightDist = 20

SWEP.WorldModelOffset = {
    pos = Vector(5, 3, 0),
    ang = Angle(10, 180, 0),
	scale = 0.9
}

SWEP.Firemodes = {
    {
        Mode = 1,
        PrintName = "BOLT"
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


--IRON

    ["idle_iron"] = {
        Source = "iron_idle",
    },
		
    ["fire_iron"] = {
        Source = {"iron_fire"},
    },

--IRON_EMPTY
	
    ["idle_iron"] = {
        Source = "iron_idle_empty",
    },
		

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
        Source = "base_melee",
    },
				
	["bash_empty"] = {
        Source = "base_melee_empty",
    }
}	
	