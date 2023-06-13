MAP("ww2_siegfriedline_wf", "tdm", "", FACTION_USA, FACTION_GERMANYWEST)

MAP:Add("view", Vector(-2788, -8623, 583), Angle(15.607079, 26.830280, 0.000000))

local spawnDistance = 50

MAP:Add("area", 1, function(MAP)
	MAP:Add("spawnang", TEAM_AXIS, Angle(0, -180, 0))
	MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 0, 0))


	MAP:Add("flag", "A", 500, Vector(-1657, -8097, 74))

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(-4866 + spawnDistance * i, -8990, 98))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_AXIS, Vector(681 - spawnDistance * i, -8996, 77))
	end

	MAP:Add("playablezone", Vector(-1668, -9006, 47), 4500)
end)

MAP:Add("area", 2, function(MAP)
	MAP:Add("spawnang", TEAM_AXIS, Angle(0, 90, 0))
	MAP:Add("spawnang", TEAM_ALLIES, Angle(0, -90, 0))

	MAP:Add("mandatoryequipment", {"usa_melee_brassknuckes"})
	MAP:Add("flag", "A", 200, Vector(1760, 3081, 101))

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(1342 + spawnDistance * i, 4141, 134))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_AXIS, Vector(990 + spawnDistance * i, 2024, 118))
	end

	MAP:Add("playablezone", Vector(1760, 3081, 101), 1500)
end)

MAP:Add("endview", {startPos = Vector(-1656, -10368, 200), endPos = Vector(-1656, -7000, 200), angle = Angle(33, -90, 0)})

MAP:Add("maxplayers", 20)