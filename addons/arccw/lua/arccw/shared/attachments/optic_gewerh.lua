att.PrintName = "Sniper scope"
att.Icon = nil;
att.Description = "Gewerh sights"

att.SortOrder = 2.7
att.Slot = "optic_g"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/optic/v_scope_zf4.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/optic/w_scope_zf4.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.47, 1.406, 1.150),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 7,
        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
        IgnoreExtra = true,
        ViewModelFOV = 30
    }
}

att.BoneMerge = true
att.ScopeGlint = true

att.Holosight = true
att.HolosightReticle = Material("models/weapons/cultist/optics/zf4_crosshair")
att.HolosightNoFlare = true
att.HolosightSize = 7
att.HolosightMScale = 0.6
att.HolosightBone = "scope_origin"
att.HolosightNoHSP = true
att.HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
att.HolosightOffset = Vector(0, -0.4, -0.6)

att.HolosightMagnification = 1
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 1.1
att.HolosightMagnificationMax = 4

att.Mult_SightTime = 1.25