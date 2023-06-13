-- --------------------------
-- M1 GARAND
-- --------------------------


sound.Add({ 
 name = "Weapon_Garand.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/garand/garand_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/garand/garand_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0, 
 sound = "weapons/cultist/garand/garand_fp.wav", 
 })



-- M1 GARAND HANDLING

sound.Add({ 
 name = "Weapon_Garand.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.MagFetch",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/garand/handling/garand_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Magout",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/garand/handling/garand_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/garand/handling/garand_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.MagHit",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/garand/handling/garand_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.Ping",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/garand/handling/garand_ping_01.wav",
"weapons/cultist/garand/handling/garand_ping_02.wav",
"weapons/cultist/garand/handling/garand_ping_03.wav",
"weapons/cultist/garand/handling/garand_ping_04.wav",
"weapons/cultist/garand/handling/garand_ping_05.wav"} 
 })

sound.Add({ 
 name = "Weapon_Garand.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav",
"weapons/cultist/universal/weapon_melee_02.wav",
"weapons/cultist/universal/weapon_melee_03.wav",
"weapons/cultist/universal/weapon_melee_04.wav",
"weapons/cultist/universal/weapon_melee_05.wav",
"weapons/cultist/universal/weapon_melee_06.wav"}
 })

-- --------------------------
-- GARAND RIFLE GRENADE
-- --------------------------

sound.Add({ 
 name = "Weapon_GarandGL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/garand/garand_gl_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_GarandGL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_GarandGL.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/garand/garand_gl_fp.wav", 
 })

-- RIFLE GRENADE HANDLING

sound.Add({ 
 name = "Weapon_Garand.GLLoad1",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/garand/handling/garand_gl_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.GLLoad2",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/garand/handling/garand_gl_load2.wav", 
 })


sound.Add({ 
 name = "Weapon_Garand.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/garand/handling/garand_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_Garand.GlRemove",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/garand/handling/garand_gl_remove.wav", 
 })
 

-- --------------------------
-- KAR 98
-- --------------------------


sound.Add({ 
 name = "Weapon_kar98.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/kar98/kar98_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/kar98/kar98_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/kar98/kar98_fp.wav", 
 })



-- KAR98 HANDLING

sound.Add({ 
 name = "Weapon_kar98.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/kar98/handling/Kar98_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.MagIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/Kar98_MagIn.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.RoundsIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/Kar98_RoundsIn.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.ClipRemove",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/Kar98_ClipRemove.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/kar98/handling/kar98_bulletin_1.wav", 
 "weapons/cultist/kar98/handling/kar98_bulletin_2.wav", 
 "weapons/cultist/kar98/handling/kar98_bulletin_3.wav", 
 "weapons/cultist/kar98/handling/kar98_bulletin_4.wav"} 
 })

sound.Add({ 
 name = "Weapon_kar98.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav",
"weapons/cultist/universal/weapon_melee_02.wav",
"weapons/cultist/universal/weapon_melee_03.wav",
"weapons/cultist/universal/weapon_melee_04.wav",
"weapons/cultist/universal/weapon_melee_05.wav",
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_kar98.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.BoltforwardStripperClip",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/kar98/handling/kar98_boltforward_stripperclip.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.StripperClipEject",
 channel = CHAN_STATIC,
 volumel = 0.2,
sound = "weapons/cultist/kar98/handling/Kar98_stripperclip_eject.wav", 
 })

-- --------------------------
-- KAR98 RIFLE GRENADE
-- --------------------------

sound.Add({ 
 name = "Weapon_kar98GL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/kar98/kar98_gl_tp.wav", 
 })
 

sound.Add({ 
 name = "Weapon_kar98GL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98GL.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/kar98/kar98_gl_fp.wav", 
 })

-- RIFLE GRENADE HANDLING

sound.Add({ 
 name = "Weapon_kar98.GLLoad1", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/kar98/handling/kar98_gl_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.GLLoad2", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/kar98/handling/kar98_gl_load2.wav", 
 })


sound.Add({ 
 name = "Weapon_kar98.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/kar98/handling/kar98_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98.GlRemove",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/kar98/handling/kar98_gl_remove.wav", 
 })

-- --------------------------
-- WALTHER PPK
-- --------------------------


sound.Add({ 
 name = "Weapon_Ppk.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/ppk/ppk_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ppk/ppk_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/ppk/ppk_fp.wav", 
 })



-- WALTHER PPK HANDLING

sound.Add({ 
 name = "Weapon_Ppk.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/Ppk/handling/ppk_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/Ppk/handling/ppk_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_Ppk.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Ppk/handling/ppk_empty.wav", 
 })

-- --------------------------
-- WALTHER P38
-- --------------------------


sound.Add({ 
 name = "Weapon_P38.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/p38/p38_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/p38/p38_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/p38/p38_fp.wav", 
 })



-- WALTHER P38 HANDLING

sound.Add({ 
 name = "Weapon_P38.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/p38/handling/p38_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/p38/handling/p38_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_P38.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/p38/handling/p38_empty.wav", 
 })

-- --------------------------
-- P08 LUGER
-- --------------------------


sound.Add({ 
 name = "Weapon_P08.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/P08/P08_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/P08/P08_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/P08/P08_fp.wav", 
 })



-- P08 LUGER HANDLING

sound.Add({ 
 name = "Weapon_P08.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/P08/handling/p08_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/P08/handling/p08_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_P08.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/P08/handling/p08_empty.wav", 
 })

-- --------------------------
-- M1911
-- --------------------------


sound.Add({ 
 name = "Weapon_M1911.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m1911/m1911_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1911/m1911_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1911/m1911_FP.wav", 
 })

-- M1911 HANDLING

sound.Add({ 
 name = "Weapon_M1911.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m1911/handling/m1911_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m1911/handling/m1911_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M1911.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1911/handling/m1911_empty.wav", 
 })

-- --------------------------
-- BAR
-- --------------------------


sound.Add({ 
 name = "Weapon_Bar.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/BAR/BAR_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/BAR/BAR_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/BAR/BAR_fp.wav", 
 })



-- BAR HANDLING

sound.Add({ 
 name = "Weapon_Bar.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/BAR/handling/BAR_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Magin",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/BAR/handling/BAR_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.MagHit",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/BAR/handling/BAR_mag_hit.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Magout",
 channel = CHAN_STATIC,
 volume = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/BAR/handling/BAR_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/BAR/handling/BAR_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/BAR/handling/BAR_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_fireselect_1.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.EndDeployedReload",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/BAR/handling/BAR_EndDeployedReload.wav", 
 })

sound.Add({ 
 name = "Weapon_Bar.Deploy",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BAR/handling/BAR_DeployGroundHit.wav", 
 })


-- --------------------------
-- STG44
-- --------------------------

sound.Add({ 
 name = "Weapon_Stg44.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/stg44/stg44_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/stg44/stg44_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/stg44/stg44_fp.wav", 
 })


-- STG44 HANDLING

sound.Add({ 
 name = "Weapon_Stg44.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/Stg44/handling/Stg44_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/Stg44/handling/Stg44_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg44.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Stg44/handling/Stg44_fireselect_1.wav", 
 })

-- --------------------------
-- MG42
-- --------------------------


sound.Add({ 
 name = "Weapon_MG42.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/MG42/MG42_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/MG42/MG42_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/MG42/MG42_fp.wav", 
 })



-- MG42 HANDLING

sound.Add({ 
 name = "Weapon_MG42.Foley",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/MG42/handling/MG42_foley_01.wav", 
"weapons/cultist/MG42/handling/MG42_foley_02.wav", 
"weapons/cultist/MG42/handling/MG42_foley_03.wav", 
"weapons/cultist/MG42/handling/MG42_foley_04.wav"} 
})

sound.Add({ 
 name = "Weapon_MG42.LidOpen",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_LidOpen.wav", 
 })

sound.Add({ 
 name = "Weapon_Mg42.LinkRattle",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_LinkRattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Mg42.BeltJingle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_BeltJingle.wav", 
 })

sound.Add({ 
 name = "Weapon_Mg42.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_BeltAlign.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.LidClose",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/MG42/handling/MG42_LidClose.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/MG42/handling/MG42_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG42/handling/MG42_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/MG42/handling/MG42_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/MG42/handling/MG42_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/MG42/handling/MG42_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_MG42.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/MG42/handling/MG42_DeployGroundHit.wav", 
 })

-- --------------------------
-- MG34
-- --------------------------


sound.Add({ 
 name = "Weapon_MG34.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/MG34/MG34_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/MG34/MG34_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/MG34/MG34_fp.wav", 
 })



-- MG34 HANDLING

sound.Add({ 
 name = "Weapon_MG34.CoverOpen",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG34/handling/mg34_CoverOpen.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.CoverClose",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG34/handling/mg34_CoverClose.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG34/handling/mg34_mag_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.BipodDeploy",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/MG34/handling/mg34_BipodDeploy.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.BipodRetract",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/MG34/handling/mg34_BipodRetract.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/MG34/handling/mg34_DeployGroundHit.wav", 
 })


sound.Add({ 
 name = "Weapon_MG34.Magin",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG34/handling/mg34_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.MagHit",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/MG34/handling/mg34_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/MG34/handling/mg34_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/MG34/handling/mg34_BeltAlign.wav", 
 })


sound.Add({ 
 name = "Weapon_MG34.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/MG34/handling/mg34_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/MG34/handling/mg34_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/MG34/handling/mg34_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/MG34/handling/mg34_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/MG34/handling/mg34_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/MG34/handling/mg34_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_MG34.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/MG34/handling/mg34_fireselect.wav", 
 })

-- --------------------------
-- M1919
-- --------------------------


sound.Add({ 
 name = "Weapon_M1919.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1919/m1919_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1919/m1919_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1919/m1919_fp.wav", 
 })



-- M1919 HANDLING

sound.Add({ 
 name = "Weapon_M1919.Foley",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/M1919/handling/M1919_foley_01.wav", 
"weapons/cultist/M1919/handling/M1919_foley_02.wav", 
"weapons/cultist/M1919/handling/M1919_foley_03.wav", 
"weapons/cultist/M1919/handling/M1919_foley_04.wav"} 
})

sound.Add({ 
 name = "Weapon_M1919.LidOpen",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_LidOpen.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.LinkRattle",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_LinkRattle.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.BeltJingle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_BeltJingle.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_BeltAlign.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.LidClose",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/M1919/handling/M1919_LidClose.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/M1919/handling/M1919_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/M1919/handling/M1919_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_M1919.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_DeployGroundHit.wav", 
 })

-- --------------------------
-- G43
-- --------------------------


sound.Add({ 
 name = "Weapon_G43.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/G43/G43_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/G43/G43_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/G43/G43_fp.wav", 
 })


-- G43 HANDLING

sound.Add({ 
 name = "Weapon_G43.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/G43/handling/G43_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/G43/handling/G43_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/G43/handling/G43_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_g43.MagFetch",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/g43/handling/g43_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/G43/handling/G43_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/G43/handling/G43_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_G43.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/G43/handling/G43_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_g43.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g43/handling/g43_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_g43.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"}
 })


-- --------------------------
-- SPRINGFIELD
-- --------------------------


sound.Add({ 
 name = "Weapon_Springfield.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/springfield/springfield_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/springfield/springfield_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/springfield/springfield_fp.wav", 
 })


-- SPRINGFIELD HANDLING

sound.Add({ 
 name = "Weapon_Springfield.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/springfield/handling/Springfield_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/springfield/handling/Springfield_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/springfield_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/springfield_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/springfield_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/springfield_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/springfield_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/springfield/handling/springfield_bulletin_1.wav", 
 "weapons/cultist/springfield/handling/springfield_bulletin_2.wav", 
 "weapons/cultist/springfield/handling/springfield_bulletin_3.wav", 
 "weapons/cultist/springfield/handling/springfield_bulletin_4.wav"} 
 })

