att.PrintName = "2x scope"
att.Icon = nil;
att.Description = "Kar98K sights"

att.SortOrder = 2.7
att.Slot = "optic"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/optic/v_kar98k_zf4.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/optic/w_scope_zf4.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 1.18, 1.260),
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
att.HolosightReticle = Material("models/weapons/cultist/optics/kar98k_crosshair")
att.HolosightNoFlare = true
att.HolosightSize = 6
att.HolosightBone = "scope_origin"
att.HolosightNoHSP = true
att.HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
att.HolosightMScale = 0.62
att.HolosightOffset = Vector(-2.3, 0.5, 0.68)

att.HolosightMagnification = 1
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 1.1
att.HolosightMagnificationMax = 2

att.Mult_SightTime = 1.25