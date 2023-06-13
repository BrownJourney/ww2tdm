maploader = maploader or {}

local stored = maploader.stored or {}
local loaders = {}
maploader.stored = stored
maploader.loaders = loaders

local entityloaders = {}
maploader.entityloaders = entityloaders

local class = {}
function class:__call(mapname, gametype, icon, allies, axis, pushTable, developer)
	if !mapname then 
		return 
	end
	
	self.name = mapname
	self.gametype = gametype
	self.icon = Material("map_preview/" .. icon, "smooth noclamp")
	self.factions = {
		[TEAM_AXIS] = axis,
		[TEAM_ALLIES] = allies
	}
	self.pushTable = pushTable
	self.developer = developer
	self.data = {}
end
function class:Add(type, ...)
	local data = {...}
	if type == "maxplayers" or type == "minplayers" then
		self[type] = data[1]
	end

	self.data = self.data or {}
	self.data[type] = self.data[type] or {}

	table.insert(self.data[type], data)
end

function maploader.New()
	local new = {}

	setmetatable(new, class)
	table.SafeMerge(new, class)

	return new
end

function maploader.Map(mapid)
	return stored[mapid]
end

function maploader.Gamemode()
	local mapData = maploader.Map(maploader.GetLoadedMap())
	if mapData then
		return mapData.gametype
	end
end

function maploader.GetHQ(teamID)
	if CFG.Spawns[teamID] then
		return CFG.Spawns[teamID][1] or Vector(0, 0, 0)
	end
end

function maploader.SetLoadMap(mapid)
	if CLIENT then return end
	if !mapid then gVars.SetVar("loadMap", nil) return end

	local map = maploader.Map(mapid)
	if !map then return end

	print("===============LOADING NEW MAP===============")
	print(mapid)
	print("===============LOADING NEW MAP===============")

	gVars.SetVar("loadMap", mapid)
	game.ConsoleCommand('changelevel ' .. map.name .. '\n')
end

function maploader.GetLoadedMap()
	if maploader.CurrentID then
		return maploader.CurrentID
	end

	if SERVER and gVars.GetVar("loadMap") then
		return gVars.GetVar("loadMap")
	end

	return game.GetMap()
end

function maploader.RegisterLoader(loaderType, func, entityLoader)
	if !entityLoader then
		if loaders[loaderType] then 
			return 
		end

		loaders[loaderType] = func
	else
		if CLIENT then return end
		
		if entityloaders[loaderType] then 
			return 
		end

		entityloaders[loaderType] = func
	end
end

maploader.DeriveMapsFrom = {
	["capture"] = "capture_arcade"
}

function maploader.Init()
	local strDir = GAMEMODE.FolderName.."/gamemode/maps/"
	local files, _ = file.Find(strDir.."*.lua", "LUA", "namedesc")

	for k, v in ipairs(files) do
		MAP = maploader.New()
			Include(strDir..v)
			stored[v:StripExtension()] = MAP
		MAP = nil
	end

	maploader.Load()
end

function maploader.Cleanup()
	local map = maploader.Map(maploader.GetLoadedMap())

	map.data = {}

	CFG.Spawns = {}

	local pointsRemoved = 0
	for k, v in pairs(ents.FindByClass("ww2_point_flag")) do
		pointsRemoved = pointsRemoved + 1
		SafeRemoveEntity(v)
	end

	ZONE:Clear()

	return pointsRemoved
end

