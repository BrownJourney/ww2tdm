MAP("ww2_stemariedumont", "tdm", "", FACTION_USA, FACTION_GERMANY)

MAP:Add("view", Vector(79, 1930, 780), Angle(3.561773, -40.444099, 0.000000))

MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 180, 0))
MAP:Add("spawnang", TEAM_AXIS, Angle(0, 0, 0))

local spawnDistance = 50

MAP:Add("area", 1, function(MAP)
	MAP:Add("flag", "A", 150, Vector(6149, 11292, 439), TEAM_DEFEND)

	for i = 1, 14 do
		MAP:Add("spawn", TEAM_ALLIES, Vector(6959, 10872 + spawnDistance * i, 524))
	end

	for i = 1, 12 do
		MAP:Add("spawn", TEAM_AXIS, Vector(5347, 10872 + spawnDistance * i, 369))
	end

	timer.Simple(1, function()
		local blockProp = ents.Create("prop_physics")
		blockProp:SetModel("models/props_c17/oildrum001.mdl")
		blockProp:SetPos(Vector(6359, 11500, 669))
		blockProp:SetAngles(Angle(-75, -1, -90))
		blockProp:Spawn()
		blockProp:SetMoveType(MOVETYPE_NONE)
	end)
end)

MAP:Add("playablezone", Vector(6128, 11306, 420), 2000)

MAP:Add("endview", {startPos = Vector(-2099.872314, -8237.967773, 877.165344), endPos = Vector(-2105.687744, -8342.827148, 269.892761), angle = Angle(-40.228207, -90.764046, 0.000000)})

MAP:Add("maxplayers", 8)