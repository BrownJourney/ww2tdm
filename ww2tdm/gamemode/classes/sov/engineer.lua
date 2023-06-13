CLASS.Name = "Инженер"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_BLASTPROTECTION
CLASS.Cost = 10
CLASS.Favourite = "support_fortification"
CLASS.Icon = Material("hud/roles/engi.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_1.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1			
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
			[1] = 5,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,		
		}		
	},	
	helmet = {
		model = "models/soviet/head/sh36_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_1.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1			
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
			[1] = 5,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,		
		}		
	},	
	helmet = {
		model = "models/soviet/head/sh36_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180

CLASS.Weapons = {"rus_rifle_mosin_carbine", "rus_grenade_rg42_grenade", "w_hammer"}
CLASS.Variants = {
	[1] = {
		Name = "Demolition",
		Cost = 5,
		Weapons = {
			{
				weapon = "rus_rifle_mosin_carbine",
				attachments = {
					[3] = "bayonet_mosins"
				}
			},
			"rus_grenade_rg42_grenade",	
			"rus_bomb_satchel_rus",
			"w_hammer",
		},
		Level = 3
	},
	[2] = {
		Name = "Assault Engineer",
		Cost = 10,
		Level = 8,
		Weapons = {"rus_smg_ppd34", "rus_bomb_satchel_rus", "rus_grenade_rg42_grenade", "w_hammer"}
	}
}