sound.Add({ 
 name = "Weapon_Springfield.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

--SPRINGFIELD STRIPPER CLIP

sound.Add({ 
 name = "Weapon_Springfield.MagIn",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/springfield/handling/springfield_MagIn.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.RoundsIn",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/springfield/handling/springfield_RoundsIn.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.BoltforwardStripperClip",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/springfield/handling/Springfield_boltforward_stripperclip.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.StripperClipEject",
 channel = CHAN_STATIC,
 volumel = 0.2,
sound = "weapons/cultist/springfield/handling/Springfield_stripperclip_eject.wav", 
 })

-- --------------------------
-- SPRINGFIELD RIFLE GRENADE
-- --------------------------

sound.Add({ 
 name = "Weapon_SpringfieldGL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/springfield/springfield_gl_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_SpringfieldGL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_SpringfieldGL.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/springfield/springfield_gl_fp.wav", 
 })

-- RIFLE GRENADE HANDLING

sound.Add({ 
 name = "Weapon_Springfield.GLLoad1", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/springfield/handling/springfield_gl_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.GLLoad2", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/springfield/handling/springfield_gl_load2.wav", 
 })


sound.Add({ 
 name = "Weapon_Springfield.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/springfield/handling/springfield_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_Springfield.GlRemove",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/springfield/handling/springfield_gl_remove.wav", 
 })

-- --------------------------
-- STEN
-- --------------------------


sound.Add({ 
 name = "Weapon_Sten.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Sten/Sten_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Sten/Sten_dist.wav", 
 }) 

sound.Add({ 
 name = "Weapon_Sten.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/Sten/Sten_fp.wav", 
 })

-- STEN SUPPRESSED

sound.Add({ 
 name = "Weapon_Sten.SingleSilenced",
 channel = CHAN_STATIC,
 volume = 1, 
sound = "weapons/cultist/Sten/Sten_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/Sten/Sten_suppressed_fp.wav", 
 })

-- STEN HANDLING

sound.Add({ 
 name = "Weapon_Sten.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Magout",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/Sten/handling/Sten_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_fireselect.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.StockOpen_01",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_stockopen_01.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.StockOpen_02",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sten/handling/Sten_stockopen_02.wav", 
 })

sound.Add({ 
 name = "Weapon_Sten.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

-- --------------------------
-- M1 CARBINE
-- --------------------------


sound.Add({ 
 name = "Weapon_m1carbine.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1carbine/m1carbine_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1carbine/m1carbine_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1carbine/m1carbine_fp.wav", 
 })



-- M1 CARBINE HANDLING

sound.Add({ 
 name = "Weapon_m1carbine.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1carbine.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine/handling/m1carbine_empty.wav", 
 })

--MELEE

sound.Add({ 
 name = "Weapon_m1carbine.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

-- --------------------------
-- MP40
-- --------------------------


sound.Add({ 
 name = "Weapon_mp40.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mp40/mp40_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mp40/mp40_dist.wav", 
 }) 

sound.Add({ 
 name = "Weapon_mp40.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/mp40/mp40_fp.wav", 
 })

-- MP40 HANDLING

sound.Add({ 
 name = "Weapon_mp40.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_mp40.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp40/handling/mp40_fireselect.wav", 
 })

-- --------------------------
-- M1928A1
-- --------------------------

sound.Add({ 
 name = "Weapon_m1928a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m1928a1/m1928a1_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1928a1/m1928a1_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1928a1/m1928a1_fp.wav", 
 })


-- M1928A1 HANDLING

sound.Add({ 
 name = "Weapon_m1928a1.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_fireselect_1.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.Magtap",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_magtap.wav", 
 })


--DRUM MAG

sound.Add({ 
 name = "Weapon_m1928a1.DrumMagout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_drum_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.DrumMagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_drum_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.DrumMagFetch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_drum_mag_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.DrumMagIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_drum_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1928a1.DrumMagHit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1928a1/handling/m1928a1_drum_maghit.wav", 
 })


-- --------------------------
-- M1912 Shotgun
-- --------------------------


sound.Add({ 
 name = "Weapon_M1912.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1912/m1912_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_M1912.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1912/m1912_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M1912.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1912/m1912_FP.wav", 
 })


-- M1912 HANDLING

sound.Add({ 
 name = "Weapon_M1912.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1912/handling/m1912_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M1912.BoltBack",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/m1912/handling/m1912_pumpback.wav", 
 })

sound.Add({ 
 name = "Weapon_M1912.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/m1912/handling/m1912_pumpforward.wav", 
 })

sound.Add({ 
 name = "Weapon_M1912.ShellInsert",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m1912/handling/m1912_shell_insert_1.wav", 
 "weapons/cultist/m1912/handling/m1912_shell_insert_2.wav", 
 "weapons/cultist/m1912/handling/m1912_shell_insert_3.wav"} 
 })

sound.Add({ 
 name = "Weapon_M1912.ShellInsertSingle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m1912/handling/m1912_single_shell_insert_1.wav", 
 "weapons/cultist/m1912/handling/m1912_single_shell_insert_2.wav", 
 "weapons/cultist/m1912/handling/m1912_single_shell_insert_3.wav"} 
 })


-- --------------------------
-- PANZERFAUST LAUNCHER
-- --------------------------

sound.Add({ 
 name = "Weapon_Panzerfaust.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/Panzerfaust/Panzerfaust_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Panzerfaust.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Panzerfaust/Panzerfaust_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Panzerfaust.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/Panzerfaust/Panzerfaust_fp.wav", 
 })

--PANZERFAUST HANDLING

sound.Add({ 
 name = "Weapon_Panzerfaust.Pin",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Panzerfaust/handling/Panzerfaust_pinout.wav", 
 })

sound.Add({ 
 name = "Weapon_Panzerfaust.Sight",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Panzerfaust/handling/Panzerfaust_sightup.wav", 
 })

sound.Add({ 
 name = "Weapon_Panzerfaust.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Panzerfaust/handling/Panzerfaust_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_Panzerfaust.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_launcher_empty.wav", 
 })


-- PANZERFAUST SPECIAL

sound.Add({ 
 name = "Weapon_Panzerfaust.Loop",
 channel = CHAN_ITEM,
 volume = 1,
 sound = "weapons/cultist/Panzerfaust/panzerfaust_rocket_loop.wav", 
 })

-- PANZERFAUST DETONATE

sound.Add({ 
 name = "Weapon_Panzerfaust.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Panzerfaust/Panzerfaust_detonate_01.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_02.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Panzerfaust.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_dist_01.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_dist_02.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Panzerfaust.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_03.wav"} 
 })
 
-- PANZERFAUST DETONATE WATER


sound.Add({ 
 name = "Weapon_Panzerfaust.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Panzerfaust/water/Panzerfaust_water_detonate_01.wav", 
"weapons/cultist/cultist/Panzerfaust/water/Panzerfaust_water_detonate_02.wav", 
"weapons/cultist/cultist/Panzerfaust/water/Panzerfaust_water_detonate_03.wav"} 
 })



sound.Add({ 
 name = "Weapon_Panzerfaust.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Panzerfaust/water/Panzerfaust_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/Panzerfaust/water/Panzerfaust_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/Panzerfaust/water/Panzerfaust_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Panzerfaust.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Panzerfaust/Panzerfaust_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- BAZOOKA LAUNCHER
-- --------------------------

sound.Add({ 
 name = "Weapon_Bazooka.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/Bazooka/Bazooka_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Bazooka/Bazooka_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/Bazooka/Bazooka_fp.wav", 
 })


-- BAZOOKA HANDLING


sound.Add({ 
 name = "Weapon_bazooka.Rattle",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Bazooka/handling/bazooka_endgrab.wav", 
 })

sound.Add({ 
 name = "Weapon_bazooka.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Bazooka/handling/Bazooka_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_bazooka.ReShoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Bazooka/handling/bazooka_reshoulder.wav", 
 })


sound.Add({ 
 name = "Weapon_Bazooka.Fetch",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Bazooka/handling/Bazooka_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.Load1",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Bazooka/handling/Bazooka_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.Load2",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Bazooka/handling/Bazooka_load2.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.Wire",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Bazooka/handling/bazooka_wire.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.EndGrab",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Bazooka/handling/Bazooka_endgrab.wav", 
 })

sound.Add({ 
 name = "Weapon_Bazooka.Empty",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/universal/uni_launcher_empty.wav", 
 })

-- BAZOOKA SPECIAL

sound.Add({ 
 name = "Weapon_Bazooka.Loop",
 channel = CHAN_ITEM,
 volume = 1,
 sound = "weapons/cultist/Bazooka/bazooka_rocket_loop.wav", 
 })

-- BAZOOKA DETONATE

sound.Add({ 
 name = "Weapon_Bazooka.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Bazooka/Bazooka_detonate_01.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_02.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Bazooka.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Bazooka/Bazooka_detonate_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_dist_02.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Bazooka.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Bazooka/Bazooka_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_far_dist_03.wav"} 
 })

-- BAZOOKA DETONATE WATER


sound.Add({ 
 name = "Weapon_Bazooka.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Bazooka/water/Bazooka_water_detonate_01.wav", 
"weapons/cultist/cultist/Bazooka/water/Bazooka_water_detonate_02.wav", 
"weapons/cultist/cultist/Bazooka/water/Bazooka_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Bazooka.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Bazooka/water/Bazooka_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/water/Bazooka_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/Bazooka/water/Bazooka_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_Bazooka.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Bazooka/Bazooka_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Bazooka/Bazooka_detonate_far_dist_03.wav"} 
 })
 
-- BAZOOKA WHITE PHOSPHORUS

sound.Add({ 
 name = "Weapon_Bazooka.WPExplode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Bazooka/wp/bazooka_detonate_wp_01.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_02.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Bazooka.WPExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Bazooka/wp/bazooka_detonate_wp_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_dist_02.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_Bazooka.WPExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Bazooka/wp/bazooka_detonate_wp_far_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_far_dist_01.wav", 
"weapons/cultist/cultist/Bazooka/wp/bazooka_detonate_wp_far_dist_01.wav"} 
 })
 

-- --------------------------
-- MK2 Frag Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_mk2.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/mk2/mk2_detonate_01.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_02.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_mk2.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/mk2/mk2_detonate_dist_01.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_dist_02.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_mk2.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_mk2.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/mk2/handling/mk2_pullpin.wav" 
 })

sound.Add({ 
 name = "Weapon_mk2.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/mk2/handling/mk2_throw.wav", 
 })

-- MK2 HANDLING

sound.Add({ 
 name = "Weapon_mk2.PinPull",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/mk2/handling/mk2_pinpull.wav", 
 })

sound.Add({ 
 name = "Weapon_mk2.SpoonEject",
 channel = CHAN_STATIC,
 volumel = 0.5,
sound = "weapons/cultist/mk2/handling/mk2_spooneject.wav", 
 })

sound.Add({ 
 name = "Weapon_mk2.LeftArmMovement",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/mk2/handling/mk2_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_mk2.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/mk2/handling/mk2_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_mk2.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/mk2/handling/mk2_throw_01.wav", 
 })



sound.Add({ 
 name = "Weapon_mk2.Roll",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/roll.wav", 
 })

sound.Add({ 
 name = "Weapon_mk2.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/mk2/mk2_bounce_01.wav", 
"weapons/cultist/mk2/mk2_bounce_02.wav", 
"weapons/cultist/mk2/mk2_bounce_03.wav", 
"weapons/cultist/mk2/mk2_bounce_04.wav"} 
 })

-- MK2 EXPLODE WATER

sound.Add({ 
 name = "Weapon_mk2.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/mk2/water/mk2_water_detonate_01.wav", 
"weapons/cultist/cultist/mk2/water/mk2_water_detonate_02.wav", 
"weapons/cultist/cultist/mk2/water/mk2_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_mk2.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/mk2/water/mk2_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/mk2/water/mk2_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/mk2/water/mk2_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_mk2.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/mk2/mk2_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- Stielhandgranate Frag Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_stielhandgranate.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/stielhandgranate/stielhandgranate_detonate_01.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_02.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_stielhandgranate.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_dist_01.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_dist_02.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_stielhandgranate.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_stielhandgranate.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_pullpin.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_throw.wav", 
 })

-- STIELHANDGRANATE HANDLING

sound.Add({ 
 name = "Weapon_stielhandgranate.PinPull",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_pinpull.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.SpoonEject",
 channel = CHAN_STATIC,
 volumel = 0.5,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_spooneject.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.LeftArmMovement",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_throw_01.wav", 
 })

sound.Add({ 
 name = "Weapon_Stielhandgranate.CapOff",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_capoff.wav", 
 })


sound.Add({ 
 name = "Weapon_Stielhandgranate.RopePull",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/stielhandgranate/handling/stielhandgranate_ropepull.wav", 
 })




sound.Add({ 
 name = "Weapon_stielhandgranate.Roll",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/roll.wav", 
 })

sound.Add({ 
 name = "Weapon_stielhandgranate.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/stielhandgranate/stielhandgranate_bounce_01.wav", 
"weapons/cultist/stielhandgranate/stielhandgranate_bounce_02.wav", 
"weapons/cultist/stielhandgranate/stielhandgranate_bounce_03.wav", 
"weapons/cultist/stielhandgranate/stielhandgranate_bounce_04.wav"} 
 })

-- STIELHANDGRANATE EXPLODE WATER

sound.Add({ 
 name = "Weapon_stielhandgranate.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/stielhandgranate/water/stielhandgranate_water_detonate_01.wav", 
"weapons/cultist/cultist/stielhandgranate/water/stielhandgranate_water_detonate_02.wav", 
"weapons/cultist/cultist/stielhandgranate/water/stielhandgranate_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_stielhandgranate.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/stielhandgranate/water/stielhandgranate_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/stielhandgranate/water/stielhandgranate_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/stielhandgranate/water/stielhandgranate_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_stielhandgranate.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/stielhandgranate/stielhandgranate_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- SMOKE GRENADE
-- --------------------------

sound.Add({ 
 name = "SmokeGrenade.Detonate",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/SmokeGrenade/smokegrenade_detonate.wav", 
 })

sound.Add({ 
 name = "SmokeGrenade.Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/SmokeGrenade/smokegrenade_burn_loop.wav", 
 })

sound.Add({ 
 name = "SmokeGrenade.LoopEnd",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/SmokeGrenade/smokegrenade_burn_loop_end.wav", 
 })

sound.Add({ 
 name = "SmokeGrenade.Burn",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/smokegrenade/smokeburn.wav", 
 })

sound.Add({ 
 name = "SmokeGrenade.BurnDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/smokegrenade/smokeburn_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_pullpin.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_throw.wav", 
 })

-- SMOKEGRENADE HANDLING

sound.Add({ 
 name = "Weapon_smokegrenade.PinPull",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_pinpull.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.SpoonEject",
 channel = CHAN_STATIC,
 volumel = 0.5,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_spooneject.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.LeftArmMovement",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_smokegrenade.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/smokegrenade/handling/smokegrenade_throw_01.wav", 
 })

sound.Add({ 
 name = "Weapon_Smoke.Roll",
 channel = CHAN_ITEM,
 volumel = 1.0, 
 sound = "weapons/cultist/smokegrenade/roll.wav", 
 })

sound.Add({ 
 name = "Weapon_SmokeGrenade.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/SmokeGrenade/smokegrenade_bounce_01.wav", 
 "weapons/cultist/SmokeGrenade/smokegrenade_bounce_02.wav", 
 "weapons/cultist/SmokeGrenade/smokegrenade_bounce_03.wav"} 
 })


-- --------------------------
-- ENTRENCHING TOOL
-- --------------------------


sound.Add({ 
 name = "Weapon_enttool.Hit",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/EntrenchingTool/ent_tool_melee_01.wav", 
 "weapons/cultist/EntrenchingTool/ent_tool_melee_02.wav", 
 "weapons/cultist/EntrenchingTool/ent_tool_melee_03.wav", 
 "weapons/cultist/EntrenchingTool/ent_tool_melee_04.wav", 
 "weapons/cultist/EntrenchingTool/ent_tool_melee_05.wav", 
sound = "weapons/cultist/EntrenchingTool/ent_tool_melee_06.wav"} 
 })

-- --------------------------
-- BAYONET
-- --------------------------

sound.Add({ 
 name = "Weapon_Bayonet.HitWorld",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = {"weapons/cultist/Bayonet/bayonet_hitworld_01.wav", 
"weapons/cultist/Bayonet/bayonet_hitworld_02.wav", 
"weapons/cultist/Bayonet/bayonet_hitworld_03.wav", 
"weapons/cultist/Bayonet/bayonet_hitworld_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_Bayonet.HitFlesh",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/Bayonet/bayonet_hitflesh_01.wav", 
"weapons/cultist/Bayonet/bayonet_hitflesh_02.wav", 
"weapons/cultist/Bayonet/bayonet_hitflesh_03.wav", 
"weapons/cultist/Bayonet/bayonet_hitflesh_04.wav"} 
 })


-- BRITISH THEATER

-- --------------------------
-- WELROD
-- --------------------------

sound.Add({ 
 name = "Weapon_Welrod.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/Welrod/Welrod_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/Welrod/Welrod_fp.wav", 
 })

-- WELROD HANDLING

sound.Add({ 
 name = "Weapon_Welrod.Magin",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/welrod/handling/welrod_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.Magout",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/welrod/handling/welrod_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.TwistOpen",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/welrod/handling/welrod_twist_open.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.TwistClose",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/welrod/handling/welrod_twist_close.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/welrod/handling/welrod_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/welrod/handling/welrod_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Welrod.Empty",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/welrod/handling/welrod_empty.wav", 
 })

-- --------------------------
-- NO76 Incendiary Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_NO76_Incendiary.Burn",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/no76/no76_burn.wav", 
 })

sound.Add({ 
 name = "Weapon_NO76_Incendiary.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/no76/no76_bounce_01.wav", 
 "weapons/cultist/no76/no76_bounce_02.wav", 
 "weapons/cultist/no76/no76_bounce_03.wav"} 
 })

-- --------------------------
-- PIAT LAUNCHER
-- --------------------------

sound.Add({ 
 name = "Weapon_Piat.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/Piat/Piat_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Piat/Piat_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/Piat/Piat_fp.wav", 
 })

-- PIAT HANDLING


sound.Add({ 
 name = "Weapon_Piat.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Piat/handling/Piat_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.Empty",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Piat/handling/Piat_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.Fetch",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/Piat/handling/Piat_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.Load1",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Piat/handling/Piat_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.Load2",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Piat/handling/Piat_load2.wav", 
 })

sound.Add({ 
 name = "Weapon_Piat.EndGrab",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Piat/handling/Piat_endgrab.wav", 
 })

-- Piat DETONATE

sound.Add({ 
 name = "Weapon_Piat.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Piat/Piat_detonate_01.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_02.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Piat.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Piat/Piat_detonate_dist_01.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_dist_02.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Piat.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Piat/Piat_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_far_dist_03.wav"} 
 })

-- Piat DETONATE WATER


sound.Add({ 
 name = "Weapon_Piat.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Piat/water/Piat_water_detonate_01.wav", 
"weapons/cultist/cultist/Piat/water/Piat_water_detonate_02.wav", 
"weapons/cultist/cultist/Piat/water/Piat_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Piat.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Piat/water/Piat_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/Piat/water/Piat_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/Piat/water/Piat_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Piat.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/Piat/Piat_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Piat/Piat_detonate_far_dist_03.wav"} 
 })
-- --------------------------
-- ENFIELD
-- --------------------------


sound.Add({ 
 name = "Weapon_Enfield.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/enfield/enfield_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/enfield/enfield_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/enfield/enfield_fp.wav", 
 })


-- ENFIELD HANDLING

