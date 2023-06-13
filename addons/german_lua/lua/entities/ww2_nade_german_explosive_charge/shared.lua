ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Sathel Charge"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_ger_satchel.mdl"
ENT.FuseTime = 15
ENT.ArmTime = 15
ENT.ImpactFuse = false

ENT.DamageRadius = 900
ENT.DamageAmount = 300

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
		"weapons/cultist/compositonb/compositonb_bounce_01.wav",
		"weapons/cultist/compositonb/compositonb_bounce_02.wav",
		"weapons/cultist/compositonb/compositonb_bounce_03.wav"
	},
	ImpactSoft = {
		"weapons/cultist/compositonb/compositonb_bounce_01.wav",
		"weapons/cultist/compositonb/compositonb_bounce_02.wav",
		"weapons/cultist/compositonb/compositonb_bounce_03.wav"
	},
	Explode = {
	"weapons/cultist/compositonb/compositonb_detonate_01.wav",
	"weapons/cultist/compositonb/compositonb_detonate_02.wav",
	"weapons/cultist/compositonb/compositonb_detonate_03.wav",	
	},
	
	WaterExplode = { 
	"weapons/cultist/compositonb/water/compositonb_water_detonate_01.wav",
	"weapons/cultist/compositonb/water/compositonb_water_detonate_02.wav",
	"weapons/cultist/compositonb/water/compositonb_water_detonate_03.wav",	
	}
}

ENT.Decal = "Scorch"


AddCSLuaFile()
