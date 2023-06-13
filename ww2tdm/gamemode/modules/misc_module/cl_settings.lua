--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

settings = settings or {}
settings.list = {
	['general'] = {
		{default = 1, stype = 'checkBox', sname = 'stamps'},
		{default = 0, stype = 'checkBox', sname = 'health'},
		{default = 1, stype = 'checkBox', sname = 'targetid'},
		{default = 0, stype = 'checkBox', sname = 'huddisable'},
		{default = 1, stype = 'checkBox', sname = 'announcer'},
		{default = 1, stype = 'checkBox', sname = 'killfeed'},
		{default = 1, stype = 'checkBox', sname = 'xpfeed'},
		-- {default = 1, stype = 'checkBox', sname = 'voicesounds'},
		{default = 0, stype = 'checkBox', sname = 'arccw_cheapscopes', cvar = true},
		{default = 100, stype = 'bar', sname = 'pointsize'},
		{default = 90, stype = 'bar', sname = 'fov_slider', min = 60, max = 110},
		{default = 100, stype = 'bar', sname = 'music_volume'},
		{default = 100, stype = 'bar', sname = 'headbob_slider', min = 0, max = 100},
		{default = KEY_N, stype = 'dbinder', sname = 'ww2_bind_radio', cvar = true},
		{default = KEY_G, stype = 'dbinder', sname = 'ww2_bind_commorse', cvar = true},
		{default = KEY_Z, stype = 'dbinder', sname = 'ww2_bind_prone', cvar = true},
		{default = KEY_E, stype = 'dbinder', sname = 'ww2_bind_bipod', cvar = true},
		{default = KEY_LSHIFT, stype = 'dbinder', sname = 'ww2_bind_breath', cvar = true},
		{default = KEY_E, stype = 'dbinder', sname = 'ww2_bind_revive', cvar = true},
		{default = KEY_V, stype = 'dbinder', sname = 'ww2_bind_firemode', cvar = true},
		{default = KEY_F, stype = 'dbinder', sname = 'ww2_bind_melee', cvar = true},
		{default = KEY_G, stype = 'dbinder', sname = 'ww2_bind_leanleft', cvar = true},
		{default = KEY_H, stype = 'dbinder', sname = 'ww2_bind_leanright', cvar = true}
	},
}

settings.MusicSounds = {
	['midmusic'] = true,
	['winning'] = true,
	['firstSpawn'] = true,
	['victory'] = true
}

for k, v in pairs(settings.list['general']) do

	if v.cvar and v.sname:find("ww2") then

		CreateClientConVar(v.sname, v.default, true, true, "", 1)

	end

end

local function bool_to_number(bool)
	return bool and 1 or 0
end

function settings.InitFile()
	if !file.IsDir('ww2tdm', 'DATA') then
		file.CreateDir('ww2tdm')
		file.Write('ww2tdm/settings.txt', '{}')
	end

	local readFile = file.Read('ww2tdm/settings.txt')
	if readFile and !util.JSONToTable(readFile) then
		file.Write('ww2tdm/settings.txt', '{}')
	end

	for k, v in pairs(settings.list["general"]) do
		settings.InitSetting(v.sname, v.default)
	end
end

function settings.InitSetting(setting, value)
	local s = settings.Get()

	if isbool(s[setting]) or isnumber(s[setting]) or isstring(s[setting]) then
		if settings.GetData(setting) and settings.GetData(setting).cvar then
			RunConsoleCommand(setting, tonumber(s[setting]))
		end

		return
	end

	s[setting] = value

	s = util.TableToJSON(s)

	file.Write('ww2tdm/settings.txt', s)
end

function settings.ChangeSetting(setting, value)
	local s = settings.Get()

	s[setting] = value

	s = util.TableToJSON(s)

	file.Write('ww2tdm/settings.txt', s)

	settings.stored = settings.Get()

	hook.Run("OnSettingChanged", setting, value)

	if settings.GetData(setting) then
		if settings.GetData(setting).update then
			net.Start('update_bind')
				net.WriteString(setting)
				net.WriteUInt(value, 32)
			net.SendToServer()
		elseif settings.GetData(setting).cvar then
			if isbool(value) then
				RunConsoleCommand(setting, bool_to_number(value))
			else
				RunConsoleCommand(setting, value)
			end
		end
	end
end

function settings.GetData(setting)
	local stable = settings.list["general"]
	for i = 1, #stable do
		if stable[i].sname == setting then
			return stable[i]
		end
	end

	return nil
end

function settings.GetSetting(setting)
	local s = settings.Get()

	return s[setting]
end

function settings.Get()
	if settings.stored then
		return settings.stored
	end

	local readen = file.Read('ww2tdm/settings.txt')
	
	if !readen then
		return {}
	else
		settings.stored = util.JSONToTable(readen) or {}
		return settings.stored
	end
end

settings.InitFile()

--[[-------------------------------------------------------------------------
HOOKS
-------------------------------------------------------------------------]]