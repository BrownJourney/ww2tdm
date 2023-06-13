CLASS.Name = "Стрелок"
CLASS.Based = "shooter" -- на каком классе по сути базируется данная элитка
CLASS.Category = CLASS_ELITEASSAULT
CLASS.Cost = 2

CLASS.Bonemerge = {
	body = {
		model = "models/soviet/body/body_m43_jacket.mdl",
		skin = 6,
		bodygroups = {
			[0] = 0,
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 0,			
		}
	},
	legs = {
		model = "models/soviet/legs/pants_m21_naval.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 1			
		}		
	},
	helmet = {
		model = "models/soviet/head/hat_navy.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/soviet/body/body_m39_coat.mdl",
		skin = 3,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1,
			[4] = 1,	
			[5] = 1			
		}
	},
	
	legs = {
		model = "models/soviet/legs/pants_m21_naval.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
			[1] = 0
		}
	},
	gear = {
		model = "models/soviet/gear/gear_main.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 1,
			[1] = 1,
			[2] = 1,
			[3] = 0,
			[4] = 1			
		}		
	},
	
	helmet = {
		model = "models/soviet/head/hat_navy.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	},
	scarf = {
		model = "models/soviet/head/scarf.mdl",
		skin = 0,		
		bodygroups = {
			[0] = 0,
		}		
	}	
}

 
CLASS.HP = 130
CLASS.AP = 0
CLASS.WalkSpeed = 120
CLASS.RunSpeed = 220
CLASS.Weapons = {
	{
		weapon = "rus_rifle_mosin_1891",
		attachments = {"mosin_sniper_bolt", "bayonet_mosins"}
	},
	"rus_grenade_f1_grenade",
	"rus_grenade_rgd33light",
	"rus_melee_knife",
}