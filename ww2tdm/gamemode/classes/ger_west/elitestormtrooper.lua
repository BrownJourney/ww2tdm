CLASS.Name = "Elite Stoßtrupp"
CLASS.Limit = 0.05
CLASS.Category = CLASS_ASSAULT
CLASS.Cost = 18
CLASS.Trait = TRAIT_QUICKRELOAD
CLASS.Favourite = {
	["point_capture"] = true,
	["point_release"] = true
}
CLASS.Icon = Material("hud/roles/elite_assault.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 13,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 10,
		bodygroups = {
			[0] = 0,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 5,
			[1] = 5,
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
		model = "models/german/body/m42_smock.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[4] = 1,	
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 5,
			[1] = 5,
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
			[0] = 3,			
		}
	},	
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {"ger_smg_mp41", "ger_grenade_nebelhandgranate", "ger_grenade_stielhandgranate", "ger_melee_k98kbayonet"}
CLASS.Variants = {
	[1] = {
		Name = "Support",
		Weapons = {"ger_battlerifle_stg44", "ger_grenade_stielhandgranate", "ger_grenade_stielhandgranate", "ger_melee_k98kbayonet"},
		Level = 4,
		Cost = 4
	},
	[2] = {
		Name = "Assault",
		Weapons = {"ger_smg_erma", "ger_grenade_splintering_stielhandgranate", "ger_grenade_splintering_stielhandgranate", "ger_grenade_nebelhandgranate", "ger_melee_k98kbayonet"},
		Level = 6,
		Cost = 5
	},
}