sound.Add({ 
 name = "Weapon_Enfield.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/enfield/handling/enfield_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/enfield/handling/enfield_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/enfield/handling/enfield_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/enfield/handling/enfield_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/enfield/handling/enfield_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/enfield/handling/enfield_bulletin_1.wav", 
 "weapons/cultist/enfield/handling/enfield_bulletin_2.wav", 
 "weapons/cultist/enfield/handling/enfield_bulletin_3.wav", 
 "weapons/cultist/enfield/handling/enfield_bulletin_4.wav"} 
 })

sound.Add({ 
 name = "Weapon_Enfield.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/enfield/handling/enfield_rattle.wav", 
 })

--ENFIELD STRIPPER CLIP

sound.Add({ 
 name = "Weapon_Enfield.MagIn",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/enfield/handling/enfield_MagIn.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.RoundsIn",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/enfield/handling/enfield_RoundsIn.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.ClipRemove",
 channel = CHAN_ITEM,
 volumel = 0.2,
sound = "weapons/cultist/enfield/handling/enfield_clipremove.wav", 
 })

--MELEE

sound.Add({ 
 name = "Weapon_Enfield.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

-- --------------------------
-- ENFIELD RIFLE GRENADE
-- --------------------------

sound.Add({ 
 name = "Weapon_EnfieldGL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/enfield/enfield_gl_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_EnfieldGL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_EnfieldGL.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/enfield/enfield_gl_fp.wav", 
 })

-- RIFLE GRENADE HANDLING

sound.Add({ 
 name = "Weapon_Enfield.GLLoad1", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/enfield/handling/Enfield_gl_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.GLLoad2", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/enfield/handling/Enfield_gl_load2.wav", 
 })


sound.Add({ 
 name = "Weapon_Enfield.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/enfield/handling/Enfield_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_Enfield.GlRemove",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/enfield/handling/Enfield_gl_remove.wav", 
 })


-- --------------------------
-- LIFEBOUY FLAMETHROWER No2
-- --------------------------

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.Start",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo2/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.Looping",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo2/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.End",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo2/flamethrower_end.wav", 
 })

-- LOCAL

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.StartLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo2/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.LoopingLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo2/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.EndLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo2/flamethrower_end.wav", 
 })

--HANDLING

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.Empty",
 channel = CHAN_STATIC,
 volume = 0.7,
sound = "weapons/cultist/FlamethrowerNo2/handling/flamethrower_empty.wav", 
 })


--SPECIAL

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.BackpackDetonate",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/FlamethrowerNo2/handling/flamethrower_backpack_explode.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo2.BackpackLeak",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = { "weapons/cultist/FlamethrowerNo2/handling/flamethrower_tank_leak_01.wav", 
"weapons/cultist/FlamethrowerNo2/handling/flamethrower_tank_leak_02.wav", 
"weapons/cultist/FlamethrowerNo2/handling/flamethrower_tank_leak_03.wav"} 
 })

-- --------------------------
-- GERMAN FLAMETHROWER No41
-- --------------------------

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.Start",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo41/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.Looping",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo41/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.End",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/FlamethrowerNo41/flamethrower_end.wav", 
 })

-- LOCAL

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.StartLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo41/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.LoopingLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo41/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.EndLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/FlamethrowerNo41/flamethrower_end.wav", 
 })


--HANDLING

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.Empty",
 channel = CHAN_STATIC,
 volume = 0.7,
sound = "weapons/cultist/FlamethrowerNo41/handling/flamethrower_empty.wav", 
 })


--SPECIAL

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.BackpackDetonate",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/FlamethrowerNo41/handling/flamethrower_backpack_explode.wav", 
 })

sound.Add({ 
 name = "Weapon_FlamethrowerNo41.BackpackLeak",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = { "weapons/cultist/FlamethrowerNo41/handling/flamethrower_tank_leak_01.wav", 
"weapons/cultist/FlamethrowerNo41/handling/flamethrower_tank_leak_02.wav", 
"weapons/cultist/FlamethrowerNo41/handling/flamethrower_tank_leak_03.wav"} 
 })

-- --------------------------
-- WEBLEY
-- --------------------------

sound.Add({ 
 name = "Weapon_webley.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/webley/webley_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/cultist/webley/webley_dist.wav", 

 })

sound.Add({ 
 name = "Weapon_webley.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/webley/webley_fp.wav", 
 })

-- REVOLVER HANDLING

sound.Add({ 
 name = "Weapon_webley.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/webley/handling/webley_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.OpenChamber",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/webley/handling/webley_open_chamber.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.CloseChamber",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/webley/handling/webley_close_chamber.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.CockHammer",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/webley/handling/webley_cock_hammer.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.CockHammerReady",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/webley/handling/webley_cock_hammer_ready.wav", 
 })

sound.Add({ 
 name = "Weapon_webley.DumpRounds",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = { "weapons/cultist/webley/handling/webley_dump_rounds_01.wav", 
 "weapons/cultist/webley/handling/webley_dump_rounds_02.wav", 
 "weapons/cultist/webley/handling/webley_dump_rounds_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_webley.RoundInsertSingle",
 channel = CHAN_STATIC,
 volumel = 0.1, 
 sound = { "weapons/cultist/webley/handling/webley_round_insert_single_01.wav", 
"weapons/cultist/webley/handling/webley_round_insert_single_02.wav",
"weapons/cultist/webley/handling/webley_round_insert_single_03.wav", 
"weapons/cultist/webley/handling/webley_round_insert_single_04.wav",
"weapons/cultist/webley/handling/webley_round_insert_single_05.wav", 
"weapons/cultist/webley/handling/webley_round_insert_single_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_webley.RoundInsertSpeedLoader",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/webley/handling/webley_speed_loader_insert_01.wav", 
 })


-- --------------------------
-- VICKERS K (GO)
-- --------------------------


sound.Add({ 
 name = "Weapon_VickersGO.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/vickersgo/vickersgo_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/vickersgo/vickersgo_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/vickersgo/vickersgo_fp.wav", 
 })



-- VICKERS HANDLING

sound.Add({ 
 name = "Weapon_VickersGO.Foley",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/M1919/handling/M1919_foley_01.wav", 
"weapons/cultist/M1919/handling/M1919_foley_02.wav", 
"weapons/cultist/M1919/handling/M1919_foley_03.wav", 
"weapons/cultist/M1919/handling/M1919_foley_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_VickersGO.LidOpen",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_LidOpen.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.LinkRattle",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_LinkRattle.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.BeltJingle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_BeltJingle.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_BeltAlign.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.LidClose",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/M1919/handling/M1919_LidClose.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/M1919/handling/M1919_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M1919/handling/M1919_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/M1919/handling/M1919_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_VickersGO.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/M1919/handling/M1919_DeployGroundHit.wav", 
 })


-- --------------------------
-- VICKERS
-- --------------------------


sound.Add({ 
 name = "Weapon_Vickers.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/vickers/vickers_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/vickers/vickers_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/vickers/vickers_fp.wav", 
 })



-- VICKERS HANDLING

sound.Add({ 
 name = "Weapon_Vickers.Foley",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/vickers/handling/M1919_foley_01.wav", 
"weapons/cultist/vickers/handling/M1919_foley_02.wav", 
"weapons/cultist/vickers/handling/M1919_foley_03.wav", 
"weapons/cultist/vickers/handling/M1919_foley_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_Vickers.BeltJingle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/vickers/handling/vickers_beltjingle.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/vickers/handling/vickers_beltalign.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.BeltDrop",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/vickers/handling/vickers_beltdrop.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.BeltPull",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/vickers/handling/vickers_beltpull.wav", 
 })


sound.Add({ 
 name = "Weapon_Vickers.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/vickers/handling/vickers_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/vickers/handling/vickers_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/vickers/handling/vickers_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/vickers/handling/vickers_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/vickers/handling/vickers_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_Vickers.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/vickers/handling/vickers_DeployGroundHit.wav", 
 })



-- --------------------------
-- BREN
-- --------------------------


sound.Add({ 
 name = "Weapon_Bren.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/bren/bren_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/bren/bren_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/bren/bren_fp.wav", 
 })



-- BREN HANDLING

sound.Add({ 
 name = "Weapon_Bren.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Magout",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_magout.wav", 
 })


sound.Add({ 
 name = "Weapon_Bren.Magin",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.MagHit",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_mag_hit.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/Bren/handling/Bren_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/Bren/handling/Bren_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Bren/handling/Bren_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Bren/handling/Bren_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/Bren/handling/Bren_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_Bren.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/Bren/handling/Bren_DeployGroundHit.wav", 
 })

-- --------------------------
-- ITHACA Shotgun
-- --------------------------


sound.Add({ 
 name = "Weapon_Ithaca.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/ithaca/ithaca_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ithaca/ithaca_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/ithaca/ithaca_FP.wav", 
 })


-- ITHACA HANDLING

sound.Add({ 
 name = "Weapon_Ithaca.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/ithaca/handling/ithaca_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ithaca/handling/ithaca_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.BoltBack",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/ithaca/handling/ithaca_pumpback.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/ithaca/handling/ithaca_pumpforward.wav", 
 })

sound.Add({ 
 name = "Weapon_Ithaca.ShellInsert",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/ithaca/handling/ithaca_shell_insert_1.wav", 
 "weapons/cultist/ithaca/handling/ithaca_shell_insert_2.wav", 
 "weapons/cultist/ithaca/handling/ithaca_shell_insert_3.wav"} 
 })

sound.Add({ 
 name = "Weapon_Ithaca.ShellInsertSingle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/ithaca/handling/ithaca_single_shell_insert_1.wav", 
 "weapons/cultist/ithaca/handling/ithaca_single_shell_insert_2.wav", 
 "weapons/cultist/ithaca/handling/ithaca_single_shell_insert_3.wav"} 
 })

sound.Add({ 
 name = "Weapon_Ithaca.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

-- --------------------------
-- Mills Frag Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_Mills.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/MillsBomb/mills_detonate_01.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_02.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Mills.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/MillsBomb/mills_detonate_dist_01.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_dist_02.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Mills.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_03.wav"} 
 })

-- NEW HANDLING

sound.Add({ 
 name = "Weapon_Mills.PinPull",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/MillsBomb/handling/mills_pinpull.wav", 
 })

sound.Add({ 
 name = "Weapon_Mills.SpoonEject",
 channel = CHAN_STATIC,
 volumel = 0.5,
sound = "weapons/cultist/MillsBomb/handling/mills_spooneject.wav", 
 })

sound.Add({ 
 name = "Weapon_Mills.LeftArmMovement",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/MillsBomb/handling/mills_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_Mills.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/MillsBomb/handling/mills_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_Mills.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/MillsBomb/handling/mills_throw_01.wav", 
 })


sound.Add({ 
 name = "Weapon_Mills.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/MillsBomb/mills_bounce_01.wav", 
"weapons/cultist/MillsBomb/mills_bounce_02.wav", 
"weapons/cultist/MillsBomb/mills_bounce_03.wav", 
"weapons/cultist/MillsBomb/mills_bounce_04.wav"} 
 })

-- MILLS BOMB EXPLODE WATER

sound.Add({ 
 name = "Weapon_Mills.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/MillsBomb/water/mills_water_detonate_01.wav", 
"weapons/cultist/cultist/MillsBomb/water/mills_water_detonate_02.wav", 
"weapons/cultist/cultist/MillsBomb/water/mills_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_Mills.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/MillsBomb/water/mills_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/MillsBomb/water/mills_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/MillsBomb/water/mills_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_Mills.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/MillsBomb/mills_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- No69 Frag Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_No69.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/no69/no69_detonate_01.wav", 
"weapons/cultist/cultist/no69/no69_detonate_02.wav", 
"weapons/cultist/cultist/no69/no69_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_No69.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/no69/no69_detonate_dist_01.wav", 
"weapons/cultist/cultist/no69/no69_detonate_dist_02.wav", 
"weapons/cultist/cultist/no69/no69_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_No69.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/no69/no69_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/no69/no69_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/no69/no69_detonate_far_dist_03.wav"} 
 })

-- NEW HANDLING


sound.Add({ 
 name = "Weapon_No69.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/no69/handling/no69_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_No69.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/no69/handling/no69_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_No69.CapOff",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/no69/handling/no69_capoff.wav", 
 })


sound.Add({ 
 name = "Weapon_No69.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/no69/no69_bounce_01.wav", 
"weapons/cultist/no69/no69_bounce_02.wav", 
"weapons/cultist/no69/no69_bounce_03.wav", 
"weapons/cultist/no69/no69_bounce_04.wav"} 
 })

-- No69 EXPLODE WATER

