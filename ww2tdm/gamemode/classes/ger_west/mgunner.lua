CLASS.Name = "MG-Schütze"
CLASS.Limit = 0.05
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_SUPPRESSION
CLASS.Cost = 4
CLASS.Favourite = "point_objective"
CLASS.Icon = Material("hud/roles/mg.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 1
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 3,
		bodygroups = {
			[0] = 1,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 1,			
		}
	},
}


CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m40_coat.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 1
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 1,			
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,			
		}
	},		
}


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 165
CLASS.Weapons = {"ger_mg_mg42", "ger_pistol_p38"}
CLASS.Variants = {
	[1] = {
		Name = "MG-42",
		Weapons = {"ger_mg_mg34", "ger_pistol_p38", "ger_melee_etool_ger"},
		Level = 4,
		Cost = 4
	},
}