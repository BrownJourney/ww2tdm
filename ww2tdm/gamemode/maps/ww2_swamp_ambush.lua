MAP("ww2_swamp_ambush", "war", "ww2_swamp_ambush.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(-9551, 1934, 8598), Angle(59.400188, -38.356365, 0.000000))

MAP:Add("music", "music/maps/swamp/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 180, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 0, 0))

MAP:Add("flag", "A", 1500, Vector(-10809, -7257, -296), {
	Vector(-10405, -7902, -280),
	Vector(-10699, -7926, -280),
	Vector(-11377, -7896, -280),
	Vector(-10653, -6869, -266),
	Vector(-11005, -6825, -266),
	Vector(-11367, -7596, -296)
})
MAP:Add("flag", "B", 1000, Vector(-5521, -11086, -226), {
	Vector(-5051, -10444, -176),
	Vector(-4865, -10467, -176),
	Vector(-5645, -12019, -111),
	Vector(-5480, -11997, -111),
	Vector(-6132, -10655, -296)
})
MAP:Add("flag", "C", 1500, Vector(-819, -9497, -296), {
	Vector(-118, -9373, -292),
	Vector(-343, -9590, -292),
	Vector(-228, -9713, -292),
	Vector(-1351, -9938, -296),
	Vector(-1504, -9717, -296),
	Vector(-1446, -9244, -296)
})
MAP:Add("flag", "D", 1000, Vector(-174, -48, 0), {
	Vector(-131, 90, 0),
	Vector(-19, -30, 0),
	Vector(-71, -260, -6),
	Vector(410, -65, 0),
	Vector(-619, 626, -24),
	Vector(-911, 364, 0)
})
MAP:Add("flag", "E", 1200, Vector(931, 4433, -296), {
	Vector(1029, 5334, -298),
	Vector(859, 5256, -296),
	Vector(1521, 4093, -296),
	Vector(913, 4175, -296),
	Vector(149, 4305, -296)
})
MAP:Add("flag", "F", 1000, Vector(4570, 6838, -314), {
	Vector(4831, 7059, -303),
	Vector(4954, 7039, -301),
	Vector(5103, 7053, -296),
	Vector(4562, 7025, -306),
	Vector(4468, 7044, -306),
	Vector(4321, 7097, -304)
})
MAP:Add("flag", "G", 1000, Vector(10189, 8345, -289), {
	Vector(10290, 9092, -273),
	Vector(10218, 9021, -273),
	Vector(10103, 8884, -291),
	Vector(10214, 7868, -292),
	Vector(10157, 7681, -294),
	Vector(9827, 7579, -292)
})

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(13323 - spawnDistance * i, -239, 40))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(13324 - spawnDistance * i, 436, 91))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(13471 - spawnDistance * i, -779, 15))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-8493 + spawnDistance * i, -160, 35))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-8492 + spawnDistance * i, 124, 35))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-3763, 4854, -1371), Vector(-16448, -6322, 2047))
MAP:Add("restrict", TEAM_ALLIES, Vector(5837, 3943, -1667), Vector(14343, -6850, 2796))

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(-10482, 125, 54), Ang = Angle(0, 0, 0)},
	{Pos = Vector(-10491, -125, 54), Ang = Angle(0, 0, 0)},
}, 180, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(11167, 4, 50), Ang = Angle(0, -180, 0)},
	{Pos = Vector(10533, 4, 49), Ang = Angle(0, -180, 0)},
}, 180, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
	{Pos = Vector(9908, 12, 51), Ang = Angle(0, 180, 0)},
}, 600, 1, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
	{Pos = Vector(-9829, -1, 73), Ang = Angle(0, 0, 0)},
}, 600, 1, TEAM_ALLIES)

MAP:Add("endview", {startPos = Vector(-1112, -15, 1393), endPos = Vector(1751, -15, 1393), angle = Angle(90, 0, 0)})

MAP:Add("minplayers", 30)