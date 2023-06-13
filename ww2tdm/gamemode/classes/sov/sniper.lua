CLASS.Name = "Снайпер" 
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMODROP
CLASS.Cost = 9
CLASS.Favourite = "long_kill"
CLASS.Icon = Material("hud/roles/sniper.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/ameba_camo.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 1,		
		}
	},
	legs = {
		model = "models/soviet/legs/camo_pants.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 0			
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
		model = "models/soviet/body/ameba_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 2,
			[3] = 1,	
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
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 0			
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
CLASS.RunSpeed = 180
CLASS.Weapons = {
	{
		weapon = "rus_rifle_mosin_1891",
		attachments = {"mosin_sniper_bolt", "optic_mosins_3x"}
	},
	"rus_pistol_tokarev"
}
CLASS.Variants = {
	[1] = {
		Name = "Mid Range",
		Level = 2,
		Cost = 3,
		Weapons = {
			{
				weapon = "rus_rifle_mosin_1891",
				attachments = {"mosin_sniper_bolt", "optic_mosins_6x"}
			},
			"rus_pistol_tokarev"
		}
	},
	[2] = {
		Name = "Long Range",
		Level = 6,
		Cost = 4,
		Weapons = {
			{
				weapon = "rus_rifle_mosin_1891",
				attachments = {"mosin_sniper_bolt", "optic_mosins_8x", "bayonet_mosins"}
			},
			"rus_pistol_tokarev"	
		}
	},
}