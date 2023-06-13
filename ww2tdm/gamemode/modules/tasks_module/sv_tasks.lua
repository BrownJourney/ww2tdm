local tasks = tasks;

local PLAYER = FindMetaTable("Player")

function PLAYER:RefreshTasks()

	for id, data in pairs(tasks.Get()) do

		if self:GetLevel() < (data.Level or 0) then

			continue

		end

		self:AddTask(id)

	end

end

function PLAYER:GetTasks()

	return self:GetPerm("tasks", {})

end

function PLAYER:AddTask(id)

	if self:IsTaskCompleted(id) or self:IsTaskActive(id) then

		return

	end

	local plyTasks = self:GetTasks()
	local progressTable = {}

	local taskData = tasks.GetData(id)

	for k, v in pairs(taskData.Objectives) do

		progressTable[v.id] = 0
 
	end

	plyTasks[id] = {
		phase = 1,
		progress = progressTable
	}

	self:SetPerm("tasks", plyTasks)

	notify.Custom(self, "task_available", id)

end

function PLAYER:AddTaskRequirement(id, requirement, amount)

	amount = tonumber(amount) or 1

	if !self:IsTaskActive(id) then

		return

	end

	local plyTasks = self:GetTasks()
	if !plyTasks[id].progress then

		return

	end

	plyTasks[id].progress[requirement] = plyTasks[id].progress[requirement] + amount

	self:CheckTaskRequirements(id)

	self:SetPerm("tasks", plyTasks)

end

function PLAYER:CheckTaskRequirements(id)

	if !self:IsTaskActive(id) then

		return

	end

	local plyTasks = self:GetTasks()
	local taskData = tasks.GetData(id)

	local progress = plyTasks[id].progress

	for k, v in pairs(taskData.Objectives) do

		if progress[v.id] < v.requirement then

			return;

		end

	end

	plyTasks[id].finished = true

	self:SetPerm("tasks", plyTasks)

end

function PLAYER:CompleteTask(id)

	if !self:IsTaskActive(id) then

		return

	end

	local plyTask = self:GetTasks()

	if !plyTask[id].finished then

		return

	end

	plyTask[id] = nil;

	notify.Custom(self, "task_completed", id)

	local completedTasks = self:GetPerm("completedTasks", {})
	completedTasks[id] = true
	self:SetPerm("completedTasks", completedTasks)

	local taskData = tasks.GetData(id)

	taskData.OnComplete(self)

end

function tasks.InitializeHooks()

	for id, data in pairs(tasks.Get()) do

		for hookid, func in pairs(data.Hooks or {}) do

			local hookname = string.format("%s_%s", id, hookid)

			hook.Add(hookid, hookname, function(...)
				if gamestate.Get() == GS_WAITING_PLAYERS then return end
				func(...)
			end)

		end

	end
	
end

function PLAYER:IsTaskCompleted(id)

	local plyTasks = self:GetPerm("completedTasks", {})

	return plyTasks[id]

end

function PLAYER:IsTaskActive(id)

	return !self:IsTaskCompleted(id) and self:GetTasks()[id]

end

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

util.AddNetworkString("tasks.Complete")
net.Receive("tasks.Complete", function(len, ply)

	local id = net.ReadString()
	ply:CompleteTask(id)

end)

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add("PlayerInitialSpawn", "Player.RefreshTasks", function(ply)

	ply:RefreshTasks()

end)

hook.Add("PlayerNewLevel", "Player.RefreshTasks", function(ply)

	ply:RefreshTasks()

end)

hook.Add("InitPostEntity", "tasks.InitializeHooks", tasks.InitializeHooks)