MAP("ww2_station_wf", "capture", "ww2_station_wf.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(1772.544800, -4507.424316, 990.824280), Angle(8.149914, 111.449646, 0.000000))

MAP:Add("music", "music/maps/station/music_1.ogg")

MAP:Add("flag", "A", 400, Vector(1436, -1304, 497))
MAP:Add("flag", "B", 400, Vector(362, 1365, 620))
MAP:Add("flag", "C", 400, Vector(77, -3880, 149))
MAP:Add("flag", "D", 400, Vector(-2264, 644, 200))

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4248, -4792 + (spawnDistance * i), 289))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4419, -4660 + (spawnDistance * i), 267))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4521, -4612 + (spawnDistance * i), 288))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(5021, 5998 - (spawnDistance * i), 1039))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(4897, 6106 - (spawnDistance * i), 1025))
end

for i = 1, 10 do
	MAP:Add("spawn", TEAM_AXIS, Vector(4786, 6093 - (spawnDistance * i), 1022))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-3520, -1599, 136), Vector(-5213, -5115, 1239))
MAP:Add("restrict", TEAM_ALLIES, Vector(3718, 3051, 755), Vector(5332, 6572, 2327))

MAP:Add("endview", {startPos = Vector(430, 2218, 490), endPos = Vector(-2085, 2218, 490), angle = Angle(0, -180, 0)})

MAP:Add("maxplayers", 30)