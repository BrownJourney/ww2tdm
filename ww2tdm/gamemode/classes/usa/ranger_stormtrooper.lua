CLASS.Name = "Assault"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/usa/body/ranger.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_3.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
			[1] = 0	
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
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/usa/body/small_coat.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/usa/pants/pants_3.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
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
CLASS.Hands = "models/usa/body/arms/hands_m43_jacket_1.mdl"

CLASS.Weapons = {"usa_smg_thompson_m1a1", "usa_pistol_m1911", "usa_grenade_mk2"}

