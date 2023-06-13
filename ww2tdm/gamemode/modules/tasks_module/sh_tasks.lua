tasks = tasks or {}

TASK_BEGINNER = "beginner"
TASK_COMMON = "common"
TASK_EXPERT = "expert"

function tasks.GetCategories()
	return {TASK_BEGINNER, TASK_COMMON, TASK_EXPERT}
end

TASK_PREMIUM_BONUS = 0.4

tasks.List = {}

lang.AddPhrase("ru", TASK_BEGINNER, "Обучение")
lang.AddPhrase("ru", TASK_COMMON, "Военная карьера")
lang.AddPhrase("ru", TASK_EXPERT, "Почётные задания")

local taskID;
local taskRequirements;
local desc = function(id)
	return id.."_desc"
end

lang.AddPhrase("ru", "xp", "%sXP")
lang.AddPhrase("en", "xp", "%sXP")

lang.AddPhrase("ru", "coins", "%s монет снабжения")
lang.AddPhrase("en", "coins", "%s supply coins")

function tasks.GetPremiumBonus(type, amount, ply)

	ply = IsValid(ply) and ply or LocalPlayer()

	if type != "xp" then

		return 0

	end

	return ply:IsPremium() and math.floor(amount * TASK_PREMIUM_BONUS) or 0

end

--[[-------------------------------------------------------------------------
НОВОБРАНЕЦ
---------------------------------------------------------------------------]]
taskID = "task_start"
taskRequirements = {
	[1] = "round_played"
}

lang.AddPhrase("ru", taskID, "Новобранец")
lang.AddPhrase("ru", taskRequirements[1], "Матчей сыграно: %s/%s")

lang.AddPhrase("en", taskID, "Recruit")
lang.AddPhrase("en", taskRequirements[1], "Rounds played: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["PlayerInitialSpawn"] = function(ply)
			local gs = gamestate.Get()
			if (gs == GS_ROUND_PLAYING and CurTime() - gamestate.GetRoundTime() <= 180) or gs == GS_WAITING_PLAYERS or gs == GS_ROUND_PRE_PLAYING or gs == GS_ROUND_PREPARE then
				ply.JoinedFromBeggining = true;
			end
		end,
		["OnGameState"] = function(lastGS, gs)
			if gs != GS_ROUND_END then return end

			for k, ply in pairs(player.GetAll()) do
				if !ply.JoinedFromBeggining then continue end

				ply:AddTaskRequirement("task_start", "round_played")
			end
		end,
	},
	Rewards = {
		["xp"] = 500
	},
	OnComplete = function(ply)
		ply:AddPermXP(500, true)
	end
}

--[[-------------------------------------------------------------------------
ГЛАВНОЕ - ПОБЕДА
---------------------------------------------------------------------------]]
taskID = "task_round_win"
taskRequirements = {
	[1] = "round_win"
}

lang.AddPhrase("ru", taskID, "Главное - победа")
lang.AddPhrase("ru", taskRequirements[1], "Матчей выиграно: %s/%s")

lang.AddPhrase("en", taskID, "Win is the goal")
lang.AddPhrase("en", taskRequirements[1], "Rounds won: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Level = 1,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["PlayerInitialSpawn"] = function(ply)
			local gs = gamestate.Get()
			if (gs == GS_ROUND_PLAYING and CurTime() - gamestate.GetRoundTime()) or gs == GS_WAITING_PLAYERS or gs == GS_ROUND_PRE_PLAYING or gs == GS_ROUND_PREPARE then
				ply.JoinedFromBeggining = true
			end
		end,
		["OnGameState"] = function(lastGS, gs)
			if gs != GS_ROUND_END then return end

			for k, ply in pairs(player.GetAll()) do
				if !ply.JoinedFromBeggining then continue end

				if ply:Team() == gamestate.GetWinner() then
					ply:AddTaskRequirement("task_round_win", "round_win")
				end
			end
		end,
	},
	Rewards = {
		["xp"] = 1000
	},

	OnComplete = function(ply)
		ply:AddPermXP(1000, true)
	end
}

--[[-------------------------------------------------------------------------
ЗНАЙ ВРАГА В ЛИЦО
---------------------------------------------------------------------------]]
taskID = "task_kill"
taskRequirements = {
	[1] = "enemy_killed"
}

lang.AddPhrase("ru", taskID, "Знай врага в лицо")
lang.AddPhrase("ru", taskRequirements[1], "Врагов ликвидировано: %s/%s")

lang.AddPhrase("en", taskID, "Know your enemy")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Level = 2,
	Objectives = {
		{id = taskRequirements[1], requirement = 15}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker)
			attacker:AddTaskRequirement("task_kill", "enemy_killed")
		end,
	},
	Rewards = {
		["xp"] = 1500
	},

	OnComplete = function(ply)
		ply:AddPermXP(1500, true)
	end
}

