gm = {}
MODE = MODE or {}

local GM = GM and GM or GAMEMODE

function gm.Load(gametype)
	local strDir = GM.FolderName.."/gamemode/gamemodes/"..gametype.."/"
	local clientside = strDir.."cl_init.lua"
	local serverside = strDir.."init.lua"
	local clExists = file.Exists(clientside, "LUA")

	MODE = {}

	if SERVER then 
		if file.Exists(serverside, "LUA") then
			include(serverside)
		else
			return false
		end

		if clExists then
			AddCSLuaFile(clientside)
		end

		return true
	else
		if clExists then
			include(clientside)

			return true
		end
	end

	return false
end

function gm.Call(name, ...)
	if MODE[name] then
		MODE[name](MODE, unpack({...}))
	end
end

function gm.Launch(gametype)
	if gm.Load(gametype) then
		hook.Call("GamemodeInitialize", GM and GM or GAMEMODE)

		Print(CLR_MSG_GREEN, "Gamemode '"..gametype.."' is loaded.")
	else
		Print(CLR_MSG_ORANGE, "Failed to load gamemode '"..gametype.."'.")
	end
end
