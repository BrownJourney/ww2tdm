MAP("ww2_hill35_wf", "push", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_AXIS, TEAM_ALLIES})

MAP:Add("view", Vector(-4114, -5201, 367), Angle(-5.940058, 52.043777, 0.000000))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 600, Vector(-6545, -6942, 99), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-10631 + spawnDistance * i, -8137, 58))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-10634 + spawnDistance * i, -8332, 58))
	end

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-3558, -3502 - spawnDistance * i, 91))
	end
	
	MAP:Add("restrict", TEAM_ATTACK, Vector(-1857, -8792, -706), Vector(-5288, -335, 1903))
	MAP:Add("restrict", TEAM_ATTACK, Vector(-8512, -4956, -1538), Vector(-5288, -335, 1903))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-10838, -9016, -452), Vector(-7369, -5503, 1017))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "B", 600, Vector(-2420, -5529, 136), TEAM_DEFEND)
	MAP:Add("flag", "C", 600, Vector(-3503, -1372, 8), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-6709, -6110 - spawnDistance * i, 137))
	end

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(951 - spawnDistance * i, -887, 66))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-2421, -3422, -584), Vector(1507, 2084, 1394))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-8875, -1985, -191), Vector(-5029, -9231, 2862))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-2968, -4582, -266), Vector(-5029, -9231, 2862))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "D", 800, Vector(11, -32, 31), TEAM_DEFEND)

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-6298 + spawnDistance * i, -1451, 119))
	end

	for i = 1, 35 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(2269, 5451 - spawnDistance * i, 326))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(1010, -1979, -517), Vector(5460, 9578, 3502))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-1562, 1564, -887), Vector(-9046, -6530, 2454))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-5118, -8731, -547), Vector(942, -2194, 1505))
end)

MAP:Add("stage", 4, function(MAP)
	MAP:Add("flag", "E", 1200, Vector(6297, 6414, 1088), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(1347, 947 + spawnDistance * i, 122))
	end

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(7707 + spawnDistance * i, 8233, 1040))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(6219, 7586, 413), Vector(9276, 9213, 1378))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-3007, -3329, -1311), Vector(4332, 9289, 1969))
end)

MAP:Add("endview", {startPos = Vector(5549, 6078, 1151), endPos = Vector(2812, 5229, 374), angle = Angle(3.595989, 27.922314, 0.000000)})

MAP:Add("maxplayers", 26)