--[[-------------------------------------------------------------------------
ЗНАЙ СВОЮ ЦЕЛЬ
---------------------------------------------------------------------------]]
taskID = "task_capture"
taskRequirements = {
	[1] = "points_captured"
}

lang.AddPhrase("ru", taskID, "Знай свою цель")
lang.AddPhrase("ru", taskRequirements[1], "Точек захвачено: %s/%s")

lang.AddPhrase("en", taskID, "Know your objective")
lang.AddPhrase("en", taskRequirements[1], "Points captured: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Level = 2,
	Objectives = {
		{id = taskRequirements[1], requirement = 10}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "point_capture" then return end
			
			ply:AddTaskRequirement("task_capture", "points_captured")
		end,
	},
	Rewards = {
		["xp"] = 1500
	},

	OnComplete = function(ply)
		ply:AddPermXP(1500, true)
	end
}

--[[-------------------------------------------------------------------------
ПРОРЫВ
---------------------------------------------------------------------------]]
taskID = "task_breakthrough"
taskRequirements = {
	[1] = "rounds_won"
}

lang.AddPhrase("ru", taskID, "Прорыв")
lang.AddPhrase("ru", taskRequirements[1], "Раундов выиграно в Прорыве: %s/%s")

lang.AddPhrase("en", taskID, "Breakthrough")
lang.AddPhrase("en", taskRequirements[1], "Rounds won in Breakthrough: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Level = 3,
	Objectives = {
		{id = taskRequirements[1], requirement = 2}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward)
			if reward != "winner" then return end
			if maploader.Gamemode() != "push" then return end
			ply:AddTaskRequirement("task_breakthrough", "rounds_won")
		end,
	},
	Rewards = {
		["xp"] = 2000
	},

	OnComplete = function(ply)
		ply:AddPermXP(2000, true)
	end
}

--[[-------------------------------------------------------------------------
ПОДДЕРЖКА
---------------------------------------------------------------------------]]
taskID = "task_resupply"
taskRequirements = {
	[1] = "resupplied"
}

lang.AddPhrase("ru", taskID, "Поддержка")
lang.AddPhrase("ru", taskRequirements[1], "Получено очков поддержки: %s/%s")

lang.AddPhrase("en", taskID, "Support")
lang.AddPhrase("en", taskRequirements[1], "Support scores earned: %s/%s")

tasks.List[taskID] = {
	Category = TASK_BEGINNER,
	Level = 4,
	Objectives = {
		{id = taskRequirements[1], requirement = 2000}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if !reward:find('support') then
				return
			end

			ply:AddTaskRequirement("task_resupply", "resupplied", amount)
		end,
	},
	Rewards = {
		["xp"] = 1000
	},

	OnComplete = function(ply)
		ply:AddPermXP(1000, true)
	end
}

--[[-------------------------------------------------------------------------
МАСТЕР БЛИЖНЕГО БОЯ
---------------------------------------------------------------------------]]
taskID = "task_melee"
taskRequirements = {
	[1] = "enemies_killed"
}

lang.AddPhrase("ru", taskID, "Мастер ближнего боя")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов оружием ближнего боя: %s/%s")

lang.AddPhrase("en", taskID, "Master of melee combat")
lang.AddPhrase("en", taskRequirements[1], "Enemies killed by melee weapon: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 5,
	Objectives = {
		{id = taskRequirements[1], requirement = 20}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !dmg:IsDamageType(DMG_SLASH) and !dmg:IsDamageType(DMG_CLUB) then return end

			attacker:AddTaskRequirement("task_melee", "enemies_killed")
		end,
	},
	Rewards = {
		["xp"] = 1500
	},

	OnComplete = function(ply)
		ply:AddPermXP(1500, true)
	end
}

--[[-------------------------------------------------------------------------
ГРЕНАДЁР
---------------------------------------------------------------------------]]
taskID = "task_grenade"
taskRequirements = {
	[1] = "grenade_multikill"
}

lang.AddPhrase("ru", taskID, "Гренадёр")
lang.AddPhrase("ru", taskRequirements[1], "Требуется убить три противника одним взрывом гранаты")

lang.AddPhrase("en", taskID, "Grenadier")
lang.AddPhrase("en", taskRequirements[1], "You have to kill three enemies with one grenade")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 6,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !dmg:IsExplosionDamage() then return end
			if (attacker.i_FastStreak or 0) < 3 then return end

			attacker:AddTaskRequirement("task_grenade", "grenade_multikill")
		end,
	},
	Rewards = {
		["xp"] = 1000
	},

	OnComplete = function(ply)
		ply:AddPermXP(1000, true)
	end
}

--[[-------------------------------------------------------------------------
ПЕХОТИНЕЦ
---------------------------------------------------------------------------]]
taskID = "task_objectives_match"
taskRequirements = {
	[1] = "objectives"
}

