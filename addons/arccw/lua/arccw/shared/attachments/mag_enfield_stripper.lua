att.PrintName = "Stripper clip"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "mag_enfield"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_enfield_stripper_clip.mdl"
att.HideWorldModel = true

att.Hook_SelectReloadAnimation = function(wep, curanim)
	if wep:Clip1() == 0 then
		return "reload_clip"
	end
end

att.Override_ShotgunReload = false
att.Override_HybridReload = true
att.BoneMerge = true