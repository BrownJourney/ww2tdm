CLASS.Name = "Supply-Trooper"
CLASS.Limit = 0.05
CLASS.Category = CLASS_LOGISTIC
CLASS.Trait = TRAIT_SUPPLYCRATE
CLASS.Cost = 0
CLASS.Favourite = "support_resupply_ammo"
CLASS.Icon = Material("hud/roles/support.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m41_jacket_1.mdl",
		skin = 5,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_1.mdl",
		skin = 1,
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
			[0] = 5,	
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
			[0] = 5,	
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
CLASS.RunSpeed = 190
CLASS.Weapons = {"usa_battlerifle_garand", "usa_grenade_mk2", "ammo_crate"}
CLASS.Variants = {
	[1] = {
		Name = "Veteran",
		Level = 2,
		Cost = 2,
		Weapons = {
			{
				weapon = "usa_rifle_springfield",
				attachments = {"bayonet_springfield"}
			},
			"usa_grenade_mk2",
			"usa_grenade_m18",
			"ammo_crate"
		}
	},
	[2] = {
		Name = "Close Range",
		Level = 5,
		Cost = 4,
		Weapons = {"usa_battlerifle_m1a1", "usa_grenade_mk2", "ammo_crate", "usa_melee_etool_usa"}
	},
}