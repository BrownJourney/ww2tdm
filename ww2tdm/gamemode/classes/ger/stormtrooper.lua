CLASS.Name = "Stoßtrupp"
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
		model = "models/german/body/m40_tunic.mdl",
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
			[0] = 4,
			[1] = 4,
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
		skin = 0,
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
			[0] = 4,
			[1] = 4,
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
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 1,			
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
CLASS.Weapons = {"ger_smg_mp34", "ger_grenade_stielhandgranate", "ger_melee_etool_ger"}
CLASS.Variants = {
	[1] = {
		Name = "Flanker",
		RunSpeed = 215,
		Level = 3,
		Cost = 4,
		Weapons = {"ger_smg_mp40", "ger_grenade_nebelhandgranate", "ger_grenade_splintering_stielhandgranate", "ger_melee_etool_ger"}
	},
	[2] = {
		Name = "Mid Range",
		Level = 6,
		Cost = 10,
		Weapons = {
			"ger_semiauto_g41",
			"ger_grenade_nebelhandgranate",
			"ger_grenade_splintering_stielhandgranate",
			"ger_melee_fairbairn"
		}
	}
}