CLASS.Name = "Элитный стрелок"
CLASS.Limit = 0.05
CLASS.Category = CLASS_ASSAULT
CLASS.Trait = TRAIT_TACSPRINT
CLASS.Cost = 15
CLASS.Favourite = "kill"
CLASS.Icon = Material("hud/roles/elite_rifleman.png", "smooth noclamp")

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
		skin = 2,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 6,
			[1] = 6,
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
		model = "models/soviet/body/body_telogreika_2.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 1,
		}
	},
	legs = {
		model = "models/soviet/legs/pants_telogreika.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 6,
			[1] = 6,
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

	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 0,
		}		
	}
}





CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 180
CLASS.Weapons = {"rus_semiauto_svt38", "rus_grenade_rgd33light", "rus_melee_etool_rus"}
CLASS.Variants = {
	[1] = {
		Name = "Precise",
		Level = 3,
		Cost = 4,
		Weapons = {
			{
				weapon = "rus_semiauto_svt38",
				attachments = {"optic_svt_1x"}
			},
		"rus_grenade_rgd33light",
		"rus_melee_etool_rus"
		}
	},
	[2] = {
		Name = "Ambusher",
		Level = 6,
		Cost = 4,
		Weapons = {"rus_semiauto_avs36", "rus_grenade_rgd33light", "rus_melee_etool_rus"}
	},
}