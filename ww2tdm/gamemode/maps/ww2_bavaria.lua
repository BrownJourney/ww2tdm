MAP("ww2_bavaria", "capture", "ww2_bavaria.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(1552.358765, 401.811554, 2729.520752), Angle(19, -150, 0))
MAP:Add("music", "music/maps/bavaria/music_1.ogg")

MAP:Add("flag", "A", 150, Vector(4562, -1605, 1673))
MAP:Add("flag", "B", 800, Vector(-15, -920, -253))
MAP:Add("flag", "C", 700, Vector(-359, -4212, 2001))
MAP:Add("flag", "D", 500, Vector(-3, -907, 1863))
MAP:Add("flag", "E", 600, Vector(391, 2456, 2036))
MAP:Add("flag", "F", 150, Vector(-4510, -208, 1673))

for i = 1, 16 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(5677, 1946 - (50 * i), 1992))
end

for i = 1, 16 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(6392, 1806 - (50 * i), 2038))
end

for i = 1, 10 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6469, -3591 + (50 * i), 2079))
end

for i = 1, 10 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6281, -3629 + (50 * i), 2012))
end

MAP:Add("restrict", TEAM_AXIS, Vector(3277, -789, 683), Vector(7073, 2999, 2912))
MAP:Add("restrict", TEAM_AXIS, Vector(6687, -1631, 951), Vector(4784, -67, 3543))
MAP:Add("restrict", TEAM_ALLIES, Vector(-3306, -1207, 444), Vector(-7328, -4627, 2583))
MAP:Add("restrict", TEAM_ALLIES, Vector(-7317, -1575, 927), Vector(-4921, -293, 2742))

MAP:Add("endview", {startPos = Vector(1300, -913, 1832), endPos = Vector(-1300, -913, 1832), angle = Angle(0, 180, 0)})
MAP:Add("maxplayers", 32)