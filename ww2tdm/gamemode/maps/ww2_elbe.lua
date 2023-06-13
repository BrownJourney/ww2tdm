MAP("ww2_elbe", "war", "", FACTION_USSR, FACTION_GERMANY, nil, true)

MAP:Add("view", Vector(3952, -7368, 2327), Angle(73.047714, 100.482864, 0.000000))

MAP:Add("music", "music/maps/elbe/music_1.ogg")

MAP:Add("flag", "A", 1000, Vector(-7993, -1187, -15882), {
	Vector(-8173, -661, -15744),
	Vector(-7895, -655, -15880),
	Vector(-8308, -1837, -15875),
	Vector(-8187, -1562, -15877),
	Vector(-7730, -1762, -15879),
})
MAP:Add("flag", "B", 1200, Vector(8380, 2722, -15877), {
	Vector(7819, 3652, -15888),
	Vector(7704, 3659, -15888),
	Vector(7480, 2951, -15872),
	Vector(7455, 2696, -15872),
	Vector(7716, 2545, -15903),
	Vector(7848, 1952, -15898),
})
MAP:Add("flag", "C", 1300, Vector(-4447, 9336, -15680), {
	Vector(-4054, 9239, -15680),
	Vector(-4040, 9421, -15680),
	Vector(-3569, 9380, -15680),
	Vector(-3564, 9230, -15680),
	Vector(-5388, 9279, -15712),
	Vector(-5092, 9274, -15712),
})
MAP:Add("flag", "D", 1200, Vector(8382, -10495, -15378), {
	Vector(8025, -10719, -15416),
	Vector(8475, -10865, -15391),
	Vector(8728, -10598, -15407),
	Vector(8503, -10359, -15400),
	Vector(8092, -10231, -15411)
})
MAP:Add("flag", "E", 1000, Vector(-2013, -12830, -15158), {
	Vector(-2319, -12807, -15188),
	Vector(-2269, -13003, -15220),
	Vector(-2632, -12659, -15185),
	Vector(-2376, -12455, -15178),
	Vector(-2218, -12519, -15164),
	Vector(-1737, -12128, -15049)
})
MAP:Add("flag", "F", 600, Vector(13232, -6569, -15212), {
	Vector(12939, -6379, -15217),
	Vector(13342, -6798, -15208),
	Vector(13193, -6994, -15208),
	Vector(13139, -6812, -15072),
	Vector(13206, -6990, -15072)
})
MAP:Add("flag", "G", 1000, Vector(12449, 5575, -15895), {
	Vector(12937, 5329, -15888),
	Vector(12744, 5188, -15888),
	Vector(12748, 4921, -15888),
	Vector(11902, 5847, -15888),
	Vector(12073, 5789, -15752),
	Vector(11873, 6007, -15752)
})
MAP:Add("flag", "H", 1000, Vector(284, -552, -15934), {
	Vector(505, 176, -16103),
	Vector(307, 172, -16094),
	Vector(785, 116, -16089),
})
MAP:Add("flag", "I", 1200, Vector(-6471, 3806, -15933), {
	Vector(-7071, 3933, -15919),
	Vector(-7017, 4046, -15919),
	Vector(-7088, 4066, -15783),
	Vector(-7134, 3847, -15783),
	Vector(-5803, 4156, -15800),
	Vector(-5940, 4197, -15936)
})
MAP:Add("flag", "J", 1000, Vector(-14316, 13677, -15550), {
	Vector(-13949, 13902, -15552),
	Vector(-13767, 13731, -15552),
	Vector(-13940, 14075, -15520),
	Vector(-13675, 14234, -15520),
	Vector(-14144, 14066, -15520),
	Vector(-14621, 14051, -15520),
	Vector(-14405, 14261, -15368)
})

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-16144 + spawnDistance * i, -13773, -15761))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-16140 + spawnDistance * i, -13678, -15761))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-16137 + spawnDistance * i, -13584, -15761))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-16198 + spawnDistance * i, -13036, -15783))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(14538, 16127 - spawnDistance * i, -15623))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(15188, 16097 - spawnDistance * i, -15577))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(16005, 15430 - spawnDistance * i, -15557))
end

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(-15703, -12993, -15795), Ang = Angle(0, 0, 0)},
	{Pos = Vector(-15578, -13633, -15768), Ang = Angle(0, 0, 0)}
}, 60, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(15087, 14886, -15646), Ang = Angle(0, 0, 0)},
	{Pos = Vector(14362, 14186, -15626), Ang = Angle(0, 90, 0)}
}, 60, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
	{Pos = Vector(13764, 14341, -15656), Ang = Angle(0, 180, 0)},
}, 600, 1, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
	{Pos = Vector(-13649, -12255, -15634), Ang = Angle(0, -45, 0)},
}, 600, 1, TEAM_ALLIES)

MAP:Add("restrict", TEAM_AXIS, Vector(-16390, -16257, -19296), Vector(-3171, -9895, -11643))
MAP:Add("restrict", TEAM_ALLIES, Vector(16629, 9184, -17045), Vector(4873, 16768, -8235))

MAP:Add("endview", {startPos = Vector(-4404, 9242, -15117), endPos = Vector(-4404, 9242, -10000), angle = Angle(90, 90, 0)})

MAP:Add("minplayers", 34)