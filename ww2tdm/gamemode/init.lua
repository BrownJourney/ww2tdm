AddCSLuaFile("shared.lua")
include("shared.lua")

function file.ReadDataAndConent(path)

	local f = file.Read(path, "DATA")
	if f then return f end

	f = file.Read(GAMEMODE.Folder .. "/data/" .. path, "GAME")

	return f

end

util.AddNetworkString("eChat_addChat")
function ShowMessage(...)

	local packedMessage = {...}

	net.Start("eChat_addChat")

		net.WriteTable(packedMessage)

	net.Broadcast()

end

function ShowMessageTo(players, ...)

	local packedMessage = {...}

	net.Start("eChat_addChat")
	
		net.WriteTable(packedMessage)

	net.Send(players)

end

local function LoadModules()

	print()
	IncludeDirectory("modules", true)

end


RunConsoleCommand("hostname", "NextOren WWII | Eastern/Western front | Round based | 17+ Maps | PvP")


LoadModules()
