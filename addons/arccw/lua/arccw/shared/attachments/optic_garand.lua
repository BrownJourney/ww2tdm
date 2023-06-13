att.PrintName = "4x scope"
att.Icon = nil;
att.Description = "shit"

att.SortOrder = 2.7
att.Slot = "garand_optic"

att.AutoStats = true

att.Model = "models/weapons/cultist/upgrades/a_optic_garand.mdl"
att.WorldModel = "models/weapons/cultist/upgrades/w_scope_garand.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(1.4, 1.65, 1.35),
        Ang = Angle(0, 0, 0),
        Magnification = 1,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 7,
        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
        IgnoreExtra = true,
        ViewModelFOV = 20
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
att.HolosightMScale = 0.85
att.HolosightOffset = Vector(3.2, 1.3, -0.55)

att.HolosightMagnification = 2
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 4

att.Mult_SightTime = 1.25