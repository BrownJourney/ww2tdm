CLASS.Name = "Элитный Штурмовик"
CLASS.Based = "elitestormtrooper" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2
 
CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/ameba_camo.mdl",
		skin = 4,
		bodygroups = {
			[0] = 0,		
		}
	},
	legs = {
		model = "models/soviet/legs/camo_pants.mdl",
		skin = 4,		
		bodygroups = {
			[0] = 1,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 1,
			[3] = 1,
			[4] = 1			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/gear_bodyarmor.mdl",
		skin = 0,		
		bodygroups = {
			[2] = 0,		
		}		
	},	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,		
		}		
	},	
	helmet = {
		model = "models/soviet/head/ssh40_helm.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/ameba_camo.mdl",
		skin = 9,
		bodygroups = {
			[0] = 0,		
		}
	},
	legs = {
		model = "models/soviet/legs/camo_pants.mdl",
		skin = 9,		
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
		model = "models/soviet/gear/gear_bodyarmor.mdl",
		skin = 0,		
		bodygroups = {
			[2] = 0,		
		}		
	},	
	gear_backpack = {
		model = "models/soviet/gear/gear_backpack.mdl",
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
		skin = 5,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

 
CLASS.HP = 130
CLASS.AP = 50
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220
CLASS.Weapons = {"rus_smg_pps43", "rus_grenade_rgd33bundle_grenade", "rus_grenade_f1_grenade", "rus_melee_etool_rus"}
