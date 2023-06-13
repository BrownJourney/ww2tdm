CLASS.Name = "Elite Schütze"
CLASS.Based = "eliteshooter" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2


CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic_camo.mdl",
		skin = 11,
		bodygroups = {
			[0] = 0,
			[1] = 1
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 12,
		bodygroups = {
			[0] = 1,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m43_cap_camo.mdl",
		skin = 11,
		bodygroups = {
			[0] = 0,			
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,			
		}
	},
	
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m40_coat.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 0,	
			[3] = 2,			
		}
	},
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 2,			
		}
	},	
	helmet_camo = {
		model = "models/german/head/m40_helmet_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,			
		}
	},		
}

CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220


CLASS.Weapons = {"rus_semiauto_svt40", "ger_pistol_p38", "ger_grenade_stielhandgranate", "ger_melee_etool_ger"}
