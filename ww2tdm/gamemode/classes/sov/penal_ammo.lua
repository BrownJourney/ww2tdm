CLASS.Name = "Снабженец"
CLASS.Based = "ammo" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITELOGISTIC
CLASS.Cost = 2
 
CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 5,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m35.mdl",
		skin = 3,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/m35_pilotka.mdl",
		skin = 1,		
		bodygroups = {
			[0] = 0,
		}		
	}
}


CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_telogreika_1.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	legs = {
		model = "models/soviet/legs/pants_telogreika.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 0,
			[4] = 0		
		}		
	},	
	
	helmet = {
		model = "models/soviet/head/m35_pilotka.mdl",
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
CLASS.Weapons = {"rus_shotgun_sawedoff", "rus_bomb_satchel_rus", "rus_grenade_rdg1_grenade", "ammo_crate"}
