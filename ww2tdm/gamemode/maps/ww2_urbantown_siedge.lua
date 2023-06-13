MAP("ww2_urbantown_siedge", "push", "ww2_urbantown_siedge.jpg", FACTION_USSR, FACTION_GERMANY, {TEAM_ALLIES, TEAM_AXIS}, true)

MAP:Add("view", Vector(-890, -8419, 370), Angle(20.196009, -164.501129, 0.000000))

MAP:Add("music", "music/maps/urbantown/music_1.ogg")

-- basespawn'ы используются когда скрипт не может найти обычные спавны.
-- Также в момент их регистрации TEAM_ATTACK и TEAM_DEFEND не объявлены и не могут быть использованы
MAP:Add("basespawn", TEAM_AXIS, Vector(-1297, -6976, -64))
MAP:Add("basespawn", TEAM_ALLIES, Vector(-2004, -10251, -64))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP) -- регистрация стадии матча. Когда атакующие захватывают весь сектор, то игра переходит к следующей стадии.
	MAP:Add("flag", "A", 400, Vector(251, -10263, -57), TEAM_DEFEND)

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-1443 + i * spawnDistance, -12200, 8))
	end
	
	for i = 1, 25 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-1442 + i * spawnDistance, -12120, 8))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1499, -9763 + spawnDistance * i, -73))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1556, -9763 + spawnDistance * i, -73))
	end
	
	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1598, -9763 + spawnDistance * i, -73))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-428, -10587, -394), Vector(-3015, -8215, 1114))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-1372, -10859, -462), Vector(1652, -12678, 987))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "B", 750, Vector(-590, -6557, -64), TEAM_DEFEND)

	for i = 1, 35 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(208 - spawnDistance * i, -10178, -44))
	end

	for i = 1, 25 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1585 + spawnDistance * i, -2646, -64))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(124, -5895, -403), Vector(-1790, -2370, 764))
	MAP:Add("restrict", TEAM_DEFEND, Vector(848, -11159, -363), Vector(-2131, -7886, 719))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "C", 600, Vector(351, 1399, 61), TEAM_DEFEND)

	for i = 1, 30 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-624, -2818 - spawnDistance * i, 27))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(693 + spawnDistance * i, 5148, 192))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(694 + spawnDistance * i, 5205, 192))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(694 + spawnDistance * i, 5255, 192))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(2197, 2513, -397), Vector(-1354, 5730, 2236))
	MAP:Add("restrict", TEAM_DEFEND, Vector(1547, -1764, -878), Vector(-2330, -8000, 992))
end)

MAP:Add("stage", 4, function(MAP)
	MAP:Add("flag", "D", 800, Vector(1084, 5835, 496), TEAM_DEFEND)

	for i = 1, 40 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(667 - spawnDistance * i, 713, 31))
	end

	for i = 1, 5 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(2085 - spawnDistance * i, 8177, 158))
	end

	for i = 1, 5 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(2101 - spawnDistance * i, 8708, 155))
	end

	for i = 1, 5 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(1104 + spawnDistance * i, 8748, 163))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(2300, 9285, -484), Vector(-248, 6433, 1115))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-777, 4639, -663), Vector(2690, -2467, 1290))
end)

MAP:Add("maxplayers", 24)

MAP:Add("endview", {startPos = Vector(1170, 4847, 1099), endPos = Vector(1170, 7200, 1099), angle = Angle(60, -180, 0)})