MAP("ww2_farm_wf", "tdm", "", FACTION_USA, FACTION_GERMANYWEST)

MAP:Add("view", Vector(-3441, -9111, 672), Angle(19.073877, 12.055494, 0.000000))

local spawnDistance = 50

MAP:Add("area", 1, function(MAP)
	MAP:Add("flag", "A", 400, Vector(-3746, -8815, 101))

	for i = 1, 20 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(-3279 - spawnDistance * i, -7408, -51))
	end
	
	for i = 1, 20 do
		MAP:Add("spawn", TEAM_AXIS, Vector(-3152 - spawnDistance * i, -10185, 134))
	end

	MAP:Add("playablezone", Vector(-4496, -8823, 102), 2000)
end)

MAP:Add("endview", {startPos = Vector(-1260, -9745, 286), endPos = Vector(-1260, -6045, 286), angle = Angle(3.893908, 177.943268, 0.000000)})

MAP:Add("maxplayers", 14)