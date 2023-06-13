CLASS.Name = "Sniper"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMODROP
CLASS.Cost = 9
CLASS.Favourite = "long_kill"
CLASS.Icon = Material("hud/roles/sniper.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/parka.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_2.mdl",
		skin = 0,
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
		model = "models/usa/body/parka.mdl",
		skin = 8,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_2.mdl",
		skin = 8,
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
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 0,			
		}
	},
	camo = {
		model = "models/usa/head/m1_camo.mdl",
		skin = 11,
		bodygroups = {
			[0] = 0,	
		}
	},	
}

CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {
	{
		weapon = "usa_rifle_springfield",
		attachments = {"optic_springfield_optic", "bolt_springfield"}
	},
}
CLASS.Variants = {
	[1] = {
		Name = "Mid Range",
		Level = 2,
		Cost = 3,
		Weapons = {
			{
				weapon = "usa_rifle_springfield",
				attachments = {"optic_springfield_optic", "bolt_springfield", "bayonet_springfield"}
			},
			"usa_pistol_m1911",
			"usa_grenade_mk2",
		}
	},
	[2] = {
		Name = "Long Range",
		Level = 6,
		Cost = 4,
		Weapons = {
			{
				weapon = "usa_rifle_springfield",
				attachments = {"optic_springfield_7x", "bolt_springfield", "clothwrap_springfield"}
			},
			"usa_pistol_m1911"
		}
	}
}