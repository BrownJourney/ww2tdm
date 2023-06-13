local run = {}
run.maxSpeed = 350
run.defaultJumpPower = CFG.JumpPower

local PLAYER = FindMetaTable('Player')

function PLAYER:SlowDown()

	if CVAR_ARCADE then return end

	self.beingShot = true

	timer.Create('RemoveShotEffect'..self:SteamID64(), math.random(1, 3), 1, function()

		if IsValid(self) then

			self.beingShot = false

		end

	end)

end

function run.IncreaseSpeed(ply, key)

	if ply.bFreezed then return end
	if !ply:GetFaction() then return end

	local class = ply:GetFaction():Class(ply:GetCurrentClass(), ply:GetLoadout())
	local speed_min = ply.SpawnRunSpeed or 200
	local speed_add = 70
	local speed_increment = 1
	-- if game.GetMap() == "ww2_omaha_beach_offensive_wfa" and gamestate.GetStage() == 1 then
	-- 	speed_add = 200
	-- 	speed_increment = speed_increment * 5
	if CVAR_ARCADE then
		speed_add = 100
		speed_increment = speed_increment * 5
	end

	local speed_max = math.Clamp(speed_min + speed_add, 0, run.maxSpeed)

	ply:SetWalkSpeed(CFG.WalkSpeed)

	if ply.beingShot then

		ply:SetRunSpeed(ply:GetWalkSpeed())
		ply:SetJumpPower(100)

		return

	end

	if ply:Team() == TEAM_SPECTATOR then

		return

	end

	if key == IN_SPEED then

		if ply:GetTrait() == TRAIT_TACSPRINT and gamestate.Get() != GS_ROUND_PREPARE then

			speed_increment = speed_increment * 10

		end

		timer.Create('SPEED_'..ply:UniqueID(), 0.1, 0, function()

			if !IsValid(ply) then

				return

			end

			if ply:GetRunSpeed() < speed_max then

				ply:SetRunSpeed(ply:GetRunSpeed() + speed_increment)

			end

		end)

	elseif key == IN_JUMP then

		local jumpStopValue = -0.5
		if CVAR_ARCADE then
			jumpStopValue = -0.2
		end

		ply:SetVelocity(ply:GetVelocity() * jumpStopValue)

		ply:SetRunSpeed(ply:GetWalkSpeed())

		timer.Create("ResetPlayerStats_"..ply:SteamID64(), 0.5, 1, function()

			if !IsValid(ply) then

				return

			end

			ply:SetJumpPower(run.defaultJumpPower)
			ply:SetRunSpeed(speed_min)

		end)

	end

	

end

function run.DecreaseSpeed(ply, key)

	if ply.bFreezed then return end

	if ply.beingShot then

		ply:SetRunSpeed(ply:GetWalkSpeed())
		return

	end

	if ply:Team() != TEAM_SPECTATOR and (key == IN_SPEED or key == IN_BACK) then

		ply.JumpCount = 0

		timer.Remove('SPEED_'..ply:UniqueID())

		local class = ply:GetFaction():Class(ply:GetCurrentClass(), ply:GetLoadout())
		local speed_min = ply.SpawnRunSpeed or 200
		local speed_max = math.Clamp(speed_min + 70, 0, run.maxSpeed)

		ply:SetRunSpeed(speed_min)

	end

end

hook.Add('KeyPress', 'speed_set', run.IncreaseSpeed)

hook.Add('KeyRelease', 'speed_reset', run.DecreaseSpeed)
