CLASS.Name = "Tank-Hunter"
CLASS.Limit = 0.05
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_GRENADES
CLASS.Cost = 10
CLASS.Favourite = "car_destroy"
CLASS.Icon = Material("hud/roles/tankhunter.png", "smooth noclamp")

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
			[2] = 1,
			[3] = 1				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,	
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
			[0] = 0,
			[1] = 0,
			[2] = 1,
			[3] = 1				
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,	
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

CLASS.Weapons = {"usa_battlerifle_garand", "ger_grenade_antitank_bomb", "usa_grenade_m18"}
CLASS.Variants = {
	[1] = {
		Name = "Flanker",
		AP = 30,
		Level = 3,
		Weapons = {"usa_smg_greasegun", "usa_bomb_compb_allies", "usa_grenade_m18"}
	},
	[2] = {
		Name = "Tank Hunter",
		Level = 6,
		Cost = 10,
		Weapons = {"usa_rpg_bazooka", "usa_pistol_m1911", "usa_melee_etool_usa"}
	}
}