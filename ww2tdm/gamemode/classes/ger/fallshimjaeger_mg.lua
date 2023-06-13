CLASS.Name = "MG-Schütze"
CLASS.Based = "mgunner" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_FALLSHIMJAEGERS
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
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m43_cap_camo.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 2,			
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
		skin = 4,
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
			[0] = 1,	
		}
	},
	helmet = {
		model = "models/german/head/m43_cap_camo.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,
			[1] = 2,			
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
CLASS.Weapons = {"ger_mg_mg81", "ger_pistol_p38", "ger_melee_etool_ger"}