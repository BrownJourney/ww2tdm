local ENTITY = FindMetaTable('Entity')

local debugging = false

function calcBitSize(num)
	local bitSize = 3
	local mul = 2
	local max = 2
	local min = 0
	for i = 1, 30 do
		max = max * mul
		min = -max
		local let_max = max - 1
		if num >= min and num <= let_max then
			return bitSize
		end

		bitSize = bitSize + 1
	end
end

BJ_VARS = BJ_VARS or {}

function ENTITY:GetBJString(id, template)
	if !BJ_VARS[self:SteamID64()] then

		BJ_VARS[self:SteamID64()] = {}

	end

	return BJ_VARS[self:SteamID64()][id] or (template or '')
end

if (SERVER) then
	util.AddNetworkString('NetInt')
	util.AddNetworkString('NetFloat')
	util.AddNetworkString('NetBool')
	util.AddNetworkString('NetString')
	util.AddNetworkString('NetEntity')
	util.AddNetworkString('WorldBool')
	util.AddNetworkString('WorldInt')
	util.AddNetworkString('WorldFloat')
	util.AddNetworkString('WorldString')

	--[[-------------------------------------------------------------------------
	True-Networking
	---------------------------------------------------------------------------]]

	util.AddNetworkString('BJVars_String')

	function ClearBJVars(ply)
		if !BJ_VARS[ply:SteamID64()] then
			return
		end

		BJ_VARS[ply:SteamID64()] = nil
	end

	function UpdateBJVars(ply)
		for sid, value in pairs( BJ_VARS ) do
			for id, var in pairs( value ) do
				net.Start('BJVars_String')
					net.WriteString(sid)
					net.WriteString(id)
					net.WriteString(var)
				net.Send(ply) 
			end
		end
	end

	function ENTITY:SetBJString(id, var)
		if !self:IsPlayer() then
			error('SetBJString is allowed for players only!')
			return
		end

		if !BJ_VARS[self:SteamID64()] then
			BJ_VARS[self:SteamID64()] = {}
		end

		BJ_VARS[self:SteamID64()][id] = var

		net.Start('BJVars_String')
			net.WriteString(self:SteamID64())
			net.WriteString(id)
			net.WriteString(var)
		net.Broadcast()

	end

	hook.Add('PlayerDisconnected', 'ClearBJVars', ClearBJVars)
	hook.Add('PlayerInitialSpawn', 'UpdateBJVars', UpdateBJVars)
	hook.Add('onCharacterLoaded', 'UpdateOnLoad', UpdateBJVars)

	--[[-------------------------------------------------------------------------
	---------------------------------------------------------------------------]]

	function ENTITY:SetNetInt(id, var)
		if !isnumber(var) then
			return
		end

		self:SetNWInt(id, var)

		if debugging then
			print('setting int '..id)
		end

		net.Start('NetInt')
			net.WriteEntity(self)
			net.WriteString(id)
			net.WriteUInt(calcBitSize(var) - 1, 5)
			net.WriteInt(var, calcBitSize(var))
		net.Broadcast()
	end

	function ENTITY:SetNetFloat(id, var, bYourself)
		self:SetNWFloat(id, var)

		if debugging then
			print('setting float '..id)
		end
	
		net.Start('NetFloat')
			net.WriteEntity(self)
			net.WriteString(id)
			net.WriteFloat(var)
		bYourself = tobool(bYourself) or false
		if bYourself then
			net.Send(self)
		else
			net.Broadcast()
		end
	end

	function ENTITY:SetNetBool(id, var, bYourself)
		if !isbool(var) then
			return
		end

		self:SetNWBool(id, var)

		if debugging then
			print('setting bool '..id)
		end
	
		net.Start('NetBool')
			net.WriteEntity(self)
			net.WriteString(id)
			net.WriteBool(var)
		bYourself = tobool(bYourself) or false
		if bYourself then
			net.Send(self)
		else
			net.Broadcast()
		end
	end

	function ENTITY:SetNetString(id, var, bYourself)
		if !isstring(var) then
			return
		end

		self:SetNWString(id, var)

		if debugging then
			print('setting string '..id)
		end
	
		net.Start('NetString')
			net.WriteEntity(self)
			net.WriteString(id)
			net.WriteString(var)
		bYourself = tobool(bYourself) or false
		if bYourself then
			net.Send(self)
		else
			net.Broadcast()
		end
	end

	function ENTITY:SetNetEntity(id, var, bYourself)
		self:SetNWEntity(id, var)

		if debugging then
			print('setting ent '..id)
		end
	
		net.Start('NetEntity')
			net.WriteEntity(self)
			net.WriteString(id)
			net.WriteEntity(var)
		bYourself = tobool(bYourself) or false
		if bYourself then
			net.Send(self)
		else
			net.Broadcast()
		end
	end

	function SetWorldBool(id, var)
		SetGlobalBool(id, var)

		if debugging then
			print('setting world bool '..id)
		end

		net.Start('WorldBool')
			net.WriteString(id)
			net.WriteBool(var)
		net.Broadcast()
	end

	function SetWorldInt(id, var)
		SetGlobalInt(id, var)
		
		if debugging then
			print('setting world int '..id)
		end

		net.Start('WorldInt')
			net.WriteString(id)
			net.WriteInt(var, 32)
		net.Broadcast()
	end

	function SetWorldFloat(id, var)
		SetGlobalFloat(id, var)
		
		if debugging then
			print('setting world float '..id)
		end

		net.Start('WorldFloat')
			net.WriteString(id)
			net.WriteFloat(var)
		net.Broadcast()
	end

	function SetWorldString(id, var)
		SetGlobalString(id, var)
		
		if debugging then
			print('setting world string '..id)
		end

		net.Start('WorldString')
			net.WriteString(id)
			net.WriteString(var)
		net.Broadcast()
	end