lang.AddPhrase("ru", taskID, "Пехотинец")
lang.AddPhrase("ru", taskRequirements[1], "Требуется захватить 6 точек в одном раунде")

lang.AddPhrase("en", taskID, "Infantryman")
lang.AddPhrase("en", taskRequirements[1], "You have to capture 6 objectives in single round")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 6,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "point_capture" then return end

			ply.RoundCaptured = (ply.RoundCaptured or 0) + 1
			if ply.RoundCaptured >= 6 then
				ply:AddTaskRequirement("task_objectives_match", "objectives")
			end
		end
	},
	Rewards = {
		["xp"] = 2000
	},

	OnComplete = function(ply)
		ply:AddPermXP(2000, true)
	end
}

--[[-------------------------------------------------------------------------
ЗАЩИТНИК
---------------------------------------------------------------------------]]
taskID = "task_objectives_hold"
taskRequirements = {
	[1] = "hold_points"
}

lang.AddPhrase("ru", taskID, "Защитник")
lang.AddPhrase("ru", taskRequirements[1], "Очков получено за удержание точек: %s/%s")

lang.AddPhrase("en", taskID, "Defender")
lang.AddPhrase("en", taskRequirements[1], "Points earned for holding objectives: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 7,
	Objectives = {
		{id = taskRequirements[1], requirement = 1500}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "point_objective" then return end

			ply:AddTaskRequirement("task_objectives_hold", "hold_points", amount)
		end,
	},
	Rewards = {
		["xp"] = 2000
	},

	OnComplete = function(ply)
		ply:AddPermXP(2000, true)
	end
}

--[[-------------------------------------------------------------------------
ПОЧЁТНЫЙ СОЛДАТ
---------------------------------------------------------------------------]]
taskID = "task_topplayer"
taskRequirements = {
	[1] = "top_player"
}

lang.AddPhrase("ru", taskID, "Почётный солдат")
lang.AddPhrase("ru", taskRequirements[1], "Займите почётное место в списке лучших игроков в конце матча")

lang.AddPhrase("en", taskID, "Honorable soldier")
lang.AddPhrase("en", taskRequirements[1], "Take place at the top players list in the end of match")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 7,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "top_player" then return end

			ply:AddTaskRequirement("task_topplayer", "top_player")
		end,
	},
	Rewards = {
		["xp"] = 1500
	},

	OnComplete = function(ply)
		ply:AddPermXP(1500, true)
	end
}

--[[-------------------------------------------------------------------------
Меткий глаз
---------------------------------------------------------------------------]]
taskID = "task_headshots"
taskRequirements = {
	[1] = "headshots"
}

lang.AddPhrase("ru", taskID, "Меткий глаз")
lang.AddPhrase("ru", taskRequirements[1], "Убито в голову: %s/%s")

lang.AddPhrase("en", taskID, "Bulls eye")
lang.AddPhrase("en", taskRequirements[1], "Headshots: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 8,
	Objectives = {
		{id = taskRequirements[1], requirement = 50}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "headshot_kill" then return end

			ply:AddTaskRequirement("task_headshots", "headshots")
		end,
	},
	Rewards = {
		["xp"] = 2500
	},

	OnComplete = function(ply)
		ply:AddPermXP(2500, true)
	end
}

--[[-------------------------------------------------------------------------
Внимательный боец
---------------------------------------------------------------------------]]
taskID = "task_kd"
taskRequirements = {
	[1] = "kd_got"
}

lang.AddPhrase("ru", taskID, "Внимательный боец")
lang.AddPhrase("ru", taskRequirements[1], "Завершите матч с КД 2 или более")

lang.AddPhrase("en", taskID, "Attentive combatant")
lang.AddPhrase("en", taskRequirements[1], "Complete match with KD 2 or higher")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 9,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["OnGameState"] = function(oldGS, gs)
			if gs != GS_ROUND_END then return end
			for k, ply in pairs(player.GetAll()) do
				if ply:GetKDRatio() < 2 then continue end
				ply:AddTaskRequirement("task_kd", "kd_got")
			end
		end,
	},
	Rewards = {
		["xp"] = 1500
	},

	OnComplete = function(ply)
		ply:AddPermXP(1500, true)
	end
}

--[[-------------------------------------------------------------------------
ГОРДОСТЬ НАЦИИ
---------------------------------------------------------------------------]]
taskID = "task_scores"
taskRequirements = {
	[1] = "scores"
}

lang.AddPhrase("ru", taskID, "Гордость нации")
lang.AddPhrase("ru", taskRequirements[1], "Заработайте 3,000 очков в одном раунде")

