att.PrintName = "8x scope"
att.Icon = nil;
att.Description = "Kar98K sights"

att.SortOrder = 2.7
att.Slot = "optic"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/optic/v_kar98k_8x.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/optic/w_kar98k_8x.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(-0.27, 1.406, 1.100),
        Ang = Angle(0, 0, 0),
        Magnification = 2,
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
att.HolosightSize = 10
att.HolosightBone = "scope_origin"
att.HolosightNoHSP = true
att.HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
att.HolosightOffset = Vector(-2.87, 0, 0.4)

att.HolosightMagnification = 2
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 4

att.Mult_SightTime = 1.25