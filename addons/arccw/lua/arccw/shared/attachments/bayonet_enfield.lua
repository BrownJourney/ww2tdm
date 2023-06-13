att.PrintName = "Bayonet"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "enfield_bayonet"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_enfield_bayonet_spike.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_enfield_bayonet_spike.mdl"

att.Hook_TranslateAnimation = function(wep, anim)
	if anim == "idle_sprint" then
		return "idle_sprint_bayonet"
	elseif anim == "base_sprint_empty" then
		return "idle_sprint_empty_bayonet"
	end
end

att.Hook_SelectBashAnim = function(wep, anim)
	return anim.."_bayonet"
end

att.Mult_MeleeDamage = 10
att.Override_MeleeDamageType = DMG_SLASH

att.BoneMerge = true