lang.AddPhrase("en", taskID, "Pride of nation")
lang.AddPhrase("en", taskRequirements[1], "Earn 3,000 score in single round")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 10,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if ply:GetNWInt("fragscount") < 3000 then return end

			ply:AddTaskRequirement("task_scores", "scores")
		end,
	},
	Rewards = {
		["xp"] = 1000
	},

	OnComplete = function(ply)
		ply:AddPermXP(1000, true)
	end
}

--[[-------------------------------------------------------------------------
ТДМЩИК
---------------------------------------------------------------------------]]
taskID = "task_tdm"
taskRequirements = {
	[1] = "tdm_won",
}

lang.AddPhrase("ru", taskID, "Командный боец")
lang.AddPhrase("ru", taskRequirements[1], "Выиграно раундов в режиме Командный Бой: %s/%s")

lang.AddPhrase("en", taskID, "Team fighter")
lang.AddPhrase("en", taskRequirements[1], "Rounds won in Team Deathmatch: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 10,
	Objectives = {
		{id = taskRequirements[1], requirement = 5},
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward)
			if reward != "winner" then return end
			if maploader.Gamemode() != "tdm" then return end
			ply:AddTaskRequirement("task_tdm", "tdm_won")
		end,
	},
	Rewards = {
		["xp"] = 2000,
	},

	OnComplete = function(ply)
		ply:AddPermXP(2000, true)
	end
}

--[[-------------------------------------------------------------------------
ОФИЦЕР
---------------------------------------------------------------------------]]
taskID = "task_officer"
taskRequirements = {
	[1] = "beacon_spawns"
}

lang.AddPhrase("ru", taskID, "Офицер")
lang.AddPhrase("ru", taskRequirements[1], "Представлена высадка на маяке для игроков: %s/%s")

lang.AddPhrase("en", taskID, "Officer")
lang.AddPhrase("en", taskRequirements[1], "Provided spawn beacon deployment: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 10,
	Objectives = {
		{id = taskRequirements[1], requirement = 40}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "beacon_spawn" then return end
			ply:AddTaskRequirement("task_officer", "beacon_spawns")
		end,
	},
	Rewards = {
		["xp"] = 2000
	},

	OnComplete = function(ply)
		ply:AddPermXP(2000, true)
	end
}

--[[-------------------------------------------------------------------------
СНАЙПЕР
---------------------------------------------------------------------------]]
taskID = "task_sniper"
taskRequirements = {
	[1] = "longshots"
}

lang.AddPhrase("ru", taskID, "Снайпер")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов с большой дистанции: %s/%s")

lang.AddPhrase("en", taskID, "Sniper")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated from long distance: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 10,
	Objectives = {
		{id = taskRequirements[1], requirement = 25}
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "long_kill" then return end

			ply:AddTaskRequirement("task_sniper", "longshots")
		end,
	},
	Rewards = {
		["xp"] = 2500
	},

	OnComplete = function(ply)
		ply:AddPermXP(2500, true)
	end
}

--[[-------------------------------------------------------------------------
ИЗДЕВАТЕЛЬСТВО
---------------------------------------------------------------------------]]
taskID = "task_melee_prone"
taskRequirements = {
	[1] = "melee_prone_kills",
}

lang.AddPhrase("ru", taskID, "Издевательство")
lang.AddPhrase("ru", taskRequirements[1], "Убито лежащих оружием ближнего боя: %s/%s")

lang.AddPhrase("en", taskID, "Mockery")
lang.AddPhrase("en", taskRequirements[1], "Eliminated enemies in prone state with melee weapons: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 10,
	Objectives = {
		{id = taskRequirements[1], requirement = 10},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !dmg:IsDamageType(DMG_SLASH) and !dmg:IsDamageType(DMG_CLUB) then return end
			if !victim:IsProne() then return end

			attacker:AddTaskRequirement("task_melee_prone", "melee_prone_kills")
		end,
	},
	Rewards = {
		["xp"] = 3000,
	},

	OnComplete = function(ply)
		ply:AddPermXP(3000, true)
	end
}


--[[-------------------------------------------------------------------------
ПОЗИЦИОННОЕ ПРЕИМУЩЕСТВО
---------------------------------------------------------------------------]]
taskID = "task_highground"
taskRequirements = {
	[1] = "highground_kills"
}

lang.AddPhrase("ru", taskID, "Позиционное преимущество")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов с высокой позиции: %s/%s")

lang.AddPhrase("en", taskID, "High ground advantage")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated from high ground: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 11,
	Objectives = {
		{id = taskRequirements[1], requirement = 30}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !IsValid(victim) then return end
			local heightDifference = math.abs(attacker:GetPos().z - victim:GetPos().z)
			if heightDifference < 150 then return end

			attacker:AddTaskRequirement("task_highground", "highground_kills")
		end,
	},
	Rewards = {
		["xp"] = 3000
	},

	OnComplete = function(ply)
		ply:AddPermXP(3000, true)
	end
}

