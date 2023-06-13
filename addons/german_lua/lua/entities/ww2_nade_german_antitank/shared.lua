ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Anti-tank Grenade"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_antitank_bomb.mdl"
ENT.FuseTime = 8.5
ENT.ArmTime = 0
ENT.ImpactFuse = true

ENT.DamageRadius = 100
ENT.DamageAmount = 1000

ENT.ExplosionEffects = {
"doi_grenade_explosion_shock_smoke",
"doi_grenade_explosion_glow_c",
"doi_grenade_explosion_sparks"
 }
 
 ENT.SoundTable = {
	ImpactHard = {
		"weapons/cultist/antitank_bomb/m67_bounce_01.wav",
		"weapons/cultist/antitank_bomb/m67_bounce_02.wav",
		"weapons/cultist/antitank_bomb/m67_bounce_03.wav"
	},
	ImpactSoft = {
		"weapons/cultist/antitank_bomb/m67_bounce_01.wav",
		"weapons/cultist/antitank_bomb/m67_bounce_02.wav",
		"weapons/cultist/antitank_bomb/m67_bounce_03.wav"
	},
	Explode = {
	"weapons/cultist/antitank_bomb/m67_detonate.wav",
	},
	
	WaterExplode = { 
	"weapons/cultist/antitank_bomb/water/m67_water_detonate_01.wav",
	"weapons/cultist/antitank_bomb/water/m67_water_detonate_02.wav",
	"weapons/cultist/antitank_bomb/water/m67_water_detonate_03.wav",	
	}
}

ENT.Decal = "Scorch"
 
 
AddCSLuaFile()
