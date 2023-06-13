CLASS.Name = "Medic"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_HEALTH
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_heal"
CLASS.Icon = Material("hud/roles/medic.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m41_jacket_1.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_1.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 0,
			[3] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/usa/body/winter_coat.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_1.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 0,
			[3] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},
	scarf = {
		model = "models/usa/head/scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,	
		}
	},
}

CLASS.HP = 125
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190
CLASS.Weapons = {"usa_revolver_sw1917", "usa_grenade_m18", "medic_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Field Medic",
		Cost = 2,
		Level = 4,
		Weapons = {"usa_battlerifle_garand", "usa_grenade_m18", "medic_crate"}
	},
	[2] = {
		Name = "Combat Medic",
		Cost = 2,
		Level = 6,
		Weapons = {"usa_battlerifle_garand", "usa_grenade_mk2", "medic_crate"}
	},
} 