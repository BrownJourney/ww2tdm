CLASS.Name = "Снабженец"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_SUPPLYCRATE
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_ammo"
CLASS.Icon = Material("hud/roles/support.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
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
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,		
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
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,		
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


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190

CLASS.Weapons = {"rus_rifle_mosin_carbine", "rus_grenade_rgd33light", "ammo_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Veteran",
		Level = 2,
		Cost = 2,
		Weapons = {
			{
				weapon = "rus_rifle_mosin_carbine",
				attachments = {
					[3] = "bayonet_mosins"
				}
			},
			"rus_grenade_rgd33light", 
			"rus_grenade_rdg1_grenade",
			"ammo_crate"	
		}
	},
	[2] = {
		Name = "Close Range",
		Level = 5,
		Cost = 4,
		Weapons = {"rus_semiauto_svt40", "rus_grenade_rgd33light", "ammo_crate"}
	},
}