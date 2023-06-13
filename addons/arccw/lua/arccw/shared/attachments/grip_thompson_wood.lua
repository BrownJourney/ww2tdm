att.PrintName = "Wood grip"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "thompson_grip"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_thompson_foregrip.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_thompson_foregrip.mdl"

att.Hook_TranslateSequence = function(wep, seq)
	if !isstring(seq) then return end
	if not seq:find("base") then return end
	local spl = string.Split(seq, '_')
	spl[1] = "foregrip"
	return table.concat(spl, '_')
end

att.Mult_Sway = 0.6

att.BoneMerge = true