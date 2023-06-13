ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Mk2"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false
 
ENT.Model = "models/weapons/cultist/w_mk2.mdl"
ENT.FuseTime = 4.5
ENT.ArmTime = 4.5
ENT.ImpactFuse = false

ENT.DamageRadius = 830
ENT.DamageAmount = 130



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
 }

ENT.SoundTable = {
	ImpactHard = {
		"weapons/cultist/mk2/mk2_bounce_01.wav",
		"weapons/cultist/mk2/mk2_bounce_02.wav",
		"weapons/cultist/mk2/mk2_bounce_03.wav",
		"weapons/cultist/mk2/mk2_bounce_04.wav"
	},
	ImpactSoft = {
		"weapons/cultist/mk2/mk2_bounce_01.wav",
		"weapons/cultist/mk2/mk2_bounce_02.wav",
		"weapons/cultist/mk2/mk2_bounce_03.wav",
		"weapons/cultist/mk2/mk2_bounce_04.wav"
	},
	Explode = {
	"weapons/cultist/mk2/mk2_detonate_01.wav",
	"weapons/cultist/mk2/mk2_detonate_02.wav",
	"weapons/cultist/mk2/mk2_detonate_03.wav",	
	},
	
	WaterExplode = { 
	"weapons/cultist/mk2/water/mk2_water_detonate_01.wav",
	"weapons/cultist/mk2/water/mk2_water_detonate_02.wav",
	"weapons/cultist/mk2/water/mk2_water_detonate_03.wav",	
	}
}

ENT.Decal = "Scorch"



AddCSLuaFile()
