hook.Add("EntityNetworkedVarChanged", "prone.DetectProneStateChanges", function(ply, nwVarName, oldVal, newVal)
	if nwVarName == "prone.AnimationState" then
		if newVal == PRONE_NOTINPRONE then
			ply:ResetHull()
		end
	end
end)

-- Called to inform the player that they can't get up.
local lastGetUpPrintTime = 0		-- Last time a print was made.
local getUpWarningPrintDelay = 2	-- Time it takes before allowing another print.
function prone.CantGetUpWarning()
	local ct = CurTime()

	if lastGetUpPrintTime < ct then
		notify.Add("There is not enough room to get up here.", "nil", 3)
		lastGetUpPrintTime = ct + getUpWarningPrintDelay
	end
end

--------------------
-- prone.SetImpulse
--------------------
-- Desc:		This is the proper, predicted, way to toggle prone.
-- Arg One:		CUserCmd object, to set the impulse on.
function prone.SetImpulse(cmd)
	cmd:SetImpulse(PRONE_IMPULSE)
end

-----------------
-- prone.Request
-----------------
-- Desc:		Begins sending a prone impulse to the server.
local SendImpulse = false
function prone.Request()
	SendImpulse = true
end
concommand.Add("prone", function()
	prone.Request()
end)

-------------------
-- Bind key handler
-------------------
local function boolToNumString(bool)
	return bool and "1" or "0"
end
local jumptogetup_doubletap = false

local key_waspressed = false
local last_prone_request = 0
local doubletap_shouldsend = true
local doubletap_keypress_resettime = false
hook.Add("CreateMove", "prone.ReadBindKeys", function(cmd)
	local ply = LocalPlayer()
	if not IsValid(ply) then
		return
	end

	if SendImpulse then
		prone.SetImpulse(cmd)

		if cmd:TickCount() ~= 0 then
			SendImpulse = false
		end
	end

	if (system.IsLinux() or system.HasFocus()) and ply:OnGround() and not vgui.GetKeyboardFocus() and not gui.IsGameUIVisible() and not gui.IsConsoleVisible() then
		if input.IsKeyDown(tonumber(settings.GetSetting("ww2_bind_prone"))) then
			key_waspressed = true

			-- If doubletap is enabled they have a second to double click the bind key.
			doubletap_keypress_resettime = CurTime() + .66
		else
			if key_waspressed then
				if last_prone_request < CurTime() then
					doubletap_shouldsend = not doubletap_shouldsend

					if true then
						prone.Request()

						last_prone_request = CurTime() + 1.25
					end
				end

				key_waspressed = false
			end
		end

		if doubletap_keypress_resettime ~= false and doubletap_keypress_resettime < CurTime() then
			doubletap_keypress_resettime = false
			doubletap_shouldsend = true
		end
	end
end)

-- If they enable jump to get up then read that here.
local jumptogetup_presstime = 0
hook.Add("KeyPress", "Prone.JumpToGetUp", function(ply, key)
	if IsFirstTimePredicted() and ply == LocalPlayer() and ply:IsProne() and (key == IN_JUMP or key == IN_DUCK) then
		if not jumptogetup_doubletap then
			prone.Request()
		else
			if jumptogetup_presstime > CurTime() then
				prone.Request()
			else
				jumptogetup_presstime = CurTime() + 1.25
			end
		end
	end
end)

-------------------
-- View Transitions
-------------------

-- Addons should use the prone.ShouldChangeCalcView and prone.ShouldChangeCalcViewModelView hooks instead of this cvar.
local enabledViewTransitions = false

do
	local headPos, headAng
	hook.Add("CalcView", "prone.ViewTransitions", function(ply, pos, angles, fov)
		if ply ~= LocalPlayer() or enabledViewTransitions then
			return
		end

		local result = hook.Run("prone.ShouldChangeCalcView", ply)
		if result == false then
			return
		end

		local proneState = ply:GetProneAnimationState()
		if proneState ~= PRONE_GETTINGDOWN and proneState ~= PRONE_GETTINGUP then
			headPos = nil
			return
		end

		headPos, headAng = ply:GetBonePosition(ply:LookupBone("ValveBiped.Bip01_Head1"))

		local view = {}
		view.origin = Vector(pos.x, pos.y, headPos.z)
		view.fov = tonumber(settings.GetSetting("fov_slider"))

		return view
	end)
	hook.Add("CalcViewModelView", "prone.ViewTransitions", function(ply, vm, oldPos, oldAng, pos)
		local localply = LocalPlayer()
		local wep = localply:GetActiveWeapon()

		if enabledViewTransitions then
			return
		end

		local result = hook.Run("prone.ShouldChangeCalcViewModelView", localply)
		if result == false then
			return
		end

		local proneState = localply:GetProneAnimationState()
		if proneState ~= PRONE_GETTINGDOWN and proneState ~= PRONE_GETTINGUP then
			headPos = nil
			return
		end

		if headPos then
			local pos = Vector(pos.x, pos.y, headPos.z)
			pos = pos - headAng:Forward() * 100
			return pos
		end
	end)

	hook.Add("AdjustMouseSensitivity", "ProneMouseSensivity", function(default)
		if LocalPlayer():IsProne() then
			return 0.2
		end
	end)
end