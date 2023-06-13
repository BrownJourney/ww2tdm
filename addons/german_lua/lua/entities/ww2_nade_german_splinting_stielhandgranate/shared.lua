ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Splinting Stilhangranate"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_splintering_stielhandgranate.mdl"
ENT.FuseTime = 4.5
ENT.ArmTime = 0
ENT.ImpactFuse = false

ENT.DamageRadius = 850
ENT.DamageAmount = 100

ENT.ExplosionEffects = {
"ww2_grenade_inner_explosion",
"ww2_grenade_explosion_smoke",
"ww2_grenade_explosion_sparks_b",
"ww2_grenade_explosion_sparks",
"ww2_grenade_explosion_flames_b",
"ww2_grenade_explosion_spikes_c",
"ww2_grenade_inner_explosion_glow",
"ww2_grenade_inner_explosion_debris",
"ww2_grenade_flash",
"doi_splinter_explosion_sparkBurst",
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
	"weapons/cultist/splintering_stielhandgranate/splinteringstielhandgranate_detonate_01.wav",
	"weapons/cultist/splintering_stielhandgranate/splinteringstielhandgranate_detonate_02.wav",
	"weapons/cultist/splintering_stielhandgranate/splinteringstielhandgranate_detonate_03.wav",	
	},
	
	WaterExplode = { 
	"weapons/cultist/splintering_stielhandgranate/water/splinteringstielhandgranate_water_detonate_01.wav",
	"weapons/cultist/splintering_stielhandgranate/water/splinteringstielhandgranate_water_detonate_02.wav",
	"weapons/cultist/splintering_stielhandgranate/water/splinteringstielhandgranate_water_detonate_03.wav",	
	}
}

ENT.Decal = "Scorch"

AddCSLuaFile()
 