CLASS.Name = "Pioniere"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_BLASTPROTECTION
CLASS.Cost = 0
CLASS.Favourite = "support_fortification"
CLASS.Icon = Material("hud/roles/engi.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,	
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
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,	
			[3] = 1,			
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,			
		}
	},		
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {"ger_rifle_kar98", "ger_grenade_stielhandgranate", "w_hammer"}
CLASS.Variants = {
	[1] = {
		Name = "Demolition",
		Cost = 5,
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[3] = "bayonet_kar98k",
				}
			},
			"ger_grenade_stielhandgranate",	
			"ger_bomb_satchel_ger",
			"w_hammer",
		},
		Level = 3
	},
	[2] = {
		Name = "Assault Engineer",
		Cost = 10,
		Level = 8,
		Weapons = {"ger_smg_mp34", "ger_bomb_satchel_ger", "ger_grenade_stielhandgranate", "w_hammer"}
	}
}