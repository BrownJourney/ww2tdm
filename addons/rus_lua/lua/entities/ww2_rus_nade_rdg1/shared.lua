ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "RDG-1 Smoke"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_rdg1_grenade.mdl"
ENT.FuseTime = 4
ENT.ArmTime = 4
ENT.ImpactFuse = false


ENT.DamageRadius = 0
ENT.DamageAmount = 0

ENT.ExplosionEffects = {
"ww2_smokegrenade_a",
"ww2_smokegrenade_c",
"ww2_smokegrenade_b"
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
	"weapons/cultist/smokegrenade/smokeburn.wav",
	},
	
	WaterExplode = { 
	"weapons/cultist/smokegrenade/smokeburn.wav",
	}
}


AddCSLuaFile()
