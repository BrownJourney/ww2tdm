ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "RPG-43"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_rpg43_grenade.mdl"
ENT.FuseTime = 5
ENT.ArmTime = 0
ENT.ImpactFuse = true


ENT.DamageRadius = 100
ENT.DamageAmount = 2000

ENT.ExplosionEffects = {
"doi_grenade_explosion_shock_smoke",
"doi_grenade_explosion_glow_c",
"doi_grenade_explosion_sparks"
 }
 
 
 ENT.SoundTable = {
	ImpactHard = {
		"weapons/cultist/f1/mk2_bounce_01.wav",
		"weapons/cultist/f1/mk2_bounce_02.wav",
		"weapons/cultist/f1/mk2_bounce_03.wav",
		"weapons/cultist/f1/mk2_bounce_04.wav"
		
	},
	ImpactSoft = {
		"weapons/cultist/f1/mk2_bounce_01.wav",
		"weapons/cultist/f1/mk2_bounce_02.wav",
		"weapons/cultist/f1/mk2_bounce_03.wav",
		"weapons/cultist/f1/mk2_bounce_04.wav"
	},
	Explode = {
	"weapons/cultist/f1/mk2_detonate_01.wav",
	"weapons/cultist/f1/mk2_detonate_02.wav",
	"weapons/cultist/f1/mk2_detonate_03.wav",	
	},
	
	WaterExplode = { 
	"weapons/cultist/f1/water/mk2_water_detonate_01.wav",
	"weapons/cultist/f1/water/mk2_water_detonate_02.wav",
	"weapons/cultist/f1/water/mk2_water_detonate_03.wav",	
	}
}

ENT.Decal = "Scorch"

AddCSLuaFile()
