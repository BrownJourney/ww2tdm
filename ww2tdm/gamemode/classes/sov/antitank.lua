CLASS.Name = "Противотанкист"
CLASS.Limit = 0.05
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_GRENADES
CLASS.Cost = 10
CLASS.Favourite = "car_destroy"
CLASS.Icon = Material("hud/roles/tankhunter.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0,	
			[5] = 0			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_telogreika.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,
			[1] = 5,
			[2] = 2,
			[3] = 0,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_1.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1			
		}
	},
	
	legs = {
		model = "models/soviet/legs/pants_telogreika.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,
			[1] = 5,
			[2] = 2,
			[3] = 0,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 190

CLASS.Weapons = {"rus_rifle_mosin_9130", "rus_grenade_rpg40_grenade", "rus_grenade_rdg1_grenade"}
CLASS.Variants = {
	[1] = {
		Name = "Flanker",
		Level = 3,
		Weapons = {"rus_rifle_mosin_carbine", "rus_bomb_compb_rus", "rus_grenade_rdg1_grenade"}
	},
	[2] = {
		Name = "Tank Hunter",
		Level = 6,
		Cost = 10,
		Weapons = {"rus_rifle_ptrd41", "rus_pistol_tokarev", "rus_melee_etool_rus"}
	}
}