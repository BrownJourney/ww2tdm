ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "RGD-33 Bundle"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_rgd33bundle_grenade.mdl"
ENT.FuseTime = 6
ENT.ArmTime = 0
ENT.ImpactFuse = false

ENT.DamageRadius = 770
ENT.DamageAmount = 190

ENT.Decal = "Scorch"



ENT.ExplosionEffects = {
"doi_splinter_explosion",
"doi_grenade_explosion_spikes",
"doi_grenade_explosion_flame_b",
"doi_grenade_explosion_sparkBurst",
"doi_grenade_explosion_shock_smoke",
"doi_grenade_explosion_smoke_ground",
"doi_grenade_explosion_glow_c",
"doi_grenade_explosion_smoke",
"doi_grenade_explosion_sparks",
"generic_crater_smoke",
"doi_artillery_explosion_flame",
"doi_artillery_explosion_sparks_b",
"doi_ceilingDust_large_d",
"doi_mortar_explosion_smoke_b",
"doi_splinter_explosion_sparkBurst",
"doi_frag_explosion",
"doi_frag_explosion_smoke_ring",
"doi_frag_explosion_smoke_d",
"doi_frag_explosion_spikes",
"doi_frag_explosion_glow",
"doi_frag_explosion_flame_c",
"doi_frag_explosion_smoke",
"doi_frag_explosion_flame"
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
