CLASS.Name = "Стрелок"
CLASS.Limit = 0
CLASS.Category = CLASS_ASSAULT
CLASS.Trait = TRAIT_MOBILITY
CLASS.Cost = 0
CLASS.Favourite = "kill"
CLASS.Icon = Material("hud/roles/rifleman.png", "smooth noclamp")

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
			[0] = 0,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 1			
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
			[0] = 0,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 1			
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
CLASS.RunSpeed = 185
CLASS.Weapons = {"rus_rifle_mosin_9130", "rus_melee_etool_rus"}
CLASS.Variants = {
	[1] = {
		Name = "Bayonet",
		Level = 1,
		Weapons = {
			{
				weapon = "rus_rifle_mosin_9130",
				attachments = {
					[3] = "bayonet_mosins"
				}
			},
			"rus_grenade_rg42_grenade",	
			"rus_melee_etool_rus"	
		},
	},
	[2] = {
		Name = "Veteran",
		Weapons = {
			{
				weapon = "rus_rifle_mosin_9130",
				attachments = {
					[3] = "bayonet_mosins",
					[5] = "mag_mosin_stripper"
				}
			},
			"rus_grenade_rgd33light"		
		},
		Level = 5
	},
}