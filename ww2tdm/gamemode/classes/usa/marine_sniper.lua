CLASS.Name = "Sniper"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITESUPPORT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/m43_jacket_1.mdl",
		skin = 9,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_camo.mdl",
		skin = 7,
		bodygroups = {
			[0] = 1,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 1,
		}
	},
	camo = {
		model = "models/usa/head/m1_camo.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},	
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 10,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 1,	
			[3] = 0,			
		}
	},
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/usa/body/parka.mdl",
		skin = 8,
		bodygroups = {
			[0] = 1,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_camo.mdl",
		skin = 8,
		bodygroups = {
			[0] = 3,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/usa/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 5,
			[2] = 1,
			[3] = 1,
			[4] = 0			
		}
	},
	gear_backpack = {
		model = "models/usa/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,	
		}
	},
	helmet = {
		model = "models/usa/head/m1_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 1,	
			[3] = 0,			
		}
	},
	
		camo = {
		model = "models/usa/head/m1_camo.mdl",
		skin = 11,
		bodygroups = {
			[0] = 0,
			[1] = 0	
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


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220

CLASS.Weapons = {
	{
		weapon = "usa_rifle_winchester70",
		attachments = {"optic_springfield_optic", "bayonet_springfield"}
	},
	"usa_pistol_m1911",
	"usa_grenade_mk2",
}