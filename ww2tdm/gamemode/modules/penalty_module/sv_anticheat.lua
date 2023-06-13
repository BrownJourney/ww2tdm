local AC = AC;

AC.KickedPlayers = AC.KickedPlayers or {}

AC.MaxDetects = 15 -- Detects to get banned permanently and globally

function AC.PlayerLoaded(ply)

	ply.JoinTimeAC = CurTime()
	ply.PlayerFullyAuthenticated = true

end

function AC.KickPlayer(ply, reason, detects)

	if !IsValid(ply) then

		return

	end

	reason = tostring(reason) or ''
	detects = tonumber(detects) or 1

	reason = reason .. '\n' .. 'You have to wait until map change before you can join'

	AC.KickedPlayers[ply:SteamID64()] = reason
	ply:Kick(reason)
	ply:AddDetects(detects)

end

function AC.BanPlayer(steamid, reason)



end

--[[-------------------------------------------------------------------------
PLAYER
---------------------------------------------------------------------------]]

local PLAYER = FindMetaTable('Player')

function PLAYER:ZeroACStats() -- test function, should not be called anywhere

	self.i_Hits = 0
	self.i_Shots = 0
	self.i_Headshots = 0

	self:SetPerm('Detects', 0)

end

function PLAYER:GetKDRatio()

	return self:GetNWInt('PlayerKills') / math.max(self:GetNWInt('PlayerDeaths'), 1)

end

function PLAYER:GetAccurancy()

	return (self.i_Hits or 0) / (self.i_Shots or 1)

end

function PLAYER:AddDetects(amount)

	amount = tonumber(amount) or 1

	local newDetects = self:GetDetects() + amount
	self:SetPerm("Detects", newDetects)
	Print(CLR_MSG_ORANGE, '==========================')
	Print(CLR_MSG_ORANGE, 'Detected suspisious behavior')
	Print(CLR_MSG_ORANGE, 'Player name: ' .. self:Name())
	Print(CLR_MSG_ORANGE, 'Player Steam ID: ' .. self:SteamID())
	Print(CLR_MSG_ORANGE, 'Detects: ' .. newDetects)
	Print(CLR_MSG_ORANGE, '==========================')

	if newDetects >= AC.MaxDetects then

		-- TODO: Global Ban implementation

	end

end

function PLAYER:GetDetects()

	return self:GetPerm('Detects') or 0

end

local teamkill_kick_message = "YOU ARE KICKED FROM ROUND FOR TEAMKILLING"

function PLAYER:AddTeamkill()

	self:AddXP('team_kill')
	self:SetPerm("Teamkills", self:GetPerm("Teamkills", 0) + 1)

	if self:GetPerm("Teamkills") >= CFG.MaxTeamkills and !self:IsSuperAdmin() then

		self:SetPerm("Teamkills", 0)
		AC.KickPlayer(self, teamkill_kick_message)

	end

end

function PLAYER:PunishTeamkiller(victim)

	local victim = self.lastKiller

	if !IsValid(victim) then

		notify.Add(self, "left_server")
		return

	end

	victim:AddTeamkill()
	self.lastKiller = nil;
	notify.Add(self, "punished_teamkiller")

end

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

util.AddNetworkString("__writeInternalData")

util.AddNetworkString('TeamkillPenalty')
net.Receive('TeamkillPenalty', function(len, ply)
	ply:PunishTeamkiller()
end)

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add('PlayerInitialSpawn', 'AC.PlayerLoaded', AC.PlayerLoaded)

hook.Add("CheckPassword", "AC.NiggerProtection", function(sid64, ip, svPass, clPass, name)
	local bannedList = gData.get("ipBanned") or {}
	if bannedList[ip] then
		return false, "Ты в бане, майонезный ушлепок"
	end

	if AC.KickedPlayers[sid64] then
		return false, "You have to wait until map changes to connect"
	end
end)

hook.Add('OnGameState', 'ResetTeamkills', function(oldGS, gs)
	if gs != GS_GAME_OVER then return end
	for k, ply in pairs(player.GetAll()) do
		ply:SetPerm('Teamkills', 0)
	end
end)