sound.Add({ 
 name = "Weapon_No69.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/no69/water/no69_water_detonate_01.wav", 
"weapons/cultist/cultist/no69/water/no69_water_detonate_02.wav", 
"weapons/cultist/cultist/no69/water/no69_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_No69.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/no69/water/no69_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/no69/water/no69_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/no69/water/no69_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_No69.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/no69/no69_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/no69/no69_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/no69/no69_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- No77 Smoke Grenade (Impact Grenade)
-- --------------------------

sound.Add({ 
 name = "Weapon_No77.SmokeExplode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/No77/no77_detonate_smoke_near_01.wav",
 })


sound.Add({ 
 name = "Weapon_No77.SmokeExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
sound = "weapons/cultist/No77/no77_detonate_smoke_far_01.wav",
 })
-- NEW HANDLING

sound.Add({ 
 name = "Weapon_No77.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/No77/handling/no77_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_No77.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/No77/handling/no77_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_No77.CapOff",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/No77/handling/no77_capoff.wav", 
 })


-- --------------------------
-- RADIO BACKPACK
-- --------------------------

--SPECIAL

sound.Add({ 
 name = "Weapon_Radio.BackpackDetonate",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/radiobackpack/handling/radiobackpack_explode_01.wav", 
"weapons/cultist/cultist/radiobackpack/handling/radiobackpack_explode_02.wav", 
"weapons/cultist/cultist/radiobackpack/handling/radiobackpack_explode_03.wav", 
"weapons/cultist/cultist/radiobackpack/handling/radiobackpack_explode_04.wav"} 
 })

-- --------------------------
-- BAYONET DRAW HOLSTER
-- --------------------------

sound.Add({ 
 name = "Weapon_Bayonet.Draw",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = {"weapons/cultist/universal/bayonet_draw_01.wav", 
"weapons/cultist/universal/bayonet_draw_02.wav", 
"weapons/cultist/universal/bayonet_draw_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_Bayonet.Holster",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/bayonet_holster_01.wav", 
"weapons/cultist/universal/bayonet_holster_02.wav", 
"weapons/cultist/universal/bayonet_holster_03.wav"} 
 })


-- --------------------------
-- LEWIS
-- --------------------------


sound.Add({ 
 name = "Weapon_Lewis.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/lewis/lewis_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/lewis/lewis_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/lewis/lewis_fp.wav", 
 })



-- LEWIS HANDLING

sound.Add({ 
 name = "Weapon_Lewis.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.MagoutFull",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = "weapons/cultist/lewis/handling/lewis_magoutfull.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Magout",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/lewis/handling/lewis_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.MagFiddle",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = "weapons/cultist/lewis/handling/lewis_magfiddle.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Magin",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = "weapons/cultist/lewis/handling/lewis_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.MagHit",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/lewis/handling/lewis_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Rattle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_shoulder_weapon.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.Empty",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/lewis/handling/lewis_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Lewis.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/lewis/handling/lewis_DeployGroundHit.wav", 
 })

-- --------------------------
-- C96 Carbine MAUSER
-- --------------------------


sound.Add({ 
 name = "Weapon_C96.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/c96carbine/c96carbine_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/c96carbine/c96carbine_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/c96carbine/c96carbine_fp.wav", 
 })



-- C96 HANDLING

sound.Add({ 
 name = "Weapon_C96.ROF",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_fireselect.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.MagFiddle",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_magfiddle.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.MagFetch",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.MagIn",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96carbine_empty.wav", 
 })

--C96 PISTOL STRIPPER CLIP

sound.Add({ 
 name = "Weapon_C96.ClipIn", 
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96_strippr_clip_in.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.RoundsIn_01",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96_strippr_clip_rounds_in_01.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.RoundsIn_02",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96_strippr_clip_rounds_in_02.wav", 
 })

sound.Add({ 
 name = "Weapon_C96.ClipRemove",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/c96carbine/handling/c96_strippr_clip_remove.wav", 
 })

-- --------------------------
-- M3 GREASE GUN
-- --------------------------


sound.Add({ 
 name = "Weapon_m3.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m3/m3_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m3/m3_dist.wav", 
 }) 

sound.Add({ 
 name = "Weapon_m3.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/m3/m3_fp.wav", 
 })

-- M3 HANDLING

sound.Add({ 
 name = "Weapon_m3.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m3/handling/m3_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m3/handling/m3_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.15, 
 sound = "weapons/cultist/m3/handling/m3_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m3/handling/m3_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m3/handling/m3_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m3.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/m3/handling/m3_boltback.wav", 
 })

-- --------------------------
-- BRASS KNUCKLES
-- --------------------------

sound.Add({ 
 name = "Weapon_BrassKnuckles.Draw",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = {"weapons/cultist/universal/uni_weapon_lower_01.wav", 
"weapons/cultist/universal/uni_weapon_lower_02.wav", 
"weapons/cultist/universal/uni_weapon_lower_03.wav", 
"weapons/cultist/universal/uni_weapon_lower_04.wav", 
"weapons/cultist/universal/uni_weapon_lower_05.wav", 
"weapons/cultist/universal/uni_weapon_lower_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Holster",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_weapon_lower_01.wav", 
"weapons/cultist/universal/uni_weapon_lower_02.wav", 
"weapons/cultist/universal/uni_weapon_lower_03.wav", 
"weapons/cultist/universal/uni_weapon_lower_04.wav", 
"weapons/cultist/universal/uni_weapon_lower_05.wav", 
"weapons/cultist/universal/uni_weapon_lower_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Ready_01",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/BrassKnuckles/BrassKnuckle_ready_01.wav", 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Ready_02",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/BrassKnuckles/BrassKnuckle_ready_02.wav", 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Knuckle_Slide_On_01",
 channel = CHAN_ITEM,
 volumel = 0.15, 
 sound = "weapons/cultist/BrassKnuckles/BrassKnuckle_knuckle_slideon_01.wav", 
 })


sound.Add({ 
 name = "Weapon_BrassKnuckles.Knuckle_Crack_Ready_01",
 channel = CHAN_ITEM,
 volumel = 0.15, 
 sound = "weapons/cultist/BrassKnuckles/BrassKnuckle_knuckle_ready_01.wav", 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Knuckle_Crack_Ready_02",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/BrassKnuckles/BrassKnuckle_knuckle_ready_02.wav", 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.Melee",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = {"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_01.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_02.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_03.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_04.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_05.wav"} 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.HitWorld",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_hitworld_01.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_hitworld_02.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_hitworld_03.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_hitworld_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_BrassKnuckles.HitFlesh",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_01.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_01A.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_01B.wav",
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_02.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_02A.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_02B.wav",
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_03.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_03A.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_03B.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_04.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_04A.wav", 
"weapons/cultist/BrassKnuckles/BrassKnuckle_melee_flesh_04B.wav"} 
 })


-- --------------------------
-- compositonB EXPLOSIVE
-- --------------------------

sound.Add({ 
 name = "compositonB.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/compositonB/compositonB_detonate_01.wav", 
"weapons/cultist/cultist/compositonB/compositonB_detonate_02.wav", 
"weapons/cultist/cultist/compositonB/compositonB_detonate_03.wav"} 
 })


 
 
sound.Add({ 
 name = "Weapon_compositonB.Prime",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/compositonB/handling/compositonB_prime.wav", 
 })

sound.Add({ 
 name = "Weapon_compositonB.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/compositonB/compositonB_bounce_01.wav", 
 "weapons/cultist/compositonB/compositonB_bounce_02.wav", 
 "weapons/cultist/compositonB/compositonB_bounce_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_compositonB.Throw",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/compositonB/handling/compositonB_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_compositonB.Plant_ArmMovement",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/compositonB/handling/compositonB_plant_armmovement.wav", 
 })

sound.Add({ 
 name = "Weapon_compositonB.Plant_Place",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/compositonB/handling/compositonB_plant_place.wav", 
 })

sound.Add({ 
 name = "Weapon_compositonB.Fuse_Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/compositonB/handling/compositonB_fuse_loop.wav", 
 })

-- --------------------------
-- compositonB EXPLOSIVE WATER
-- --------------------------

sound.Add({ 
 name = "compositonB.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/compositonB/water/compositonB_water_detonate_01.wav", 
"weapons/cultist/cultist/compositonB/water/compositonB_water_detonate_02.wav", 
"weapons/cultist/cultist/compositonB/water/compositonB_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "compositonB.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/compositonB/water/compositonB_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/compositonB/water/compositonB_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/compositonB/water/compositonB_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "compositonB.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/compositonB/compositonB_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/compositonB/compositonB_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/compositonB/compositonB_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- TNT EXPLOSIVE
-- --------------------------

sound.Add({ 
 
 name = "TNT.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/TNT/TNT_detonate_01.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_02.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_03.wav", } 
 })


sound.Add({ 
 
 name = "TNT.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/TNT/TNT_detonate_dist_01.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_dist_02.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 
 name = "TNT.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_TNT.Prime",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/TNT/handling/TNT_prime.wav", 
 })

sound.Add({ 
 name = "Weapon_TNT.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/TNT/TNT_bounce_01.wav", 
 "weapons/cultist/TNT/TNT_bounce_02.wav", 
 "weapons/cultist/TNT/TNT_bounce_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_TNT.Throw",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/TNT/handling/TNT_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_TNT.Plant_ArmMovement",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/TNT/handling/TNT_plant_armmovement.wav", 
 })

sound.Add({ 
 name = "Weapon_TNT.Plant_Place",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/TNT/handling/TNT_plant_place.wav", 
 })

sound.Add({ 
 name = "Weapon_TNT.Fuse_Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/TNT/handling/TNT_fuse_loop.wav", 
 })

-- --------------------------
-- TNT EXPLOSIVE WATER
-- --------------------------

sound.Add({ 
 
 name = "TNT.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/TNT/water/TNT_water_detonate_01.wav", 
"weapons/cultist/cultist/TNT/water/TNT_water_detonate_02.wav", 
"weapons/cultist/cultist/TNT/water/TNT_water_detonate_03.wav"} 
 })


sound.Add({ 
 
 name = "TNT.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/TNT/water/TNT_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/TNT/water/TNT_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/TNT/water/TNT_water_detonate_dist_03.wav"} 
 })


sound.Add({ 
 
 name = "TNT.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/TNT/TNT_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- M1A1 Thompson 
-- --------------------------

sound.Add({ 
 name = "Weapon_m1a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m1a1/m1a1_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1a1/m1a1_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1a1/m1a1_fp.wav", 
 })


-- m1a1 HANDLING

sound.Add({ 
 name = "Weapon_m1a1.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m1a1/handling/m1a1_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_fireselect_1.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.Magtap",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magtap.wav", 
 })


--DRUM MAG

sound.Add({ 
 name = "Weapon_m1a1.DrumMagout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_drum_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.DrumMagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_drum_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.DrumMagFetch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_drum_mag_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.DrumMagIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_drum_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.DrumMagHit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_drum_maghit.wav", 
 })

-- --------------------------
-- BrowningHp
-- --------------------------


sound.Add({ 
 name = "Weapon_BrowningHp.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/BrowningHp/Browning_Hp_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/BrowningHp/Browning_Hp_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/BrowningHp/Browning_Hp_FP.wav", 
 })

-- BrowningHp HANDLING

sound.Add({ 
 name = "Weapon_BrowningHp.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_BrowningHp.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/BrowningHp/handling/Browning_Hp_empty.wav", 
 })

-- --------------------------
-- PANZERSCHRECK LAUNCHER
-- --------------------------

sound.Add({ 
 name = "Weapon_panzerschreck.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/panzerschreck/panzerschreck_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/panzerschreck/panzerschreck_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/panzerschreck/panzerschreck_fp.wav", 
 })


-- panzerschreck HANDLING


sound.Add({ 
 name = "Weapon_panzerschreck.Rattle",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_endgrab.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.ReShoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_reshoulder.wav", 
 })


sound.Add({ 
 name = "Weapon_panzerschreck.Fetch",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.Load1",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.Load2",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_load2.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.Wire",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_wire.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.EndGrab",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/panzerschreck/handling/panzerschreck_endgrab.wav", 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.Empty",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/universal/uni_launcher_empty.wav", 
 })

-- panzerschreck SPECIAL

sound.Add({ 
 name = "Weapon_panzerschreck.Loop",
 channel = CHAN_ITEM,
 volume = 1,
 sound = "weapons/cultist/panzerschreck/panzerschreck_rocket_loop.wav", 
 })

-- panzerschreck DETONATE

sound.Add({ 
 name = "Weapon_panzerschreck.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/panzerschreck/panzerschreck_detonate_01.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_02.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_panzerschreck.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_dist_01.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_dist_02.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_panzerschreck.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_far_dist_03.wav"} 
 })

-- panzerschreck DETONATE WATER


sound.Add({ 
 name = "Weapon_panzerschreck.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/panzerschreck/water/panzerschreck_water_detonate_01.wav", 
"weapons/cultist/cultist/panzerschreck/water/panzerschreck_water_detonate_02.wav", 
"weapons/cultist/cultist/panzerschreck/water/panzerschreck_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_panzerschreck.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/panzerschreck/water/panzerschreck_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/panzerschreck/water/panzerschreck_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/panzerschreck/water/panzerschreck_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_panzerschreck.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/panzerschreck/panzerschreck_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/panzerschreck/panzerschreck_detonate_far_dist_03.wav", } 
 })
 
-- --------------------------
-- M1 CARBINE PARATROOPER
-- --------------------------


sound.Add({ 
 name = "Weapon_m1paratrooper.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1carbine_para/m1carbine_para_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1carbine_para/m1carbine_para_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1carbine_para/m1carbine_para_fp.wav", 
 })



-- M1 CARBINE HANDLING

sound.Add({ 
 name = "Weapon_m1paratrooper.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Stock01",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_stockopen_01.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Stock02",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_stockopen_02.wav", 
 })

sound.Add({ 
 name = "Weapon_m1paratrooper.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1carbine_para/handling/m1carbine_para_rattle.wav", 
 })



-- --------------------------
-- Splintering Stielhandgranate Frag Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_dist_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_dist_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_03.wav"} 
 })
 
-- SPLINTERING STIELHANDGRANATE EXPLODE WATER

sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/water/splinteringstielhandgranate_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_splinteringstielhandgranate.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/Splintering_Stielhandgranate/splinteringstielhandgranate_detonate_far_dist_03.wav"} 
 })


-- REVOLVER HANDLING

sound.Add({ 
 name = "Weapon_M1917.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1917/handling/m1917_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M1917.OpenChamber",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1917/handling/m1917_open_chamber.wav", 
 })

sound.Add({ 
 name = "Weapon_M1917.CloseChamber",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/m1917/handling/m1917_close_chamber.wav", 
 })

sound.Add({ 
 name = "Weapon_M1917.CockHammer",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/m1917/handling/m1917_cock_hammer.wav", 
 })

sound.Add({ 
 name = "Weapon_M1917.CockHammerReady",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/m1917/handling/m1917_cock_hammer_ready.wav", 
 })

sound.Add({ 
 name = "Weapon_M1917.DumpRounds",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = { "weapons/cultist/m1917/handling/m1917_dump_rounds_01.wav", 
 "weapons/cultist/m1917/handling/m1917_dump_rounds_02.wav", 
 "weapons/cultist/m1917/handling/m1917_dump_rounds_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_M1917.RoundInsertSingle",
 channel = CHAN_STATIC,
 volumel = 0.1, 
 sound = { "weapons/cultist/m1917/handling/m1917_round_insert_single_01.wav", 
 "weapons/cultist/m1917/handling/m1917_round_insert_single_02.wav", 
 "weapons/cultist/m1917/handling/m1917_round_insert_single_03.wav", 
 "weapons/cultist/m1917/handling/m1917_round_insert_single_04.wav", 
 "weapons/cultist/m1917/handling/m1917_round_insert_single_05.wav", 
 "weapons/cultist/m1917/handling/m1917_round_insert_single_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_M1917.MoonClip",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = {"weapons/cultist/m1917/handling/m1917_moonclip_insert_01.wav", 
 "weapons/cultist/m1917/handling/m1917_moonclip_insert_02.wav", 
 "weapons/cultist/m1917/handling/m1917_moonclip_insert_03.wav"} 
 })

-- --------------------------
-- MELEE BASH
-- --------------------------

sound.Add({ 
 name = "Weapon_Bash.Melee",
 channel = CHAN_STATIC,
 volumel = 0.15, 
 sound = {"weapons/cultist/MeleeBash/melee_bash_01.wav", 
"weapons/cultist/MeleeBash/melee_bash_02.wav", 
"weapons/cultist/MeleeBash/melee_bash_03.wav", 
"weapons/cultist/MeleeBash/melee_bash_04.wav", 
"weapons/cultist/MeleeBash/melee_bash_05.wav"} 
 })

sound.Add({ 
 name = "Weapon_Bash.HitWorld",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/MeleeBash/melee_bash_hitworld_01.wav", 
"weapons/cultist/MeleeBash/melee_bash_hitworld_02.wav", 
"weapons/cultist/MeleeBash/melee_bash_hitworld_03.wav", 
"weapons/cultist/MeleeBash/melee_bash_hitworld_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_Bash.HitFlesh",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/MeleeBash/melee_bash_hit_flesh_01.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_02.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_03.wav", 
 "weapons/cultist/MeleeBash/melee_bash_hit_flesh_04.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_05.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_06.wav", 
 "weapons/cultist/MeleeBash/melee_bash_hit_flesh_07.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_08.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_09.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_10.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_11.wav", 
"weapons/cultist/MeleeBash/melee_bash_hit_flesh_12.wav"} 
 })

-- --------------------------
-- HATCHET
-- --------------------------

sound.Add({ 
 name = "Weapon_Hatchet.Melee",
 channel = CHAN_STATIC,
 volumel = 0.15, 
 sound = {"weapons/cultist/MeleeBash/hatchet_melee_01.wav", 
"weapons/cultist/MeleeBash/hatchet_melee_02.wav", 
"weapons/cultist/MeleeBash/hatchet_melee_03.wav", 
"weapons/cultist/MeleeBash/hatchet_melee_04.wav", 
"weapons/cultist/MeleeBash/hatchet_melee_05.wav"} 
 })

sound.Add({ 
 name = "Weapon_Hatchet.HitWorld",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/MeleeBash/hatchet_hitworld_01.wav", 
"weapons/cultist/MeleeBash/hatchet_hitworld_02.wav", 
"weapons/cultist/MeleeBash/hatchet_hitworld_03.wav", 
"weapons/cultist/MeleeBash/hatchet_hitworld_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_Hatchet.HitFlesh",
 channel = CHAN_STATIC,
 volumel = 0.25, 
 sound = {"weapons/cultist/MeleeBash/hatchet_hitflesh_01.wav", 
"weapons/cultist/MeleeBash/hatchet_hitflesh_02.wav", 
"weapons/cultist/MeleeBash/hatchet_hitflesh_03.wav", 
 "weapons/cultist/MeleeBash/hatchet_hitflesh_04.wav"} 
 })


-- --------------------------
-- MELEE BASH EINSTOSS
-- --------------------------

sound.Add({ 
 name = "Weapon_Bash.MeleeEintoss",
 channel = CHAN_STATIC,
 volumel = 0.15, 
 sound = {"weapons/cultist/MeleeBash/melee_bash_flamethrower_01.wav", 
"weapons/cultist/MeleeBash/melee_bash_flamethrower_02.wav", 
"weapons/cultist/MeleeBash/melee_bash_flamethrower_03.wav", 
"weapons/cultist/MeleeBash/melee_bash_flamethrower_04.wav", 
"weapons/cultist/MeleeBash/melee_bash_flamethrower_05.wav"} 
 })

-- --------------------------
-- KNIFE ETOOL MELEE
-- --------------------------

sound.Add({ 
 name = "Weapon_KnifeEtool.Melee",
 channel = CHAN_STATIC,
 volumel = 0.1, 
 sound = {"weapons/cultist/MeleeBash/knife_etool_melee_01.wav", 
"weapons/cultist/MeleeBash/knife_etool_melee_01.wav", 
"weapons/cultist/MeleeBash/knife_etool_melee_01.wav", 
"weapons/cultist/MeleeBash/knife_etool_melee_01.wav", 
"weapons/cultist/MeleeBash/knife_etool_melee_01.wav"} 
 })

-- --------------------------
-- EINSTOSSFLAMMENWERFER 
-- --------------------------

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.Start",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.Looping",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.End",
channel = CHAN_STREAM,
 volumel = 1.0, 
sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_end.wav", 
 })

