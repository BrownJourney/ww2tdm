ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Bundle-grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_bandlenade.mdl"
ENT.FuseTime = 4.5
ENT.ArmTime = 0
ENT.ImpactFuse = false

ENT.DamageRadius = 770
ENT.DamageAmount = 190

ENT.Decal = "Scorch"


ENT.ExplosionEffects = {
"ww2_dynamite_explosion_shockwave",
"ww2_dynamite_explosion_inner",
"ww2_dynamite_explosion_spikes_b",
"ww2_dynamite_explosion_g_smoke",
"ww2_dynamite_explosion_smoke_ground",
"ww2_dynamite_explosion_flames",
"ww2_dynamite_explosion_sparks_e_tracers",
"ww2_dynamite_explosion_smoke_c",
"ww2_dynamite_explosion_sparks_b",
"ww2_dynamite_explosion_smoke_b",
"ww2_dynamite_explosion_sparks_group",
 }
 
 ENT.SoundTable = {
	ImpactHard = {
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_01.wav",
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_02.wav",
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_03.wav"
	},
	ImpactSoft = {
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_01.wav",
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_02.wav",
		"weapons/cultist/stielhandgranate/stielhandgranate_bounce_03.wav"
	},
	Explode = {
	"weapons/cultist/panzerschreck/panzerschreck_detonate_02.wav"
	},
	
	WaterExplode = { 
	"weapons/cultist/panzerschreck/water/panzerschreck_water_detonate_02.wav"
	}
}



AddCSLuaFile()
