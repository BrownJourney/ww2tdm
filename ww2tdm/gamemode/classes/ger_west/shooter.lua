CLASS.Name = "Schütze"
CLASS.Limit = 0
CLASS.Category = CLASS_ASSAULT
CLASS.Trait = TRAIT_MOBILITY
CLASS.Cost = 0
CLASS.Favourite = "kill"
CLASS.Icon = Material("hud/roles/rifleman.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 1,
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
			[1] = 0
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
			[0] = 1,
			[1] = 1,
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
		model = "models/german/head/m43_cap.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,	
			[3] = 0,			
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

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {"ger_rifle_kar98", "ger_melee_etool_ger"}
CLASS.Variants = {
	[1] = {
		Name = "Experienced",
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[3] = "bayonet_kar98k",
				}
			},
			"ger_grenade_stielhandgranate"	
		},
		Level = 2
	},
	[2] = {
		Name = "Veteran",
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[3] = "bayonet_kar98k",
					[5] = "mag_kar98k_stripper"
				}
			},
			"ger_grenade_stielhandgranate"		
		},
		Level = 5
	},
}