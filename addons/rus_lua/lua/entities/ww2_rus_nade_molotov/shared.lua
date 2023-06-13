ENT.Type = "anim"
ENT.Base = "ww2_nade_base"
ENT.PrintName = "Molotov"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/weapons/cultist/w_molotov.mdl"
ENT.FuseTime = 4.5
ENT.ArmTime = 0
ENT.ImpactFuse = true

AddCSLuaFile()

ENT.ExplosionEffects = {
"doi_petrol_flameup_flames_c",
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
