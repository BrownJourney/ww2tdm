
local PLAYER = FindMetaTable('Player')

function PLAYER:InitProgression()

	if self:GetLevel() == 0 then

		self:SetLevel(1)

	end

	self:SetNetInt('level', self:GetLevel())
	self:SetNetInt('coins', self:GetCoins())
	self:SetNetInt('elitecoins', self:GetEliteCoins())
	self:SetNetInt('xp', self:GetPermXP())

	self.BeginStats = {
		xp = self:GetPermXP(),
		level = self:GetLevel()
	}

	self.RoundXP = {}
	self:SetFrags(0)

end

util.AddNetworkString('ShowRewards')
function ShowPlayerRewards()

	for k, ply in pairs(player.GetAll()) do

		if !ply.BeginStats or !ply.RoundXP then

			continue

		end

		ply:CloseAllUI()

		net.Start('ShowRewards')
			net.WriteTable(ply.BeginStats)
			net.WriteTable(ply.RoundXP)
		net.Send(ply)

	end

end

--[[-------------------------------------------------------------------------
BOOSTS
---------------------------------------------------------------------------]]

function PLAYER:AddBoost(hours)

	local tSeconds = INT_HOUR_IN_SECONDS * hours

	if hours == -1 then

		self:SetPerm("boost_expire", -1)
		self:SetNetInt("boost_expire", self:GetBoost())

	else

		self:SetPerm("boost_expire", self:GetBoost() + tSeconds)
		self:SetNetInt("boost_expire", self:GetBoost())

	end

end

--[[-------------------------------------------------------------------------
XP
---------------------------------------------------------------------------]]
util.AddNetworkString("ShowXPReward")
function PLAYER:AddXP(reward)

	local gs = gamestate.Get()

	if gs != GS_ROUND_PLAYING and gs != GS_ROUND_END and gs != GS_GAME_OVER then

		return

	end

	local gametype = maploader.Gamemode()
	local rewardTable = CFG.Rewards[gametype]

	if !rewardTable then

		Print(CLR_MSG_YELLOW, "There is no reward table for gamemode '" .. gametype .. "'!")
		return

	end

	local xpAmount = rewardTable[reward]

	if !xpAmount then

		if !CFG.Rewards.general[reward] then

			Print(CLR_MSG_YELLOW, "There is no info for reward '" .. reward .. "'!")
			return

		end

		xpAmount = CFG.Rewards.general[reward]

	end

	if self:GetNWBool("InZone") and reward:find("support") then

		return

	end

	self:AddFrags(xpAmount)
	self:AddStatValue("PlayerScores", xpAmount)

	local trueXPAmount = xpAmount

	if self:IsBoosting() then

		self:WriteRoundReward("doublexp", xpAmount)

		xpAmount = xpAmount * 2
		
	end

	self:AddPermXP(xpAmount)

	local classXP = xpAmount
	local favourite = self:GetClassInfo("Favourite", self.wasClass) or {}

	local isClassReward = istable(favourite) and favourite[reward] or favourite == reward

	if isClassReward then

		classXP = classXP * 2

	end

	if self:IsPremium() then

		net.Start("ShowXPReward")
			net.WriteString(reward)
			net.WriteInt(xpAmount, 20)
		net.Send(self)

	end

	self:AddClassXP(classXP)

	self:WriteRoundReward(reward, trueXPAmount)

	hook.Run("PlayerGainedXP", self, reward, xpAmount)

end

function PLAYER:WriteRoundReward(reward, amount)

	if !self.RoundXP then

		self.RoundXP = {}

	end

	if !self.RoundXP[reward] then

		self.RoundXP[reward] = 0

	end

	self.RoundXP[reward] = self.RoundXP[reward] + amount

end

function PLAYER:SetPermXP(xp)

	self:SetPerm('xp', xp)
	self:SetNetInt('xp', xp)

end

function PLAYER:AddPermXP(xp, shouldNotify)

	if shouldNotify then

		xp = xp + tasks.GetPremiumBonus("xp", xp, self)

		notify.Custom(self, "xp_gained", xp)

		self.BeginStats.xp = self.BeginStats.xp + xp

	end

	self:SetPermXP(self:GetPermXP() + xp)

	if self:GetPermXP() < 0 then

		self:SetPermXP(0)

	end

	self:CheckLevelUp(shouldNotify)

end

--[[-------------------------------------------------------------------------
LEVEL
---------------------------------------------------------------------------]]

function PLAYER:SetLevel(level)

	self:SetPerm('level', level)
	self:SetNetInt('level', level)

end

function PLAYER:AddLevel()

	local newLevel = self:GetLevel() + 1
	self:SetLevel(newLevel)

	if PROGRESSION_LEVELS[newLevel] then

		self:AddCoins(PROGRESSION_LEVELS[newLevel].reward)

	end

	hook.Run("PlayerNewLevel", self, newLevel)

end

function PLAYER:CheckLevelUp(shouldNotify)

	local nextLevel = PROGRESSION_LEVELS[self:GetLevel() + 1]

	if !nextLevel then

		return

	end

	if self:GetPermXP() < nextLevel.xp then

		return

	end

	local xpExcess = self:GetPermXP() - nextLevel.xp

	self:SetPermXP(xpExcess)
	self:AddLevel()

	if shouldNotify then

		self:ShowUI("newlevel")

	end

end

--[[-------------------------------------------------------------------------
COINS
---------------------------------------------------------------------------]]

function PLAYER:SetCoins(coins)

	self:SetPerm('coins', coins)
	self:SetNetInt('coins', coins)

end

function PLAYER:AddCoins(coins, shouldNotify)

	self:SetCoins(self:GetCoins() + coins)

	if shouldNotify then

		notify.Custom(self, "coins_gained", coins)

	end

end

function PLAYER:SetEliteCoins(coins)

	self:SetPerm('elitecoins', coins)
	self:SetNetInt('elitecoins', coins)

end

function PLAYER:AddEliteCoins(coins, shouldNotify)

	self:SetEliteCoins(self:GetEliteCoins() + coins)

	if shouldNotify then

		notify.Custom(self, "elitecoins_gained", coins)

	end

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]


hook.Add("PlayerInitialSpawn", "InitPlayerXP", function(ply)

	ply:InitProgression()

end)

hook.Add("PlayerFullyLoaded", "InitPlayerBoost", function(ply)

	notify.Add(ply, "Двойной буст на 4 часа был добавлен на ваш аккаунт!", nil, 8)
	ply:AddBoost(4)	

	if !ply:IsBoosting() then return end
	
	ply:SetNetInt("boost_expire", ply:GetBoost())

end)

hook.Add("PlayerFullyLoaded", "ECChecker", function(ply)
	if ply:GetPerm("ec_received") == true then
		return
	end

	for classid, v in pairs(faction.levels) do
		if ply:GetClassLevel(classid) < CFG.ClassMaxLevel then
			continue
		end

		ply:AddEliteCoins(CFG.EliteCoinsForLevel)
	end

	ply:SetPerm("ec_received", true)
end)

--[[-------------------------------------------------------------------------
CHEATS
---------------------------------------------------------------------------]]

concommand.Add("ww2_unlock", function(ply)
	if !ply:IsSuperAdmin() then return end

	notify.Add(ply, "Наслаждайся бонусами, читер")

	ply:SetLevel(#PROGRESSION_LEVELS)
	ply:AddCoins(999)
	ply:AddEliteCoins(999)

	for classid, level in pairs(faction.levels) do

		ply:AddClassLevel(CFG.ClassMaxLevel, classid)

	end
end)