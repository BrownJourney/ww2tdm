MAP("ww2_stannum_wfa", "war", "", FACTION_USA, FACTION_GERMANYWEST)

MAP:Add("view", Vector(48, 1430, 11782), Angle(89.000000, -179.860336, 0.000000))

MAP:Add("spawnang", TEAM_AXIS, Angle(0, -180, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 90, 0))

MAP:Add("flag", "A", 700, Vector(73, -659, 24), {
	Vector(-9, -462, 24),
	Vector(328, -433, 24),
	Vector(6, -682, 24),
	Vector(-202, -726, 24),
	Vector(87, -707, 160),
	Vector(12, -442, 160)
})
MAP:Add("flag", "B", 1600, Vector(-5315, -729, 0), {
	Vector(-4780, -821, 132),
	Vector(-4960, -800, 0),
	Vector(-5818, -1360, 24),
	Vector(-6087, -1139, 24),
	Vector(-5642, -70, 42),
	Vector(-5963, 159, 23)
})
MAP:Add("flag", "C", 1400, Vector(-3860, 1971, -32), {
	Vector(-4117, 1950, -31),
	Vector(-3876, 1787, -32),
	Vector(-4256, 1935, -14),
	Vector(-4230, 2159, -9),
	Vector(-3954, 1953, -24),
	Vector(-4094, 1371, -33)
})
MAP:Add("flag", "D", 500, Vector(-4052, 5049, 56), {
	Vector(-3902, 4794, 24),
	Vector(-3908, 5187, 24),
	Vector(-4174, 5148, 24),
	Vector(-3953, 5194, 160),
	Vector(-4140, 5129, 160),
	Vector(-3968, 4846, 160)
})
MAP:Add("flag", "E", 1000, Vector(879, 4875, 1), {
	Vector(1057, 4854, 0),
	Vector(965, 4736, -2),
	Vector(874, 4572, -5),
	Vector(991, 4495, -5),
	Vector(1176, 4394, 0),
	Vector(1246, 4579, 0)
})

local spawnDistance = 50

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(1761, -8681 + spawnDistance * i, 60))
end

for i = 1, 30 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(1888, -8685 + spawnDistance * i, 60))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(7443 - spawnDistance * i, 6400, 26))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(7443 - spawnDistance * i, 6400, 26))
end

MAP:Add("restrict", TEAM_AXIS, Vector(4626, -8089, -883), Vector(-7161, -3015, 1915))
MAP:Add("restrict", TEAM_ALLIES, Vector(7720, 2486, -918), Vector(1698, 8429, 1642))

MAP:Add("restrict", TEAM_AXIS, Vector(-6861, -9355, -1689), Vector(8141, 7492, -161))
MAP:Add("restrict", TEAM_ALLIES, Vector(-6861, -9355, -1689), Vector(8141, 7492, -161))

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

MAP:Add("endview", {startPos = Vector(-871.457458, -2485.728760, -70.253647), endPos = Vector(-871.457458, -2485.728760, 1200.253647), angle = Angle(-38.908054, 85.723885, 0.000000)})

MAP:Add("minplayers", 28)