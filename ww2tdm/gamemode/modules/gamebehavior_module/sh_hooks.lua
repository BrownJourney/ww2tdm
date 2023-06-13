--[[-------------------------------------------------------------------------
GLOBALS
---------------------------------------------------------------------------]]

DAMAGE_EXPLOSION = 'expl'
DAMAGE_FALL = 'fall'
DAMAGE_FIRE = 'fire'
DAMAGE_BASH = 'bash'
DAMAGE_BAYONET = 'bayo'

HITGROUP_DICK = 11
HITGROUP_SPINE = 12
HITGROUP_HEART = 13

--[[-------------------------------------------------------------------------
GAMEMODES STUFF
---------------------------------------------------------------------------]]

function GM:GamemodeInitialize()
	gm.Call("GamemodeInitialize")
end

function GM:OneSecond()
	gm.Call("OneSecond")
end

function GM:OnGameState(oldGameState, newGameState)
	gm.Call("OnGameState", oldGameState, newGameState)
end

function GM:OnGameStage(newGameStage)
	gm.Call("OnGameStage", newGameStage)
end

function GM:OnGameArea(newAreaID)
	gm.Call("OnGameArea", newAreaID)
end

function GM:OnPointCaptured(playersList, teamID)
	gm.Call("OnPointCaptured", playersList, teamID)
end

--[[-------------------------------------------------------------------------
SETUP MOVEDATA
---------------------------------------------------------------------------]]
function GM:StartCommand(ply, cmd)
	if ply:IsBot() then
		cmd:ClearMovement()
		-- cmd:SetButtons(IN_ATTACK)
		return
	end

	if ply:GetMoveType() == MOVETYPE_NOCLIP then
		return
	end

	if ply.GetSimfphys and IsValid(ply:GetSimfphys()) then
		return
	end

	if ply:GetFreezed() then
		cmd:ClearMovement()
	end

	if gamestate.Get() == GS_ROUND_PRE_PLAYING and maploader.Gamemode() == "push_omaha" and ply:Team() == TEAM_ATTACK then
		cmd:RemoveKey(IN_JUMP)
	end

	if CVAR_ARCADE then
		return
	end

	if cmd:KeyDown(IN_SPEED) then
		local strafeDiv = 2
		if ply:GetTrait() == TRAIT_MOBILITY then
			strafeDiv = 1.2
		end
		if !cmd:KeyDown(IN_FORWARD) and (cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_MOVELEFT)) then
			cmd:SetSideMove(cmd:GetSideMove() / (strafeDiv * 4))
		else
			cmd:SetSideMove(cmd:GetSideMove() / strafeDiv)
		end
		cmd:RemoveKey(IN_DUCK)
		if cmd:GetForwardMove() < 0 then
			if ply:GetTrait() == TRAIT_MOBILITY then
				cmd:SetForwardMove(cmd:GetForwardMove() / 6.6)
			else
				cmd:RemoveKey(IN_SPEED)
			end
		end
	end

	if cmd:KeyDown(IN_DUCK) then
		if !ply.DuckFrame then
			ply.DuckFrame = CurTime()
		end

		if CurTime() - ply.DuckFrame > 0.5 then
			cmd:RemoveKey(IN_JUMP)
		end
	else
		ply.DuckFrame = nil;
	end

	if cmd:KeyDown(IN_JUMP) then
		local ctime = CurTime() - (ply.JumpTime or 0)
		local jumpCooldown = CFG.JumpCooldown
		if ply:GetTrait() == TRAIT_MOBILITY then
			jumpCooldown = jumpCooldown / 2
		end
		if ctime < jumpCooldown then
			if ctime > 0.1 then
				cmd:RemoveKey(IN_JUMP)
			end
		else
			ply.JustJumped = true
			ply.JumpTime = CurTime()
		end
	end

	ply.JustJumped = false
end

function GM:CreateMove(cmd)
	local ply = LocalPlayer()

	if ply.IsProne and ply:IsProne() then
        local ang = cmd:GetViewAngles()
        ang.p = math.max(-30, ang.p)
        cmd:SetViewAngles(ang)
    end

    local car = ply.GetSimfphys and ply:GetSimfphys()
    if IsValid(car) then
        local ang = cmd:GetViewAngles()
        ang.p = math.Clamp(ang.p, -30, 30)
        ang.y = math.Clamp(ang.y, 30, 145)
        cmd:SetViewAngles(ang)
    end
end

--[[-------------------------------------------------------------------------
BUTTONS
---------------------------------------------------------------------------]]

hook.Add("PlayerNoClip", "WW2_SandboxDisable", function(ply)
	return false
end)

hook.Add("PlayerButtonDown", "WW2_Bipod", function(ply, button)
	local wep = ply:GetActiveWeapon()

	if button != ply:GetInfoNum("ww2_bind_bipod", -1) then
		return
	end

	if !IsValid(wep) then return end
	if !wep.InBipod then return end

	if wep:InBipod() then
	    wep:ExitBipod()
	else
	    wep:EnterBipod()
	end
end)

hook.Add("PlayerButtonDown", "WW2_Melee", function(ply, button)
	local wep = ply:GetActiveWeapon()

	if button != ply:GetInfoNum("ww2_bind_melee", -1) then
		return
	end

	if !IsValid(wep) then return end
	if !wep.ArcCW then return end
	if !wep.CanBash then return end

	wep:Bash()
end)

hook.Add("PlayerButtonDown", "WW2_Lean", function(ply, button)
	if button == ply:GetInfoNum("ww2_bind_leanleft", -1) then
		ply:ConCommand("+alt1")
	elseif button == ply:GetInfoNum("ww2_bind_leanright", -1) then
		ply:ConCommand("+alt2")
	end
end)

hook.Add("PlayerButtonUp", "WW2_Lean", function(ply, button)
	if button == ply:GetInfoNum("ww2_bind_leanleft", -1) then
		ply:ConCommand("-alt1")
	elseif button == ply:GetInfoNum("ww2_bind_leanright", -1) then
		ply:ConCommand("-alt2")
	end
end)

