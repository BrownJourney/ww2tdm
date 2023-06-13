MAP("ww2_bavaria", "tdm", "ww2_bavaria.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(1552.358765, 401.811554, 2729.520752), Angle(19, -150, 0))
MAP:Add("music", "music/maps/bavaria/music_1.ogg")

local spawnDistance = 50
MAP:Add("area", 1, function(MAP)

	-- различные точки захвата
	MAP:Add("flag", "A", 400, Vector(-9, -910, 1869))

	-- спавны
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(122, -3790 - spawnDistance * i, 2038))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(-125, -3773 - spawnDistance * i, 2038))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_AXIS, Vector(-85, 1956 + spawnDistance * i, 2030))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_AXIS, Vector(73, 1950 + spawnDistance * i, 2030))
	end

end)
MAP:Add("endview", {startPos = Vector(1300, -913, 1832), endPos = Vector(-1300, -913, 1832), angle = Angle(0, 180, 0)})
MAP:Add("maxplayers", 28)