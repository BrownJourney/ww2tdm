MAP("ww2_battleofcarentan", "push", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_ALLIES, TEAM_AXIS}, true)

MAP:Add("view", Vector(-2544, 200, -389), Angle(9.372152, 28.078529, 0.000000))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 1000, Vector(2519, -6169, -988), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(9702 - spawnDistance * i, -11831, -1015))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(9637 - spawnDistance * i, -11477, -1040))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-446, 128 - spawnDistance * i, -875))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-865, 151 - spawnDistance * i, -818))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-1070, 6031, -570), Vector(6563, -112, 1819))
	MAP:Add("restrict", TEAM_DEFEND, Vector(10569, -12288, -1656), Vector(6726, -8712, 403))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "B", 600, Vector(712, 1559, -1020), TEAM_DEFEND)

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(422, -3217 - spawnDistance * i, -869))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1387 + spawnDistance * i, 7303, -1037))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1385 + spawnDistance * i, 7363, -1037))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(2883, 8466, -1771), Vector(-5557, 2240, 1028))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-5119, -882, -1854), Vector(7974, -11188, 632))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "C", 500, Vector(-332, 3196, -976), TEAM_DEFEND)
	MAP:Add("flag", "D", 500, Vector(2128, 3305, -948), TEAM_DEFEND)
	MAP:Add("flag", "E", 500, Vector(-1475, 4033, -972), TEAM_DEFEND)

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(278, -265 - spawnDistance * i, -942))
	end

	for i = 1, 35 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-28, 7226 - spawnDistance * i, -1042))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-2732, 4383, -1832), Vector(4231, 9092, 1107))
	MAP:Add("restrict", TEAM_DEFEND, Vector(6052, 2110, -2464), Vector(-5932, -4520, 573))
end)

MAP:Add("stage", 4, function(MAP)
	MAP:Add("flag", "F", 300, Vector(-708, 7972, -992), TEAM_DEFEND)

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-271, 1018 + spawnDistance * i, -942))
	end

	for i = 1, 35 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-626 + spawnDistance * i, 11661, -1108))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(2455, 12757, -1758), Vector(-1896, 8427, -458))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-2581, 5174, -1828), Vector(5292, -4662, 1066))
end)

MAP:Add("endview", {startPos = Vector(-710, 7705, -714), endPos = Vector(-710, 6200, -714), angle = Angle(0.823650, 90.326546, 0.000000)})

MAP:Add("maxplayers", 32)