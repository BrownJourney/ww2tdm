-- 	 НАЗВАНИЕ КАРТЫ   id режима  иконка   фракция союзников  фракция оси
MAP("ww2_battle_for_wismars", "ffa", "ww2_battle_for_wismars.jpg", FACTION_USSR, FACTION_GERMANY)

-- вид с экрана дислокации
MAP:Add("view", Vector(-381.742, -1568.912, 650.082), Angle(18.347, 105.096, 0.000))

MAP:Add("music", "music/maps/wismar/music.ogg")

-- спавны
MAP:Add("spawn", -1, Vector(-1876, 3733, -80))
MAP:Add("spawn", -1, Vector(-1452, 4132, 0))
MAP:Add("spawn", -1, Vector(-547, 4123, 128))
MAP:Add("spawn", -1, Vector(267, 4320, 0))
MAP:Add("spawn", -1, Vector(969, 3632, 0))
MAP:Add("spawn", -1, Vector(706, 2555, 131))
MAP:Add("spawn", -1, Vector(-444, 2032, 0))
MAP:Add("spawn", -1, Vector(-1060, 3157, 0))
MAP:Add("spawn", -1, Vector(-2162, 2914, 6))
MAP:Add("spawn", -1, Vector(-1881, 1449, 144))
MAP:Add("spawn", -1, Vector(-1635, 1074, 0))
MAP:Add("spawn", -1, Vector(-2276, 234, 0))
MAP:Add("spawn", -1, Vector(-3030, -227, 0))
MAP:Add("spawn", -1, Vector(-3561, -1389, 0))
MAP:Add("spawn", -1, Vector(-2107, -1970, 0))
MAP:Add("spawn", -1, Vector(-202, -983, -210))
MAP:Add("spawn", -1, Vector(45, -1791, 136))
MAP:Add("spawn", -1, Vector(287, -1052, 0))
MAP:Add("spawn", -1, Vector(-2022, -530, 136))
MAP:Add("spawn", -1, Vector(737, -553, 0))
MAP:Add("spawn", -1, Vector(1571, -245, 0))
MAP:Add("spawn", -1, Vector(803, 4, 0))
MAP:Add("spawn", -1, Vector(621, 1010, 0))

MAP:Add("endview", {startPos = Vector(-803, -1353, 291), endPos = Vector(-803, 840, 291), angle = Angle(20, 90, 0)})
MAP:Add("maxplayers", 14)