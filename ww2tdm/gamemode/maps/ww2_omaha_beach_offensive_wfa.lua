MAP("ww2_omaha_beach_offensive_wfa", "push_omaha", "", FACTION_USA, FACTION_GERMANYWEST, {TEAM_ALLIES, TEAM_AXIS})

MAP:Add("view", Vector(-1109.293579, 5491.562500, -76.930145), Angle(7.027684, -94.975220, 0.000000))

MAP:Add("spawnang", TEAM_AXIS, Angle(0, -90, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 90, 0))

local spawnDistance = 50

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 600, Vector(-676, -4224, -1589), TEAM_DEFEND)
	MAP:Add("flag", "B", 600, Vector(-3455, -4165, -1554), TEAM_DEFEND)

	local attackSpawns = {
		Vector(-1603, -12738, -1719 + 50),
		Vector(-1555, -12738, -1719 + 50),
		Vector(-1557, -12662, -1718 + 50),
		Vector(-1601, -12662, -1718 + 50),
		Vector(-1599, -12610, -1719 + 50),
		Vector(-1563, -12611, -1719 + 50),
		Vector(-1590, -12200, -1702 + 50),
		Vector(-1550, -12193, -1717 + 50),
		Vector(-1548, -12136, -1712 + 50),
		Vector(-1589, -12131, -1713 + 50),
		Vector(-1585, -12080, -1710 + 50),
		Vector(-1549, -12072, -1713 + 50),
		Vector(-1932, -12751, -1703 + 50),
		Vector(-1972, -12748, -1704 + 50),
		Vector(-1972, -12679, -1700 + 50),
		Vector(-1926, -12670, -1704 + 50),
		Vector(-1969, -12605, -1705 + 50),
		Vector(-1932, -12606, -1699 + 50),
		Vector(-1972, -12208, -1730 + 50),
		Vector(-1931, -12197, -1730 + 50),
		Vector(-1967, -12149, -1728 + 50),
		Vector(-1931, -12129, -1700 + 50),
		Vector(-1978, -12081, -1726 + 50),
		Vector(-1933, -12060, -1725 + 50),
	}
	for k, v in pairs(attackSpawns) do
		MAP:Add("spawn", TEAM_ATTACK, v)
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-1842, -518 - 20 * i, -1746))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(3157, -2389, -2273), Vector(-7922, 2915, 1402))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-7097, -3029, -2693), Vector(4487, -7321, 821))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "C", 500, Vector(-3492, -1978, -1059), TEAM_DEFEND)
	MAP:Add("flag", "D", 500, Vector(-471, -2015, -1059), TEAM_DEFEND)
	MAP:Add("flag", "Q", 500, Vector(-1663, -2034, -1760), TEAM_DEFEND)

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-933 - spawnDistance * i, 686, -1194))
	end

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-3193 + spawnDistance * i, 1115, -1158))
	end

	local attackSpawns = {
		Vector(-4444, -4304, -1618),
		Vector(-4419, -4264, -1598),
		Vector(-3763, -4615, -1660),
		Vector(-3694, -4633, -1625),
		Vector(-2996, -4301, -1609),
		Vector(-2899, -4329, -1618),
		Vector(-2213, -4522, -1617),
		Vector(-2168, -4543, -1615),
		Vector(-1283, -4621, -1683),
		Vector(-1219, -4641, -1675),
		Vector(-285, -4504, -1621),
		Vector(-227, -4545, -1637),
		Vector(373, -4161, -1598),
		Vector(479, -4167, -1597),
	}
	for k, v in pairs(attackSpawns) do
		MAP:Add("spawn", TEAM_ATTACK, v)
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-6735, -1233, -2426), Vector(3895, 4795, 1862))
	MAP:Add("restrict", TEAM_DEFEND, Vector(3306, -2375, -2701), Vector(-7733, -7774, 843))
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "E", 500, Vector(-978, 684, -1139), TEAM_DEFEND)
	MAP:Add("flag", "F", 500, Vector(-3660, 1078, -1125), TEAM_DEFEND)

	for i = 1, 24 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-872 - spawnDistance * i, -2945, -1482))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-860, 7988 - spawnDistance * i, -553))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-603, 7914 - spawnDistance * i, -553))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-7204, 2669, -2146), Vector(3441, 7986, 1239))
	MAP:Add("restrict", TEAM_DEFEND, Vector(3661, -101, 427), Vector(-8077, -5398, -2422))
end)

MAP:Add("stage", 4, function(MAP)
	MAP:Add("flag", "G", 500, Vector(1428, 3874, -320), TEAM_DEFEND)
	MAP:Add("flag", "H", 500, Vector(-4053, 3792, -383), TEAM_DEFEND)

	for i = 1, 6 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-3680 + spawnDistance * i, -2024, -1059))
	end

	for i = 1, 6 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-686 + spawnDistance * i, -2021, -1059))
	end

	for i = 1, 16 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-996, 6183, -632))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-7723, 4877, -1519), Vector(3750, 8678, 1633))
	MAP:Add("restrict", TEAM_DEFEND, Vector(3661, -101, 427), Vector(-8077, -5398, -2422))
end)

MAP:Add("stage", 5, function(MAP)
	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-933 - spawnDistance * i, 686, -1194))
	end

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-3193 + spawnDistance * i, 1115, -1158))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(1136 - spawnDistance * i, 12521, -422))
	end

	MAP:Add("flag", "I", 500, Vector(-4227, 6128, -226), TEAM_DEFEND)
	MAP:Add("flag", "J", 500, Vector(-1445, 6686, -575), TEAM_DEFEND)
	MAP:Add("flag", "K", 500, Vector(1729, 6874, -334), TEAM_DEFEND)

	MAP:Add("restrict", TEAM_ATTACK, Vector(3718, 8372, -1783), Vector(-7016, 15095, 1475))
	MAP:Add("restrict", TEAM_DEFEND, Vector(3872, 4974, 1101), Vector(-8110, -2420, -3168))
end)

MAP:Add("stage", 6, function(MAP)
	MAP:Add("flag", "L", 500, Vector(-4174, 9013, -150), TEAM_DEFEND)
	MAP:Add("flag", "M", 500, Vector(2091, 10023, -337), TEAM_DEFEND)

	for i = 1, 16 do
		MAP:Add("spawn", TEAM_ATTACK, Vector(-1470 - spawnDistance * i, 3276, -914))
	end

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_DEFEND, Vector(-4172 - spawnDistance * i, 12934, -311))
	end

	MAP:Add("restrict", TEAM_ATTACK, Vector(-6857, 14710, -865), Vector(-1492, 10206, 412))
	MAP:Add("restrict", TEAM_DEFEND, Vector(3571, 7359, 1096), Vector(-7927, -657, -3119))
end)

MAP:Add("endview", {startPos = Vector(-1429.651123, 8595.132813, -273.854187), endPos = Vector(-1429.651123, 8595.132813, -273.854187), angle = Angle(39.763710, -9.342529, 0.000000)})

MAP:Add("maxplayers", 32)
MAP:Add("minplayers", 16)