att.PrintName = "15 round magazine"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "m1911_magazine"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_magazine_1911_15.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_magazine_1911_15.mdl"

att.Hook_GetCapacity = function(wep, cap) return 15 end

att.Mult_Recoil = 1.1

att.Hook_SelectReloadAnimation = function(wep, curanim)
	return curanim.."_ext"
end

att.BoneMerge = true