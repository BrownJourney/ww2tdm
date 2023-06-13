CLASS.Name = "Elite Assault"
CLASS.Limit = 0.05
CLASS.Category = CLASS_ASSAULT
CLASS.Cost = 18
CLASS.Trait = TRAIT_QUICKRELOAD
CLASS.Favourite = {
	["point_capture"] = true,
	["point_release"] = true
}
CLASS.Icon = Material("hud/roles/elite_assault.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m41_jacket_2.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_2.mdl",
		skin = 2,
		bodygroups = {
			[0] = 3,
		}
	},	
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 4,
			[2] = 1,
			[3] = 1,
			[4] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/usa/body/winter_coat.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_3.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 4,
			[2] = 1,
			[3] = 1,
			[4] = 0
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},
	scarf = {
		model = "models/usa/head/scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,	
		}
	},	
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {"usa_mg_bar", "usa_grenade_m18", "usa_grenade_mk2", "usa_melee_brassknuckes"}
CLASS.Variants = {
	[1] = {
		Name = "Support",
		Weapons = {"usa_battlerifle_m2auto", "usa_grenade_mk2", "usa_grenade_mk2", "usa_melee_brassknuckes"},
		Level = 4,
		Cost = 4
	},
	[2] = {
		Name = "Assault",
		Weapons = {"usa_shotgun_ithaca", "usa_grenade_mk2", "usa_grenade_mk2", "usa_grenade_m18", "usa_melee_brassknuckes"},
		Level = 6,
		Cost = 5
	},
}