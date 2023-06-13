MAP("ww2_fallen", "war", "", FACTION_USSR, FACTION_GERMANY)

MAP:Add("view", Vector(-6062, -253, 10884), Angle(66.032700, -1.764371, 0.000000))
MAP:Add("snow")
-- MAP:Add("music", "music/maps/litovsk/music_1.ogg")

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 90, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, -90, 0))

MAP:Add("flag", "A", 1000, Vector(-1182, -7648, 103), {
	Vector(-1299, -7271, 131),
	Vector(-1112, -7310, 141),
	Vector(-1125, -7969, 144),
	Vector(-1275, -7979, 146),
	Vector(-1212, -7645, 130)
})
MAP:Add("flag", "B", 2000, Vector(-2052, -567, 28), {
	Vector(-1365, -448, 34),
	Vector(-1347, -658, 3),
	Vector(-1650, -1114, 37),
	Vector(-1823, -170, 37),
	Vector(-2617, -505, 37),
	Vector(-1747, -90, 37)
})
MAP:Add("flag", "C", 1000, Vector(-2872, 6598, 101), {
	Vector(-2691, 6932, 145),
	Vector(-2966, 6923, 139),
	Vector(-2787, 6252, 140),
	Vector(-2945, 6251, 140),
	Vector(-2849, 6625, 105)
})

local spawnDistance = 50

for i = 1, 50 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(-4067 + spawnDistance * i, 13431, 56))
end

for i = 1, 50 do
	MAP:Add("spawn", TEAM_AXIS, Vector(251 - spawnDistance * i, -14494, 82))
end

MAP:Add("restrict", TEAM_AXIS, Vector(3090, 15533, -1046), Vector(-7224, 9023, 2363))
MAP:Add("restrict", TEAM_ALLIES, Vector(3430, -16190, -2030), Vector(-7417, -11362, 2479))

MAP:Add("restrict", TEAM_AXIS, Vector(3150, -16059, -169), Vector(-7114, 14939, -1367))
MAP:Add("restrict", TEAM_ALLIES, Vector(3150, -16059, -169), Vector(-7114, 14939, -1367))

MAP:Add("entityspawn", "sim_fphys_zis", {
	{Pos = Vector(-2391, 12352, 117), Ang = Angle(0, -90, 0)},
	{Pos = Vector(-1933, 12208, 90), Ang = Angle(0, -180, 0)},
}, 180, 2, TEAM_ALLIES)

MAP:Add("entityspawn", "sim_fphys_opel", {
	{Pos = Vector(-1638, -13097, 124), Ang = Angle(0, 90, 0)},
	{Pos = Vector(-2338, -13188, 110), Ang = Angle(0, 0, 0)},
}, 180, 2, TEAM_AXIS)

MAP:Add("endview", {startPos = Vector(-5344, -3903, 774), endPos = Vector(-5344, -3903, 774), angle = Angle(10.063963, 66.215752, 0.000000)})

MAP:Add("minplayers", 30)