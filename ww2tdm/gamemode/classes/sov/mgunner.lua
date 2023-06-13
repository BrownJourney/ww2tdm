CLASS.Name = "Пулемётчик"
CLASS.Limit = 0.05
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_SUPPRESSION
CLASS.Cost = 4
CLASS.Favourite = "point_objective"
CLASS.Icon = Material("hud/roles/mg.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 1,
			[3] = 2,
			[4] = 0,	
			[5] = 0			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 5,
			[1] = 5,
			[2] = 3,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[1] = 1,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_m39_coat.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,	
			[5] = 0			
		}
	},
	
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 5,
			[1] = 5,
			[2] = 3,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[1] = 1,		
		}		
	},	
	
	scarf = {
		model = "models/soviet/head/scarf.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
		}		
	},
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}



CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 165
CLASS.Weapons = {"rus_mg_dp28", "rus_revolver_nagan"}
CLASS.Variants = {
	[1] = {
		Name = "DT-37",
		Weapons = {"rus_mg_dt", "rus_revolver_nagan"},
		Level = 4,
		Cost = 4
	},
}
