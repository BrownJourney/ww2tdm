CLASS.Name = "Медик"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_HEALTH
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_heal"
CLASS.Icon = Material("hud/roles/medic.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,
			[3] = 1,
			[4] = 0,	
			[5] = 0			
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
			[0] = 6,
			[1] = 6,
			[2] = 2,
			[3] = 2,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 3,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_m39_coat.mdl",
		skin = 0,
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
			[0] = 2,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 6,
			[1] = 6,
			[2] = 2,
			[3] = 2,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 3,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.HP = 125
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190
CLASS.Weapons = {"rus_revolver_nagan", "rus_grenade_rdg1_grenade", "medic_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Field Medic",
		Cost = 2,
		Level = 4,
		Weapons = {"rus_rifle_mosin_carbine", "rus_grenade_rdg1_grenade", "medic_crate"}
	},
	[2] = {
		Name = "Combat Medic",
		Cost = 2,
		Level = 6,
		Weapons = {"rus_rifle_mosin_carbine", "rus_grenade_rgd33light", "medic_crate"}
	},
}