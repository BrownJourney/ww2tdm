MAP("ww2_mudruins", "war", "ww2_mudruins.jpg", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(-2590, 1124, 14696), Angle(78, 11, 0))
MAP:Add("music", "music/maps/litovsk/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 0, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 180, 0))

MAP:Add("flag", "A", 400, Vector(578, 993, 221), {
	Vector(576, 1208, 221),
	Vector(465, 1212, 221),
	Vector(646, 754, 221),
	Vector(567, 750, 221)
})
MAP:Add("flag", "B", 1000, Vector(-432, -10565, 68), {
	Vector(-281, -11085, 80),
	Vector(-669, -10967, 80),
	Vector(-913, -10020, 102),
	Vector(-506, -10078, 86),
	Vector(421, -10749, 88),
	Vector(215, -10882, 87)
})
MAP:Add("flag", "C", 1000, Vector(6634, -9189, 61), {
	Vector(6454, -8969, 58),
	Vector(7165, -8861, 97),
	Vector(6341, -9265, 356),
	Vector(6337, -9136, 362),
	Vector(6247, -9388, 39),
	Vector(6282, -8972, 58)
})
MAP:Add("flag", "D", 1200, Vector(-2671, 8551, 144), {
	Vector(-3420, 8711, 64),
	Vector(-3539, 8299, 61),
	Vector(-3600, 8583, 64),
	Vector(-3017, 9340, 186),
	Vector(-2955, 9463, 213),
	Vector(-2585, 9467, 219)
})
MAP:Add("flag", "E", 1700, Vector(7569, 4358, 60), {
	Vector(6882, 4844, 64),
	Vector(6998, 4823, 63),
	Vector(7054, 4660, 62),
	Vector(8646, 3570, 65),
	Vector(8721, 3576, 64),
	Vector(8640, 4382, 64)
})

MAP:Add("flag", "F", 1000, Vector(-7529, -333, 64), {
	Vector(-7514, -499, 64),
	Vector(-7451, -387, 64),
	Vector(-7714, -164, 64),
	Vector(-7757, -951, 64),
	Vector(-7712, 36, 64)
})

MAP:Add("flag", "G", 1500, Vector(12701, 8253, 64), {
	Vector(12536, 8920, 64),
	Vector(12285, 8909, 64),
	Vector(12455, 7618, 72),
	Vector(12772, 7491, 69),
	Vector(13353, 7831, 71),
	Vector(13434, 8782, 64)
})

local spawnDistance = 50

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6316 + spawnDistance * i, 12209, 376))
end

for i = 1, 20 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6315 + spawnDistance * i, 12292, 376))
end

for i = 1, 50 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(13790, -13609 + spawnDistance * i, 147))
end

MAP:Add("restrict", TEAM_AXIS, Vector(15626, -15716, -831), Vector(10539, -8558, 1548))
MAP:Add("restrict", TEAM_ALLIES, Vector(-8587, 10153, -875), Vector(-2301, 12862, 1590))

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(112262, -13493, 132), Ang = Angle(0, 180, 0)},
	{Pos = Vector(12214, -13130, 132), Ang = Angle(0, 180, 0)}
}, 180, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(-4033, 11582, 218), Ang = Angle(0, -90, 0)},
	{Pos = Vector(-3862, 11670, 267), Ang = Angle(0, -90, 0)},
}, 160, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
	{Pos = Vector(-3526, 12248, 377), Ang = Angle(0, 0, 0)},
}, 600, 1, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
	{Pos = Vector(12716, -10656, 123), Ang = Angle(0, 180, 0)},
}, 600, 1, TEAM_ALLIES)

MAP:Add("endview", {startPos = Vector(-2347, -4545, 17), endPos = Vector(-5154, -7664, 374), angle = Angle(-1.816525, -133.170654, 0.000000)})

MAP:Add("playablezone", {min = Vector(-12548, -14281, -767), max = Vector(14047, 14202, 2124)})

MAP:Add("minplayers", 30)