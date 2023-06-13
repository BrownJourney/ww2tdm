CLASS.Name = "MG-Gunner"
CLASS.Limit = 0.05
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_SUPPRESSION
CLASS.Cost = 4
CLASS.Favourite = "point_objective"
CLASS.Icon = Material("hud/roles/mg.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m41_jacket_1.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_1.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 5,
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
		skin = 4,
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
			[1] = 6,
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


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 165
CLASS.Weapons = {
	{
		weapon = "usa_mg_bar",
		attachments = {"bipod_bar"}
	},
	"usa_pistol_m1911"
}


CLASS.Variants = {
	[1] = {
		Name = "M1941",
		Weapons = {"usa_mg_m1919", "usa_pistol_m1911", "usa_melee_etool_usa"},
		Level = 4,
		Cost = 4
	},
}