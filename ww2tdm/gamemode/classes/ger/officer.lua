CLASS.Name = "Officier"
CLASS.Limit = 0.03
CLASS.Category = CLASS_SUPPORT
CLASS.Trait = TRAIT_BEACON
CLASS.Cost = 9
CLASS.Favourite = "beacon_spawn"
CLASS.Icon = Material("hud/roles/officer.png", "smooth noclamp")
CLASS.TraitInstant = true

CLASS.Bonemerge = {
	body = {
		model = "models/german/body/m36_officer.mdl",
		skin = 3,
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 3,
		bodygroups = {
			[0] = 3,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,
			[1] = 1,
			[2] = 0,
			[3] = 0					
		}
	},	
	helmet = {
		model = "models/german/head/m40_officer.mdl",
		skin = 3,
	},		
}

CLASS.SnowBonemerge = {
	body = {
		model = "models/german/body/m40_summer.mdl",
		skin = 0,
		bodygroups = {
			[0] = 0,
			[1] = 0,
			[3] = 4,			
			[4] = 1,				
		}
	},
	legs = {
		model = "models/german/legs/wool_pants.mdl",
		skin = 4,
		bodygroups = {
			[0] = 3,
		}
	},
	gear = {
		model = "models/german/gear/gear_main.mdl",
		skin = 0,
		bodygroups = {
			[0] = 6,
			[1] = 1,
			[2] = 0,
			[3] = 0					
		}
	},	
	helmet = {
		model = "models/german/head/m40_officer.mdl",
		skin = 3,
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
CLASS.Weapons = {"ger_smg_mp40", "ger_pistol_lugerp08", "ger_grenade_stielhandgranate", "ger_grenade_nebelhandgranate", "beacon_placer"}

CLASS.Variants = {
	[1] = {
		Name = "Support Officer",
		Weapons = {"ger_semiauto_g43", "ger_pistol_lugerp08", "ger_grenade_stielhandgranate", "ger_grenade_nebelhandgranate", "ger_grenade_nebelhandgranate", "beacon_placer" },
		Level = 5,
		Cost = 5
	},
	
	[2] = {
		Name = "Sturm Officer",
		Weapons = {"ger_battlerifle_mkb42", "ger_pistol_lugerp08", "ger_grenade_splintering_stielhandgranate", "ger_grenade_splintering_stielhandgranate", "ger_grenade_nebelhandgranate", "beacon_placer" },
		Level = 8,
		Cost = 5
	},
}