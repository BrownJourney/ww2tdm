-- 	 НАЗВАНИЕ КАРТЫ           id режима  иконка   фракция союзников  фракция оси
MAP("ww2_battle_for_wismars", "capture", "ww2_battle_for_wismars.jpg", FACTION_USSR, FACTION_GERMANY)

-- вид с экрана дислокации
MAP:Add("view", Vector(-381.742, -1568.912, 650.082), Angle(18.347, 105.096, 0.000))

MAP:Add("music", "music/maps/wismar/music.ogg")

-- в какую сторону должны смотреть игроки при спавне (не обязательно)
MAP:Add("spawnang", TEAM_AXIS, Angle(0, 0, 0))
MAP:Add("spawnang", TEAM_ALLIES, Angle(0, 180, 0))

-- различные точки захвата
MAP:Add("flag", "A", 400, Vector(-761, 2604, -10))
MAP:Add("flag", "B", 400, Vector(-806.617, -196.375, 32.031))
MAP:Add("flag", "C", 200, Vector(120, 367, 10))
MAP:Add("flag", "D", 400, Vector(-1513.653, -2151.077, 0.031))
MAP:Add("flag", "E", 200, Vector(-1935.482, 951.044, -202.160))
MAP:Add("flag", "F", 200, Vector(350.580, -1419.905, -201.449))

-- спавны
MAP:Add("spawn", TEAM_AXIS, Vector(-3896.173, -1403.433, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3775.840, -1383.738, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3622.868, -1394.031, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3570.358, -1280.497, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3703.087, -1278.491, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3851.027, -1273.673, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3927.705, -1184.173, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3876.332, -1117.020, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3900.659, -992.658, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3855.496, -912.302, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3763.547, -968.581, 0.031))
MAP:Add("spawn", TEAM_AXIS, Vector(-3743.271, -1084.706, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3686.273, -1150.587, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3617.990, -1129.178, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3627.731, -1032.801, -7.968))
MAP:Add("spawn", TEAM_AXIS, Vector(-3658.449, -936.227, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1884.766, 477.344, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1865.285, 598.956, -7.968))
MAP:Add("spawn", TEAM_ALLIES, Vector(1844.719, 705.535, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1819.333, 812.907, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1778.910, 889.047, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1715.507, 1029.806, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1625.887, 1144.293, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1619.802, 1255.452, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1603.884, 1054.133, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1643.836, 871.813, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1671.363, 724.435, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1740.992, 587.938, -7.968))
MAP:Add("spawn", TEAM_ALLIES, Vector(1693.670, 505.514, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1557.914, 699.944, 0.031))
MAP:Add("spawn", TEAM_ALLIES, Vector(1455.251, 866.330, 0.031))

-- запретные зоны для команд
MAP:Add("restrict", TEAM_AXIS, Vector(476, 1724, -90), Vector(2811, -1199, 1303))
MAP:Add("restrict", TEAM_ALLIES, Vector(-2354.375, 590.934, -10.594), Vector(-3954.452, -1410.762, 316.227))
MAP:Add("restrict", TEAM_ALLIES, Vector(-2092, -462, -216), Vector(-2985, -2591, 681))

MAP:Add("endview", {startPos = Vector(-803, -1353, 291), endPos = Vector(-803, 840, 291), angle = Angle(20, 90, 0)})
MAP:Add("maxplayers", 24)