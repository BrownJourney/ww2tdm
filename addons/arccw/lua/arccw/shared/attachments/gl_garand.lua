att.PrintName = "Grenade launcher"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "garand_gl"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_garand_gl.mdl"
att.HideWorldModel = true

att.BoneMerge = true

-- att.Hook_TranslateSequence = function(wep, seq)
-- 	if !isstring(seq) then return end
-- 	if seq:find("glsetup") then return end
-- 	if seq:find("bash") then
-- 		return seq
-- 	end
-- 	local spl = string.Split(seq, '_')
-- 	spl[1] = "glsetup"
-- 	print(table.concat(spl, '_'))
-- 	return table.concat(spl, '_')
-- end

att.LHIK = true
att.LHIK_Animation = true

att.UBGL = true

att.UBGL_Automatic = false
--att.UBGL_MuzzleEffect = "muzzleflash_m79"
att.UBGL_ClipSize = 1
att.UBGL_Ammo = "smg1_grenade"
att.UBGL_RPM = 300
att.UBGL_Recoil = 2.5
att.UBGL_Capacity = 1

att.UBGL_Fire = function(wep, ubgl)
    if wep:Clip2() <= 0 then return end

    wep:DoLHIKAnimation("fire", 0.5)

    wep:FireRocket("arccw_gl_he", 30000)

    wep:EmitSound("weapons/grenade_launcher1.wav", 100)

    wep:SetClip2(wep:Clip2() - 1)

    wep:DoEffects()
end