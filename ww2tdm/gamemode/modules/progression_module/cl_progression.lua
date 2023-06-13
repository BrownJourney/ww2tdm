
local PLAYER = FindMetaTable('Player')

local LEVELS_REWARDED = {}
local PLAYER_WINNER;

local function RewardForLevel(level)

	if LEVELS_REWARDED[level] then

		return

	end

	LEVELS_REWARDED[level] = true

	local nld = PROGRESSION_LEVELS[level]
	local newLevelDesc = T("newlevel_desc"):format(level)
	notify.Add(T("newlevel"), newLevelDesc, 3, "ww2/ui/class_purchased.mp3")
	for k, v in pairs(faction.stored) do

		local lastribbon = LocalPlayer():FindRibbon(k, level - 1)
		local newribbon = LocalPlayer():FindRibbon(k, level)

		if lastribbon == newribbon then

			continue

		end
		
		notify.Add(newribbon, newLevelDesc, 3)

	end

	notify.Add(T("level_rewards"):format(nld.reward), "nil", 3, "ww2/ui/coins_received.mp3")

end

function ShowRoundRewards(stats, rewards)

	if !stats then

		stats = {level = 0, xp = 0}

	end

	if !rewards then

		// only for testing purposes (ofc)
		rewards = {
			["cock"] = 2500,
			["ball"] = 1500
		}

	end

	local w, h = ScrW(), ScrH()

	local rewards_panel = Gui.CreateVGUI('rewards_panel', 'DFrame')
	rewards_panel:SetSize(w, h)
	rewards_panel:ShowCloseButton(false)
	rewards_panel:SetTitle('')
	rewards_panel:SetDraggable(false)
	-- rewards_panel:MakePopup()
	-- rewards_panel:SetKeyboardInputEnabled(true)
	rewards_panel:SetMouseInputEnabled(true)
	rewards_panel.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
		Gui.FrameBlur(self, 2, 2)

		local nextLevel = stats.level + 1
		local nld = PROGRESSION_LEVELS[nextLevel]
		local drawCurXP = stats.xp .. 'XP'
		local drawNextXP = nld and nld.xp .. 'XP' or 'MAX'

		local xpFont = F('futuraBold_35')
		local offset = 10
		local wide1, height1 = surface.GetSize(drawCurXP, xpFont)
		local wide2, height2 = surface.GetSize(drawNextXP, xpFont)

		local levelFont = F('futuraBold_30')
		--local levelWide, levelHeight = surface.GetSize(T('level_current'):format(stats.level), levelFont)
		--draw.SimpleText(T('level_current'):format(stats.level), levelFont, w / 2, h * 0.8 - levelHeight - 5, color_white, TEXT_ALIGN_CENTER)
		draw.SimpleText(drawCurXP, xpFont, w / 2 - w * 0.25 - wide1 - offset, h * 0.8 + height1 / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		draw.SimpleText(drawNextXP, xpFont, w / 2 + w * 0.25 + offset, h * 0.8 + height2 / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		HUD:Tickets()
	end

	local result_teams = vgui.Create('DPanel', rewards_panel)
	local wide, height;
	if IsValid(PLAYER_WINNER) then

		wide, height = w * 0.5, h * 0.4

		local name = PLAYER_WINNER:Name()
		result_teams.Paint = function(self, w, h)
			draw.SimpleText("ПОБЕДА ДОСТАЛАСЬ", F("futura_24"), w / 2, 5, color_white, TEXT_ALIGN_CENTER)
			draw.SimpleText(name, F("futuraBold_50"), w / 2, 5 + ScrH() * 0.03, color_white, TEXT_ALIGN_CENTER)
		end

		local size =  height * 0.75
		local avatar = vgui.Create("AvatarImage", result_teams)
		avatar:SetSize(size, size)
		avatar:SetPlayer(PLAYER_WINNER, 128)
		avatar.Think = function(self)
			local parent = self:GetParent()
			self:SetPos(parent:GetWide() / 2 - size / 2, height - size)
		end

	else

		wide, height = w * 0.8, h * 0.6

		local scoreFont = F('futuraBold_120')
		result_teams.factionLogo = function(self, x, y, teamID)
			local logoSize, logoOffset = 120, 4
			local teamColor = team.GetColor(teamID)
			local scoreWide = surface.GetSize(team.GetScore(teamID), scoreFont)
			x = x - logoSize / 2
			local fx, fy = x - scoreWide * 2 - w * 0.01, y - logoSize / 2

			if x > self:GetWide() / 2 then
				fx = x + scoreWide * 2 + w * 0.01
			end

			--draw.RoundedBox(0, fx, fy, logoSize, logoSize, Color(teamColor.r, teamColor.g, teamColor.b, self.alpha))
			surface.SetDrawColor(255, 255, 255, self.alpha)
		    surface.SetMaterial(faction.Team(teamID).icoLarge)
		    surface.DrawTexturedRect(fx + logoOffset, fy + logoOffset, logoSize - logoOffset * 2, logoSize - logoOffset * 2)
		end
		result_teams.Paint = function(self, w, h)
			local winner = gamestate.GetWinner()
			local reason = gamestate.GetReason()
			local winnerText = T("match_frindship")
			if faction.GetID(winner) then
				winnerText = T("match_winner"):format(T(faction.GetID(winner)))
			end
			draw.SimpleText(winnerText, F('futuraBold_60'), w / 2, 5, color_white, TEXT_ALIGN_CENTER)
			local _, winnerHeight = surface.GetSize(winnerText, F('futuraBold_60'))
			draw.SimpleText(T(reason), F('futura_40'), w / 2, 5 + winnerHeight, color_white, TEXT_ALIGN_CENTER)

			if self.Resized then
				self.alpha = math.min(self.alpha + FrameTime() * 300, 255)
			end

			local white_alpha = Color(255, 255, 255, self.alpha)

		    self:factionLogo(w * 0.4, h / 2, TEAM_AXIS)
			draw.SimpleText(team.GetScore(TEAM_AXIS), scoreFont, w * 0.4, h / 2, white_alpha, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.SimpleText(":", F('futuraBold_60'), w / 2, h / 2, white_alpha, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.SimpleText(team.GetScore(TEAM_ALLIES), scoreFont, w * 0.6, h / 2, white_alpha, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			self:factionLogo(w * 0.6, h / 2, TEAM_ALLIES)
		end

	end

	result_teams.alpha = 0
	result_teams:SetSize(0, height)
	result_teams:SizeTo(wide, height, 1.5, 0, 2, function(anim, self)
		self.Resized = true
	end)
	result_teams.Think = function(self)
		self:SetPos(w / 2 - self:GetWide() / 2, h * 0.1)
	end

	local xpPanel = vgui.Create('DPanel', rewards_panel)
	xpPanel:SetSize(w * 0.5, h * 0.05)
	xpPanel:SetPos(w / 2 - xpPanel:GetWide() / 2, h * 0.8)
	xpPanel.xp = stats.xp
	xpPanel.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 250))

		local scale = 0
		local nextLevel = stats.level + 1
		local nld = PROGRESSION_LEVELS[nextLevel]

		local speed = FrameTime() * 800
		if self.xp < stats.xp then
			self.xp = math.min(self.xp + speed, stats.xp)
		elseif self.xp > stats.xp then
			self.xp = math.max(self.xp - speed, stats.xp)
		end

		if nld then
			scale = 1 - ((nld.xp - self.xp) / nld.xp)

			if self.xp >= nld.xp then
				self.xp = 0
				stats.xp = stats.xp - nld.xp
				stats.level = stats.level + 1
				RewardForLevel(stats.level)
			end
		else
			scale = 1
		end

		draw.RoundedBox(0, 0, 0, w * scale, h, color_white)

		surface.SetDrawColor(255, 255, 255, 200)
		surface.DrawOutlinedRect(0, 0, w, h)
	end

	local i = 0
	for reward, xp in pairs(rewards or {}) do

		local time = i == 0 and 0.1 or 2 * i
		timer.Create("ShowNextReward"..i, time, 1, function()

			if !IsValid(xpPanel) then return end

			local posx = w / 2 - xpPanel:GetWide() / 2

			local reward_text = vgui.Create('DPanel', rewards_panel)
			reward_text:SetSize(w * 0.5, h * 0.05)
			reward_text:SetPos(posx, h * 0.7)
			reward_text:SetAlpha(0)
			reward_text:AlphaTo(255, 0.25)
			reward_text:AlphaTo(0, 0.25, 1, function()
				stats.xp = stats.xp + xp
			end)
			reward_text:MoveTo(posx, h * 0.8, 1, 0.5, -1, function()
				reward_text:Remove()
			end)
			reward_text.Paint = function(self, w, h)
				local sign = '+'
				if xp < 0 then
					sign = ''
				end
				draw.SimpleText(T(reward) .. ' ' .. sign .. '' .. xp .. 'XP', F('futuraBold_20'), 0, h / 2, color_white, nil, TEXT_ALIGN_CENTER)
			end

		end)

		i = i + 1

	end

end

net.Receive('ShowRewards', function()

	local stats = net.ReadTable()
	local rewards = net.ReadTable()
	ShowRoundRewards(stats, rewards)

end)

net.Receive("DeclareWinner", function()
	PLAYER_WINNER = net.ReadEntity()
end)

local CurrentPos = CFG.EndView and CFG.EndView.startPos;
hook.Add("CalcView", "EOR_View", function(pl, origin, angles, fov)

	if !CFG or !CFG.EndView then return end
	if gamestate.Get() != GS_ROUND_END and gamestate.Get() != GS_GAME_OVER then CurrentPos = CFG.EndView.startPos return end
	if !CurrentPos then return end

	local view = {}
	CurrentPos = Lerp(FrameTime() / 30, CurrentPos, CFG.EndView.endPos)
	view.origin = CurrentPos
	view.angles = CFG.EndView.angle or Angle(0, 0, 0)

	return view

end)

hook.Add('RequestedUI', 'ShowNewLevel', function(id)

	if id == 'newlevel' then

		RewardForLevel(LocalPlayer():GetLevel())

	end

end)