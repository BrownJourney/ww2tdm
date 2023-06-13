CLASS.Name = "Heckenschütze"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_AMMO
CLASS.Cost = 7
CLASS.Favourite = "headshot_kill"
CLASS.Icon = Material("hud/roles/marksmen.png", "smooth noclamp")

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 2,
			[2] = 1,
			[3] = 0					
		}
	},	
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},	
	helmet = {
		model = "models/german/head/m43_cap.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,			
		}
	},	
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m40_coat.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 2,
			[2] = 1,
			[3] = 0					
		}
	},	
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},	
	helmet = {
		model = "models/german/head/m43_cap.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,			
		}
	},	
	scard = {
		model = "models/german/head/head_scarf.mdl",
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
		weapon = "ger_semiauto_g43",
		attachments = {"optic_gewerh"}
	},
	"ger_melee_etool_ger"
}

CLASS.Variants = {
	[1] = {
		Name = "Close Combat",
		Level = 3,
		Cost = 4,
		Weapons = {"ger_semiauto_g43", "ger_grenade_nebelhandgranate", "ger_melee_etool_ger"}
	},
	[2] = {
		Name = "Expert",
		Level = 8,
		Cost = 6,
		Weapons = {
			{
				weapon = "ger_semiauto_g43",
				attachments = {"optic_gewerh", "clothwrap_g43"}
			},
		"ger_grenade_nebelhandgranate"	
		}
	}
}