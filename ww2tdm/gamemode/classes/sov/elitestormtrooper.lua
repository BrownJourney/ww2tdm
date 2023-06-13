CLASS.Name = "Элитный штурмовик"
CLASS.Limit = 0.05
CLASS.Category = CLASS_ASSAULT
CLASS.Cost = 18
CLASS.Trait = TRAIT_QUICKRELOAD
CLASS.Favourite = {
	["point_capture"] = true,
	["point_release"] = true
}
CLASS.Icon = Material("hud/roles/elite_assault.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 0			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[2] = 1,		
		}		
	},	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,		
		}		
	},	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/ameba_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1,
			[4] = 0,	
			[5] = 0			
		}
	},
	
	legs = {
		model = "models/soviet/legs/camo_pants.mdl",
		skin = 2,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[2] = 1,		
		}		
	},	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,		
		}		
	},	
	
	scarf = {
		model = "models/soviet/head/scarf.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
		}		
	},
	
	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}



CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {"rus_smg_ppsh41", "rus_grenade_rdg1_grenade", "rus_grenade_rg42_grenade", "rus_melee_etool_rus"}
CLASS.Variants = {
	[1] = {
		Name = "Support",
		Weapons = {"rus_smg_pps43", "rus_grenade_rg42_grenade", "rus_grenade_rg42_grenade", "rus_melee_etool_rus"},
		Level = 4,
		Cost = 4
	},
	[2] = {
		Name = "Assault",
		Weapons = {
			{
				weapon = "rus_smg_ppsh41",
				attachments = {"mag_ppsh_extended"}
			},
			"rus_grenade_rg42_grenade",
			"rus_grenade_rg42_grenade",
			"rus_grenade_rdg1_grenade"
		},
		Level = 6,
		Cost = 5
	},
}