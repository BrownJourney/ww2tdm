MAP("ww2_krasnyb_bor", "war", "ww2_krasnyb_bor.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(42, -2999, 6343), Angle(63, 89, 0))

MAP:Add("music", "music/maps/krasnyi/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 0, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, -180, 0))

MAP:Add("flag", "A", 1500, Vector(-4104, -3617, 0), {
	Vector(-4960, -3178, 22),
	Vector(-4716, -3172, 22),
	Vector(-4940, -3824, 15),
	Vector(-4925, -4071, 15),
	Vector(-3694, -4064, 0),
	Vector(-3443, -3264, 0),
})
MAP:Add("flag", "B", 520, Vector(29, -2442, 78), {
	Vector(279, -2295, 32),
	Vector(-285, -2208, 32),
	Vector(-347, -2646, 32),
	Vector(-19, -2353, 184),
	Vector(501, -2300, 184),
	Vector(-345, -2599, 184)
})
MAP:Add("flag", "C", 1000, Vector(238, 1669, 16), {
	Vector(-364, 1825, 16),
	Vector(-227, 1832, 16),
	Vector(238, 1862, 16),
	Vector(453, 1842, 16),
	Vector(141, 1062, 16),
	Vector(740, 1613, 208)
})
MAP:Add("flag", "D", 1200, Vector(3524, -3399, 32), {
	Vector(3371, -3648, 32),
	Vector(3350, -3108, 32),
	Vector(3487, -4269, 32),
	Vector(3542, -3796, 32),
	Vector(3803, -3416, 184),
	Vector(3304, -3666, 184)
})

MAP:Add("flag", "E", 1000, Vector(-4282, 1772, 16), {
	Vector(-4422, 1328, 29),
	Vector(-4118, 1325, 31),
	Vector(-4755, 1722, 18),
	Vector(-4545, 2312, 16),
	Vector(-4175, 2324, 25),
	Vector(-3949, 1649, 16)
})

MAP:Add("flag", "F", 1300, Vector(6076, 2279, 51), {
	Vector(6321, 3004, 22),
	Vector(6491, 3011, 22),
	Vector(6204, 1564, 0),
	Vector(5945, 1864, 0),
	Vector(5636, 1798, 0)
})

local spawnDistance = 50

for i = 1, 35 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-9188, 1738 - spawnDistance * i, 741))
end

for i = 1, 35 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-9404, 1752 - spawnDistance * i, 741))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(11530 - spawnDistance * i, 575, -4))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(11530 - spawnDistance * i, 177, -4))
end

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(-9068, 575, 660), Ang = Angle(0, 0, 0)},
}, 180, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(10245, 373, -4), Ang = Angle(0, 180, 0)},
}, 180, 2, TEAM_ALLIES)

MAP:Add("restrict", TEAM_AXIS, Vector(7148, 3738, -248), Vector(14334, -2836, 1095))
MAP:Add("restrict", TEAM_ALLIES, Vector(-9972, 4575, -179), Vector(-6075, -5914, 599))

MAP:Add("endview", {startPos = Vector(95, -557, 571), endPos = Vector(95, 988, 571), angle = Angle(0, -90, 0)})

MAP:Add("minplayers", 28)