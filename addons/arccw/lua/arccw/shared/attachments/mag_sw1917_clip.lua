att.PrintName = "Clip"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "sw1917_clip"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_clips_sw1917.mdl"
att.HideWorldModel = true

att.Hook_SelectReloadAnimation = function(wep, curanim)
	return curanim.."_clip"
end

att.Override_ShotgunReload = false
att.BoneMerge = true