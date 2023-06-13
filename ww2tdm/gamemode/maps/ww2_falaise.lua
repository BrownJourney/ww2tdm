MAP("ww2_falaise", "push", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_AXIS, TEAM_ALLIES})

MAP:Add("view", Vector(12583, -2300, 0), Angle(15.245689, 177.595230, 0.000000))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 1200, Vector(6768, -7862, -415), TEAM_DEFEND)

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(13614 - spawnDistance * i, -2773, -394))
	end
	
	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(13622 - spawnDistance * i, -2573, -399))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(826 - spawnDistance * i, -8016, -142))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(836 - spawnDistance * i, -7833, -142))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-2936, -13378, -1511), Vector(4293, -1707, 2739))
	MAP:Add("restrict", TEAM_DEFEND, Vector(15635, 6064, -979), Vector(6549, -1901, 1931))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "B", 400, Vector(1598, -5133, -330), TEAM_DEFEND)
	MAP:Add("flag", "C", 500, Vector(2925, -11985, -424), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(10009 - spawnDistance * i, -8209, -359))
	end

	for i = 1, 24 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-5059 + spawnDistance * i, -8123, -288))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-8635, 903, -2129), Vector(-2516, -13982, 1560))
	MAP:Add("restrict", TEAM_DEFEND, Vector(12509, -10889, -1570), Vector(2733, -672, 595))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "D", 1500, Vector(-12386, -4686, 84), TEAM_DEFEND)

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-1388 - spawnDistance * i, -2197, -372))
	end

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-9650 - spawnDistance * i, -13903, 133))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-16650, -16043, -1301), Vector(-4014, -9117, 978))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-2723, 781, -1785), Vector(-7539, -14732, 1507))
end)

MAP:Add("endview", {startPos = Vector(-1752, -11118, -254), endPos = Vector(-3480, -9857, -284), angle = Angle(5.575689, -132.531128, 0.000000)})

MAP:Add("maxplayers", 36)