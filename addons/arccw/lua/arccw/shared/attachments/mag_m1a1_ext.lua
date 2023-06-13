att.PrintName = "30 round magazine"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "m1a1_mag"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_magazine_m1a1_30.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_magazine_m1a1_30.mdl"

att.Hook_GetCapacity = function(wep, cap) return 30 end

att.Hook_SelectReloadAnimation = function(wep, curanim)
	return curanim.."_ext"
end

att.BoneMerge = true