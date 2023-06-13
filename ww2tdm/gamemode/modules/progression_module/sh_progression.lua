
MAX_LEVEL_XP = 100000

INT_MINUTE_IN_SECONDS = 60
INT_HOUR_IN_SECONDS = 3600

PROGRESSION_LEVELS = {
	[1] = {xp = 1000, reward = 1, ribbon = "1_1"},
	[2] = {xp = 1500, reward = 2, ribbon = "1_2"},
	[3] = {xp = 2000, reward = 2, ribbon = "1_3"},
	[4] = {xp = 2500, reward = 3, ribbon = "1_4"},
	[5] = {xp = 3000, reward = 3, ribbon = "1_5"},
	[6] = {xp = 5000, reward = 4},
	[7] = {xp = 7000, reward = 4, ribbon = "1_6"},
	[8] = {xp = 10000, reward = 5},
	[9] = {xp = 15000, reward = 5, ribbon = "1_6"},
	[10] = {xp = 20000, reward = 5},
	[11] = {xp = 25000, reward = 5, ribbon = "1_7"},
	[12] = {xp = 30000, reward = 5},
	[13] = {xp = 35000, reward = 5, ribbon = "1_8"},
	[14] = {xp = 40000, reward = 6},
	[15] = {xp = 45000, reward = 6, ribbon = "1_9"},
	[16] = {xp = 50000, reward = 7},
	[17] = {xp = 55000, reward = 7, ribbon = "1_10"},
	[18] = {xp = 60000, reward = 8},
	[19] = {xp = 65000, reward = 8},
	[20] = {xp = 70000, reward = 8, ribbon = "1_11"},
	[21] = {xp = 75000, reward = 8},
	[22] = {xp = 80000, reward = 8},
	[23] = {xp = 85000, reward = 10, ribbon = "1_12"},
	[24] = {xp = 90000, reward = 10},
	[25] = {xp = MAX_LEVEL_XP, reward = 10},
	[26] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_13"},
	[27] = {xp = MAX_LEVEL_XP, reward = 10},
	[28] = {xp = MAX_LEVEL_XP, reward = 10},
	[29] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_14"},
	[30] = {xp = MAX_LEVEL_XP, reward = 10},
	[31] = {xp = MAX_LEVEL_XP, reward = 10},
	[32] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_15"},
	[33] = {xp = MAX_LEVEL_XP, reward = 10},
	[34] = {xp = MAX_LEVEL_XP, reward = 10},
	[35] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_16"},
	[36] = {xp = MAX_LEVEL_XP, reward = 10},
	[37] = {xp = MAX_LEVEL_XP, reward = 10},
	[38] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_17"},
	[39] = {xp = MAX_LEVEL_XP, reward = 10},
	[40] = {xp = MAX_LEVEL_XP, reward = 10},
	[41] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_18"},
	[42] = {xp = MAX_LEVEL_XP, reward = 10},
	[43] = {xp = MAX_LEVEL_XP, reward = 10},
	[44] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_19"},
	[45] = {xp = MAX_LEVEL_XP, reward = 10},
	[46] = {xp = MAX_LEVEL_XP, reward = 10},
	[47] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_20"},
	[48] = {xp = MAX_LEVEL_XP, reward = 10},
	[49] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_21"},
	[50] = {xp = MAX_LEVEL_XP, reward = 10, ribbon = "1_22"},
}

local PLAYER = FindMetaTable('Player')

function PLAYER:GetLevel()

	if SERVER then

		return self:GetPerm('level', 0)

	end

	return self:GetNWInt('level')

end

function PLAYER:GetCoins()

	if SERVER then

		return self:GetPerm('coins', 0)

	end

	return self:GetNWInt('coins')

end

function PLAYER:GetEliteCoins()

	if SERVER then

		return self:GetPerm('elitecoins', 0)

	end

	return self:GetNWInt('elitecoins')

end

function PLAYER:GetPermXP()

	if SERVER then

		return self:GetPerm('xp', 0)

	end

	return self:GetNWInt('xp', 0)

end

PLAYER._AddFrags = PLAYER._AddFrags or PLAYER.AddFrags
function PLAYER:AddFrags(fragscount)

	self:_AddFrags(fragscount)
	self:SetNetInt('fragscount', self:Frags())

end

PLAYER._SetFrags = PLAYER._SetFrags or PLAYER.SetFrags
function PLAYER:SetFrags(fragscount)

	self:_SetFrags(fragscount)
	self:SetNetInt('fragscount', self:Frags())

end

function PLAYER:FindRibbon(facID, level)

	local ribbon;
	facID = isstring(facID) and facID or faction.GetID(self:Team())
	level = isnumber(level) and level or self:GetLevel()

	for k, v in ipairs(PROGRESSION_LEVELS) do

		if v.ribbon and level >= k then

			ribbon = v.ribbon

		end

	end

	if FACTION_REPLACE_ID[facID] then

		facID = FACTION_REPLACE_ID[facID]

	end

	local prefixes = {
		[FACTION_USSR] = "3",
		[FACTION_GERMANY] = "2",
		[FACTION_USA] = "1"
	}

	if ribbon and facID and prefixes[facID] then

		ribbon = "hud/ranks/" .. (facID or "") .. '/' .. prefixes[facID] .. '_' .. ribbon .. '.png'

	end

	return ribbon

end

function PLAYER:GetBoost()

	local boostInt = self:GetNWInt("boost_expire", 0)

	if SERVER then

		boostInt = self:GetPerm("boost_expire", 0)

	end

	local osTime = os.time()

	if boostInt == 0 then

		return osTime

	elseif boostInt == -1 then

		return -1

	end

	return math.max(boostInt, osTime)

end

function PLAYER:IsBoosting()

	local boostInt = self:GetBoost()

	if boostInt == -1 then

		return true

	end

	return boostInt - os.time() > 0

end