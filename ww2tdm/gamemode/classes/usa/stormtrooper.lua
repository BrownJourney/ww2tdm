CLASS.Name = "Assault"
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
		model = "models/usa/body/m41_jacket_1.mdl",
		skin = 2,
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
			[0] = 4,
			[1] = 5,
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
			[0] = 4,
			[1] = 5,
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
CLASS.Weapons = {"usa_smg_greasegun", "usa_grenade_mk2", "usa_melee_etool_usa"}
CLASS.Variants = {
	[1] = {
		Name = "Flanker",
		RunSpeed = 215,
		Level = 3,
		Cost = 4,		
				Weapons = {
			{
				weapon = "usa_smg_thompson",
				attachments = {"mag_thompson_20", "grip_thompson_standart", "optic_thompson"}
			},
			"usa_grenade_mk2",
			"usa_grenade_m18",
			"usa_melee_etool_usa"
		}
	},
	[2] = {
		Name = "Mid Range",
		Level = 6,
		Cost = 10,
		Weapons = {
			{
				weapon = "usa_smg_thompson",
				attachments = {"mag_thompson_20", "optic_thompson", "grip_thompson_wood"}
			},
			"usa_grenade_mk2",
			"usa_grenade_m18",
			"usa_melee_etool_usa"
		}
	}
}