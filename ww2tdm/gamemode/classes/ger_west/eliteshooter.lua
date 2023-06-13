CLASS.Name = "Elite Schütze"
CLASS.Limit = 0.05
CLASS.Category = CLASS_ASSAULT
CLASS.Trait = TRAIT_TACSPRINT
CLASS.Cost = 15
CLASS.Favourite = "kill"
CLASS.Icon = Material("hud/roles/elite_rifleman.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic_camo.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,
			[1] = 2,
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
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 2,			
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
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,
			[1] = 2,
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
			[3] = 2,			
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,			
		}
	},	
	helmet_camo = {
		model = "models/german/head/m40_helmet_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,			
		}
	},		
}

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {"ger_semiauto_g41", "ger_grenade_stielhandgranate", "ger_melee_etool_ger"}
CLASS.Variants = {
	[1] = {
		Name = "Grenadier",
		Level = 3,
		Cost = 4,
		Weapons = {"ger_semiauto_g41", "ger_grenade_stielhandgranate", "ger_grenade_stielhandgranate", "ger_grenade_nebelhandgranate", "ger_melee_etool_ger"}
	},
	[2] = {
		Name = "Ambusher",
		Level = 6,
		Cost = 4,	
		Weapons = {"ger_battlerifle_mkb42", "ger_pistol_p38", "ger_grenade_stielhandgranate", "ger_melee_etool_ger"}
	},
}