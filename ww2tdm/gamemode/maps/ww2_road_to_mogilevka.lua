MAP("ww2_road_to_mogilevka", "push", "ww2_road_to_mogilevka.jpg", FACTION_USSR, FACTION_GERMANY, {TEAM_AXIS, TEAM_ALLIES})

MAP:Add("view", Vector(479, 3529, 656), Angle(13.232573, -0.379347, 0.000000))
MAP:Add("snow")
MAP:Add("music", "music/maps/road_to/music_1.ogg")

local function commonRestirct(MAP, min, max)
	MAP:Add("restrict", TEAM_AXIS, min, max)
	MAP:Add("restrict", TEAM_ALLIES, min, max)
end

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 1000, Vector(4624, 7772, 0), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(1457 + 50 * i, 13326, 43))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(1463 + 50 * i, 13064, 43))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(1465 + 50 * i, 12824, 43))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(4360, 1937 + 50 * i, 57))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(4593, 1927 + 50 * i, 57))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(4968, 1962 + 50 * i, 72))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-1070, 6031, -570), Vector(6563, -112, 1819))
	MAP:Add("restrict", TEAM_DEFEND, Vector(6236, 9041, -650), Vector(2000, 13881, 9822))

	commonRestirct(MAP, Vector(-5615, 11204, -220), Vector(8281, -13930, -2266))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "B", 500, Vector(4716, 3926, 1), TEAM_DEFEND)
	MAP:Add("flag", "C", 600, Vector(1959, 1468, 0), TEAM_DEFEND)
	MAP:Add("flag", "D", 600, Vector(3532, 565, 1), TEAM_DEFEND)

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(3698, 9379 - 50 * i, 52))
	end
	
	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(3338, 9383 - 50 * i, 52))
	end

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(2966, 9420 - 50 * i, 65))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(3127, -5245 + 50 * i, 51))
	end
	
	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(3239, -5247 + 50 * i, 51))
	end

	for i = 1, 15 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(3544, -5230 + 50 * i, 57))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-402, -1871, -1365), Vector(8335, -6609, 1675))
	MAP:Add("restrict", TEAM_DEFEND, Vector(6236, 9041, -650), Vector(-2120, 4912, 1423))
	commonRestirct(MAP, Vector(-5615, 11204, -220), Vector(8281, -13930, -2266))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "E", 1000, Vector(4321, -7352, -3), TEAM_DEFEND)

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(2874, -2223 - 50 * i, 106))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(3007, -2219 - 50 * i, 106))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(3990, -11099 + 50 * i, 0))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(5101 - 50 * i, -9946, 4))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(710, -8931, -228), Vector(7887, -11320, 1433))
	MAP:Add("restrict", TEAM_DEFEND, Vector(6236, 9041, -650), Vector(835, -5511, 946))
	commonRestirct(MAP, Vector(-5615, 11204, -220), Vector(8281, -13930, -2266))
end)

MAP:Add("endview", {startPos = Vector(2910, 1067, 138), endPos = Vector(2910, -1067, 138), angle = Angle(0, 90, 0)})

MAP:Add("maxplayers", 24)