--[[-------------------------------------------------------------------------
УБИЙСТВА НА СОШКАХ
---------------------------------------------------------------------------]]
taskID = "task_bipodkills"
taskRequirements = {
	[1] = "bipod_kills"
}

lang.AddPhrase("ru", taskID, "Убийства на сошках")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов с использованием сошек: %s/%s")

lang.AddPhrase("en", taskID, "Bipod kills")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated while using bipod: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 12,
	Objectives = {
		{id = taskRequirements[1], requirement = 50}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			local wep = attacker:GetActiveWeapon()
			if !IsValid(wep) then return end
			if !wep.ArcCW then return end
			if !wep:GetInBipod() then return end

			attacker:AddTaskRequirement("task_bipodkills", "bipod_kills")
		end,
	},
	Rewards = {
		["xp"] = 3000
	},

	OnComplete = function(ply)
		ply:AddPermXP(3000, true)
	end
}

--[[-------------------------------------------------------------------------
УБИЙСТВА СИДЯ
---------------------------------------------------------------------------]]
taskID = "task_duckkills"
taskRequirements = {
	[1] = "duck_kills"
}

lang.AddPhrase("ru", taskID, "Убийства сидя")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов в положении сидя: %s/%s")

lang.AddPhrase("en", taskID, "Duck kills")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated while ducked: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 13,
	Objectives = {
		{id = taskRequirements[1], requirement = 40}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !attacker:Crouching() then return end

			attacker:AddTaskRequirement("task_duckkills", "duck_kills")
		end,
	},
	Rewards = {
		["xp"] = 3000
	},

	OnComplete = function(ply)
		ply:AddPermXP(3000, true)
	end
}


--[[-------------------------------------------------------------------------
УБИЙСТВА ЛЁЖА
---------------------------------------------------------------------------]]
taskID = "task_pronekills"
taskRequirements = {
	[1] = "prone_kills"
}

lang.AddPhrase("ru", taskID, "Убийства лёжа")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов в положении лёжа: %s/%s")

lang.AddPhrase("en", taskID, "Prone kills")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated while proned: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 13,
	Objectives = {
		{id = taskRequirements[1], requirement = 25}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !victim:IsProne() then return end

			attacker:AddTaskRequirement("task_pronekills", "prone_kills")
		end,
	},
	Rewards = {
		["xp"] = 3000
	},

	OnComplete = function(ply)
		ply:AddPermXP(3000, true)
	end
}

--[[-------------------------------------------------------------------------
ВОЕНИЗИРОВАННЫЙ ВОДИТЕЛЬ
---------------------------------------------------------------------------]]
taskID = "task_vehicle"
taskRequirements = {
	[1] = "vehicles_killed"
}

lang.AddPhrase("ru", taskID, "Военизированный водитель")
lang.AddPhrase("ru", taskRequirements[1], "Убито врагов, находясь в транспорте: %s/%s")

lang.AddPhrase("en", taskID, "War driver")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated while in vehicle: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 14,
	Objectives = {
		{id = taskRequirements[1], requirement = 20}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !attacker:InVehicle() then return end

			attacker:AddTaskRequirement("task_vehicle", "vehicles_killed")
		end,
	},
	Rewards = {
		["xp"] = 5000
	},

	OnComplete = function(ply)
		ply:AddPermXP(5000, true)
	end
}

--[[-------------------------------------------------------------------------
ЖЕСТКОСТЬ И МЯСО
---------------------------------------------------------------------------]]
taskID = "task_gore"
taskRequirements = {
	[1] = "gore_did"
}

lang.AddPhrase("ru", taskID, "Жестокость и мясо")
lang.AddPhrase("ru", taskRequirements[1], "Совершено критических попаданий по голове: %s/%s")

lang.AddPhrase("en", taskID, "Gore and meat")
lang.AddPhrase("en", taskRequirements[1], "Performed critical hits in head: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 14,
	Objectives = {
		{id = taskRequirements[1], requirement = 25}
	},
	Hooks = {
		["HeadshotCritical"] = function(attacker, victim, dmg)
			if !IsValid(attacker) then return end
			if !attacker:IsPlayer() then return end
			attacker:AddTaskRequirement("task_gore", "gore_did")
		end,
	},
	Rewards = {
		["xp"] = 4000
	},

	OnComplete = function(ply)
		ply:AddPermXP(4000, true)
	end
}

--[[-------------------------------------------------------------------------
ВОЙНА НА РАЗНЫХ ФРОНТАХ
---------------------------------------------------------------------------]]
taskID = "task_maps"
taskRequirements = {
	[1] = "played_maps"
}

lang.AddPhrase("ru", taskID, "Война на разных фронтах")
lang.AddPhrase("ru", taskRequirements[1], "Сыграно на уникальных картах: %s/%s")

