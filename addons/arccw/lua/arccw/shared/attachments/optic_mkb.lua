att.PrintName = "3x scope"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "mkb_optic"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/optic/v_scope_fg42.mdl"
att.HideWorldModel = true

att.AdditionalSights = {
    {
        Pos = Vector(2.625, 4, -2.5),
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
att.HolosightReticle = Material("models/weapons/cultist/optics/fg42_crosshair")
att.HolosightNoFlare = true
att.HolosightSize = 10
att.HolosightBone = "scope_origin"
att.HolosightNoHSP = true
att.HolosightPiece = "models/weapons/arccw/atts/hamr_hsp.mdl"
att.HolosightMScale = 0.8
att.HSPBonemerge = true
att.HolosightOffset = Vector(0.4, 0, 0.95)

att.HolosightMagnification = 2
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 3

att.Mult_SightTime = 1.25