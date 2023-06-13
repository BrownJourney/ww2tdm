MAP("ww2_litovsk_outskirts", "capture", "ww2_litovsk_outskirts.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(-1547, -5602, 952), Angle(27, -128, 0))
MAP:Add("snow")
MAP:Add("music", "music/maps/litovsk/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 180, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 0, 0))

MAP:Add("flag", "A", 500, Vector(-3479, -5426, 9))
MAP:Add("flag", "B", 600, Vector(-2612, -6890, 17))
MAP:Add("flag", "C", 800, Vector(-869, -8253, 11))

MAP:Add("playablezone", Vector(-2647, -6900, 18), 5500)

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-6823 + spawnDistance * i, -7035, 117))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-6811 + spawnDistance * i, -7375, 109))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(1878, -6935 - spawnDistance * i, 18))
end

for i = 2, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(1545, -6982 - spawnDistance * i, 49))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-4481, -4837, -1089), Vector(-6799, -9730, 1555))
MAP:Add("restrict", TEAM_ALLIES, Vector(-200, -9085, -278), Vector(3188, -5087, 1624))

MAP:Add("maxplayers", 28)

MAP:Add("endview", {startPos = Vector(-691, 4004, 328), endPos = Vector(-4074, 4603, 457), angle = Angle(20, -80, 0)})