-- LOCAL

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.StartLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_start.wav", 
 })

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.LoopingLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_looping.wav", 
 })

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.EndLocal",
channel = CHAN_STREAM,
 volumel = 1.0, 
 sound = "weapons/cultist/Einstossflammenwerfer/flamethrower_end.wav", 
 })

sound.Add({ 
 name = "Weapon_Einstossflammenwerfer.WorldBurn",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/Einstossflammenwerfer/world_burn_loop_01.wav", 
"weapons/cultist/cultist/Einstossflammenwerfer/world_burn_loop_02.wav", 
"weapons/cultist/cultist/Einstossflammenwerfer/world_burn_loop_03.wav"} 
 })

-- --------------------------
-- FG42
-- --------------------------

sound.Add({ 
 name = "Weapon_Fg42.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/fg42/fg42_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/fg42/fg42_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/fg42/fg42_fp.wav", 
 })


-- FG42 HANDLING

sound.Add({ 
 name = "Weapon_Fg42.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.FetchMag", 
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_mag_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/fg42/handling/fg42_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.MagHit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Fg42.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fg42/handling/fg42_fireselect_1.wav", 
 })


-- --------------------------
-- No77 Incendiary Grenade
-- --------------------------

sound.Add({ 
 name = "Weapon_No77_Incendiary.Burn",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/no77_incendiary/no77_incendiary_burn.ogg", 
 })

sound.Add({ 
 name = "Weapon_No77_Incendiary.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/no77_incendiary/no77_bounce_01.wav", 
 "weapons/cultist/no77_incendiary/no77_bounce_02.wav", 
 "weapons/cultist/no77_incendiary/no77_bounce_03.wav"} 
 })

-- --------------------------
-- UNI A
-- --------------------------

sound.Add({ 
 name = "Uni_A.01",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_A_01.wav", 
 })

sound.Add({ 
 name = "Uni_A.02",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_A_02.wav", 
 })

sound.Add({ 
 name = "Uni_A.03",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_A_03.wav", 
 })

sound.Add({ 
 name = "Uni_A.04",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_A_04.wav", 
 })

sound.Add({ 
 name = "Uni_A.05",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/universal/uni_A_05.wav", 
 })

sound.Add({ 
 name = "Uni_A.06",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = "weapons/cultist/universal/uni_A_06.wav", 
 })

sound.Add({ 
 name = "Universal.NullWav",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

-- --------------------------
-- OWEN
-- --------------------------


sound.Add({ 
 name = "Weapon_Owen.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Owen/Owen_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Owen/Owen_dist.wav", 
 }) 

sound.Add({ 
 name = "Weapon_Owen.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/Owen/Owen_fp.wav", 
 })



-- STEN HANDLING

sound.Add({ 
 name = "Weapon_Owen.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Magout",
 channel = CHAN_STATIC,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/Owen/handling/Owen_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_fireselect.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Owen/handling/Owen_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_Owen.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav", 
"weapons/cultist/universal/weapon_melee_02.wav", 
"weapons/cultist/universal/weapon_melee_03.wav", 
"weapons/cultist/universal/weapon_melee_04.wav", 
"weapons/cultist/universal/weapon_melee_05.wav", 
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

-- --------------------------
-- Deployables
-- --------------------------

sound.Add({ 
 name = "Deployable.CycleInventory",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/Deployable/deployable_cycle_inventory.wav", 
 })


-- --------------------------
-- M16A4
-- --------------------------


sound.Add({ 
 name = "Weapon_M16A4.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m16A4/M16A4_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m16A4/M16A4_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m16A4/M16A4_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m16A4/M16A4_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })



sound.Add({ 
 name = "Weapon_M16A4.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/m16A4/M16A4_suppressed_fp.wav", 
 })

-- M16 HANDLING

sound.Add({ 
 name = "Weapon_M16A4.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.MagHitrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m16A4/handling/M16_maghitrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m16A4/handling/M16_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m16A4/handling/M16_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_hit.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M16A4.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m16A4/handling/M16_fireselect.wav", 
 })


-- --------------------------
-- M1014 Shotgun
-- --------------------------


sound.Add({ 
 name = "Weapon_m1014.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1014/m1014_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m1014.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1014/m1014_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M1014.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1014/M1014_FP.wav", 
 })

-- M1014 HANDLING

sound.Add({ 
 name = "Weapon_M1014.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m1014/handling/m1014_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M1014.BoltBack",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m1014/handling/m1014_pumpback.wav", 
 })

sound.Add({ 
 name = "Weapon_M1014.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m1014/handling/m1014_pumpforward.wav", 
 })

sound.Add({ 
 name = "Weapon_M1014.ShellInsert",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m1014/handling/m1014_shell_insert_1.wav", 
 "weapons/cultist/m1014/handling/m1014_shell_insert_2.wav", 
 "weapons/cultist/m1014/handling/m1014_shell_insert_3.wav"} 
 })


-- --------------------------
-- M590 Shotgun
-- --------------------------


sound.Add({ 
 name = "Weapon_m590.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m590/m590_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m590/m590_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m590/m590_FP.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m590/m590_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/m590/m590_suppressed_fp.wav", 
 })

-- M590 HANDLING

sound.Add({ 
 name = "Weapon_m590.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m590/handling/m590_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.BoltBack",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/m590/handling/m590_pumpback.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/m590/handling/m590_pumpforward.wav", 
 })

sound.Add({ 
 name = "Weapon_m590.ShellInsert",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m590/handling/m590_shell_insert_1.wav", 
 "weapons/cultist/m590/handling/m590_shell_insert_2.wav", 
 "weapons/cultist/m590/handling/m590_shell_insert_3.wav"} 
 })

sound.Add({ 
 name = "Weapon_m590.ShellInsertSingle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m590/handling/m590_single_shell_insert_1.wav", 
 "weapons/cultist/m590/handling/m590_single_shell_insert_2.wav", 
 "weapons/cultist/m590/handling/m590_single_shell_insert_3.wav"} 
 })


-- --------------------------
-- TOZ Shotgun
-- --------------------------


sound.Add({ 
 name = "Weapon_toz.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/toz_shotgun/toz_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_toz.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/toz_shotgun/toz_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_TOZ.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/toz_shotgun/toz_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_toz.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/toz_shotgun/toz_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_toz.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_toz.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/toz_shotgun/toz_suppressed_fp.wav", 
 })

-- TOZ HANDLING

sound.Add({ 
 name = "Weapon_TOZ.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/toz_shotgun/handling/toz_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_TOZ.BoltBack",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/toz_shotgun/handling/toz_pumpback.wav", 
 })

sound.Add({ 
 name = "Weapon_TOZ.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/toz_shotgun/handling/toz_pumpforward.wav", 
 })

sound.Add({ 
 name = "Weapon_TOZ.ShellInsert",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/toz_shotgun/handling/toz_shell_insert_1.wav", 
 "weapons/cultist/toz_shotgun/handling/toz_shell_insert_2.wav", 
 "weapons/cultist/toz_shotgun/handling/toz_shell_insert_3.wav"} 
 })

sound.Add({ 
 name = "Weapon_TOZ.ShellInsertSingle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/toz_shotgun/handling/toz_single_shell_insert_1.wav",
"weapons/cultist/toz_shotgun/handling/toz_single_shell_insert_2.wav",
"weapons/cultist/toz_shotgun/handling/toz_single_shell_insert_3.wav"} 
 })


-- --------------------------
-- M1A1
-- --------------------------


sound.Add({ 
 name = "Weapon_m1a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m1a1/m1a1_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m1a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m1a1/m1a1_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m1a1/m1a1_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_M1a1.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/M1a1/M1a1_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M1a1.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/m1a1/m1a1_suppressed_fp.wav", 
 })

-- M1A1 HANDLING

sound.Add({ 
 name = "Weapon_M1A1.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1a1/handling/m1a1_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/m1a1/handling/m1a1_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M1A1.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m1a1/handling/m1a1_empty.wav", 
 })


-- --------------------------
-- MINI14
-- --------------------------


sound.Add({ 
 name = "Weapon_mini14.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/mini14/mini14_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_mini14.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mini14/mini14_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/mini14/mini14_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_mini14.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/mini14/mini14_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_mini14.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/mini14/mini14_suppressed_fp.wav", 
 })

-- MINI14 HANDLING

sound.Add({ 
 name = "Weapon_Mini14.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/mini14/handling/mini14_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/mini14/handling/mini14_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/mini14/handling/mini14_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/mini14/handling/mini14_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/mini14/handling/mini14_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Mini14.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/mini14/handling/mini14_empty.wav", 
 })

-- --------------------------
-- AKS-74U
-- --------------------------

sound.Add({ 
 name = "Weapon_AKS74U.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/aks74u/AKS_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/aks74u/AKS_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/aks74u/AKS_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/aks74u/AKS_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/aks74u/AKS_suppressed_fp.wav", 
 })

-- AKS HANDLING

sound.Add({ 
 name = "Weapon_AKS74U.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/aks74u/handling/AKS_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/aks74u/handling/AKS_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_AKS74U.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/aks74u/handling/AKS_fireselect_1.wav", 
 })


-- --------------------------
-- AK47
-- --------------------------

sound.Add({ 
 name = "Weapon_AK47.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/ak47/AK47_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ak47/AK47_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/ak47/AK47_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/AK47/AK47_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/ak47/AK47_suppressed_fp.wav", 
 })

-- AK HANDLING

sound.Add({ 
 name = "Weapon_AK47.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ak47/handling/AK47_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ak47/handling/AK47_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_AK47.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak47/handling/AK47_fireselect_1.wav", 
 })

-- --------------------------
-- MP5K
-- --------------------------


sound.Add({ 
 name = "Weapon_mp5k.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mp5k/mp5k_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mp5k/mp5k_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_MP5K.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/mp5k/mp5k_FP.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.SingleSilenced",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mp5k/mp5k_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_MP5K.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/mp5k/mp5k_suppressed_fp.wav", 
 })

-- MP5k HANDLING

sound.Add({ 
 name = "Weapon_mp5k.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp5k/handling/mp5k_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Magin",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/mp5k/handling/mp5k_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Magout",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/mp5k/handling/mp5k_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mp5k/handling/mp5k_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mp5k/handling/mp5k_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mp5k/handling/mp5k_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp5k/handling/mp5k_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_mp5k.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mp5k/handling/mp5k_fireselect.wav", 
 })


-- --------------------------
-- M9
-- --------------------------


sound.Add({ 
 name = "Weapon_M9.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/M9/M9_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/M9/M9_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m9/M9_FP.wav", 
 })


sound.Add({ 
 name = "Weapon_M9.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/M9/M9_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/M9/M9_suppressed_fp.wav", 
 })

-- M9 HANDLING

sound.Add({ 
 name = "Weapon_M9.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m9/handling/M9_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m9/handling/M9_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M9.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m9/handling/M9_empty.wav", 
 })


-- --------------------------
-- Makarov
-- --------------------------


sound.Add({ 
 name = "Weapon_makarov.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/makarov/makarov_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/makarov/makarov_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Makarov.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/makarov/makarov_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/makarov/makarov_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/makarov/makarov_suppressed_fp.wav", 
 })




-- MAKAROV HANDLING

sound.Add({ 
 name = "Weapon_makarov.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/makarov/handling/Makarov_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/makarov/handling/Makarov_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_makarov.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/makarov/handling/Makarov_empty.wav", 
 })

-- --------------------------
-- M45
-- --------------------------


sound.Add({ 
 name = "Weapon_M45.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m45/m45_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m45/m45_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m45/m45_FP.wav", 
 })


sound.Add({ 
 name = "Weapon_M45.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m45/m45_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/m45/m45_suppressed_fp.wav", 
 })

-- M45 HANDLING

sound.Add({ 
 name = "Weapon_M45.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.MagHit",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m45/handling/m45_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/m45/handling/m45_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.safety",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_safety.wav", 
 })

sound.Add({ 
 name = "Weapon_M45.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m45/handling/m45_empty.wav", 
 })



-- --------------------------
-- M40A1
-- --------------------------


sound.Add({ 
 name = "Weapon_m40a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m40a1/m40a1_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m40a1/m40a1_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M40A1.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/m40a1/m40a1_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/m40a1/m40a1_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_m40a1.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M40A1.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/m40a1/m40a1_suppressed_fp.wav", 
 })

-- M40A1 HANDLING

sound.Add({ 
 name = "Weapon_m40a1.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m40a1/handling/m40a1_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m40a1/handling/m40a1_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m40a1/handling/m40a1_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m40a1/handling/m40a1_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m40a1/handling/m40a1_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_m40a1.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/m40a1/handling/m40a1_bulletin_1.wav", 
 "weapons/cultist/m40a1/handling/m40a1_bulletin_2.wav", 
 "weapons/cultist/m40a1/handling/m40a1_bulletin_3.wav", 
 "weapons/cultist/m40a1/handling/m40a1_bulletin_4.wav"} 
 })


 
-- --------------------------
-- RPG7
-- --------------------------

sound.Add({ 
 name = "Weapon_RPG7.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/rpg7/rpg7_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/rpg7/rpg7_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/rpg7/rpg7_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.Hit",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/AT4/AT4RPG_detonate_01.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_02.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_RPG7.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/AT4/AT4RPG_detonate_dist_01.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_dist_02.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_RPG7.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/AT4/AT4RPG_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_RPG7.Loop",
 channel = CHAN_ITEM,
 volume = 1,
 sound = "weapons/cultist/rpg7/rpg_rocket_loop.wav", 
 })

-- RPG HANDLING

sound.Add({ 
 name = "Weapon_RPG7.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.Fetch",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/rpg7/handling/rpg7_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.Load1",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/rpg7/handling/rpg7_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.Load2",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/rpg7/handling/rpg7_load2.wav", 
 })

sound.Add({ 
 name = "Weapon_RPG7.EndGrab",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/rpg7/handling/rpg7_endgrab.wav", 
 })




-- --------------------------
-- M67 Frag Grenade
-- --------------------------

sound.Add({ 
 name = "BaseGrenade.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/m67/m67_detonate_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_03.wav"} 
 })


sound.Add({ 
 name = "BaseGrenade.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/m67_detonate_dist_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_dist_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "BaseGrenade.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/m67_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_M67.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_pullpin.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.DrawBack",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_drawback.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_throw.wav", 
 })

-- NEW HANDLING

