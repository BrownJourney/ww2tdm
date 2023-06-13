MAP("ww2_adenau", "capture_arcade", "", FACTION_USA, FACTION_GERMANYWEST)

MAP:Add("view", Vector(385, 1008, 460), Angle(29.864031, -129.820557, 0.000000))

MAP:Add("spawnang", TEAM_AXIS, Angle(0, 0, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, -90, 0))

MAP:Add("flag", "A", 200, Vector(1576, -879, 70))
MAP:Add("flag", "B", 500, Vector(44, 656, 143))
MAP:Add("flag", "C", 250, Vector(-2154, 2662, 91))

local spawnDistance = 50

for i = 1, 16 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(2925, 3564 - spawnDistance * i, 128))
end

for i = 1, 12 do
	MAP:Add("spawn", TEAM_ALLIES, Vector(2672, 3597 - spawnDistance * i, 154))
end

for i = 1, 7 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-3216 + spawnDistance * i, -708, 70))
end

for i = 1, 7 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-3216 + spawnDistance * i, -640, 70))
end

for i = 1, 7 do
	MAP:Add("spawn", TEAM_AXIS, Vector(-3216 + spawnDistance * i, -438, 70))
end

MAP:Add("restrict", TEAM_AXIS, Vector(1658, 1716, -831), Vector(3631, 3802, 1345))
MAP:Add("restrict", TEAM_ALLIES, Vector(-3835, -1150, -664), Vector(-1719, 1439, 786))

MAP:Add("endview", {startPos = Vector(3228, 1371, 182), endPos = Vector(1300, 1371, 182), angle = Angle(0, 0, 0)})
MAP:Add("maxplayers", 30)