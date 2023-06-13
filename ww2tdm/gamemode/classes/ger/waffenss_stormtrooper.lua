CLASS.Name = "Stoßtrupp"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic_camo.mdl",
		skin = 5,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[5] = 1,
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 0,
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
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 2,	
			[4] = 0,			
		}
	},	
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 5,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[4] = 1,	
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 5,
			[1] = 5,
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
		skin = 6,
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
}


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220

CLASS.Weapons = {"ger_smg_mp41", "ger_grenade_bandlenade", "ger_grenade_stielhandgranate"}
