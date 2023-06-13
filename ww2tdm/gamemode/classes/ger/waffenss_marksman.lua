CLASS.Name = "Heckenschütze"
CLASS.Based = "marksman" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITESUPPORT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 9,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
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
		model = "models/german/head/m43_cap_camo.mdl",
		skin = 6,
		bodygroups = {
			[0] = 1,			
		}
	},	
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 9,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 4,			
			[3] = 4,	
			[5] = 1	
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
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
		model = "models/german/head/m40_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,			
		}
	},	
	scard = {
		model = "models/german/head/head_scarf.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,			
		}
	},	
}


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220

CLASS.Weapons = {
	{
		weapon = "ger_battlerifle_mkb42",
		attachments = {"optic_mkb"}
	},
	"ger_melee_etool_ger",
	"ger_grenade_stielhandgranate"
}