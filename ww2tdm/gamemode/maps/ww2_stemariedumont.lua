MAP("ww2_stemariedumont", "push", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_ALLIES, TEAM_AXIS})

MAP:Add("view", Vector(79, 1930, 780), Angle(3.561773, -40.444099, 0.000000))

local spawnDistance = 50

local function commonRestirct(MAP, min, max)
	MAP:Add("restrict", TEAM_AXIS, min, max)
	MAP:Add("restrict", TEAM_ALLIES, min, max)
end

MAP:Add("stage", 1, function(MAP)
	MAP:Add("spawnang", TEAM_ATTACK, Angle(0, -90, 0))
	MAP:Add("spawnang", TEAM_DEFEND, Angle(0, 90, 0))

	MAP:Add("flag", "A", 500, Vector(3328, 6742, 177), TEAM_DEFEND)
	MAP:Add("flag", "B", 500, Vector(209, 5711, 264), TEAM_DEFEND)

	for i = 1, 100 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(6226 - spawnDistance * i, 12269, 532))
	end

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1251, -301 + spawnDistance * i, 575))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(4630, 4702, -672), Vector(-4312, -1581, 3276))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-2239, 8595, -439), Vector(8014, 14169, 3125))

	commonRestirct(MAP, Vector(-4741, 13612, -1057), Vector(7521, 4905, -23))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "C", 500, Vector(-3153, 1894, 405), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-399, 6931 - spawnDistance * i, 367))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-2341, -3074 + spawnDistance * i, 279))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-3039, 1184, -556), Vector(2452, -2808, 2251))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-4074, 3585, -1254), Vector(7542, 10643, 2015))

	commonRestirct(MAP, Vector(-4741, 13612, -1057), Vector(7521, 4905, -23))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "D", 600, Vector(-551, -2500, 240), TEAM_DEFEND)
	MAP:Add("flag", "E", 500, Vector(-964, -5216, 268), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-1703, 1342 + spawnDistance * i, 473))
	end

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(1637 - spawnDistance * i, -8255, 304))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-3038, -6465, -637), Vector(2634, -10779, 2314))
	MAP:Add("restrict", TEAM_DEFEND, Vector(5918, -1764, -296), Vector(-4442, 8182, 2382))

	commonRestirct(MAP, Vector(-4741, 13612, -1057), Vector(7521, 4905, -23))
end)

MAP:Add("endview", {startPos = Vector(-2099.872314, -8237.967773, 877.165344), endPos = Vector(-2105.687744, -8342.827148, 269.892761), angle = Angle(-40.228207, -90.764046, 0.000000)})

MAP:Add("maxplayers", 34)