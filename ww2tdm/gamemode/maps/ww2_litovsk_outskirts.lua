MAP("ww2_litovsk_outskirts", "war", "ww2_litovsk_outskirts.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(-10893, -4927, 21291), Angle(74, 8, 0))
MAP:Add("snow")
MAP:Add("music", "music/maps/litovsk/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 180, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 0, 0))

MAP:Add("flag", "A", 2500, Vector(9372, 9163, -1), {
	Vector(10455, 8937, 9),
	Vector(10470, 9073, 9),
	Vector(9569, 7604, 22),
	Vector(9622, 7606, 129),
	Vector(8195, 10498, 7),
	Vector(8104, 10240, 7)
})
MAP:Add("flag", "B", 2000, Vector(7885, -676, 50), {
	Vector(8888, -1766, 1),
	Vector(8696, -1740, 1),
	Vector(7192, -685, 0),
	Vector(6956, -520, 1),
	Vector(8348, 640, 68),
	Vector(6921, -780, -199)
})
MAP:Add("flag", "C", 1500, Vector(-2630, 2699, 3), {
	Vector(-2877, 3310, 1),
	Vector(-2454, 3286, 15),
	Vector(-2373, 2873, 29),
	Vector(-2847, 2661, 1),
	Vector(-3290, 2831, 1),
	Vector(-3052, 3361, 1)
})
MAP:Add("flag", "D", 600, Vector(-2612, -6890, 17), {
	Vector(-2480, -6707, 17),
	Vector(-2865, -7002, 17),
	Vector(-2481, -7080, 17),
	Vector(-2539, -7053, 185),
	Vector(-2497, -6850, 185),
	Vector(-2748, -6859, 185)
})
MAP:Add("flag", "E", 1000, Vector(-7763, 4410, 1), {
	Vector(-7740, 4385, 20),
	Vector(-7832, 4469, 22),
	Vector(-7892, 4524, 28),
	Vector(-7964, 4591, 36)
})
MAP:Add("flag", "F", 1500, Vector(-9783, -11771, 191), {
	Vector(-10681, -11565, 227),
	Vector(-10673, -11818, 227),
	Vector(-10274, -11813, 227),
	Vector(-9897, -13019, 178),
	Vector(-10039, -12708, 178),
	Vector(-10573, -12774, 178)
})

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-12634, 10821 - spawnDistance * i, 1))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-12488, 10813 - spawnDistance * i, 1))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-12390, 10814 - spawnDistance * i, 1))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_AXIS, Vector(9053, -11756 + spawnDistance * i, 92))
end

for i = 2, 31 do
	MAP:Add("spawn", TEAM_AXIS, Vector(9053 - spawnDistance * i, -11756, 92))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-8655, 6053, -1131), Vector(-14285, 12101, 2218))
MAP:Add("restrict", TEAM_ALLIES, Vector(11742, -14474, -625), Vector(4967, -7276, 1387))

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(-11555, 10030, 51), Ang = Angle(0, 0, 0)},
	{Pos = Vector(-11311, 9412, 51), Ang = Angle(0, 0, 0)},
	{Pos = Vector(-11342, 8812, 51), Ang = Angle(0, 0, 0)}
}, 180, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(9408, -12664, 76), Ang = Angle(0, -180, 0)},
	{Pos = Vector(9935, -11368, 79), Ang = Angle(0, -180, 0)},
	{Pos = Vector(8991, -8446, 109), Ang = Angle(0, 90, 0)},
}, 180, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
	{Pos = Vector(7827, -11800, 53), Ang = Angle(0, -180, 0)},
}, 600, 1, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
	{Pos = Vector(-11375, 10676, 106), Ang = Angle(0, 0, 0)},
}, 600, 1, TEAM_ALLIES)

MAP:Add("tickets", 1000)

MAP:Add("endview", {startPos = Vector(-691, 4004, 328), endPos = Vector(-4074, 4603, 457), angle = Angle(20, -80, 0)})

MAP:Add("minplayers", 30)