CLASS.Name = "Scharfschütze"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMODROP
CLASS.Cost = 9
CLASS.Favourite = "long_kill"
CLASS.Icon = Material("hud/roles/sniper.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants.mdl",
		skin = 12,
		bodygroups = {
			[0] = 2,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 0,
			[3] = 0					
		}
	},	
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},	
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},	
	helmet_camo = {
		model = "models/german/head/m40_helmet_camo.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,		
		}
	},	
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[3] = 4,			
			[4] = 1,				
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants.mdl",
		skin = 7,
		bodygroups = {
			[0] = 4,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 0,
			[3] = 0					
		}
	},	
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},	
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},	
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 2,
		bodygroups = {
			[0] = 3,			
		}
	},	
}

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {
	{
		weapon = "ger_rifle_kar98",
		attachments = {"optic_kar98k_2x"}
	},
}
CLASS.Variants = {
	[1] = {
		Name = "Mid Range",
		Level = 2,
		Cost = 3,
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[1] = "optic_kar98k_4x",
				}
			},
			"ger_pistol_p38",
			"ger_grenade_stielhandgranate",
		}
	},
	[2] = {
		Name = "Long Range",
		Level = 6,
		Cost = 4,
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[1] = "optic_kar98k_8x",
					[4] = "clothwrap_kar98"
				}
			},
			"ger_revolver_reichrevolver"
		}
	}
}