MAP("ww2_stcomedumont", "push", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_ALLIES, TEAM_AXIS}, true)

MAP:Add("view", Vector(-1885, -1193, 969), Angle(2.144129, 22.877993, 0.000000))

MAP:Add("spawnang", TEAM_ATTACK, Angle(0, 90, 0))
MAP:Add("spawnang", TEAM_DEFEND, Angle(0, -90, 0))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 500, Vector(174, -4473, 224), TEAM_DEFEND)
	MAP:Add("flag", "B", 500, Vector(-1033, -4174, 254), TEAM_DEFEND)

	for i = 1, 16 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(489, -9115 - spawnDistance * i, 93))
	end
	
	for i = 1, 16 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(370, -9132 - spawnDistance * i, 93))
	end

	for i = 1, 16 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(229, -9153 - spawnDistance * i, 93))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-926, -525 + spawnDistance * i, 277))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-776, -478 + spawnDistance * i, 277))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(732, -3099, -434), Vector(-6979, -297, 2737))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-3592, -6966, -797), Vector(2382, -10952, 2144))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "C", 300, Vector(-3670, 1135, 254), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-2735, -2133 - spawnDistance * i, 671))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-4758 + spawnDistance * i, 4545, 337))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(119, 2215, -1026), Vector(-6752, 6898, 2813))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-6862, -160, -529), Vector(4813, -7374, 2671))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "D", 500, Vector(-1713, 4992, 280), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-2580, -1849 + spawnDistance * i, 788))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-4728 + spawnDistance * i, 6656, 222))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-5405, 7350, -277), Vector(-3057, 5125, 1492))
	MAP:Add("restrict", TEAM_DEFEND, Vector(191, 3428, -989), Vector(-6952, -2729, 3265))
end)

MAP:Add("playablezone", {min = Vector(-6526, 7425, -62), max = Vector(3010, -12517, 1600)})

MAP:Add("endview", {startPos = Vector(-2406.884766, 5969.133301, 358.875305), endPos = Vector(-2406.884766, 2969.133301, 358.875305), angle = Angle(0.0, 90.0, 0.000000)})

MAP:Add("maxplayers", 28)