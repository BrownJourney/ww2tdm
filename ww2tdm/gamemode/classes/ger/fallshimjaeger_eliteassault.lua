CLASS.Name = "Elite Stoßtrupp (Fallshimjaegers)"
CLASS.Based = "elitestormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2
 
CLASS.Bonemerge = {
	body = {
		model = "models/german/body/fallshim.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1					
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
		model = "models/german/head/m38_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,		
		}
	},
}
 
CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m42_smock.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,
			[3] = 0			
		}
	},
 
	legs = {
		model = "models/german/legs/cotton_pants.mdl",
		skin = 8,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 3,
			[1] = 3,
			[2] = 1,
			[3] = 1					
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
		model = "models/german/head/m38_helmet.mdl",
		skin = 1,
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
CLASS.Weapons = {"ger_battlerifle_fg42", "ger_pistol_lugerp08", "ger_grenade_stielhandgranate"}