lang.AddPhrase("en", taskID, "War on different fronts")
lang.AddPhrase("en", taskRequirements[1], "Played on unique maps: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 15,
	Objectives = {
		{id = taskRequirements[1], requirement = 5}
	},
	Hooks = {
		["OnGameState"] = function(oldGS, gs)
			if gs != GS_ROUND_END then return end
			for k, ply in pairs(player.GetAll()) do
				if !ply:IsTaskActive("task_maps") then continue end
				local maps = ply:GetPerm("played_maps", {})
				if maps[game.GetMap()] then return end

				maps[game.GetMap()] = true
				ply:SetPerm("played_maps", maps)

				ply:AddTaskRequirement("task_maps", "played_maps")
			end
		end,
	},
	Rewards = {
		["xp"] = 5000
	},

	OnComplete = function(ply)
		ply:AddPermXP(5000, true)
	end
}

--[[-------------------------------------------------------------------------
ВИДИШЬ ЯЩИКИ?
---------------------------------------------------------------------------]]
taskID = "task_crates"
taskRequirements = {
	[1] = "crate_kills",
}

lang.AddPhrase("ru", taskID, "Видишь ящики?")
lang.AddPhrase("ru", taskRequirements[1], "Совершено убийств с помощью ящиков: %s/%s")

lang.AddPhrase("en", taskID, "Can you see crates?")
lang.AddPhrase("en", taskRequirements[1], "Kills made with support crates: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 15,
	Objectives = {
		{id = taskRequirements[1], requirement = 10},
	},
	Hooks = {
		["InflictorKillMade"] = function(attacker, victim, class)
			if !class:find("crate") then return end
			attacker:AddTaskRequirement("task_crates", "crate_kills")
		end,
	},
	Rewards = {
		["xp"] = 8000,
	},

	OnComplete = function(ply)
		ply:AddPermXP(8000, true)
	end
}

--[[-------------------------------------------------------------------------
ДУША КОМПАНИМ
---------------------------------------------------------------------------]]
taskID = "task_support"
taskRequirements = {
	[1] = "support_xp",
}

lang.AddPhrase("ru", taskID, "Душа компании")
lang.AddPhrase("ru", taskRequirements[1], "Заработано очков поддержки: %s/%s")

lang.AddPhrase("en", taskID, "Sole of company")
lang.AddPhrase("en", taskRequirements[1], "Support rewards gained: %s/%s")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 15,
	Objectives = {
		{id = taskRequirements[1], requirement = 5000},
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if !reward:find('support') then
				return
			end

			ply:AddTaskRequirement("task_support", "support_xp", amount)
		end,
	},
	Rewards = {
		["xp"] = 15000,
	},

	OnComplete = function(ply)
		ply:AddPermXP(15000, true)
	end
}

--[[-------------------------------------------------------------------------
КРОВОЖАДНЫЙ ХИЩНИК
---------------------------------------------------------------------------]]
taskID = "task_limbs"
taskRequirements = {
	[1] = "shoot_head",
	[2] = "shoot_heart",
	[3] = "shoot_back",
	[4] = "shoot_eggs",
}

lang.AddPhrase("ru", taskID, "Кровожадный хищник")
lang.AddPhrase("ru", taskRequirements[1], "Убито в голову: %s/%s")
lang.AddPhrase("ru", taskRequirements[2], "Убито в сердце: %s/%s")
lang.AddPhrase("ru", taskRequirements[3], "Убито в спину: %s/%s")
lang.AddPhrase("ru", taskRequirements[4], "Убито в яйца: %s/%s")

lang.AddPhrase("en", taskID, "Bloody predator")
lang.AddPhrase("en", taskRequirements[1], "Killed in head: %s/%s")
lang.AddPhrase("en", taskRequirements[2], "Killed in heart: %s/%s")
lang.AddPhrase("en", taskRequirements[3], "Killed in back: %s/%s")
lang.AddPhrase("en", taskRequirements[4], "Killed in nuts: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 16,
	Objectives = {
		{id = taskRequirements[1], requirement = 100},
		{id = taskRequirements[2], requirement = 20},
		{id = taskRequirements[3], requirement = 20}
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			local hg = victim:LastHitGroup()
			if hg == HITGROUP_HEAD then
				attacker:AddTaskRequirement("task_limbs", "shoot_head")
			elseif hg == HITGROUP_HEART then
				attacker:AddTaskRequirement("task_limbs", "shoot_heart")
			elseif hg == HITGROUP_SPINE then
				attacker:AddTaskRequirement("task_limbs", "shoot_back")
			end
		end,
	},
	Rewards = {
		["xp"] = 30000,
		["coins"] = 4
	},

	OnComplete = function(ply)
		ply:AddPermXP(30000, true)
		ply:AddCoins(4, true)
	end
}

--[[-------------------------------------------------------------------------
СНАЙПЕДРИСТ
---------------------------------------------------------------------------]]
taskID = "task_snipedrist"
taskRequirements = {
	[1] = "killed_notprone_sniper",
	[2] = "killed_notprone_mg",
}

