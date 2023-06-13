-- leave as is

local PLAYER = FindMetaTable('Player')
local uid = 'playerinfo'

function perm_Init()
	gData.CreateTable(uid)

	timer.Create("SavePlayerData", 30, 0, function()
		local gTable = gData.get(uid)
		if !gData.PlayerDataModified then return end
		for k, v in pairs(player.GetAll()) do
			if !v.needToSave then
				continue
			end

			if !v.PermData then
				continue
			end

			gTable[v:SteamID()] = v.PermData

			v.needToSave = false
		end

		gData.PlayerDataModified = false
		gData.ChangeTable(uid, gTable)
	end)
end

function perm_Reset()
	gData.RemoveTable(uid)
	perm_Init()
end

function perm_getBySID(sid, valueId)
	local data =  gData.get(uid)
	if !data[sid] then
		return 0
	end

	return data[sid][valueId] or 0
end

function perm_setBySID(sid, valueId, param)
	if !gData.get(uid)[sid] then
		return
	end

	local gTable = gData.get(uid)
	gTable[sid][valueId] = param

	gData.ChangeTable(uid, gTable)
end

function PLAYER:InitPerm()
	local sid = self:SteamID()
	local gTable = gData.get(uid)

	if gTable[sid] then
		self.PermData = gTable[sid]
		return self.PermData
	end

	self.PermData = {}
	gTable[sid] = {}
	gData.ChangeTable(uid, gTable)

	return self.PermData
end

function PLAYER:SetPerm(valueId, param)
	if !self:GetInfoTable() then
		self:InitPerm()
	end

	self.PermData[valueId] = param
	self.needToSave = true
	gData.PlayerDataModified = true
end

function PLAYER:GetPerm(valueId, baseValue)
	local permData = self.PermData
	if !permData then
		permData = self:InitPerm()
	end

	if permData[valueId] == nil then
		return baseValue
	end

	return permData[valueId]
end

function PLAYER:GetInfoTable()
	return gData.get(uid)[self:SteamID()]
end

function PLAYER:SavePermData()
	if !self.PermData then
		return
	end

	if !self.needToSave then
		return
	end

	local gTable = gData.get(uid)
	gTable[self:SteamID()] = self.PermData

	gData.ChangeTable(uid, gTable)
end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add('InitPostEntity', 'playerinfo.InitPostEntity', perm_Init)
hook.Add('PlayerInitialSpawn', 'playerinfo.CheckInitial', function(ply)
	ply:InitPerm()
end)
hook.Add("PlayerDisconnected", 'playerinfo.SaveStuff', function(ply)
	ply:SavePermData()
end)

hook.Add("ShutDown", 'playerinfo.SaveStuff', function()
	for k, ply in pairs(player.GetAll()) do
		ply:SavePermData()
	end
end)