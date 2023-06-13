CFG = CFG or {}

--[[-------------------------------------------------------------------------
TEAM VARS
---------------------------------------------------------------------------]]
CFG.Teams = {}
CFG.Teams.ChangeDelay = 120
CFG.Teams.SpawnDelay = 5

--[[-------------------------------------------------------------------------
RANDOM VARS
---------------------------------------------------------------------------]]
CFG.JumpCooldown = 2 -- задержка перед следующим прыжком
CFG.MaxTeamkills = 4 -- кик игрока после убийства данного кол-ва человек
CFG.MaxMags = 10 -- сколько игрок может иметь максимально магазинов
CFG.MaxSupplyCrates = 2 -- сколько ящиков снабжения игрок может иметь одновременно
CFG.SpawnForts = 3 -- сколько укреплений дается игроку при спавне
CFG.MaxForts = 3 -- сколько укреплений всего один игрок может иметь на карте
CFG.FortificaionDuration = 180 -- сколько секунд держится укрепление
CFG.HelmetDropChance = 20 -- шанс разлома башки и отлёта шлема (сасный момент)
CFG.TraitParachutesAmount = 2 -- количество парашютов, с которыми появляется класс с соответствующим боевым талантом
CFG.WalkSpeed = 120 -- скорость ходьбы
CFG.JumpPower = 200 -- сила прыжка
CFG.MaxPlayerArmor = 100 -- максимальное количество очков брони
CFG.BreathPenalty = 10 -- сколько секунд должно восстанавливаться дыхание после полного истощения
CFG.SupplyCrateRestore = 45 -- сколько секунд восстаналвиваются ящики у медиков и патрончиков
CFG.SpawnProtectionTime = 5 -- сколько секунд после спавна нельзя совершать самоубийство (передислокацию)
CFG.BeaconSpawns = 10 -- сколько раз можно появится на маяке возрождения союзникам
CFG.LoadoutDiscount = 0.8 -- скидка в процентах на покупку снаряжения, если оно уже куплено в другой фракции
CFG.ArcadeRecoilModifier = 0.5
CFG.ArcadeAccuracyModifier = 0.5
CFG.CoinsToElite = 10 -- сколько обычных монет нужно для одной элитной
CFG.EliteCoinsForLevel = 2 -- сколько элитных монет давать за прокачку класса


CFG.ClassLevelXP = {
	[1] = 5000,
	[2] = 5500,
	[3] = 6000,
	[4] = 7000,
	[5] = 8000,
	[6] = 10000,
	[7] = 12000,
	[8] = 15000,
	[9] = 20000,
	[10] = 40000
}
CFG.ClassMaxLevel = 10 -- максимальный уровень прокачки класса
CFG.ClassTraitLevel = 10 -- уровень разблокировки способностей у класса

CFG.VoicePitch = {min = 90, max = 105}

--[[-------------------------------------------------------------------------
SERVER DEPENDENCIES
---------------------------------------------------------------------------]]
CFG.View = CFG.View or {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}

CFG.Spawns = CFG.Spawns or {}
CFG.BaseSpawns = CFG.BaseSpawns or {}
CFG.FlagSpawns = CFG.FlagSpawns or {}

CFG.ClassCategories = {CLASS_ASSAULT, CLASS_SUPPORT, CLASS_LOGISTIC}
CFG.EliteCategories = {CLASS_ELITEASSAULT, CLASS_ELITESUPPORT, CLASS_ELITELOGISTIC}

CFG.MaxPlayers = CFG.MaxPlayers or game.MaxPlayers()

--[[-------------------------------------------------------------------------
POINTS
---------------------------------------------------------------------------]]
CFG.Points = {}
CFG.Points.CaptureRate = 0.5 -- скорость захвата
CFG.Points.PlayerToFulfill = 4 -- сколько игроков нужно, чтобы прогресс захвата двигался с обычной скоростью
CFG.Points.HardcoreReset = false -- если выставлено на false, то прогресс захвата будет сохраняться в случае, если захват был прекращен
CFG.Points.PushBonus = 4 * 60 -- сколько минут дается за дополнительные точки в атаке

--[[-------------------------------------------------------------------------
REWARDS
---------------------------------------------------------------------------]]

CFG.Rewards = {}

CFG.Rewards.capture = {}
CFG.Rewards.capture.kill = 50
CFG.Rewards.capture.melee_kill = 25
CFG.Rewards.capture.long_kill = 15
CFG.Rewards.capture.headshot_kill = 35
CFG.Rewards.capture.team_kill = -150
CFG.Rewards.capture.point_capture = 50
CFG.Rewards.capture.point_release = 25
CFG.Rewards.capture.point_objective = 15

