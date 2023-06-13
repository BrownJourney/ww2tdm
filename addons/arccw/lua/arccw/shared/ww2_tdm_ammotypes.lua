game._AddAmmoType = game._AddAmmoType or game.AddAmmoType
ArcCW.AmmoData = {}
function game.AddAmmoType(ammoData)
	ArcCW.AmmoData[ammoData.name or "undefined"] = true
	game._AddAmmoType(ammoData)
end

--[[-------------------------------------------------------------------------
GERMAN AMMO
---------------------------------------------------------------------------]]

game.AddAmmoType( {
	name = "ger_battlerifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_mg",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_pistol",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_revolver",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_rifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_semiauto",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_smg",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "ger_sniperrifle",
	dmgtype = DMG_BULLET,
} )

--[[-------------------------------------------------------------------------
SOVIET AMMO
---------------------------------------------------------------------------]]

game.AddAmmoType( {
	name = "rus_battlerifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_mg",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_pistol",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_revolver",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_rifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_semiauto",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "rus_smg",
	dmgtype = DMG_BULLET,
} )

--[[-------------------------------------------------------------------------
USA AMMO
---------------------------------------------------------------------------]]

game.AddAmmoType( {
	name = "usa_battlerifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_mg",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_pistol",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_revolver",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_rifle",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_semiauto",
	dmgtype = DMG_BULLET,
} )
game.AddAmmoType( {
	name = "usa_smg",
	dmgtype = DMG_BULLET,
} )