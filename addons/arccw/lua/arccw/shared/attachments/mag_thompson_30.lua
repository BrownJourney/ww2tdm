att.PrintName = "30 round magazine"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "thompson_mag"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_thompson_mag_30.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_thompson_mag_30.mdl"

att.Hook_GetCapacity = function(wep, cap) return 30 end

att.Mult_Recoil = 1.1

-- att.Hook_SelectReloadAnimation = function(wep, curanim)
-- 	return curanim.."_drum"
-- end

att.BoneMerge = true