sound.Add({ 
 name = "Weapon_M67.PinPull",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_pinpull.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.SpoonEject",
 channel = CHAN_STATIC,
 volumel = 0.5,
sound = "weapons/cultist/m67/handling/m67_spooneject.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.LeftArmMovement",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.ArmDraw",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/m67/handling/m67_armdraw.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.ArmThrow",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/m67/handling/m67_throw_01.wav", 
 })



sound.Add({ 
 name = "Weapon_M67.Roll",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/roll.wav", 
 })

sound.Add({ 
 name = "Weapon_M67.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/m67/m67_bounce_01.wav", 
"weapons/cultist/m67/m67_bounce_02.wav", 
"weapons/cultist/m67/m67_bounce_03.wav",
"weapons/cultist/m67/m67_bounce_04.wav"} 
 })


-- --------------------------
-- M84 Stun Grenade
-- --------------------------

sound.Add({ 
 name = "BaseStunGrenade.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/m84/m84_detonate.wav",
 })


sound.Add({ 
 name = "BaseStunGrenade.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/cultist/m84/m84_detonate_dist.wav",
 })
 


sound.Add({ 
 name = "BaseStunGrenade.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/cultist/m84/m84_detonate_far_dist.wav",
 })

sound.Add({ 
 name = "Weapon_M84.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0, 
 sound = "weapons/cultist/m67/handling/m67_pullpin.wav", 
 })

sound.Add({ 
 name = "Weapon_M84.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/m84/m84_bounce_01.wav", 
"weapons/cultist/m84/m84_bounce_02.wav", 
"weapons/cultist/m84/m84_bounce_03.wav"} 
 })


-- --------------------------
-- M18 Smoke Grenade
-- --------------------------

sound.Add({ 
 name = "M18.Detonate",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/m18/m18_detonate.wav", 
 })

sound.Add({ 
 name = "M18.Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/m18/m18_burn_loop.wav", 
 })

sound.Add({ 
 name = "M18.LoopEnd",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/m18/m18_burn_loop_end.wav", 
 })

sound.Add({ 
 name = "BaseSmokeEffect.Sound",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/m18/smokeburn.wav",
 })

sound.Add({ 
 name = "BaseSmokeEffect.SoundDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/m18/smokeburn_dist.wav",
 })

sound.Add({ 
 name = "Weapon_Smoke.Burn",
 channel = CHAN_ITEM,
 volumel = 1.0, 
 sound = "weapons/cultist/m18/smokeburn.wav", 
 })

sound.Add({ 
 name = "Weapon_Smoke.Pin",
 channel = CHAN_ITEM,
 volumel = 1.0, 
 sound = "weapons/cultist/m67/handling/m67_pullpin.wav", 
 })

sound.Add({ 
 name = "Weapon_Smoke.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/m67/handling/m67_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_Smoke.Roll",
 channel = CHAN_ITEM,
 volumel = 1.0, 
 sound = "weapons/cultist/m67/roll.wav", 
 })

sound.Add({ 
 name = "Weapon_M18.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/m18/m18_bounce_01.wav", 
 "weapons/cultist/m18/m18_bounce_02.wav", 
 "weapons/cultist/m18/m18_bounce_03.wav"} 
 })


-- --------------------------
-- AN-M14 Incendiary Grenade
-- --------------------------

sound.Add({ 
 name = "ANM14Incendiary.Burn",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/anm14/AN_M14_burn.wav", 
 })


sound.Add({ 
 name = "ANM14Incendiary.Detonate",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/anm14/AN_M14_detonate.wav", 
 })

sound.Add({ 
 name = "ANM14Incendiary.Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/anm14/AN_M14_burn_loop.wav", 
 })

sound.Add({ 
 name = "ANM14Incendiary.LoopEnd",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/anm14/AN_M14_burn_loop_end.wav", 
 })

sound.Add({ 
 name = "ANM14Incendiary.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/anm14/AN_M14_bounce_01.wav", 
 "weapons/cultist/anm14/AN_M14_bounce_02.wav", 
 "weapons/cultist/anm14/AN_M14_bounce_03.wav"} 
 })

-- --------------------------
-- Molotov Cocktail
-- --------------------------

sound.Add({ 
 name = "Molotov.Burn",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/molotov/molotov_burn.wav", 
 })

sound.Add({ 
 name = "Molotov.Detonate",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/molotov/molotov_detonate.wav", 
 })

sound.Add({ 
 name = "Molotov.Loop",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/molotov/molotov_burn_loop.wav", 
 })

sound.Add({ 
 name = "Molotov.Extinguish",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/molotov/molotov_burn_extinguish.wav", 
 })

sound.Add({ 
 name = "Molotov.LoopEnd",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/cultist/molotov/molotov_burn_loop_end.wav", 
 })

--Handling

sound.Add({ 
 name = "Molotov.LighterOpen",
 channel = CHAN_STATIC,
 volumel = 0.3,
sound = "weapons/cultist/molotov/handling/molotov_lighter_open.wav", 
 })

sound.Add({ 
 name = "Molotov.LighterStrike",
 channel = CHAN_STATIC,
 volumel = 0.3,
sound = "weapons/cultist/molotov/handling/molotov_lighter_strike.wav", 
 })


sound.Add({ 
 name = "Molotov.Ignite",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/molotov/handling/molotov_ignite.wav", 
 })

sound.Add({ 
 name = "Molotov.LighterClose",
 channel = CHAN_STATIC,
 volumel = 0.3,
sound = "weapons/cultist/molotov/handling/molotov_lighter_close.wav", 
 })

sound.Add({ 
 name = "Molotov.BurnIdle",
 channel = CHAN_STATIC,
 volumel = 1.0,
sound = "weapons/cultist/molotov/handling/molotov_idle_burn_loop.wav", 
 })

sound.Add({ 
 name = "Molotov.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/molotov/handling/molotov_throw_burning.wav", 
 })

-- --------------------------
-- Flare
-- --------------------------

sound.Add({ 
 name = "Flare.Burn",
 channel = CHAN_STATIC,
 volumel = 0.7,
sound = "weapons/cultist/cultist/flare/flare_burn.wav", 
 })


-- --------------------------
-- C4 EXPLOSIVE
-- --------------------------

sound.Add({ 
 name = "C4.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/C4/c4_detonate_01.wav", 
"weapons/cultist/cultist/C4/c4_detonate_02.wav", 
"weapons/cultist/cultist/C4/c4_detonate_03.wav"} 
 })



sound.Add({ 
 name = "C4.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/C4/c4_detonate_dist_01.wav", 
"weapons/cultist/cultist/C4/c4_detonate_dist_02.wav", 
"weapons/cultist/cultist/C4/c4_detonate_dist_03.wav"} 
 })


sound.Add({ 
 name = "C4.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/C4/c4_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/C4/c4_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/C4/c4_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_C4.SecurityDetonator",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/C4/handling/c4_trigger_security.wav", 
 })

sound.Add({ 
 name = "Weapon_C4.InsurgentDetonator",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/C4/handling/c4_trigger_ins.wav", 
 })

sound.Add({ 
 name = "Weapon_C4.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/C4/c4_bounce_01.wav", 
 "weapons/cultist/C4/c4_bounce_02.wav", 
 "weapons/cultist/C4/c4_bounce_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_C4.Throw",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/C4/handling/c4_throw.wav", 
 })

sound.Add({ 
 name = "Weapon_C4.Plant_ArmMovement",
 channel = CHAN_ITEM,
 volumel = 0.3,
sound = "weapons/cultist/C4/handling/c4_plant_armmovement.wav", 
 })

sound.Add({ 
 name = "Weapon_C4.Plant_PlaceC4",
 channel = CHAN_ITEM,
 volumel = 0.45,
sound = "weapons/cultist/C4/handling/c4_plant_place.wav", 
 })

-- --------------------------
-- IED EXPLOSIVE
-- --------------------------

sound.Add({ 
 name = "IED.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/IED/IED_detonate_01.wav", 
"weapons/cultist/cultist/IED/IED_detonate_02.wav", 
"weapons/cultist/cultist/IED/IED_detonate_03.wav"} 
 })


sound.Add({ 
 name = "IED.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/IED/IED_detonate_dist_01.wav", 
"weapons/cultist/cultist/IED/IED_detonate_dist_02.wav", 
"weapons/cultist/cultist/IED/IED_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "IED.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/IED/IED_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/IED/IED_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/IED/IED_detonate_far_dist_03.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_IED.Detonator",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/IED/handling/IED_trigger_ins.wav", 
 })

sound.Add({ 
 name = "Weapon_IED.Bounce",
 channel = CHAN_ITEM,
 volumel = 0.5, 
 sound = { "weapons/cultist/IED/IED_bounce_01.wav", 
 "weapons/cultist/IED/IED_bounce_02.wav", 
 "weapons/cultist/IED/IED_bounce_03.wav"} 
 })

sound.Add({ 
 name = "Weapon_IED.Throw",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/IED/handling/IED_throw.wav", 
 })



-- --------------------------
-- KABAR KNIFE
-- --------------------------

sound.Add({ 
 name = "Weapon_Knife.Single",
 channel = CHAN_ITEM,
 volumel = 0.5,
sound = "weapons/cultist/knife/knife_slash_01.wav", 
 }) 

sound.Add({ 
 name = "Weapon_Knife.Melee_Hit",
 channel = CHAN_ITEM,
 volumel = 0.5,
sound = "weapons/cultist/knife/knife_slash_01.wav", 
 }) 

sound.Add({ 
 name = "Weapon_Knife.Melee_HitWorld",
 channel = CHAN_ITEM,
 volumel = 0.5,
sound = "weapons/cultist/knife/knife_slash_01.wav", 
 }) 


-- --------------------------
-- UMP45
-- --------------------------


sound.Add({ 
 name = "Weapon_ump45.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ump45/ump45_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ump45/ump45_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/ump45/ump45_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.SingleSilenced",
 channel = CHAN_STATIC,
 volume = 1, 
sound = "weapons/cultist/ump45/ump45_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_ump45.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/ump45/ump45_suppressed_fp.wav", 
 })

-- UMP45 HANDLING

sound.Add({ 
 name = "Weapon_ump45.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ump45/handling/ump45_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Magin",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/ump45/handling/ump45_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Magout",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/ump45/handling/ump45_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ump45/handling/ump45_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ump45/handling/ump45_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ump45/handling/ump45_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ump45/handling/ump45_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_ump45.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ump45/handling/ump45_fireselect.wav", 
 })


-- --------------------------
-- SKS
-- --------------------------


sound.Add({ 
 name = "Weapon_SKS.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/SKS/SKS_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/SKS/SKS_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/SKS/SKS_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/SKS/SKS_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_SKS.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/SKS/SKS_suppressed_fp.wav", 
 })

-- SKS HANDLING

sound.Add({ 
 name = "Weapon_SKS.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/SKS/handling/SKS_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/SKS/handling/SKS_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/SKS/handling/SKS_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/SKS/handling/SKS_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/SKS/handling/SKS_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_SKS.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/SKS/handling/SKS_empty.wav", 
 })


-- --------------------------
-- M249
-- --------------------------


sound.Add({ 
 name = "Weapon_M249.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/M249/M249_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/M249/M249_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/M249/M249_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/M249/M249_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_M249.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/M249/M249_suppressed_fp.wav", 
 })




-- M249 HANDLING

sound.Add({ 
 name = "Weapon_M249.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/M249/handling/M249_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.ArmMovement_01",
 channel = CHAN_ITEM,
 volume = 0.1, 
 sound = "weapons/cultist/M249/handling/M249_ArmMovement_01.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.ArmMovement_02",
 channel = CHAN_ITEM,
 volume = 0.1, 
 sound = "weapons/cultist/M249/handling/M249_ArmMovement_02.wav", 
 })


sound.Add({ 
 name = "Weapon_M249.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_FetchMag.wav", 
 })


sound.Add({ 
 name = "Weapon_M249.BipodDeploy",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/M249/handling/M249_BipodDeploy.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BipodRetract",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/M249/handling/M249_BipodRetract.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/M249/handling/M249_DeployGroundHit.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BeltAlign",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_BeltAlign.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BeltPullOut",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_BeltPullOut.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BeltRemove",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_BeltRemove.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.BeltJingle",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_BulletJingle.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.CoverOpen",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_CoverOpen.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.CoverClose",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/M249/handling/M249_CoverClose.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.MagHit",
 channel = CHAN_ITEM,
 volume = 1, 
 sound = "weapons/cultist/M249/handling/M249_MagHit.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.Magin",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.Magout",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.MagoutFull",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_magout_full.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.ThrowAway",
 channel = CHAN_ITEM,
 volume = 0.5, 
 sound = "weapons/cultist/M249/handling/M249_ThrowAwayRemaining.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M249.Empty",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/M249/handling/M249_empty.wav", 
 })


-- --------------------------
-- RPK
-- --------------------------


sound.Add({ 
 name = "Weapon_RPK.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/RPK/RPK_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/RPK/RPK_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/RPK/RPK_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/RPK/RPK_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_RPK.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/RPK/RPK_suppressed_fp.wav", 
 })



-- RPK HANDLING

sound.Add({ 
 name = "Weapon_RPK.FetchMag",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/RPK/handling/RPK_FetchMag.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.BipodDeploy",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/RPK/handling/RPK_BipodDeploy.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.BipodRetract",
 channel = CHAN_ITEM,
 volumel = 0.45, 
 sound = "weapons/cultist/RPK/handling/RPK_BipodRetract.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.BipodGroundHit",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/RPK/handling/RPK_DeployGroundHit.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Magin",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/RPK/handling/RPK_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/RPK/handling/RPK_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/RPK/handling/RPK_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.1, 
 sound = "weapons/cultist/RPK/handling/RPK_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/RPK/handling/RPK_fireselect_1.wav", 
 })

sound.Add({ 
 name = "Weapon_RPK.EndDeployedReload",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/RPK/handling/RPK_EndDeployedReload.wav", 
 })

-- --------------------------
-- M4A1
-- --------------------------