function maploader.Load(restart)
	local varLoadedMap = maploader.GetLoadedMap()
	if !varLoadedMap then
		maploader.SetLoadMap(game.GetMap())
		return
	end

	local map = maploader.Map(varLoadedMap)

	if !map then 
		-- error loading map
		return 
	end

	if !map.gametype or !map.factions then
		-- error loading map
		return
	end

	for type, v in pairs(map.data) do
		if !loaders[type] or !isfunction(loaders[type]) then continue end
		
		for id, entry in pairs(v) do
			loaders[type](map, unpack(entry))
		end
	end

	if SERVER then
		hook.Add("InitPostEntity", "maploader", function()
			for k, v in pairs(ents.FindByClass("ww2_point_flag")) do
				SafeRemoveEntity(v)
			end

			for type, v in pairs(map.data) do
				if !entityloaders[type] or !isfunction(entityloaders[type]) then continue end
				
				for id, entry in pairs(v) do
					entityloaders[type](map, unpack(entry))
				end
			end
		end)

		hook.Add("PostCleanupMap", "maploader_entities", function()
			for id, entry in pairs(map.data["entityspawn"] or {}) do
				entityloaders["entityspawn"](map, unpack(entry))
			end
		end)
	end
	
	maploader.CurrentID = maploader.GetLoadedMap()
	maploader.SetLoadMap(nil)
	
	local axis = map.factions[TEAM_AXIS]
	local allies = map.factions[TEAM_ALLIES]

	faction.Launch(axis, allies)
	if gm.Launch then
		gm.Launch(map.gametype)
	end

	local push = map.pushTable
	if push then
		TEAM_ATTACK, TEAM_DEFEND = push[1], push[2]
	else
		TEAM_ATTACK, TEAM_DEFEND = nil, nil
	end

	print("DEBUG: LOADING MAP.")

	timer.Create('OneSecond', 1, 0, function()
		hook.Call("OneSecond", GM and GM or GAMEMODE)
	end)
end

maploader.RegisterLoader("flag", function(map, point, range, pos, team, spawns)
	
	local trigger = Vector(range, range, range)

	if istable(team) then
		spawns = team
		team = nil;
	end

	local flag = ents.Create("ww2_point_flag")
	flag:SetPos(pos)
	flag:Spawn()
	flag:SetCollisionBounds(-trigger, trigger)
	flag:SetRadius(range)
	flag:SetControlledBy(team and team or 0)
	flag:SetPoint(point)

	if spawns then
		CFG.FlagSpawns[point] = spawns
	end

	print("spawned flag", flag)
end, true)

maploader.RegisterLoader("restrict", function(map, team, mins, maxs)
	ZONE:Create(mins, maxs, team)
	print("created restricted zone for team " .. (isnumber(team) and team or 0))
end, true)

maploader.RegisterLoader("view", function(map, pos, ang)
	CFG.View = {pos = pos, ang = ang}
	print("created view position")
end)

maploader.RegisterLoader("spawn", function(map, team, pos)
	if !CFG.Spawns[team] then
		CFG.Spawns[team] = {}
	end

	table.insert(CFG.Spawns[team], pos)	
	print("created spawn position for team " .. team)
end)

maploader.RegisterLoader("basespawn", function(map, team, pos)
	if !CFG.BaseSpawns[team] then
		CFG.BaseSpawns[team] = {}
	end

	table.insert(CFG.BaseSpawns[team], pos)	
end)

maploader.RegisterLoader("spawnang", function(map, team, ang)
	if !CFG.SpawnAng then
		CFG.SpawnAng = {}
	end

	CFG.SpawnAng[team] = ang
end, true)

maploader.RegisterLoader("playablezone", function(map, origin, radius)
	CFG.PlayableArea = {origin = origin, radius = radius}
end)

maploader.RegisterLoader("endview", function(map, table)
	CFG.EndView = table
end)

maploader.RegisterLoader("maxplayers", function(map, amount)
	CFG.MaxPlayers = amount
end)

maploader.RegisterLoader("tickets", function(map, amount)
	CFG.Tickets = amount
end)

