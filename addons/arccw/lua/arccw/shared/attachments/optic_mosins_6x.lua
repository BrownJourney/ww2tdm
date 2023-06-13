att.PrintName = "6x scope"
att.Icon = nil;
att.Description = "Mosin Sights"

att.SortOrder = 2.7
att.Slot = "optic_mosins"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/optic/v_mosin_x6.mdl"
att.HideWorldModel = true

att.AdditionalSights = {
    {
        Pos = Vector(0, 0, -0.85),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 7,
        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
	    IgnoreExtra = true
    }
}

att.ScopeGlint = true

att.Holosight = true
att.HolosightReticle = Material("models/weapons/cultist/optics/mosin_crosshair")
att.HolosightNoFlare = true
att.HolosightSize = 8
att.HolosightBone = "scope_origin"
att.HolosightPiece = "models/weapons/cultist/upgrades/optic/v_mosin_x6_lens.mdl"
att.HolosightNoHSP = true
att.HolosightOffset = Vector(0, 0, 0)
att.HSPBonemerge = true

att.HolosightMagnification = 2
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 3

att.Mult_SightTime = 1.25