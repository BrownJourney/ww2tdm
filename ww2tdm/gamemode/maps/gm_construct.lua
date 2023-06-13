MAP("gm_construct", "push", "map_icon", FACTION_USSR, FACTION_GERMANY, {TEAM_ALLIES, TEAM_AXIS}, true)

MAP:Add("stage", 1, function(MAP)
	MAP:Add("flag", "A", 400, Vector(-1842, 258, -148), TEAM_DEFEND)
	MAP:Add("flag", "B", 400, Vector(-2973, -1038, 48), TEAM_DEFEND)
	MAP:Add("spawn", TEAM_ATTACK, Vector(520, 893, -150))
	MAP:Add("spawn", TEAM_DEFEND, Vector(-3001, 1243, -71))
	MAP:Add("restrict", TEAM_ATTACK, Vector(-2507, 2060, -515), Vector(-5474, 3417, 592))
	MAP:Add("restrict", TEAM_DEFEND, Vector(-1056, -1014, -389), Vector(847, 2126, 239))
end)

MAP:Add("stage", 2, function(MAP)
	MAP:Add("flag", "C", 400, Vector(-2992, 1829, -116), TEAM_DEFEND)
end)

MAP:Add("stage", 3, function(MAP)
	MAP:Add("flag", "D", 400, Vector(-3848, 3579, -100), TEAM_DEFEND)
end)