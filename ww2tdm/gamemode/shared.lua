GM.Name = "World War II Frontlines"
GM.Author = "BroJou, Cultist_kun, Schwartz Kruppo"
GM.Version = "1.0"
GM.Email    = "lapshindanila96@gmail.com"
GM.Website  = "N/A"

CLR_MSG_PINK = Color(255, 0, 255)
CLR_MSG_CYAN = Color(0, 255, 255)
CLR_MSG_ORANGE = Color(255, 100, 0)
CLR_MSG_YELLOW = Color(255, 255, 0)
CLR_MSG_GREEN = Color(0, 255, 0)

function Print(color, text)
	color = color or Color(255, 255, 255)
	text = text or ""

	MsgC(color, "[NextOren WW2-TDM] " .. text .. "\n")
end

function table.SafeMerge(to, from)
	local oldIndex, oldIndex2 = to.__index, from.__index

	to.__index = nil
	from.__index = nil
		table.Merge(to, from)
	to.__index = oldIndex
	from.__index = oldIndex2
end

function table.ContainValue(tbl, value)
	if !istable(tbl) then return end

	local checkIterate = true
	if !tbl[1] then checkIterate = false end
	if checkIterate then
		for i = 1, #tbl do
			if tbl[i] == value then
				return true
			end
		end
	else
		for k, v in pairs(tbl) do
			if v == value then
				return true
			end
		end
	end

	return false
end

local DISABLED_MODULES = {
}

function Include(strFile)
	if !strFile then
		return
	end

	if SERVER then
		if strFile:find("cl_") then
			Print(CLR_MSG_ORANGE, "Pooling CLIENT file: "..strFile)

			AddCSLuaFile(strFile)
		elseif strFile:find("sv_") then
			Print(CLR_MSG_CYAN, "Loading SERVER file: "..strFile)

			return include(strFile)
		else
			Print(CLR_MSG_YELLOW, "Pooling and loading SHARED file: "..strFile)

			AddCSLuaFile(strFile)
			return include(strFile)
		end
	else
		if !strFile:find("sv_") then
			local v1 = strFile:find("cl_") and "CLIENT" or "SHARED"
			local v2 = strFile:find("cl_") and CLR_MSG_CYAN or CLR_MSG_YELLOW
			Print(v2, "Loading "..v1.." file: "..strFile)

			return include(strFile)
		end
	end
end

function IncludeDirectory(strDir, bRecursive)
	if !strDir:EndsWith("/") then
		strDir = strDir.."/"
	end

	local dir = GM.FolderName.."/gamemode/"..strDir

	if bRecursive then
		local files, folders = file.Find(dir.."*", "LUA", "namedesc")

		--for k, v in SortedPairs(files, true) do
		--	if v:GetExtensionFromFilename() == "lua" then
		--		Include(dir..v)
		--	end
		--end

		for _, folder in SortedPairs(folders, true) do
			if DISABLED_MODULES[folder] then continue end
			for _, File in SortedPairs(file.Find(dir .. folder .."/sh_*.lua", "LUA"), true) do
				Include(dir .. folder .. "/" .. File)
			end
		end

		for _, folder in SortedPairs(folders, true) do
			if DISABLED_MODULES[folder] then continue end
			for _, File in SortedPairs(file.Find(dir .. folder .."/sv_*.lua", "LUA"), true) do
				Include(dir .. folder .. "/" .. File)
			end
		end

		for _, folder in SortedPairs(folders, true) do
			if DISABLED_MODULES[folder] then continue end
			for _, File in SortedPairs(file.Find(dir .. folder .."/cl_*.lua", "LUA"), true) do
				Include(dir .. folder .. "/" .. File)
			end
		end

		for k, v in SortedPairs(folders, true) do
			IncludeDirectory(strDir..v, bRecursive)
		end
	else
		local files, _ = file.Find(dir.."*.lua", "LUA", "namedesc")

		for k, v in SortedPairs(files, true) do
			Include(dir..v)
		end
	end
end

function GM:CountAlivePlayers(teamID)
	local count = 0
	for k, v in pairs(team.GetPlayers(teamID)) do
		if v:IsAlive() then
			count = count + 1
		end
	end
	return count
end


Include("engine/sh_faction.lua")
Include("engine/sh_config.lua")
Include("engine/sh_language.lua")
Include("engine/sh_maploader.lua")
Include("engine/sh_playerstate.lua")
Include("engine/sh_gamestate.lua")
Include("engine/sh_gamemodesystem.lua")
Include("engine/sh_gui.lua")

TEAM_ALLIES = 1
TEAM_AXIS = 2
TEAM_SPECTATOR = 3

team.SetUp(TEAM_ALLIES, "Allies",  Color(231, 76, 60))
team.SetUp(TEAM_AXIS, "Axis", Color(100, 100, 100))
team.SetUp(TEAM_SPECTATOR, "Spectator", Color(200, 200, 200))

-- DeriveGamemode( "sandbox" )