end

function net.WriteValue(value)
	local isNumber, isString, isTable, isBool, isColor

	if isnumber(value) then isNumber = true end
	if isstring(value) then isString = true end
	if istable(value) then isTable = true end
	if isbool(value) then isBool = true end
	if IsColor(value) then isColor = true end

	if isNumber then
		net.WriteString('number')
		net.WriteInt(value, 32)
	elseif isString then
		net.WriteString('string')
		net.WriteString(value)
	elseif isTable then
		net.WriteString('table')
		net.WriteTable(value)
	elseif isBool then
		net.WriteString('bool')
		net.WriteBool(value)
	elseif isColor then
		net.WriteString('color')
		net.WriteColor(value)
	end
end

function net.ReadValue()
	local _type = net.ReadString()
	local value

	if _type == 'number' then value = net.ReadInt(32) end
	if _type == 'string' then value = net.ReadString() end
	if _type == 'bool' then value = net.ReadBool() end
	if _type == 'table' then value = net.ReadTable() end
	if _type == 'color' then value = net.ReadColor() end

	return value
end

net.OrigStart = net.OrigStart or net.Start
function net.Start(msgName, unreliable)
	if debugging and !msgName:lower():find('dbugr') then
		print( 'starting network message "' .. msgName .. '"' )
	end
	net.OrigStart(msgName, unreliable)
end

ENTITY._SetNWInt = ENTITY._SetNWInt or ENTITY.SetNWInt
function ENTITY:SetNWInt(id, var)
	if debugging then
		-- print(id, var)
		-- debug.Trace()
	end
	self:_SetNWInt(id, var)
end

if (CLIENT) then
	net.Receive('BJVars_String', function(len)
		local sid = net.ReadString()
		local id = net.ReadString()
		local var = net.ReadString()

		if !BJ_VARS[sid] then BJ_VARS[sid] = {} end

		BJ_VARS[sid][id] = var
	end)

	net.Receive('NetInt', function(len)
		local ent = net.ReadEntity()
		local id = net.ReadString()
		local bits = net.ReadUInt(5) + 1
		local var = net.ReadInt(bits)

		if IsValid(ent) then
			ent:SetNWInt(id, var)
			hook.Run('NetworkIntReceived', ent, id, var)
		end
	end)

	net.Receive('NetFloat', function(len)
		local ent = net.ReadEntity()
		local id = net.ReadString()
		local var = net.ReadFloat()

		if IsValid(ent) then
			ent:SetNWFloat(id, var)
			hook.Run('NetworkFloatReceived', ent, id, var)
		end
	end)

	net.Receive('NetBool', function(len)
		local ent = net.ReadEntity()
		local id = net.ReadString()
		local var = net.ReadBool()

		if IsValid(ent) then
			ent:SetNWBool(id, var)
			hook.Run('NetworkBoolReceived', ent, id, var)
		end
	end)

	net.Receive('NetString', function(len)
		local ent = net.ReadEntity()
		local id = net.ReadString()
		local var = net.ReadString()

		if IsValid(ent) then
			ent:SetNWString(id, var)
		end
	end)

	net.Receive('NetEntity', function(len)
		local ent = net.ReadEntity()
		local id = net.ReadString()
		local var = net.ReadEntity()

		if IsValid(ent) then
			ent:SetNWEntity(id, var)
		end
	end)

	net.Receive('WorldBool', function(len)
		local id = net.ReadString()
		local var = net.ReadBool()

		SetGlobalBool(id, var)
	end)

	net.Receive('WorldInt', function(len)
		local id = net.ReadString()
		local var = net.ReadInt(32)

		hook.Run('NetworkWorldIntReceived', id, var)
		SetGlobalInt(id, var)
	end)

	net.Receive('WorldFloat', function(len)
		local id = net.ReadString()
		local var = net.ReadFloat()

		SetGlobalFloat(id, var)
	end)

	net.Receive('WorldString', function(len)
		local id = net.ReadString()
		local var = net.ReadString()

		SetGlobalString(id, var)
	end)
end