MAP("ww2_sicily_wf", "war", "", FACTION_USA, FACTION_GERMANYWEST, nil, true)

MAP:Add("view", Vector(576.625061, 3175.124023, 21415.908203), Angle(90, -90, 0))

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 180, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 90, 0))

MAP:Add("flag", "A", 800, Vector(-2709, -4927, 16), {
	Vector(-2559, -4779, 16),
	Vector(-2737, -4758, 16),
	Vector(-2880, -5014, 16),
	Vector(-2601, -5139, 16),
	Vector(-2753, -5134, 163),
	Vector(-2469, -5132, 160)
})
MAP:Add("flag", "B", 1000, Vector(3896, -12073, 912), {
	Vector(3812, -11997, 912),
	Vector(4048, -12167, 912),
	Vector(3831, -12190, 912),
	Vector(3975, -12422, 912),
	Vector(3689, -12378, 912),
	Vector(4070, -11690, 976)
})
MAP:Add("flag", "C", 1000, Vector(7445, 4158, -112), {
	Vector(7395, 4084, -112),
	Vector(7508, 4078, -112),
	Vector(7790, 4281, -112),
	Vector(7683, 3663, -112),
	Vector(7785, 4285, 32),
	Vector(7586, 4067, 32)
})
MAP:Add("flag", "D", 1500, Vector(-322, 5762, -18), {
	Vector(-404, 5749, -14),
	Vector(-817, 5726, 0),
	Vector(-899, 5501, 0),
	Vector(329, 6127, -38),
	Vector(-74, 6256, -31),
	Vector(-332, 5412, 6)
})
MAP:Add("flag", "E", 1000, Vector(-5697, 8571, 448), {
	Vector(-5865, 8033, 446),
	Vector(-5863, 8169, 452),
	Vector(-5743, 8179, 458),
	Vector(-5569, 8963, 459),
	Vector(-5545, 9044, 455),
	Vector(-5383, 8950, 455)
})
MAP:Add("flag", "F", 1200, Vector(-5692, 5345, 416), {
	Vector(-5592, 5260, 418),
	Vector(-5782, 5369, 416),
	Vector(-5720, 5177, 440),
	Vector(-5163, 4802, 430),
	Vector(-5372, 6007, 401),
	Vector(-6291, 4855, 410)
})
MAP:Add("flag", "G", 900, Vector(-5843, 266, 571), {
	Vector(-404, 5749, -14),
	Vector(-817, 5726, 0),
	Vector(-899, 5501, 0),
	Vector(329, 6127, -38),
	Vector(-74, 6256, -31),
	Vector(-332, 5412, 6)
})
MAP:Add("flag", "I", 2500, Vector(-10984, -928, 111), {
	Vector(-10720, -1051, 71),
	Vector(-10678, -719, 59),
	Vector(-11090, -572, 39),
	Vector(-11399, -693, 82),
	Vector(-11343, -1079, 51),
	Vector(-11087, -1292, 46)
})

local spawnDistance = 50

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-7494, -13550 + spawnDistance * i, 713))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-7800, -13574 + spawnDistance * i, 713))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_AXIS, Vector(14348 - spawnDistance * i, 11749, 118))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_AXIS, Vector(14342 - spawnDistance * i, 11639, 147))
end

MAP:Add("restrict", TEAM_AXIS, Vector(-3768, -6909, -1289), Vector(-15294, -15279, 3546))
MAP:Add("restrict", TEAM_ALLIES, Vector(15191, 13123, -1077), Vector(6646, 6994, 1113))

MAP:Add("playablezone", {min = Vector(14118, -14022, -1641), max = Vector(-12703, 12055, 1692)})

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

MAP:Add("endview", {startPos = Vector(3239.489502, 2860.246338, -151.789734), endPos = Vector(3239.489502, 1000.246338, -151.789734), angle = Angle(0, -90, 0)})

MAP:Add("minplayers", 30)