CLASS.Name = "Элитный Стрелок"
CLASS.Based = "eliteshooter" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 1,
		bodygroups = {
			[0] = 0,
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
			[0] = 6,
			[1] = 6,
			[2] = 0,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/cape_long.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,		
		}		
	},	

	helmet = {
		model = "models/soviet/head/m35_pilotka.mdl",
		skin = 2,		
		bodygroups = {
			[0] = 0,
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
			[0] = 6,
			[1] = 6,
			[2] = 0,
			[3] = 0,
			[4] = 0			
		}		
	},
	gear_back = {
		model = "models/soviet/gear/cape_long.mdl",
		skin = 1,		
		bodygroups = {
			[2] = 0,		
		}		
	},	

	helmet = {
		model = "models/soviet/head/hat_ushanka.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 0,
		}		
	}
}





CLASS.HP = 100
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220
CLASS.Weapons = {"rus_semiauto_sks45", "rus_grenade_f1_grenade", "rus_melee_etool_rus"}
