CLASS.Name = "Rifleman"
CLASS.Limit = 0
CLASS.Category = CLASS_ASSAULT
CLASS.Trait = TRAIT_MOBILITY
CLASS.Cost = 0
CLASS.Favourite = "kill"
CLASS.Icon = Material("hud/roles/rifleman.png", "smooth noclamp")

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
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 0,
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
		model = "models/usa/body/m41_jacket_2.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_3.mdl",
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
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 0,
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

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {"usa_battlerifle_garand", "usa_melee_etool_usa"}
CLASS.Variants = {
	[1] = {
		Name = "Experienced",
		Weapons = {
			"usa_battlerifle_garand",
			"usa_grenade_mk2",
		    "usa_melee_etool_usa"	
		},
		Level = 2
	},
	[2] = {
		Name = "Veteran",
		Weapons = {
			{
				weapon = "usa_battlerifle_garand",
				attachments = {"bayonet_garand"}
			},
			"usa_grenade_mk2",
			"usa_melee_etool_usa"
		},
		Level = 5
	},
}