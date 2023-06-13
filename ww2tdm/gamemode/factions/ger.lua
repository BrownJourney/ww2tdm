FACTION.Name = "ger"
FACTION.Team = TEAM_AXIS

if CLIENT then
	FACTION.icoLarge = Material("hud/faction/ger-large.png", "smooth")
	FACTION.icoBig = Material("hud/faction/ger-big.png", "smooth")
	FACTION.icoSmall = Material("hud/faction/ger.png", "smooth")
	FACTION.ScoreboardName = "NAZI"
end

FACTION.Music = {}

FACTION.Music.firstSpawn = Sound("music/factions/ger/spawn_first.ogg")
FACTION.Music.winning = Sound("music/factions/ger/winning_music.ogg")
FACTION.Music.victory = Sound("music/factions/ger/victory.ogg")

FACTION.Voices = {}

FACTION.Voices.underfire = {}
for i = 1, 6 do
	FACTION.Voices.underfire[i] = Sound("germany/reactions/near_hit_"..i..".wav")
end
for i = 7, 12 do
	FACTION.Voices.underfire[i] = Sound("germany/reactions/under_fire_"..(i - 6)..".wav")
end

FACTION.Voices.underfire_mg = {}
for i = 1, 3 do
	FACTION.Voices.underfire_mg[i] = Sound("germany/reactions/under_fire_mg_"..i..".wav")
end

FACTION.Voices.underfire_sniper = {}
for i = 1, 3 do
	FACTION.Voices.underfire_sniper[i] = Sound("germany/reactions/under_fire_sniper_"..i..".wav")
end

FACTION.Voices.point_lost = {}
for i = 1, 4 do
	FACTION.Voices.point_lost[i] = Sound("germany/intel/point_lost_"..i..".wav")
end

FACTION.Voices.point_captured = {}
for i = 1, 7 do
	FACTION.Voices.point_captured[i] = Sound("germany/intel/point_captured_"..i..".wav")
end

FACTION.Voices.point_loosing = {}
for i = 1, 5 do
	FACTION.Voices.point_loosing[i] = Sound("germany/intel/loosing_point_"..i..".wav")
end

FACTION.Voices.yes = {}
for i = 1, 3 do
	FACTION.Voices.yes[i] = Sound("germany/orders/yes_"..i..".wav")
end

FACTION.Voices.rush = {}
for i = 1, 3 do
	FACTION.Voices.rush[i] = Sound("germany/orders/gogo_"..i..".wav")
end

FACTION.Voices.defend = {}
for i = 1, 9 do
	FACTION.Voices.defend[i] = Sound("germany/orders/defend_"..i..".wav")
end

FACTION.Voices.attack = {}
for i = 1, 6 do
	FACTION.Voices.attack[i] = Sound("germany/orders/attack_"..i..".wav")
end

FACTION.Voices.noammo = {}
for i = 1, 4 do
	FACTION.Voices.noammo[i] = Sound("germany/weapons/no_ammo_"..i..".wav")
end

FACTION.Voices.retreat = {}
for i = 1, 6 do
	FACTION.Voices.retreat[i] = Sound("germany/orders/retreat_"..i..".wav")
end

FACTION.Voices.no = {}
for i = 1, 3 do
	FACTION.Voices.no[i] = Sound("germany/orders/no_"..i..".wav")
end

FACTION.Voices.taunt = {}
for i = 1, 5 do
	FACTION.Voices.taunt[i] = Sound("germany/orders/taunt_"..i..".wav")
end

FACTION.Voices.heal = {}
for i = 1, 4 do
	FACTION.Voices.heal[i] = Sound("germany/health/being_healed_"..i..".wav")
end

FACTION.Voices.firstspawn = {}
for i = 1, 2 do
	FACTION.Voices.firstspawn[i] = Sound("germany/commander/pre_round_attacker_"..i..".wav")
end
FACTION.Voices.firstspawn[3] = Sound("germany/commander/pre_round_defender_2.wav")

FACTION.Voices.respawn = {}
for i = 1, 3 do
	FACTION.Voices.respawn[i] = Sound("germany/commander/round_start_"..i..".wav")
end
for i = 4, 33 do
	FACTION.Voices.respawn[i] = Sound("germany/chatter/random_phrases_"..(i - 3)..".wav")
end

FACTION.Voices.death = {}
for i = 1, 15 do
	FACTION.Voices.death[i] = Sound("germany/health/fast_death_"..i..".wav")
end

FACTION.Voices.damage = {}
for i = 1, 12 do
	FACTION.Voices.damage[i] = Sound("germany/health/being_hit_"..i..".wav")
end

FACTION.Voices.long_death = {}
for i = 1, 8 do
	FACTION.Voices.long_death[i] = Sound("germany/health/near_death_"..(i + 1)..".wav")
end

FACTION.Voices.death_spine = {}
for i = 1, 3 do
	FACTION.Voices.death_spine[i] = Sound("germany/health/death_spine_"..i..".wav")
end

FACTION.Voices.death_heart = {}
for i = 1, 3 do
	FACTION.Voices.death_heart[i] = Sound("germany/health/death_heart_"..i..".wav")
end

FACTION.Voices.death_balls = {}
for i = 1, 3 do
	FACTION.Voices.death_balls[i] = Sound("germany/health/death_balls_"..i..".wav")
end

FACTION.Voices.game_won = {}
for i = 1, 2 do
	FACTION.Voices.game_won[i] = Sound("germany/intel/game_won_"..i..".wav")
end

FACTION.Voices.game_lost = {}
for i = 1, 2 do
	FACTION.Voices.game_lost[i] = Sound("germany/intel/game_lost_"..i..".wav")
end

return "FACTION_GERMANY"