MAP("ww2_lapluie_wf", "war", "", FACTION_USA, FACTION_GERMANYWEST)

MAP:Add("view", Vector(-1148, -96, 7022), Angle(76.460091, 21.675360, 0.000000))

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 90, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 0, 0))

MAP:Add("flag", "A", 1200, Vector(-518, 2562, 0), {
	Vector(-895, 2980, 22),
	Vector(-899, 3078, 22),
	Vector(-701, 2277, 33),
	Vector(-210, 2694, 43),
	Vector(-208, 3283, 34),
	Vector(-1007, 2146, 25)
})
MAP:Add("flag", "B", 1000, Vector(1541, 1035, 192), {
	Vector(1441, 759, 201),
	Vector(1611, 755, 220),
	Vector(1613, 942, 218),
	Vector(1442, 1025, 233),
	Vector(1449, 1293, 237),
	Vector(1614, 1285, 233)
})
MAP:Add("flag", "C", 1000, Vector(3433, -1003, 9), {
	Vector(3665, -1012, -28),
	Vector(3529, -838, -32),
	Vector(3329, -927, -31),
	Vector(3327, -1061, -3),
	Vector(3480, -1152, -1),
	Vector(3500, -729, -35)
})

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4028 + spawnDistance * i, 5930, 58))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4021 + spawnDistance * i, 6027, 58))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4010 + spawnDistance * i, 6176, 58))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(3829, -5715 + spawnDistance * i, 53))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(3964, -5717 + spawnDistance * i, 53))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-4406, 8931, -801), Vector(-325, 4166, 1031))
MAP:Add("restrict", TEAM_ALLIES, Vector(6584, -8126, -883), Vector(-1374, -2480, 2249))

-- MAP:Add("entityspawn", "sim_fphys_zis", {
-- 	{Pos = Vector(-11555, 10030, 51), Ang = Angle(0, 0, 0)},
-- 	{Pos = Vector(-11311, 9412, 51), Ang = Angle(0, 0, 0)},
-- 	{Pos = Vector(-11342, 8812, 51), Ang = Angle(0, 0, 0)}
-- }, 180, 2, TEAM_ALLIES)

-- MAP:Add("entityspawn", "sim_fphys_opel", {
-- 	{Pos = Vector(9408, -12664, 76), Ang = Angle(0, -180, 0)},
-- 	{Pos = Vector(9935, -11368, 79), Ang = Angle(0, -180, 0)},
-- 	{Pos = Vector(8991, -8446, 109), Ang = Angle(0, 90, 0)},
-- }, 180, 2, TEAM_AXIS)

-- MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
-- 	{Pos = Vector(7827, -11800, 53), Ang = Angle(0, -180, 0)},
-- }, 600, 1, TEAM_AXIS)

-- MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
-- 	{Pos = Vector(-11375, 10676, 106), Ang = Angle(0, 0, 0)},
-- }, 600, 1, TEAM_ALLIES)

MAP:Add("maxplayers", 32)

MAP:Add("endview", {startPos = Vector(195, 6149, 532), endPos = Vector(195, 4149, 532), angle = Angle(0, 90, 0)})