MAP("ww2_basovka_ef", "war", "", FACTION_USSR, FACTION_GERMANY, nil, true)

MAP:Add("view", Vector(412, -248, 14890), Angle(88.047714, -28.482864, 0.000000))

MAP:Add("music", "music/maps/elbe/music_1.ogg")

MAP:Add("flag", "A", 1500, Vector(5713.842773, -7325.878906, 64.031250), {
	Vector( 4808.067383, -7326.463867, 80.031250 ),
	Vector( 4867.819336, -6813.824707, 80.031250 ),
	Vector( 5402.170898, -6810.967285, 80.031250 ),
	Vector( 5404.560059, -7073.698242, 80.031250 ),
	Vector( 5082.330078, -7084.209961, 80.031250 ),
})

MAP:Add("flag", "B", 520, Vector(-1436.825317, -8877.015625, 64.031250), {	
	Vector(-27, -9858, 64),
	Vector(161, -9825, 64),
	Vector(134, -10062, 64),
	Vector(-90, -10060, 64)
})

MAP:Add("flag", "C", 1000, Vector(-7612.801270, -7182.413086, 128.031250), {
	Vector(-7624.243652, -7098.647949, 128.031250),
	Vector(-7709.932129, -6963.177246, 128.031250),
	Vector(-8155.957520, -6641.844238, 128.031250),
	Vector(-7944.986328, -7697.109863, 128.031250),
	Vector(-7594.146484, -7900.875000, 128.031250),
	Vector(-8239.879883, -6958.157227, -63.968750)
})

MAP:Add("flag", "D", 1000, Vector(-7638.437500, -999.103394, 64.019043), {
	Vector(-8937.106445, -984.223511, 64.016869),
	Vector(-8215.259766, -720.260803, 64.031250),
	Vector(-6751.334473, -1073.078613, 64.031250),
	Vector(-6940.832520, -1772.288208, 64.031250),
	Vector(-7293.732910, -1984.934692, 64.031250)
})

MAP:Add("flag", "E", 1500, Vector(393.373474, 2108.545166, 44.769215), {
	Vector(128.033066, 1684.624390, 52.203339),
	Vector(1384.777710, 1240.783936, 53.221436),
	Vector(2025.274658, 2052.232666, 48.398216),
	Vector(-171.959564, 793.077698, 64.031250),
	Vector(-557.927429, 459.225769, 64.031250)
})

MAP:Add("flag", "F", 1300, Vector(7048.773438, 639.962036, 96.031250), {
	Vector(7630.141113, -109.260178, 112.031250),
	Vector(7823.192871, 215.653687, 112.031250),
	Vector(7939.899902, 154.394073, 112.031250),
	Vector(8073.403320, -131.303421, 112.031250),
	Vector(7750.063965, -460.864227, 112.031250)
})

MAP:Add("flag", "G", 1000, Vector(-67.098839, 9865.329102, 96.031250), {
	Vector(-399.250793, 9721.087891, 96.031250),
	Vector(188.138885, 10081.171875, 96.031250),
	Vector(-329.971619, 10302.057617, 96.031250),
	Vector(-520.061584, 10497.926758, 96.031250),
	Vector(-756.091370, 10439.176758, 96.031250)
})


local spawnDistance = 50

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6838 - spawnDistance * i, -13871, 0))
end

for i = 1, 25 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-6838 - spawnDistance * i, -13997, 0))
end

for i = 1, 40 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(10049, 12516 - spawnDistance * i, 71))
end


MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(-5866.718750, -13626.750977, 64.031250), Ang = Angle(0, 60, 0)},
}, 180, 2, TEAM_AXIS)

MAP:Add("entityspawn", "sim_fphys_ww2_sdkfz", {
	{Pos = Vector( -5387.238770, -13684.760742, 64.031250), Ang = Angle(0, 180, 0)},
}, 600, 1, TEAM_AXIS)


MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(9031.562500, 11768.102539, 64.031250), Ang = Angle(0, 180, 0)},
}, 180, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_ww2_m3a1", {
	{Pos = Vector(8906.458984, 11478.164063, 64.031250), Ang = Angle(0, 180, 0)},
}, 600, 1, TEAM_ALLIES)

MAP:Add("restrict", TEAM_AXIS, Vector(10385, 16087, -1553), Vector(6540, 6707, 1150))
MAP:Add("restrict", TEAM_ALLIES, Vector(-10396, -14322, -1153), Vector(-2961, -10735, 1242))

MAP:Add("endview", {startPos = Vector(-4404, 9242, -15117), endPos = Vector(-4404, 9242, -10000), angle = Angle(90, 90, 0)})

MAP:Add("minplayers", 34)