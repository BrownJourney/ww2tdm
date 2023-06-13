CLASS.Name = "Пулеметчик"
CLASS.Based = "mgunner" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITESUPPORT
CLASS.Cost = 2
 
CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_airborne.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,		
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 5,
			[1] = 5,
			[2] = 3,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[1] = 1,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 4,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_airborne.mdl",
		skin = 2,
		bodygroups = {
			[0] = 0,		
		}
	},
	

	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 5,
			[1] = 5,
			[2] = 3,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_backpack = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[1] = 1,		
		}		
	},	
	
	scarf = {
		model = "models/soviet/head/scarf.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
		}		
	},
	
	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}



CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220
CLASS.Weapons = {"rus_mg_lad", "rus_pistol_tokarev", "rus_melee_etool_rus"}