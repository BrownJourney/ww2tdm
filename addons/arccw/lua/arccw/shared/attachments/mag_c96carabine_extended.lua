att.PrintName = "40 round magazine"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "mag_c96carabine"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_magazine_c96_40.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_c96carbine_mag_40.mdl"

att.Hook_GetCapacity = function(wep, cap) return 40 end

att.Hook_SelectReloadAnimation = function(wep, curanim)
	return curanim.."_ext"
end

att.BoneMerge = true