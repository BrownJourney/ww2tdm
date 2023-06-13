MAP("ww2_fields", "capture", "ww2_fields.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(8915, 2508, 707), Angle(20.592064, 161.243301, 0.000000))

MAP:Add("music", "music/maps/fields/music_1.ogg")

MAP:Add("flag", "A", 600, Vector(1731, 1859, 71))
MAP:Add("flag", "B", 400, Vector(6292, 1230, -10))
MAP:Add("flag", "C", 600, Vector(8166, 6108, 8))

local spawnDistance = 50

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(11577, 3592 + spawnDistance * i, 43))
end

for i = 1, 14 do
	MAP:Add("spawn", TEAM_AXIS, Vector(11987, 2059 - spawnDistance * i, 61))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-1772, 3857 - spawnDistance * i, -45))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-1751, 796 - spawnDistance * i, -66))
end

MAP:Add("restrict", TEAM_AXIS, Vector(837, 5187, -786), Vector(-2747, -1897, 1126))
MAP:Add("restrict", TEAM_ALLIES, Vector(9503, 131, -1219), Vector(12436, 6506, 1046))

MAP:Add("endview", {startPos = Vector(2098, 1599, 144), endPos = Vector(2098, 2600, 144), angle = Angle(20, -146, 0)})

MAP:Add("maxplayers", 30)