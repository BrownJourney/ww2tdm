CLASS.Name = "Офицер"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_BEACON
CLASS.Cost = 9
CLASS.Favourite = "beacon_spawn"
CLASS.Icon = Material("hud/roles/officer.png", "smooth noclamp")
CLASS.TraitInstant = true

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_commander.mdl",
		skin = 0,
		bodygroups = {
			[2] = 1,
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 8,
			[1] = 4,
			[2] = 0,
			[3] = 0					
		}
	},	
	helmet = {
		model = "models/soviet/head/hat_furajka.mdl",
		skin = 2,
	}		
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_coat_fat.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[3] = 4,			
			[4] = 1,				
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 8,
			[1] = 4,
			[2] = 0,
			[3] = 0					
		}
	},				
	scard = {
		model = "models/soviet/head/scarf.mdl",
		skin = 0,
	},	
	
	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 3,
	}		
	
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {"rus_semiauto_svt40", "rus_pistol_tokarev", "rus_grenade_rg42_grenade", "rus_grenade_rdg1_grenade", "beacon_placer"}

CLASS.Variants = {
	[1] = {
		Name = "Support Officer",
		Weapons = {"rus_semiauto_avt40", "rus_pistol_tokarev", "rus_grenade_rg42_grenade", "rus_grenade_rdg1_grenade", "rus_grenade_rdg1_grenade", "beacon_placer" },
		Level = 5,
		Cost = 5
	},
	
	[2] = {
		Name = "Sturm Officer",
		Weapons = {"rus_smg_pps43", "rus_pistol_tokarev", "rus_grenade_rgd33_grenade", "rus_grenade_rgd33_grenade", "rus_grenade_rdg1_grenade", "beacon_placer" },
		Level = 8,
		Cost = 5
	},
}