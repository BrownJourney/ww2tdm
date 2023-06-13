CLASS.Name = "Marksman"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMO
CLASS.Cost = 7
CLASS.Favourite = "headshot_kill"
CLASS.Icon = Material("hud/roles/marksmen.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m41_jacket_2.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_2.mdl",
		skin = 2,
		bodygroups = {
			[0] = 3,
		}
	},	
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,	
		}
	},
	helmet = {
		model = "models/usa/head/jeepcap.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,	
			[3] = 0,			
		}
	},
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/usa/body/winter_coat.mdl",
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
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,	
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
CLASS.Weapons = {
	{
		weapon = "usa_battlerifle_garand",
		attachments = {"optic_garand"}
	},
	"usa_melee_etool_usa"
}

CLASS.Variants = {
	[1] = {
		Name = "Close Combat",
		Level = 3,
		Cost = 4,
		Weapons = {"usa_battlerifle_garand", "usa_grenade_m18", "usa_melee_etool_usa"}
	},
	[2] = {
		Name = "Expert",
		Level = 8,
		Cost = 6,
		Weapons = {
			{
			weapon = "usa_battlerifle_garand",
			attachments = {"optic_garand", "clothwrap_garand"}
			},
		"usa_grenade_m18"	
		}
	}
}