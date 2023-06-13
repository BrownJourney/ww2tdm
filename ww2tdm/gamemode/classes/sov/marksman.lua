CLASS.Name = "Меткий стрелок"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMO
CLASS.Cost = 7
CLASS.Favourite = "headshot_kill"
CLASS.Icon = Material("hud/roles/marksmen.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 1,
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
		skin = 1,		
		bodygroups = {
			[0] = 1,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	helmet = {
		model = "models/soviet/head/sh36_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_2.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 1,
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 1,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 1,
		}		
	}
}


CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 100
CLASS.RunSpeed = 185
CLASS.Weapons = {
	{
		weapon = "rus_semiauto_svt40",
		attachments = {"optic_svt_3x"}
	},
	"rus_melee_etool_rus"
}


CLASS.Variants = {
	[1] = {
		Name = "Close Combat",
		Level = 3,
		Cost = 4,
		Weapons = {"rus_semiauto_svt40", "rus_grenade_rdg1_grenade", "rus_melee_etool_rus"}
	},
	[2] = {
		Name = "Expert",
		Level = 8,
		Cost = 6,
		Weapons = {
			{
				weapon = "rus_semiauto_svt40",
				attachments = {"optic_svt_6x"}
			},
		"rus_grenade_rdg1_grenade"	
		}
	},
}