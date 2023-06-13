function GM:ChatText(index, name, text, typ)
	if ( typ == "joinleave" ) then return true end
end

function GM:HUDShouldDraw(name)

	if name == "CHudCrosshair" or name == "CHudAmmo" or name == "CHudHealth" or name == "CHudArmor" or name == "CHudBattery" or name == "CHudWeaponSelection" or name == "CHudSecondaryAmmo" or name == "CHudDamageIndicator" then return false end

	return true

end

function GM:HUDDrawTargetID()

end

function GM:HUDWeaponPickedUp()

end

function GM:HUDAmmoPickedUp()

end

function GM:DrawDeathNotice(x, y)

end

function GM:PrePlayerDraw(ply)
	if ply:Team() == TEAM_SPECTATOR or ply:Team() == TEAM_UNASSIGNED then
		return true
	end
end

hook.Add("SpawnMenuOpen", "WW2_SandboxDisable", function()
	return LocalPlayer():IsSuperAdmin()
end)

net.Receive('PlayerTriggerVoice', function()
	local bool = net.ReadBool()
	permissions.EnableVoiceChat(bool)
end)