lang.AddPhrase("ru", taskID, "Никакого отдыха")
lang.AddPhrase("ru", taskRequirements[1], "Убито противников в стоячем положении за класс Снайпер: %s/%s")
lang.AddPhrase("ru", taskRequirements[2], "Убито противников в стоячем положении за класс Пулеметчик: %s/%s")

lang.AddPhrase("en", taskID, "No resting")
lang.AddPhrase("en", taskRequirements[1], "Eliminated enemies as Sniper while not in prone state: %s/%s")
lang.AddPhrase("en", taskRequirements[2], "Eliminated enemies as Minigunner while not in prone state: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 17,
	Objectives = {
		{id = taskRequirements[1], requirement = 150},
		{id = taskRequirements[2], requirement = 150},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if attacker:IsProne() or attacker:Crouching() then
				return
			end

			if attacker:GetDeriveClass() == "sniper" then
				attacker:AddTaskRequirement("task_snipedrist", "killed_notprone_sniper")
			elseif attacker:GetDeriveClass() == "mgunner" then
				attacker:AddTaskRequirement("task_snipedrist", "killed_notprone_mg")
			end
		end,
	},
	Rewards = {
		["xp"] = 40000,
		["coins"] = 5
	},

	OnComplete = function(ply)
		ply:AddPermXP(40000, true)
		ply:AddCoins(5, true)
	end
}

--[[-------------------------------------------------------------------------
ОПЫТНЫЙ ПИСТОЛЕТЧИК
---------------------------------------------------------------------------]]
taskID = "task_pistolexpert"
taskRequirements = {
	[1] = "killed_pistol",
}

lang.AddPhrase("ru", taskID, "Опытный пистолетчик")
lang.AddPhrase("ru", taskRequirements[1], "Убито противников из пистолета или револьвера: %s/%s")

lang.AddPhrase("en", taskID, "Pistol expert")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated with pistols or revolvers: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 17,
	Objectives = {
		{id = taskRequirements[1], requirement = 200},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			local wep = attacker:GetActiveWeapon()
			local inflictor = dmg:GetInflictor()

			if IsValid(wep) and wep:GetClass():find("pistol") or wep:GetClass():find("revolver") then
				attacker:AddTaskRequirement("task_pistolexpert", "killed_pistol")
			end
		end,
	},
	Rewards = {
		["xp"] = 35000,
		["coins"] = 4
	},

	OnComplete = function(ply)
		ply:AddPermXP(35000, true)
		ply:AddCoins(4, true)
	end
}

--[[-------------------------------------------------------------------------
ОПЫТНЫЙ ПИСТОЛЕТЧИК
---------------------------------------------------------------------------]]
taskID = "task_pistolexpert"
taskRequirements = {
	[1] = "killed_pistol",
}

lang.AddPhrase("ru", taskID, "Опытный пистолетчик")
lang.AddPhrase("ru", taskRequirements[1], "Убито противников из пистолета или револьвера: %s/%s")

lang.AddPhrase("en", taskID, "Pistol expert")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated with pistols or revolvers: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 18,
	Objectives = {
		{id = taskRequirements[1], requirement = 200},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			local wep = attacker:GetActiveWeapon()
			local inflictor = dmg:GetInflictor()

			if IsValid(wep) then
				if wep:GetClass():find("pistol") or wep:GetClass():find("revolver") then
					attacker:AddTaskRequirement("task_pistolexpert", "killed_pistol")
				end
			end
		end,
	},
	Rewards = {
		["xp"] = 25000,
		["coins"] = 4
	},

	OnComplete = function(ply)
		ply:AddPermXP(25000, true)
		ply:AddCoins(4, true)
	end
}

--[[-------------------------------------------------------------------------
ОПЫТНЫЙ ПИСТОЛЕТЧИК
---------------------------------------------------------------------------]]
taskID = "task_killedprone"
taskRequirements = {
	[1] = "proned_kills",
}

lang.AddPhrase("ru", taskID, "Добивая лежащих")
lang.AddPhrase("ru", taskRequirements[1], "Убито противников, которые находятся в лежащем состоянии: %s/%s")

lang.AddPhrase("en", taskID, "Killed the proned")
lang.AddPhrase("en", taskRequirements[1], "Enemies eliminated while they're in prone state: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 18,
	Objectives = {
		{id = taskRequirements[1], requirement = 70},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			if !victim:IsProne() then return end

			attacker:AddTaskRequirement("task_killedprone", "proned_kills")
		end,
	},
	Rewards = {
		["xp"] = 15000,
		["coins"] = 2
	},

	OnComplete = function(ply)
		ply:AddPermXP(15000, true)
		ply:AddCoins(2, true)
	end
}

