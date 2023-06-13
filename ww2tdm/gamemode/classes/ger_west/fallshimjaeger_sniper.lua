CLASS.Name = "Sniper  (Fallshimjaegers)"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITESUPPORT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/fallshim.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 0
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 1,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 0,
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
		model = "models/german/head/m38_helmet.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[2] = 4,			
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
 
CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/fallshim.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[4] = 1
		}
	},
	legs = {
		model = "models/german/legs/cotton_pants_camo.mdl",
		skin = 3,
		bodygroups = {
			[0] = 1,
			[1] = 0	
		}
	},			
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 0,
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
		model = "models/german/head/m38_helmet.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[2] = 5,				
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
				weapon = "ger_rifle_g30-40",
				attachments = {
					[1] = "optic_kar98k_4x",
					[4] = "clothwrap_kar98"
				}
			},
			"ger_pistol_p38",
			"ger_grenade_stielhandgranate",
		}