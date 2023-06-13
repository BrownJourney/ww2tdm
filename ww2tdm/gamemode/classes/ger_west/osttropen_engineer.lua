CLASS.Name = "Pioniere"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITESUPPORT
CLASS.Cost = 2


CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m40_tunic.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,	
			[3] = 1,			
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
		model = "models/german/legs/wool_pants.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 0	
		}
	},		
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 4,
			[1] = 3,
			[2] = 1,
			[3] = 1					
		}
	},
	gear_backpack = {
		model = "models/german/gear/gear_backpacks.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,	
		}
	},
	helmet = {
		model = "models/german/head/m40_helmet.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,	
			[3] = 1,			
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
CLASS.RunSpeed = 180
CLASS.Weapons = {"rus_smg_ppd40", "ger_bomb_satchel_ger", "ger_grenade_stielhandgranate", "w_hammer"}