sound.Add({ 
 name = "Weapon_M4a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/M4a1/M4a1_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_M4a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/M4a1/M4a1_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/M4a1/M4a1_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/M4a1/M4a1_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_M4a1.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })



sound.Add({ 
 name = "Weapon_M4a1.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/M4a1/M4a1_suppressed_fp.wav", 
 })

-- M4A1 HANDLING

sound.Add({ 
 name = "Weapon_M4a1.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.MagHitrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/M4a1/handling/m4a1_maghitrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/M4a1/handling/M4a1_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/M4a1/handling/M4a1_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_hit.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M4a1.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M4a1/handling/M4a1_fireselect.wav", 
 })

-- --------------------------
-- MK18
-- --------------------------


sound.Add({ 
 name = "Weapon_mk18.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/mk18/mk18_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/mk18/mk18_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/mk18/mk18_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/mk18/mk18_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_mk18.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })



sound.Add({ 
 name = "Weapon_mk18.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/mk18/mk18_suppressed_fp.wav", 
 })

-- MK18 HANDLING

sound.Add({ 
 name = "Weapon_mk18.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mk18/handling/mk18_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mk18/handling/mk18_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_hit.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_mk18.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mk18/handling/mk18_fireselect.wav", 
 })


-- --------------------------
-- AT4 LAUNCHER
-- --------------------------

sound.Add({ 
 name = "Weapon_AT4.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/AT4/AT4_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AT4.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/AT4/AT4_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_AT4.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/AT4/AT4_fp.wav", 
 })

--Handling

sound.Add({ 
 name = "Weapon_AT4.Ready",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/at4/handling/at4_ready.wav", 
 })

sound.Add({ 
 name = "Weapon_AT4.Latch_01",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/at4/handling/at4_latch_01.wav", 
 })

sound.Add({ 
 name = "Weapon_AT4.Latch_02",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/at4/handling/at4_latch_02.wav", 
 })

sound.Add({ 
 name = "Weapon_AT4.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.7, 
 sound = "weapons/cultist/at4/handling/at4_shoulder.wav", 
 })


-- --------------------------
-- M203 GL
-- --------------------------

sound.Add({ 
 name = "Weapon_m203.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m203/m203_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_m203.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_m203.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/m203/m203_fp.wav", 
 })

--M203 SMOKE

sound.Add({ 
 name = "Weapon_m203.SmokeExplode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/m203/m203_detonate_smoke_near_01.wav",
 })


sound.Add({ 
 name = "Weapon_m203.SmokeExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
sound = "weapons/cultist/m203/m203_detonate_smoke_far_01.wav", 
 })
 
-- HANDLING

sound.Add({ 
 name = "Weapon_m203.Select",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/m203/handling/m203_select.wav", 
 })

sound.Add({ 
 name = "Weapon_m203.DeSelect",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/m203/handling/m203_deselect.wav", 
 })

sound.Add({ 
 name = "Weapon_m203.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m203/handling/m203_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_m203.OpenBarrel",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/m203/handling/m203_OpenBarrel.wav", 
 })

sound.Add({ 
 name = "Weapon_m203.GrenadeIn",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = { "weapons/cultist/m203/handling/m203_InsertGrenade_01.wav", 
 "weapons/cultist/m203/handling/m203_InsertGrenade_02.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_m203.GrenadeDrop",
 channel = CHAN_STATIC,
 volumel = 0.18, 
 sound = { "weapons/cultist/bullets/shells/concrete/m203_shell_concrete_01.wav", 
 "weapons/cultist/bullets/shells/concrete/m203_shell_concrete_02.wav", 
 "weapons/cultist/bullets/shells/concrete/m203_shell_concrete_03.wav", 
 "weapons/cultist/bullets/shells/concrete/m203_shell_concrete_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_m203.CloseBarrel",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/m203/handling/m203_CloseBarrel.wav", 
 })


-- --------------------------
-- GP30 GL
-- --------------------------

sound.Add({ 
 name = "Weapon_gp30.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/gp30/gp30_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_gp30.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_gp30.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/gp30/gp30_fp.wav", 
 })

-- HANDLING

sound.Add({ 
 name = "Weapon_gp30.Select",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/gp30/handling/gp30_select.wav", 
 })

sound.Add({ 
 name = "Weapon_gp30.DeSelect",
 channel = CHAN_ITEM,
 volumel = 0.14, 
 sound = "weapons/cultist/gp30/handling/gp30_deselect.wav", 
 })

sound.Add({ 
 name = "Weapon_gp30.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/gp30/handling/gp30_empty.wav", 
 })


sound.Add({ 
 name = "Weapon_gp30.GrenadeIn",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = { "weapons/cultist/gp30/handling/gp30_InsertGrenade_01.wav", 
 "weapons/cultist/gp30/handling/gp30_InsertGrenade_02.wav"} 
 })
 
sound.Add({ 
 name = "Weapon_gp30.GrenadeInClick",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/gp30/handling/gp30_InsertGrenade_click.wav", 
 })

-- --------------------------
-- Grenade Launcher Detonate
-- --------------------------

sound.Add({ 
 name = "GrenadeLauncher.Explode",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/m67/m67_detonate_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_03.wav"} 
 })


sound.Add({ 
 name = "GrenadeLauncher.ExplodeDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/m67_detonate_dist_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_dist_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "GrenadeLauncher.ExplodeFarDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/m67_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- FN FAL
-- --------------------------

sound.Add({ 
 name = "Weapon_FnFAL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/FnFal/fnfal_tp.wav",
 })

sound.Add({ 
 name = "Weapon_FnFAL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/FnFal/fnfal_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/FnFal/fnfal_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/FnFal/fnfal_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_FnFAL.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/FnFal/fnfal_suppressed_fp.wav", 
 })

-- FN FAL HANDLING

sound.Add({ 
 name = "Weapon_FnFAL.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_rattle.wav", 
 })


sound.Add({ 
 name = "Weapon_FnFAL.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/fnfal/handling/fnfal_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = "weapons/cultist/fnfal/handling/fnfal_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_FnFAL.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/fnfal/handling/fnfal_fireselect_1.wav", 
 })

-- --------------------------
-- M14
-- --------------------------

sound.Add({ 
 name = "Weapon_M14.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/M14/M14_tp.wav",
 })

sound.Add({ 
 name = "Weapon_M14.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/M14/M14_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/M14/M14_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/M14/M14_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_M14.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/M14/M14_suppressed_fp.wav", 
 })

-- M14 HANDLING

sound.Add({ 
 name = "Weapon_M14.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_rattle.wav", 
 })


sound.Add({ 
 name = "Weapon_M14.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/M14/handling/m14_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/M14/handling/m14_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_M14.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/M14/handling/m14_fireselect.wav", 
 })

-- --------------------------
-- M67 Frag Grenade WATER
-- --------------------------

sound.Add({ 
 name = "BaseGrenade.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/m67/water/m67_water_detonate_01.wav", 
"weapons/cultist/cultist/m67/water/m67_water_detonate_02.wav", 
"weapons/cultist/cultist/m67/water/m67_water_detonate_03.wav"} 
 })

sound.Add({ 
 name = "BaseGrenade.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/water/m67_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/m67/water/m67_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/m67/water/m67_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "BaseGrenade.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/m67/m67_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/m67/m67_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- RPG / AT4 WATER
-- --------------------------

sound.Add({ 
 name = "Weapon_RPG7.HitWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/AT4/water/AT4RPG_water_detonate_01.wav", 
"weapons/cultist/cultist/AT4/water/AT4RPG_water_detonate_02.wav", 
"weapons/cultist/cultist/AT4/water/AT4RPG_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "Weapon_RPG7.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/AT4/water/AT4RPG_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/AT4/water/AT4RPG_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/AT4/water/AT4RPG_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "Weapon_RPG7.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
sound = {"weapons/cultist/AT4/AT4RPG_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/AT4/AT4RPG_detonate_far_dist_03.wav", } 
 })
 
-- --------------------------
-- C4 EXPLOSIVE WATER
-- --------------------------

sound.Add({ 
 name = "C4.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/C4/water/C4_water_detonate_01.wav", 
"weapons/cultist/cultist/C4/water/C4_water_detonate_02.wav", 
"weapons/cultist/cultist/C4/water/C4_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "C4.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/C4/water/C4_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/C4/water/C4_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/C4/water/C4_water_detonate_dist_03.wav"} 
 })
 


sound.Add({ 
 name = "C4.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/C4/c4_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/C4/c4_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/C4/c4_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- IED EXPLOSIVE WATER
-- --------------------------

sound.Add({ 
 name = "IED.ExplodeWater",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = {"weapons/cultist/IED/water/IED_water_detonate_01.wav", 
"weapons/cultist/cultist/IED/water/IED_water_detonate_02.wav", 
"weapons/cultist/cultist/IED/water/IED_water_detonate_03.wav"} 
 })


sound.Add({ 
 name = "IED.ExplodeDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/IED/water/IED_water_detonate_dist_01.wav", 
"weapons/cultist/cultist/IED/water/IED_water_detonate_dist_02.wav", 
"weapons/cultist/cultist/IED/water/IED_water_detonate_dist_03.wav"} 
 })
 
 


sound.Add({ 
 name = "IED.ExplodeFarDistantWater",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = {"weapons/cultist/cultist/IED/IED_detonate_far_dist_01.wav", 
"weapons/cultist/cultist/IED/IED_detonate_far_dist_02.wav", 
"weapons/cultist/cultist/IED/IED_detonate_far_dist_03.wav"} 
 })
 
-- --------------------------
-- AK74
-- --------------------------

sound.Add({ 
 name = "Weapon_AK74.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/ak74/AK74_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/ak74/AK74_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/ak74/AK74_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/ak74/AK74_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_AK74.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/ak74/AK74_suppressed_fp.wav", 
 })

-- AK HANDLING

sound.Add({ 
 name = "Weapon_AK74.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ak74/handling/AK74_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/ak74/handling/AK74_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_AK74.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/ak74/handling/AK74_fireselect_1.wav", 
 })

-- --------------------------
-- P2A1 FLARE GUN
-- --------------------------

sound.Add({ 
 name = "Weapon_p2a1.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/flaregun/flaregun_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1,
sound = "weapons/cultist/cultist/flaregun/flaregun_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/flaregun/flaregun_fp.wav", 
 })

-- HANDLING

sound.Add({ 
 name = "Weapon_p2a1.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/flaregun/handling/flaregun_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.OpenBarrel",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/flaregun/handling/flaregun_OpenBarrel.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.RemoveEmptyFlare",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/flaregun/handling/flaregun_RemoveFlare_01.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.FlareInStart",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/flaregun/handling/flaregun_InsertFlareStart.wav" 
 })

sound.Add({ 
 name = "Weapon_p2a1.FlareIn",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/flaregun/handling/flaregun_InsertFlare.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.FlareDrop",
 channel = CHAN_STATIC,
 volumel = 0.18, 
 sound = { "weapons/cultist/bullets/shells/concrete/flare_shell_concrete_01.wav", 
 "weapons/cultist/bullets/shells/concrete/flare_shell_concrete_02.wav", 
 "weapons/cultist/bullets/shells/concrete/flare_shell_concrete_03.wav", 
 "weapons/cultist/bullets/shells/concrete/flare_shell_concrete_04.wav"} 
 })

sound.Add({ 
 name = "Weapon_p2a1.CloseBarrel",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/flaregun/handling/flaregun_CloseBarrel.wav", 
 })

sound.Add({ 
 name = "Weapon_p2a1.CockHammer",
 channel = CHAN_ITEM,
 volumel = 0.35, 
 sound = "weapons/cultist/flaregun/handling/flaregun_cockhammer.wav", 
 })

-- --------------------------
-- NVG GOGGLES
-- --------------------------

sound.Add({ 
 name = "Weapon_NVG.NvgOn",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/cultist/NVG/nvg_on.wav", 
 })

sound.Add({ 
 name = "Weapon_NVG.NvgOff",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/cultist/NVG/nvg_off.wav", 
 })

sound.Add({ 
 name = "Weapon_NVG.InsNvgOn",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/cultist/NVG/nvg_ins_on.wav", 
 })

sound.Add({ 
 name = "Weapon_NVG.InsNvgOff",
 channel = CHAN_STATIC,
 volume = 0.3, 
 sound = "weapons/cultist/cultist/NVG/nvg_ins_off.wav", 
 })

-- --------------------------
-- Sterling SMG
-- --------------------------


sound.Add({ 
 name = "Weapon_Sterling.Single",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Sterling/Sterling_TP.wav", 
 })


sound.Add({ 
 name = "Weapon_Sterling.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/Sterling/Sterling_dist.wav", 
 }) 

sound.Add({ 
 name = "Weapon_Sterling.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/Sterling/Sterling_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.SingleSilenced",
 channel = CHAN_STATIC,
 volume = 1, 
sound = "weapons/cultist/Sterling/Sterling_suppressed_tp.wav", 
 })


sound.Add({ 
 name = "Weapon_Sterling.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/Sterling/Sterling_suppressed_fp.wav", 
 })

-- STERLING SMG HANDLING

sound.Add({ 
 name = "Weapon_Sterling.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/Sterling/handling/Sterling_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_fireselect.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.StockOpen_01",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_stockopen_01.wav", 
 })

sound.Add({ 
 name = "Weapon_Sterling.StockOpen_02",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/Sterling/handling/Sterling_stockopen_02.wav", 
 })

-- --------------------------
-- GALIL
-- --------------------------


sound.Add({ 
 name = "Weapon_Galil.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/galil/galil_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/galil/galil_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/galil/galil_fp.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.SingleSilenced",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/galil/galil_suppressed_tp.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.SingleSilencedDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.SingleSilencedLocal",
 channel = CHAN_WEAPON,
 volume = 1, 
 sound = "weapons/cultist/galil/galil_suppressed_fp.wav", 
 })

-- GALIL HANDLING

sound.Add({ 
 name = "Weapon_Galil.ROF",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_fireselect_1.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Magrelease",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Magin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Magout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Boltback",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/galil/handling/galil_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Boltrelease",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/galil/handling/galil_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.Empty",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.DrumMagin",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_drum_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.DrumMagout",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_drum_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.DrumMagoutRattle",
 channel = CHAN_ITEM,
 volume = 0.2, 
 sound = "weapons/cultist/galil/handling/galil_drum_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.DrumMagFetch",
 channel = CHAN_ITEM,
 volume = 0.3, 
 sound = "weapons/cultist/galil/handling/galil_drum_mag_fetch.wav", 
 })

sound.Add({ 
 name = "Weapon_Galil.DrumMagHit",
 channel = CHAN_ITEM,
 volume = 0.4, 
 sound = "weapons/cultist/galil/handling/galil_drum_maghit.wav", 
 })


-- --------------------------
-- Universal
-- --------------------------


sound.Add({ 
 name = "Universal.LeftCrawl",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = { "weapons/cultist/universal/Uni_Crawl_L_01.wav", 
"weapons/cultist/universal/Uni_Crawl_L_02.wav", 
"weapons/cultist/universal/Uni_Crawl_L_03.wav"} 
 })

sound.Add({ 
 name = "Universal.RightCrawl",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = { "weapons/cultist/universal/Uni_Crawl_R_01.wav", 
"weapons/cultist/universal/Uni_Crawl_R_02.wav", 
"weapons/cultist/universal/Uni_Crawl_R_03.wav"} 
 })


sound.Add({ 
 name = "Universal.Draw",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_weapon_draw_01.wav", 
 "weapons/cultist/universal/uni_weapon_draw_02.wav", 
 "weapons/cultist/universal/uni_weapon_draw_03.wav", 
 "weapons/cultist/universal/uni_weapon_draw_04.wav", 
 "weapons/cultist/universal/uni_weapon_draw_05.wav", 
 "weapons/cultist/universal/uni_weapon_draw_06.wav"} 
 })

sound.Add({ 
 name = "Universal.Holster",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_weapon_holster_01.wav", 
"weapons/cultist/universal/uni_weapon_holster_02.wav", 
"weapons/cultist/universal/uni_weapon_holster_03.wav", 
"weapons/cultist/universal/uni_weapon_holster_04.wav", 
"weapons/cultist/universal/uni_weapon_holster_05.wav", 
"weapons/cultist/universal/uni_weapon_holster_06.wav"} 
 })

sound.Add({ 
 name = "Universal.Grab",
 channel = CHAN_ITEM,
 volumel = 1.0,
sound = "weapons/cultist/universal/uni-grab.wav", 
 })

sound.Add({ 
 name = "Universal.PistolDraw",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_pistol_draw_01.wav", 
 "weapons/cultist/universal/uni_pistol_draw_02.wav", 
 "weapons/cultist/universal/uni_pistol_draw_03.wav", 
 "weapons/cultist/universal/uni_pistol_draw_04.wav", 
 "weapons/cultist/universal/uni_pistol_draw_05.wav"} 
 })

sound.Add({ 
 name = "Universal.PistolHolster",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_pistol_holster_01.wav", 
"weapons/cultist/universal/uni_pistol_holster_02.wav", 
"weapons/cultist/universal/uni_pistol_holster_03.wav", 
"weapons/cultist/universal/uni_pistol_holster_04.wav", 
"weapons/cultist/universal/uni_pistol_holster_05.wav"} 
 })

sound.Add({ 
 name = "Universal.GrenadeDraw",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_grenade_draw_01.wav", 
 "weapons/cultist/universal/uni_grenade_draw_02.wav", 
 "weapons/cultist/universal/uni_grenade_draw_03.wav", 
 "weapons/cultist/universal/uni_grenade_draw_04.wav", 
 "weapons/cultist/universal/uni_grenade_draw_05.wav"} 
 })

sound.Add({ 
 name = "Universal.GrenadeHolster",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_grenade_holster_01.wav", 
"weapons/cultist/universal/uni_grenade_holster_02.wav", 
"weapons/cultist/universal/uni_grenade_holster_03.wav", 
"weapons/cultist/universal/uni_grenade_holster_04.wav", 
"weapons/cultist/universal/uni_grenade_holster_05.wav"} 
 })


--Begin ADS
sound.Add({ 
 name = "Universal.BeginADS",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = {"weapons/cultist/universal/uni_ads_in_01.wav", 
"weapons/cultist/universal/uni_ads_in_02.wav", 
"weapons/cultist/universal/uni_ads_in_03.wav", 
"weapons/cultist/universal/uni_ads_in_04.wav", 
"weapons/cultist/universal/uni_ads_in_05.wav", 
"weapons/cultist/universal/uni_ads_in_06.wav"} 
 })

--End ADS
sound.Add({ 
 name = "Universal.EndADS",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = {"weapons/cultist/universal/uni_ads_out_01.wav", 
"weapons/cultist/universal/uni_ads_out_02.wav", 
"weapons/cultist/universal/uni_ads_out_03.wav", 
"weapons/cultist/universal/uni_ads_out_04.wav", 
"weapons/cultist/universal/uni_ads_out_05.wav", 
"weapons/cultist/universal/uni_ads_out_06.wav"} 
 })

--Lean Out
sound.Add({ 
 name = "Universal.LeanOut",
 channel = CHAN_STATIC,
 volumel = 0.5, 
 sound = {"weapons/cultist/universal/uni_lean_in_01.wav", 
"weapons/cultist/universal/uni_lean_in_02.wav", 
"weapons/cultist/universal/uni_lean_in_03.wav", 
"weapons/cultist/universal/uni_lean_in_04.wav", 
"weapons/cultist/universal/uni_lean_in_05.wav", 
"weapons/cultist/universal/uni_lean_in_06.wav"} 
 })

--Lean In
sound.Add({ 
 name = "Universal.LeanIn",
 channel = CHAN_STATIC,
 volumel = 0.5, 
 sound = { "weapons/cultist/universal/uni_lean_out_01.wav", 
 "weapons/cultist/universal/uni_lean_out_02.wav", 
 "weapons/cultist/universal/uni_lean_out_03.wav", 
 "weapons/cultist/universal/uni_lean_out_04.wav", 
"weapons/cultist/universal/uni_lean_out_05.wav", 
"weapons/cultist/universal/uni_lean_out_06.wav"} 
 })

--Weapon Lower When Begin Sprint
sound.Add({ 
 name = "Universal.SprintWeaponLower",
 channel = CHAN_ITEM,
 volumel = 0.15, 
 sound = {"weapons/cultist/universal/uni_weapon_lower_01.wav", 
"weapons/cultist/universal/uni_weapon_lower_02.wav", 
"weapons/cultist/universal/uni_weapon_lower_03.wav", 
"weapons/cultist/universal/uni_weapon_lower_04.wav", 
"weapons/cultist/universal/uni_weapon_lower_05.wav", 
"weapons/cultist/universal/uni_weapon_lower_06.wav"} 
 })

--Weapon Lower When Against Obstacle
sound.Add({ 
 name = "Universal.WeaponLower",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/uni_weapon_lower_01.wav", 
"weapons/cultist/universal/uni_weapon_lower_02.wav", 
"weapons/cultist/universal/uni_weapon_lower_03.wav", 
"weapons/cultist/universal/uni_weapon_lower_04.wav", 
"weapons/cultist/universal/uni_weapon_lower_05.wav", 
"weapons/cultist/universal/uni_weapon_lower_06.wav"} 
 })

--Weapon Raise When Clear Of Obstacle
sound.Add({ 
 name = "Universal.WeaponRaise",
 channel = CHAN_ITEM,
 volumel = 0.4, 
 sound = {"weapons/cultist/universal/uni_weapon_raise_01.wav", 
"weapons/cultist/universal/uni_weapon_raise_02.wav", 
"weapons/cultist/universal/uni_weapon_raise_03.wav", 
"weapons/cultist/universal/uni_weapon_raise_04.wav", 
"weapons/cultist/universal/uni_weapon_raise_05.wav", 
"weapons/cultist/universal/uni_weapon_raise_06.wav"} 
 })

--Depreciated
sound.Add({ 
 name = "Universal.IronIn",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "common/null.wav", 
 })

sound.Add({ 
 name = "Universal.IronOut",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "common/null.wav", 
 })

sound.Add({ 
 name = "Universal.IronIdle",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "common/null.wav", 
 })


-- --------------------------
-- G30/40
-- --------------------------


sound.Add({ 
 name = "Weapon_g3040.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
 sound = "weapons/cultist/cultist/g3040/kar98_TP.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.SingleDistant",
 channel = CHAN_STATIC,
 volume = 1, 
 sound = "weapons/cultist/cultist/g3040/kar98_dist.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.SingleLocal",
 channel = CHAN_WEAPON,
 volumel = 1.0,
sound = "weapons/cultist/g3040/kar98_fp.wav", 
 })



-- KAR98 HANDLING

sound.Add({ 
 name = "Weapon_g3040.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/g3040/handling/Kar98_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.MagIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/Kar98_MagIn.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.RoundsIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/Kar98_RoundsIn.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.ClipRemove",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/Kar98_ClipRemove.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/g3040/handling/kar98_bulletin_1.wav", 
 "weapons/cultist/g3040/handling/kar98_bulletin_2.wav", 
 "weapons/cultist/g3040/handling/kar98_bulletin_3.wav", 
 "weapons/cultist/g3040/handling/kar98_bulletin_4.wav"} 
 })

sound.Add({ 
 name = "Weapon_g3040.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav",
"weapons/cultist/universal/weapon_melee_02.wav",
"weapons/cultist/universal/weapon_melee_03.wav",
"weapons/cultist/universal/weapon_melee_04.wav",
"weapons/cultist/universal/weapon_melee_05.wav",
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_g3040.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.BoltforwardStripperClip",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/g3040/handling/kar98_boltforward_stripperclip.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.StripperClipEject",
 channel = CHAN_STATIC,
 volumel = 0.2,
sound = "weapons/cultist/g3040/handling/Kar98_stripperclip_eject.wav", 
 })

-- --------------------------
-- G30/40 RIFLE GRENADE
-- --------------------------

sound.Add({ 
 name = "Weapon_kar98GL.Single",
 channel = CHAN_STATIC,
 volumel = 1.0, 
sound = "weapons/cultist/g3040/kar98_gl_tp.wav", 
 })
 

sound.Add({ 
 name = "Weapon_kar98GL.SingleDistant",
 channel = CHAN_STATIC,
 volume = 0, 
 sound = "weapons/cultist/universal/null.wav", 
 })

sound.Add({ 
 name = "Weapon_kar98GL.SingleLocal",
 channel = CHAN_WEAPON,
 volume = 1,
sound = "weapons/cultist/cultist/g3040/kar98_gl_fp.wav", 
 })

-- RIFLE GRENADE HANDLING

sound.Add({ 
 name = "Weapon_g3040.GLLoad1", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/g3040/handling/kar98_gl_load1.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.GLLoad2", 
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/g3040/handling/kar98_gl_load2.wav", 
 })


sound.Add({ 
 name = "Weapon_g3040.Shoulder",
 channel = CHAN_ITEM,
 volume = 0.6, 
 sound = "weapons/cultist/g3040/handling/kar98_shoulder.wav", 
 })

sound.Add({ 
 name = "Weapon_g3040.GlRemove",
 channel = CHAN_ITEM,
 volumel = 0.4,
sound = "weapons/cultist/g3040/handling/kar98_gl_remove.wav", 
 })
 
 -- VOLKSSTURM HANDLING

sound.Add({ 
 name = "Weapon_volks.volk_empty_magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/volk/handling/wpn_volk_empty_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_volks.volk_empty_magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/volk/handling/wpn_volk_empty_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_volks.volk_empty_charge",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/volk/handling/wpn_volk_empty_charge.wav", 
 })



-- STG45 HANDLING

sound.Add({ 
 name = "Weapon_Stg45.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/stg45/handling/Stg44_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/stg45/handling/Stg44_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_Stg45.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/stg45/handling/Stg44_fireselect_1.wav", 
 })
 
 --SDK

sound.Add({ 
 name = "Weapon_sdk.sdk_empty_magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/sdk/handle/wpn_sdk_empty_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_sdk.sdk_empty_magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/sdk/handle/wpn_sdk_empty_magin.wav", 
 })
 
 
-- MKB42 HANDLING

sound.Add({ 
 name = "Weapon_mkb42w.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42w.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42w/handling/Stg44_fireselect_1.wav", 
 })
 
 

-- MKB42 HANDLING

sound.Add({ 
 name = "Weapon_mkb42.MagRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.MagoutRattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_magout_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mkb42/handling/Stg44_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Boltrelease",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/mkb42/handling/Stg44_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Hit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_mkb42.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/mkb42/handling/Stg44_fireselect_1.wav", 
 })
 
 --M30

sound.Add({ 
 name = "Weapon_m30luft.m30_tac_rechamber",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_tac_rechamber.wav", 
 })

sound.Add({ 
 name = "Weapon_m30luft.m30_empty_rechamber" ,
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_empty_rechamber.wav", 
 })

sound.Add({ 
 name = "Weapon_m30luft.m30_rifle_switch_on",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_rifle_switch_on.wav", 
 })
 
 sound.Add({ 
 name = "Weapon_m30luft.m30_rifle_switch_off",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_rifle_switch_off.wav", 
 })

sound.Add({ 
 name = "Weapon_m30luft.m30_rifle_open",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_rifle_open.wav", 
 })

sound.Add({ 
 name = "Weapon_m30luft.m30_rifle_rechamber",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_rifle_rechamber.wav", 
 })
 
sound.Add({ 
 name = "Weapon_m30luft.m30_empty_close",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/m30/handling/wpn_m30_empty_close.wav", 
 })


-- EMP44 HANDLING

sound.Add({ 
 name = "Weapon_emp44.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_emp44.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/emp44/handling/mp40_fireselect.wav", 
 })

-- ERMA

sound.Add({ 
 name = "Weapon_erma.Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_erma.ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/erma/handling/mp40_fireselect.wav", 
 })


-- VKZ 

sound.Add({ 
 name = "Weapon_vkz98.Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.MagFetch",
 channel = CHAN_ITEM,
 volumel = 0.3, 
 sound = "weapons/cultist/vkz98/handling/Kar98_fetchmag.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.MagIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/Kar98_MagIn.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.RoundsIn",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/Kar98_RoundsIn.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.ClipRemove",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/Kar98_ClipRemove.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.BoltRelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_boltrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.BoltLatch",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_boltlatch.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.Boltback",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.Boltforward",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_boltforward.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.Roundin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = { "weapons/cultist/vkz98/handling/kar98_bulletin_1.wav", 
 "weapons/cultist/vkz98/handling/kar98_bulletin_2.wav", 
 "weapons/cultist/vkz98/handling/kar98_bulletin_3.wav", 
 "weapons/cultist/vkz98/handling/kar98_bulletin_4.wav"} 
 })

sound.Add({ 
 name = "Weapon_vkz98.Melee",
 channel = CHAN_STATIC,
 volumel = 0.3, 
 sound = {"weapons/cultist/universal/weapon_melee_01.wav",
"weapons/cultist/universal/weapon_melee_02.wav",
"weapons/cultist/universal/weapon_melee_03.wav",
"weapons/cultist/universal/weapon_melee_04.wav",
"weapons/cultist/universal/weapon_melee_05.wav",
"weapons/cultist/universal/weapon_melee_06.wav"} 
 })

sound.Add({ 
 name = "Weapon_vkz98.Rattle",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_rattle.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.BoltforwardStripperClip",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/vkz98/handling/kar98_boltforward_stripperclip.wav", 
 })

sound.Add({ 
 name = "Weapon_vkz98.StripperClipEject",
 channel = CHAN_STATIC,
 volumel = 0.2,
sound = "weapons/cultist/vkz98/handling/Kar98_stripperclip_eject.wav", 
 })

-- WIMMERSPZ

sound.Add({ 
 name = "Weapon_wimmer.sterling_Magrelease",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_magrelease.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Magin",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_magin.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Maghit",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_maghit.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Magout",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_magout.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Empty",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_empty.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Boltlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_boltlock.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Boltunlock",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_boltunlock.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_Boltback",
 channel = CHAN_ITEM,
 volumel = 0.25, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_boltback.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_ROF",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_fireselect.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_StockOpen_01",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_stockopen_01.wav", 
 })

sound.Add({ 
 name = "Weapon_wimmer.sterling_StockOpen_02",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/wimmerspz/handling/Sterling_stockopen_02.wav", 
 })
 

--GROSSFUZZ

sound.Add({ 
 name = "Weapon_grossfuzz.rifle_clip_out",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/grossfuss/handling/rifle_clip_out_1.wav", 
 })
 sound.Add({ 
 name = "Weapon_grossfuzz.rifle_clip_in",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/grossfuss/handling/rifle_clip_in_1.wav", 
 })
 sound.Add({ 
 name = "Weapon_grossfuzz.rifle_clip_locked",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/grossfuss/handling/rifle_clip_locked_1.wav", 
 })
 sound.Add({ 
 name = "Weapon_grossfuzz.rifle_deploy",
 channel = CHAN_ITEM,
 volumel = 0.2, 
 sound = "weapons/cultist/grossfuss/handling/rifle_deploy_1.wav", 
 })
 
 // --------------------------
// R-Revolver
// --------------------------

sound.Add({ 
 name = "Weapon_Revolver1879.Single",
	channel =		CHAN_STATIC,
	volume =	    1,
	sound =	        "weapons/cultist/revolver1879/1879_tp.wav"	
	})

sound.Add({ 
 name = "Weapon_Revolver1879.SingleDistant",
	channel =		CHAN_STATIC,
	volume =		1,
	sound =	        "weapons/cultist/revolver1879/1879_dist.wav"	
})

sound.Add({ 
 name = "Weapon_Revolver1879.SingleLocal",
	channel =		CHAN_WEAPON,
	volume =		1,
	sound =	        "weapons/cultist/revolver1879/1879_fp.wav"	
})

// REVOLVER HANDLING

sound.Add({ 
 name = "Weapon_RRevolver.OpenChamber",
	channel =			CHAN_ITEM,
	volume =		    0.15,
	sound =				"weapons/cultist/revolver1879/handling/1879_open.wav" 
})

sound.Add({ 
 name = "Weapon_RRevolver.CloseChamber",
	channel =			CHAN_ITEM,
	volume =		    0.15,
	sound =				"weapons/cultist/revolver1879/handling/1879_close.wav" 
})

sound.Add({ 
 name = "Weapon_RRevolver.FullCock",
	channel =			CHAN_ITEM,
	volume =		    0.2,
	sound =				"weapons/cultist/revolver1879/handling/1879_fullcock.wav" 
})

sound.Add({ 
 name = "Weapon_RRevolver.HalfCock",
	channel =			CHAN_ITEM,
	volume =		    0.2,
	sound =				"weapons/cultist/revolver1879/handling/1879_halfcock.wav" 
})

sound.Add({ 
 name = "Weapon_RRevolver.RoundInsert",
	channel =			CHAN_STATIC,
	volume =		    0.1,
	sound =				"weapons/cultist/revolver1879/handling/1879_insert.wav"  		
})

sound.Add({ 
 name = "Weapon_RRevolver.RoundEject",
	channel =			CHAN_STATIC,
	volume =		    0.1,
	sound =				"weapons/cultist/revolver1879/handling/1879_eject.wav"  		
})


