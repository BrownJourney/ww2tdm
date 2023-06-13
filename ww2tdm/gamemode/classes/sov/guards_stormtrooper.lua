CLASS.Name = "Штурмовик"
CLASS.Based = "stormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 1,
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 0	
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/cape_short.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 1,		
		bodygroups = {
			[3] = 1,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_2.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 1,
		}
	},
	legs = {
		model = "models/soviet/legs/pants_telogreika.mdl",
		skin = 4,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 2,
			[1] = 2,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/body_additions.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,		
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
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 2,		
		bodygroups = {
			[3] = 1,
		}		
	}
}


CLASS.HP = 150
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220

CLASS.Weapons = {"rus_semiauto_avt40", "rus_grenade_rgd33bundle_grenade", "rus_grenade_f1_grenade"}
