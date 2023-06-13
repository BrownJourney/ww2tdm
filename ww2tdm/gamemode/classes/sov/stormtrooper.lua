CLASS.Name = "Штурмовик"
CLASS.Limit = 0.06
CLASS.Category = CLASS_ASSAULT
CLASS.Cost = 6
CLASS.Trait = TRAIT_DEPLOY
CLASS.Favourite = {
	["point_capture"] = true,
	["point_release"] = true
}
CLASS.Icon = Material("hud/roles/assault.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1,
			[4] = 0,	
			[5] = 0			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/body_additions.mdl",
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

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_m39_coat.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1,
			[4] = 0,	
			[5] = 0			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,		
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
		skin = 5,		
		bodygroups = {
			[4] = 1,
		}		
	}
}



CLASS.HP = 100
CLASS.AP = 35
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {"rus_smg_ppd34", "rus_grenade_rgd33light", "rus_melee_etool_rus"}
CLASS.Variants = {
	[1] = {
		Name = "Flanker",
		Level = 3,
		Cost = 4,
		Weapons = {"rus_smg_ppd40", "rus_grenade_rgd33_grenade", "rus_grenade_rdg1_grenade", "rus_melee_etool_rus"}

	},
	[2] = {
		Name = "Mid Range",
		Level = 6,
		Cost = 10,
		Weapons = {"rus_semiauto_svt38", "rus_grenade_rgd33_grenade", "rus_grenade_rdg1_grenade", "rus_melee_etool_rus"}
	}
}