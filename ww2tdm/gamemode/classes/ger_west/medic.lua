CLASS.Name = "Sanitäter"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_HEALTH
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_heal"
CLASS.Icon = Material("hud/roles/medic.png", "smooth noclamp")

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
			[0] = 8,
			[1] = 8,
			[2] = 1,
			[3] = 1	
		}	
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
		}
	},	
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 7,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 3,
		}		
	}
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
			[0] = 8,
			[1] = 8,
			[2] = 1,
			[3] = 1	
		}	
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
		}
	},	
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 7,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 3,
		}		
	}
}

CLASS.HP = 125
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190
CLASS.Weapons = {"ger_revolver_reichrevolver", "ger_grenade_nebelhandgranate", "medic_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Field Medic",
		Cost = 2,
		Level = 4,
		Weapons = {"ger_rifle_kar98", "ger_grenade_nebelhandgranate", "medic_crate"}
	},
	[2] = {
		Name = "Combat Medic",
		Cost = 2,
		Level = 6,
		Weapons = {"ger_rifle_kar98", "ger_grenade_stielhandgranate", "medic_crate"}
	},
} 