CFG.Rewards.capture_arcade = {}
CFG.Rewards.capture_arcade.kill = 50
CFG.Rewards.capture_arcade.melee_kill = 25
CFG.Rewards.capture_arcade.long_kill = 15
CFG.Rewards.capture_arcade.headshot_kill = 35
CFG.Rewards.capture_arcade.team_kill = -150
CFG.Rewards.capture_arcade.point_capture = 50
CFG.Rewards.capture_arcade.point_release = 25
CFG.Rewards.capture_arcade.point_objective = 15


CFG.Rewards.push = {}
CFG.Rewards.push.kill = 50
CFG.Rewards.push.melee_kill = 25
CFG.Rewards.push.long_kill = 15
CFG.Rewards.push.headshot_kill = 35
CFG.Rewards.push.team_kill = -150
CFG.Rewards.push.point_capture = 250
CFG.Rewards.push.point_release = 50
CFG.Rewards.push.point_objective = 30
CFG.Rewards.push.winner = 250

CFG.Rewards.push_omaha = {}
CFG.Rewards.push_omaha.kill = 50
CFG.Rewards.push_omaha.melee_kill = 25
CFG.Rewards.push_omaha.long_kill = 15
CFG.Rewards.push_omaha.headshot_kill = 35
CFG.Rewards.push_omaha.team_kill = -150
CFG.Rewards.push_omaha.point_capture = 250
CFG.Rewards.push_omaha.point_release = 50
CFG.Rewards.push_omaha.point_objective = 30
CFG.Rewards.push_omaha.winner = 250

CFG.Rewards.war = {}
CFG.Rewards.war.kill = 100
CFG.Rewards.war.melee_kill = 50
CFG.Rewards.war.long_kill = 25
CFG.Rewards.war.headshot_kill = 50
CFG.Rewards.war.team_kill = -150
CFG.Rewards.war.point_capture = 50
CFG.Rewards.war.point_release = 25
CFG.Rewards.war.point_objective = 15

CFG.Rewards.tdm = {}
CFG.Rewards.tdm.kill = 100
CFG.Rewards.tdm.melee_kill = 50
CFG.Rewards.tdm.long_kill = 25
CFG.Rewards.tdm.headshot_kill = 50
CFG.Rewards.tdm.team_kill = -150
CFG.Rewards.tdm.point_capture = 50
CFG.Rewards.tdm.point_release = 25
CFG.Rewards.tdm.point_objective = 15
CFG.Rewards.tdm.winner = 150

CFG.Rewards.ffa = {}
CFG.Rewards.ffa.kill = 100
CFG.Rewards.ffa.melee_kill = 50
CFG.Rewards.ffa.long_kill = 25
CFG.Rewards.ffa.headshot_kill = 50
CFG.Rewards.ffa.winner = 150

CFG.Rewards.general = {}
CFG.Rewards.general.support_resupply_ammo = 50
CFG.Rewards.general.support_resupply_heal = 5
CFG.Rewards.general.support_revive = 100
CFG.Rewards.general.support_fortification = 15
CFG.Rewards.general.top_player = 200
CFG.Rewards.general.winner = 500
CFG.Rewards.general.car_destroy = 100
CFG.Rewards.general.beacon_spawn = 15
--[[-------------------------------------------------------------------------
GAMEMODE MULTIPLIERS
---------------------------------------------------------------------------]]

-- CFG.Multipliers = 

--[[-------------------------------------------------------------------------
HINTS
---------------------------------------------------------------------------]]

CFG.Hints = {
	"hint_melee",
	"hint_grenade",
	"hint_ptfo",
	"hint_zoom",
	"hint_commorse_bind",
	"hint_speak_bind",
	"hint_teamkilling",
	"hint_bipod_bind",
	"hint_hitboxes",
	"hint_suppression",
	"hint_environment",
	"hint_coins",
	"hint_levelup",
	"hint_language",
	"hint_supply",
	"hint_classleveling"
}

CFG.HintsTranslate = {
	["speak"] = "ww2_bind_radio",
	["commorse"] = "ww2_bind_commorse",
	["bipod"] = "ww2_bind_bipod"
}

function CFG.GetHint(hint)

	if !hint then

		hint = table.Random(CFG.Hints)

	end

	local hintTranslated = T(hint)
	if hint:find("bind") then

		local bind = string.Split(hint, '_')[2]

		if CFG.HintsTranslate[bind] then

			local keyname = utf8upper(input.GetKeyName(LocalPlayer():GetInfoNum(CFG.HintsTranslate[bind], -1)))

			hintTranslated = T(hint):format(keyname)

		end

	end

	return hintTranslated

end

--[[-------------------------------------------------------------------------
PLAYER
---------------------------------------------------------------------------]]

function player.GetByName(name)

	for k, v in pairs(player.GetAll()) do

		if v:Name() == name then

			return v

		end

	end

	return;

end

--[[-------------------------------------------------------------------------
BROJOU
---------------------------------------------------------------------------]]

function Bro() -- да-да, я

	return player.GetBySteamID('STEAM_0:0:162962327')

end