--[[-------------------------------------------------------------------------
ОТ БЕДРА
---------------------------------------------------------------------------]]
taskID = "task_hipfire"
taskRequirements = {
	[1] = "hipfire_kills",
}

lang.AddPhrase("ru", taskID, "От бедра")
lang.AddPhrase("ru", taskRequirements[1], "Совершено убийств от бедра: %s/%s")

lang.AddPhrase("en", taskID, "Hipfire")
lang.AddPhrase("en", taskRequirements[1], "Hipfire kills: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 19,
	Objectives = {
		{id = taskRequirements[1], requirement = 250},
	},
	Hooks = {
		["EnemyKilled"] = function(attacker, victim, dmg)
			local wep = attacker:GetActiveWeapon()
			if !IsValid(wep) or !wep.ArcCW then return end
			if wep:GetState() == ArcCW.STATE_SIGHTS then return end

			attacker:AddTaskRequirement("task_hipfire", "hipfire_kills")
		end,
	},
	Rewards = {
		["xp"] = 60000,
		["coins"] = 5
	},

	OnComplete = function(ply)
		ply:AddPermXP(60000, true)
		ply:AddCoins(5, true)
	end
}

--[[-------------------------------------------------------------------------
ЗАХВАТЧИК
---------------------------------------------------------------------------]]
taskID = "task_conquer"
taskRequirements = {
	[1] = "obj_conquered",
}

lang.AddPhrase("ru", taskID, "Захватчик")
lang.AddPhrase("ru", taskRequirements[1], "Захвачено целей: %s/%s")

lang.AddPhrase("en", taskID, "Conquer")
lang.AddPhrase("en", taskRequirements[1], "Objectives captured: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 20,
	Objectives = {
		{id = taskRequirements[1], requirement = 250},
	},
	Hooks = {
		["PlayerGainedXP"] = function(ply, reward, amount)
			if reward != "point_capture" then return end

			ply:AddTaskRequirement("task_conquer", "obj_conquered")
		end,
	},
	Rewards = {
		["xp"] = 80000,
		["coins"] = 8
	},

	OnComplete = function(ply)
		ply:AddPermXP(80000, true)
		ply:AddCoins(8, true)
	end
}

--[[-------------------------------------------------------------------------
РЕАНИМАТОР
---------------------------------------------------------------------------]]
taskID = "task_reviver"
taskRequirements = {
	[1] = "players_revived",
}

lang.AddPhrase("ru", taskID, "Реаниматор")
lang.AddPhrase("ru", taskRequirements[1], "Оживлено союзников: %s/%s")

lang.AddPhrase("en", taskID, "Reviver")
lang.AddPhrase("en", taskRequirements[1], "Allies revived: %s/%s")

tasks.List[taskID] = {
	Category = TASK_EXPERT,
	Level = 21,
	Objectives = {
		{id = taskRequirements[1], requirement = 40},
	},
	Hooks = {
		["PlayerRevived"] = function(target, ply)
			if !IsValid(ply) then return end

			ply:AddTaskRequirement("task_reviver", "players_revived")
		end,
	},
	Rewards = {
		["xp"] = 60000,
		["coins"] = 5
	},

	OnComplete = function(ply)
		ply:AddPermXP(60000, true)
		ply:AddCoins(5, true)
	end
}

--[[-------------------------------------------------------------------------
Внимательный боец
---------------------------------------------------------------------------]]
taskID = "task_kd_2"
taskRequirements = {
	[1] = "kd_got"
}

lang.AddPhrase("ru", taskID, "Альфа-самец")
lang.AddPhrase("ru", taskRequirements[1], "Завершите матч с КД 3 или более, набрав 40 убийств")

lang.AddPhrase("en", taskID, "Alpha-male")
lang.AddPhrase("en", taskRequirements[1], "Complete match with KD 3 or higher, and 40 kills")

tasks.List[taskID] = {
	Category = TASK_COMMON,
	Level = 22,
	Objectives = {
		{id = taskRequirements[1], requirement = 1}
	},
	Hooks = {
		["OnGameState"] = function(oldGS, gs)
			if gs != GS_ROUND_END then return end
			for k, ply in pairs(player.GetAll()) do
				if ply:GetKDRatio() < 2 then continue end
				if ply:GetNWInt('PlayerKills') < 40 then continue end
				ply:AddTaskRequirement("task_kd_2", "kd_got")
			end
		end,
	},
	Rewards = {
		["xp"] = 50000,
		["coins"] = 6,
	},

	OnComplete = function(ply)
		ply:AddPermXP(50000, true)
		ply:AddCoins(6, true)
	end
}

--[[-------------------------------------------------------------------------
---------------------------------------------------------------------------]]



function tasks.Get()

	return tasks.List

end

function tasks.GetData(id)

	local storedTasks = tasks.Get()

	return storedTasks[id]

end