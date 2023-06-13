lang = lang or {}

local stored = lang.stored or {}
lang.stored = stored

local current_language = "en"

function lang.GetPhrase(id, ref)
	ref = ref or stored
	local val = ref[id]

	if isstring(val) then
		return val
	end

	return false
end

function lang.All(key)
	if isstring(key) then
		stored[key] = stored[key] or {}

		return stored[key]
	end

	return stored
end

function lang.Load()	-- looks very ROBUST
	local strDir = GM.FolderName.."/gamemode/lang/"
	local files, _ = file.Find(strDir.."*.lua", "LUA", "namedesc")

	for k, v in ipairs(files) do
		local id
		local new = {}
		setmetatable(new, {__call = function(self, c) id = c end})

		L = new
			Include(strDir..v)
			if id then
				lang.Add(id, L)
			end
		L = nil
	end
end

function lang.Add(index, value)
	if stored[index] then
		table.Merge(stored[index], value)
	else
		stored[index] = value
	end
end

function lang.AddPhrase(locale, id, translation)

	if !lang.stored[locale] then

		return;

	end

	lang.stored[locale][id] = translation

end

function lang.GetPlural(language, phrase, count)
	local langTable = stored[language]
	local translated = T(phrase)

	if !langTable then return translated end

	if langTable.Pluralize then
		return langTable:Pluralize(phrase, count, translated)
	end

	return translated
end

function lang.NiceTime(language, time)
	time = tonumber(time) or 0

	local langTable = stored[language]

	if langTable and langTable.NiceTime then
		return langTable:NiceTime(time)
	end
end

function lang.NiceTimeFull(language, time)
	time = tonumber(time) or 0

	local langTable = stored[language]

	if langTable and langTable.NiceTimeFull then
		return langTable:NiceTimeFull(time)
	end
end

function lang.GetCase(language, phrase, case)
	if language == "en" then 
		return T(phrase)
	end

	local langTable = stored[language]
	local translated = t(phrase)

	if !langTable then return translated end

	if langTable.GetCase then
		return langTable:GetCase(phrase, count, translated)
	end

	return translated
end

function lang.GetPlayer(player)
	if !IsValid(player) then
		return "en" 
	end

	return player:GetNWString("Lang") or "en"
end

function T(phrase, args, force_lang)
	args = istable(args) and args or {args}
	local phrase = lang.GetPhrase(phrase, stored[force_lang or current_language]) or phrase

	for k, v in pairs(args) do
		phrase = string.gsub(phrase, "{"..k.."}", v)
	end

	return phrase
end

if CLIENT then
	current_language = GetConVar("gmod_language"):GetString()

	cvars.AddChangeCallback("gmod_language", function(_, old, new)
		current_language = new

		net.Start("LangChanged")
			net.WriteString(new)
		net.SendToServer()
	end)

	net.Receive("LangRequest", function(ply)
		local new_lang = GetConVar("gmod_language"):GetString()

		net.Start("LangChanged")
			net.WriteString(new_lang)
		net.SendToServer()
	end)
else
	util.AddNetworkString("LangRequest")
	util.AddNetworkString("LangChanged")

	hook.Add("PlayerInitialSpawn", "lang", function(ply)
		net.Start("LangRequest")
		net.Send(ply)
	end)

	net.Receive("LangChanged", function(len, ply)
		ply:SetNWString("Lang", net.ReadString() or "en")
	end)


	function T(ply, phrase, args)
		args = istable(args) and args or {args}
		local phrase = lang.GetPhrase(phrase, stored[ply:GetNWString("Lang") or "en"]) or phrase

		for k, v in pairs(args) do
			phrase = string.gsub(phrase, "{"..k.."}", v)
		end

		return phrase
	end
end

lang.Load()