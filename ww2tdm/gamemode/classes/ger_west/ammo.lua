CLASS.Name = "Munition-sträger"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_SUPPLYCRATE
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_ammo"
CLASS.Icon = Material("hud/roles/support.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 0
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
			[0] = 7,	
		}
	},
	helmet = {
		model = "models/german/head/m38_cap.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,		
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
			[0] = 7,	
		}
	},
	helmet = {
		model = "models/german/head/m38_cap.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,		
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,			
		}
	},		
}

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190
CLASS.Weapons = {"ger_rifle_kar98", "ger_grenade_stielhandgranate", "ammo_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Veteran",
		Level = 2,
		Cost = 2,
		Weapons = {
			{
				weapon = "ger_rifle_kar98",
				attachments = {
					[3] = "bayonet_kar98k",
				}
			},
			"ger_grenade_stielhandgranate",
			"ger_grenade_nebelhandgranate",
			"ammo_crate"
		}
	},
	[2] = {
		Name = "Close Range",
		Level = 5,
		Cost = 4,
		Weapons = {"ger_semiauto_g43", "ger_grenade_stielhandgranate", "ammo_crate", "ger_melee_etool_ger"}
	},
}