maploader.RegisterLoader("entityspawn", function(map, name, locations, cooldown, limit, teamID)
	cooldown = tonumber(cooldown) or 180
	limit = tonumber(limit) or 1

	local timerid = name .. "_spawner"
	local findInSphere = function(origin, rad)
		local tbl = {}
		for k, v in pairs(ents.FindInSphere(origin, rad)) do
			if v.IsSimfphyscar then
				table.insert(tbl, v)
			end
		end

		return tbl
	end

	local createEnt = function(name, locations, cooldown, limit, teamID)
		local VehicleList = list.Get("simfphys_vehicles")
		local vehicle = VehicleList[name]

		local count = 0
		for k, v in pairs(ents.FindByClass(name)) do
			if v.team then
				if v.team == teamID then
					count = count + 1
				end
				continue
			end
			count = count + 1
		end
		if count > limit then
			return
		end

		for k, v in pairs(locations) do
			if #findInSphere(v.Pos, 100) > 0 then
				continue
			end

			print("spawning entity " .. name .. " at location " .. tostring(v.Pos))

			if vehicle then
				local vehicle = simfphys.SpawnVehicleSimple(name, v.Pos, v.Ang)
				vehicle.team = teamID
			else
				local ent = ents.Create(name)
				ent:SetPos(v.Pos)
				ent:SetAngles(v.Ang)
				ent:Spawn()
				ent.team = teamID
			end
		end

	end

	createEnt(name, locations, cooldown, limit, teamID)
	timer.Create(timerid, cooldown, 0, function()
		createEnt(name, locations, cooldown, limit, teamID)
	end)
end, true)

maploader.RegisterLoader("stage", function(map, stage, callback)
	gamestate.stages[stage] = function()
		local map = maploader.Map(maploader.GetLoadedMap())
		local pointsCleanuped = maploader.Cleanup(stage)
		callback(map)
		
		for type, v in pairs(map.data) do
			if !loaders[type] or !isfunction(loaders[type]) then continue end
			
			for id, entry in pairs(v) do
				loaders[type](map, unpack(entry))
			end
		end

		for type, v in pairs(map.data) do
			if !entityloaders[type] or !isfunction(entityloaders[type]) then continue end
			
			for id, entry in pairs(v) do
				entityloaders[type](map, unpack(entry))
			end
		end

		return pointsCleanuped
	end
end, true)

maploader.RegisterLoader("area", function(map, area, callback)
	gamestate.areas[area] = function()
		local map = maploader.Map(maploader.GetLoadedMap())
		maploader.Cleanup()
		callback(map)
		
		for type, v in pairs(map.data) do
			if !loaders[type] or !isfunction(loaders[type]) then continue end
			
			for id, entry in pairs(v) do
				loaders[type](map, unpack(entry))
			end
		end

		for type, v in pairs(map.data) do
			if !entityloaders[type] or !isfunction(entityloaders[type]) then continue end
			
			for id, entry in pairs(v) do
				entityloaders[type](map, unpack(entry))
			end
		end
	end
end, true)

maploader.RegisterLoader("snow", function(map)
	CFG.SnowMap = true
end)

maploader.RegisterLoader("music", function(map, soundtrack)
	CFG.MapSoundtrack = Sound(soundtrack)
end)

maploader.RegisterLoader("mandatoryequipment", function(map, equipment)
	CFG.MandatoryEquipment = equipment
end)

hook.Add('Initialize', 'maploader.Initialize', function()
	maploader.Init()
end)

if SERVER then
	util.AddNetworkString("UpdateMapData")
	hook.Add("PlayerInitialSpawn", "RetreiveMapData", function(ply)
		net.Start("UpdateMapData")
			net.WriteString(maploader.CurrentID)
		net.Send(ply)
	end)
end

if CLIENT then
	local switchSideRoles = function(var)
		local map = maploader.Map(maploader.GetLoadedMap())

		if map.pushTable then
			if var % 2 == 0 then
				TEAM_ATTACK, TEAM_DEFEND = map.pushTable[2], map.pushTable[1]
			else
				TEAM_ATTACK, TEAM_DEFEND = map.pushTable[1], map.pushTable[2]
			end
		end
	end

	hook.Add("NetworkWorldIntReceived", "SwapStatements", function(id, var)
		if id == 'GS_ROUND' then
			switchSideRoles(var)
		end
	end)

	net.Receive("UpdateMapData", function()
		maploader.CurrentID = net.ReadString()

		timer.Simple(5, function()
			switchSideRoles(gamestate.GetRound())
		end)

		maploader.Load()
	end)
end