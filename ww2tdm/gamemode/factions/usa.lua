FACTION.Name = "usa"
FACTION.Team = TEAM_ALLIES

if CLIENT then
	FACTION.icoLarge = Material("hud/faction/us-large.png", "smooth")
	FACTION.icoBig = Material("hud/faction/usf-big.png", "smooth")
	FACTION.icoSmall = Material("hud/faction/usf.png", "smooth")
	FACTION.ScoreboardName = "USA"
end

FACTION.Music = {}

FACTION.Music.firstSpawn = Sound("music/factions/usa/spawn_first.ogg")
FACTION.Music.winning = Sound("music/factions/usa/winning_music.ogg")
FACTION.Music.victory = Sound("music/factions/usa/victory.ogg")

FACTION.Voices = {}

FACTION.Voices.underfire = {}
for i = 1, 6 do
	FACTION.Voices.underfire[i] = Sound("usa/reactions/near_hit_"..i..".wav")
end
for i = 1, 6 do
	FACTION.Voices.underfire[i] = Sound("usa/reactions/under_fire_"..i..".wav")
end

FACTION.Voices.underfire_mg = {}
for i = 1, 3 do
	FACTION.Voices.underfire_mg[i] = Sound("usa/reactions/under_fire_mg_"..i..".wav")
end

FACTION.Voices.underfire_sniper = {}
for i = 1, 3 do
	FACTION.Voices.underfire_sniper[i] = Sound("usa/reactions/under_fire_sniper_"..i..".wav")
end

FACTION.Voices.point_lost = {}
for i = 1, 3 do
	FACTION.Voices.point_lost[i] = Sound("usa/intel/point_lost_"..i..".wav")
end

FACTION.Voices.point_captured = {}
for i = 1, 4 do
	FACTION.Voices.point_captured[i] = Sound("usa/intel/point_captured_"..i..".wav")
end

FACTION.Voices.point_loosing = {}
for i = 1, 5 do
	FACTION.Voices.point_loosing[i] = Sound("usa/intel/loosing_point_"..i..".wav")
end

FACTION.Voices.yes = {}
for i = 1, 3 do
	FACTION.Voices.yes[i] = Sound("usa/orders/yes_"..i..".wav")
end

FACTION.Voices.rush = {}
for i = 1, 3 do
	FACTION.Voices.rush[i] = Sound("usa/orders/gogo_"..i..".wav")
end

FACTION.Voices.defend = {}
for i = 1, 9 do
	FACTION.Voices.defend[i] = Sound("usa/orders/defend_"..i..".wav")
end

FACTION.Voices.attack = {}
for i = 1, 7 do
	FACTION.Voices.attack[i] = Sound("usa/orders/attack_"..i..".wav")
end

FACTION.Voices.noammo = {}
for i = 1, 4 do
	FACTION.Voices.noammo[i] = Sound("usa/weapons/no_ammo_"..i..".wav")
end

FACTION.Voices.retreat = {}
for i = 1, 6 do
	FACTION.Voices.retreat[i] = Sound("usa/orders/retreat_"..i..".wav")
end

FACTION.Voices.no = {}
for i = 1, 3 do
	FACTION.Voices.no[i] = Sound("usa/orders/no_"..i..".wav")
end

FACTION.Voices.taunt = {}
for i = 1, 4 do
	FACTION.Voices.taunt[i] = Sound("usa/orders/taunt_"..i..".wav")
end

FACTION.Voices.heal = {}
for i = 1, 4 do
	FACTION.Voices.heal[i] = Sound("usa/health/being_healed_"..i..".wav")
end

FACTION.Voices.firstspawn = {}
-- for i = 1, 2 do
-- 	FACTION.Voices.firstspawn[i] = Sound("usa/commander/pre_round_attacker_"..i..".wav")
-- end
FACTION.Voices.firstspawn[1] = Sound("usa/commander/pre_round_attacker_1.wav")

FACTION.Voices.respawn = {}
for i = 1, 3 do
	FACTION.Voices.respawn[i] = Sound("usa/commander/round_start_"..i..".wav")
end
for i = 1, 17 do
	FACTION.Voices.respawn[i] = Sound("usa/chatter/random_phrases_"..i..".wav")
end

FACTION.Voices.death = {}
for i = 1, 15 do
	FACTION.Voices.death[i] = Sound("usa/health/fast_death_"..i..".wav")
end

FACTION.Voices.damage = {}
for i = 1, 12 do
	FACTION.Voices.damage[i] = Sound("usa/health/being_hit_"..i..".wav")
end

FACTION.Voices.long_death = {}
for i = 1, 5 do
	FACTION.Voices.long_death[i] = Sound("usa/health/near_death_"..i..".wav")
end

FACTION.Voices.death_spine = {}
for i = 1, 3 do
	FACTION.Voices.death_spine[i] = Sound("usa/health/death_spine_"..i..".wav")
end

FACTION.Voices.death_heart = {}
for i = 1, 5 do
	FACTION.Voices.death_heart[i] = Sound("usa/health/death_heart_"..i..".wav")
end

FACTION.Voices.death_balls = {}
for i = 1, 5 do
	FACTION.Voices.death_balls[i] = Sound("usa/health/death_balls_"..i..".wav")
end

FACTION.Voices.game_won = {}
for i = 1, 1 do
	FACTION.Voices.game_won[i] = Sound("usa/intel/game_won_"..i..".wav")
end

FACTION.Voices.game_lost = {}
for i = 1, 1 do
	FACTION.Voices.game_lost[i] = Sound("usa/intel/game_lost_"..i..".wav")
end

return "FACTION_USA"