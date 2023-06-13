CLASS.Name = "Officer"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_BEACON
CLASS.Cost = 9
CLASS.Favourite = "beacon_spawn"
CLASS.Icon = Material("hud/roles/officer.png", "smooth noclamp")
CLASS.TraitInstant = true

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m43_jacket_2.mdl",
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
		model = "models/usa/body/small_coat.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_2.mdl",
		skin = 1,
		bodygroups = {
			[0] = 1,
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
CLASS.RunSpeed = 180
CLASS.Weapons = {"usa_smg_thompson", "usa_pistol_m1911", "usa_grenade_mk2", "usa_grenade_m18", "beacon_placer"}

CLASS.Variants = {
	[1] = {
		Name = "Support Officer",
		Weapons = {
			{
				weapon = "usa_battlerifle_garand",
				attachments = {"bayonet_garand", "clothwrap_garand"}
			},
		"usa_pistol_m1911",
		"usa_grenade_mk2",
		"usa_grenade_m18",
		"usa_grenade_m18",
		"beacon_placer" 
		},
		Level = 5,
		Cost = 5
	},
	
	[2] = {
		Name = "Sturm Officer",
		Weapons = {
			{
				weapon = "usa_shotgun_ithaca",
				attachments = {"optic_ithaca"}
			},
		"usa_pistol_m1911",
		"usa_grenade_mk2",
		"usa_grenade_mk2",
		"usa_grenade_m18",
		"beacon_placer"
		},
		Level = 8,
		Cost = 5
	},
}