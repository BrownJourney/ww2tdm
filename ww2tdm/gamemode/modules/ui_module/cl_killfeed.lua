--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

killfeed = killfeed or {}

killfeed.messages = {}

killfeed.icons = {
	[HITGROUP_HEAD] 	= "UI_Kill_Icon_Headshot.png",
	[HITGROUP_SPINE] 	= "UI_Kill_Icon_LowerSpineShot.png",
	[HITGROUP_DICK] 	= "ui_kill_icon_nut_shot.png",
	[HITGROUP_HEART] 	= "ui_kill_icon_heart_shot.png",
	
	[DAMAGE_EXPLOSION] 	= "ui_kill_icon_artillery_strike.png",
	[DAMAGE_FIRE] 		= "UI_Kill_Icon_Fire.png",
	[DAMAGE_FALL] 		= "ui_kill_icon_generic_death.png",
	[DAMAGE_BASH] 		= "UI_Kill_Icon_Bash.png",
	[DAMAGE_BAYONET] 	= "UI_Kill_Icon_Bayonet.png",

	['suicide'] 		= "ui_kill_icon_generic_death_skull.png"
}

killfeed.textures = {
	["ww2_nade_german_explosive_charge"] 		= Material("hud/feed/weapons/comb.png"),
	["ww2_bomb_rus_compb"] 						= Material("hud/feed/weapons/comb.png"),
	["rus_rifle_mosin_1891"] 					= Material("hud/feed/weapons/mosin_sniper.png"),
	["ger_smg_c96_carbine"] 					= Material("hud/feed/weapons/c96_carabin.png"),
	["rus_rifle_mosin_9130"] 					= Material("hud/feed/weapons/mosin9130.png"),
	["rus_rifle_mosin_carbine"] 				= Material("hud/feed/weapons/mosin_carabin.png"),
	["ww2_nade_stielhandgranate"] 				= Material("hud/feed/weapons/nade.png"),
	["ww2_nade_splintering_stielhandgranate"] 	= Material("hud/feed/weapons/splinter_nade.png"),
	["ww2_nade_german_nebelhandgranate"] 		= Material("hud/feed/weapons/splinter_nade.png"),
	["ww2_nade_german_m42_nebelgranate"] 		= Material("hud/feed/weapons/splinter_nade.png"),
	["ger_bomb_satchel_ger"] 					= Material("hud/feed/weapons/satchel.png"),
	["ww2_bomb_rus_satchel"] 					= Material("hud/feed/weapons/satchel.png"),
	["ww2_rus_nade_f1"] 						= Material("hud/feed/weapons/f1.png"),
	["ww2_rus_nade_molotov"] 					= Material("hud/feed/weapons/molotov.png"),
	["ww2_rus_nade_rgd33light"] 				= Material("hud/feed/weapons/rgd33_light.png"),
	["ww2_rus_nade_rgd33bundle"] 				= Material("hud/feed/weapons/rgd33bundle.png"),
	["ww2_rus_nade_rgd33"] 						= Material("hud/feed/weapons/rgd33.png"),
	["ww2_rus_nade_rpg40"] 						= Material("hud/feed/weapons/rpg40.png"),
	["ww2_rus_nade_rpg43"] 						= Material("hud/feed/weapons/rpg43.png"),
}

function killfeed.FormatWepID(wepClass)
	if !wepClass:find("_") then return end
	local split = string.Split(wepClass, '_')
	table.remove(split, 1); table.remove(split, 1);
	return table.concat(split, '_')
end

function killfeed.Add(victim, teamClr, inflictor, attacker, distance, hitgroup, dmgtype)

	local font = F('futura_18')
	local w, h = ScrW(), ScrH()

	local basepos = {x = w - 30, y = 0}

	if settings.GetSetting('huddisable') == true then
		
		return

	end

	local victimPly, attackerPly = player.GetByName(victim), player.GetByName(attacker)

	local victimClr = teamClr
	local attackerClr = IsValid(attackerPly) and team.GetColor(attackerPly:Team()) or color_white

	if IsValid(victimPly) and victimPly:Name() == LocalPlayer():Name() then
		
		killfeed.Personal(attackerPly)

	end

	if settings.GetSetting('killfeed') == false then
		
		return

	end

	local deathIcon;

	if killfeed.icons[hitgroup] then

		deathIcon = Material('hud/feed/' .. killfeed.icons[hitgroup], 'smooth noclamp')

	end

	if killfeed.icons[dmgtype] then

		deathIcon = Material('hud/feed/' .. killfeed.icons[dmgtype], 'smooth noclamp')

	end

	local wepTexture;
	local tableMat = killfeed.textures[inflictor]
	if tableMat and !tableMat:IsError() then

		wepTexture = tableMat

	else

		local wepID = killfeed.FormatWepID(inflictor)

		if wepID then

			wepTexture = Material('hud/feed/weapons/' .. wepID .. '.png', 'smooth noclamp')

			if wepTexture:IsError() then

				wepTexture = nil;

			end

		end

	end

	if victim == attacker and dmgtype == '' then

		deathIcon = Material('hud/feed/' .. killfeed.icons['suicide'], 'smooth noclamp')

	end

	-- if dmgtype == DAMAGE_BASH then

	-- 	wepTexture = nil;

	-- end

	local wepName = inflictor
	if weapons.Get(wepName) then

		wepName = weapons.Get(wepName).PrintName or "UNKNOWN"

	end

	if scripted_ents.Get(inflictor) then

		wepName = scripted_ents.Get(wepName).PrintName or "UNKNOWN"

	end

	local actualDistance = distance

	distance = distance .. 'M'

	MsgC(attackerClr, attacker, Color(200, 200, 200), ' [' .. wepName .. ' (' .. distance .. ')] ', victimClr, victim .. '\n')

	if actualDistance > 0 then

		wepName = ' ' .. wepName .. ' (' .. distance .. ') '

	else

		wepName = ' ' .. wepName

	end

	local panel = vgui.Create('DPanel')
	panel:SetSize(1, h * 0.04)

	local nInfo = {}

	panel.onSizeCalculated = function(self, size)

		if self.sizeCalculated then

			return

		end

		self:SetSize(size, self:GetTall())

		local baseposy
		if #killfeed.messages != 0 then

			local size = killfeed.messages[#killfeed.messages]['size']
			local posy = killfeed.messages[#killfeed.messages].posy

			baseposy = posy + size

			self:SetPos(basepos.x - self:GetWide(), baseposy + self:GetTall())

		else

			baseposy = basepos.y

			self:SetPos(basepos.x - self:GetWide(), basepos.y + self:GetTall())

		end

		nInfo['panels'] = {self}
		nInfo['posy'] = baseposy
		nInfo['size'] = self:GetTall()
		nInfo['uniq_id'] = math.random(1, 99999999)..'_kbz_'..math.random(1, 99999999)
		table.insert(killfeed.messages, nInfo)

		self.sizeCalculated = true;

	end

	panel.Paint = function(self, w, h)

		local drawSize = 0

		draw.SimpleText(attacker, font, drawSize, h / 2, attackerClr, nil, TEXT_ALIGN_CENTER)

		drawSize = drawSize + surface.GetSize(attacker, font) + 5

		if wepTexture then

			local scale = math.min(wepTexture:GetInt("$realwidth") / wepTexture:GetInt("$realheight"), 4)

			surface.SetMaterial(wepTexture)
			surface.SetDrawColor(200, 200, 200, 200)
			local sizeh = h * 0.75
			local sizew = sizeh * scale
			surface.DrawTexturedRect(drawSize, h / 2 - sizeh / 2, sizew, sizeh)

			drawSize = drawSize + sizew + 5

		else

			draw.SimpleText(wepName, font, surface.GetSize(attacker, font), h / 2, Color(200, 200, 200), nil, TEXT_ALIGN_CENTER)

			drawSize = drawSize + surface.GetSize(wepName, font)

		end

		if deathIcon then

			surface.SetMaterial(deathIcon)
			surface.SetDrawColor(200, 200, 200)
			surface.DrawTexturedRect(drawSize, h / 2 - h / 2, h, h)

			drawSize = drawSize + h + 5

		end

		if victim != attacker then

			draw.SimpleText(victim, font, drawSize, h / 2, victimClr, nil, TEXT_ALIGN_CENTER)

			drawSize = drawSize + surface.GetSize(victim, font)

		end

		if wepTexture then

			if actualDistance > 0 then

				draw.SimpleText(' (' .. distance .. ')', font, drawSize, h / 2, Color(200, 200, 200), nil, TEXT_ALIGN_CENTER)

				drawSize = drawSize + surface.GetSize(' (' .. distance .. ')', font)

			end

		end

		self:onSizeCalculated(drawSize)

	end

	timer.Simple(10, function()

		for k, v in pairs(nInfo['panels'] or {}) do

			if IsValid(v) then

				v:AlphaTo(0, 0.2, 0, function()

					v:Remove()

				end)

			end

		end

		for k, v in pairs(killfeed.messages) do

			if v.uniq_id == nInfo['uniq_id'] then

				table.remove(killfeed.messages, k)

				break

			end

		end

		for k, v in pairs(killfeed.messages) do

			if #killfeed.messages > 0 then

				if k != 1 then

					local size = killfeed.messages[k - 1]['size']
					local posy = killfeed.messages[k - 1].posy
					local baseposy = posy + size

					killfeed.messages[k].posy = baseposy

					for _, panel in pairs(killfeed.messages[k].panels) do

						if IsValid(panel) then

							panel:MoveTo(basepos.x - panel:GetWide(), baseposy + panel:GetTall(), 0.2)

						end

					end

				else

					killfeed.messages[k].posy = basepos.y

					for _, panel in pairs(killfeed.messages[k].panels) do

						if IsValid(panel) then

							panel:MoveTo(basepos.x - panel:GetWide(), basepos.y + panel:GetTall(), 0.2)

						end

					end

				end

			end

		end

	end)

end

function killfeed.Personal(attacker)

	local w, h = ScrW(), ScrH()
	
	Gui.RemoveVGUI("hint_panel")

	local selectedHint = CFG.GetHint()
	local hint = Gui.CreateVGUI("hint_panel", "DPanel")
	hint:SetTall(h * 0.1)
	hint:Dock(BOTTOM)
	hint:SetAlpha(0)
	hint:AlphaTo(255, 1, 0)
	hint.Paint = function(self, w, h)
		if LocalPlayer():Alive() then
			self:Remove()
		end

		local text, font = T("hint_text"):format(selectedHint), F("futura_35")
		if utf8len(text) > 100 then
			font = F("futura_30")
		end
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
		draw.SimpleText(text, font, w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	if !IsValid(attacker) then

		return

	end

	if attacker:Name() == LocalPlayer():Name() then

		return

	end

	local plName = attacker:Name()
	local plRibbon = attacker:FindRibbon()
	local attackerTeam = attacker:Team()

	local panel_wide, panel_tall = w, h * 0.105
	local default_wide, default_tall = panel_wide, panel_tall
	local isTeamkill = attackerTeam == LocalPlayer():Team() and !CVAR_NOTEAMS

	if isTeamkill then

		panel_tall = h * 0.14

	end

	local panel = vgui.Create("DPanel")
	panel:SetPos(0, 0)
	panel:SizeTo(panel_wide, panel_tall, 1, 0, 0.49)
	panel.Paint = function(self, rw, rh)
		local w, h = panel_wide, panel_tall
		local ribbonSize = w * 0.06
		local plFont = F('futura_50')

		local teamColor = team.GetColor(attackerTeam)
		teamColor.a = 100
		draw.RoundedBox(0, 0, 0, w, h, teamColor)

		draw.SimpleLinearGradientPanel(self, 0, 0, w, rh, Color(0, 0, 0), Color(0, 0, 0, 150))
		local upperText, upperFont = utf8upper(T("were_killed")), F('futuraLight_25')
		draw.SimpleText(upperText, upperFont, w / 2, 5, color_white, TEXT_ALIGN_CENTER)

		local infoSize = surface.GetSize(plName, plFont) + ribbonSize

		local _, height = surface.GetSize(plName, plFont)
		draw.SimpleText(plName, plFont, w / 2 + ribbonSize / 2, default_tall - height - 5, color_white, TEXT_ALIGN_CENTER)

		if plRibbon then

			surface.SetMaterial(Material(plRibbon))
			surface.SetDrawColor(255, 255, 255)
			surface.DrawTexturedRect(w / 2 - infoSize / 2, default_tall - height - 5 - ribbonSize / 4, ribbonSize, ribbonSize)

		end

		if isTeamkill then

			local text, font = T("press_charges"), F('futuraBold_25')
			local _, sHeight = surface.GetSize(text, font)
			draw.SimpleText(text, font, w / 2, h - sHeight - 5, color_white, TEXT_ALIGN_CENTER)

			if input.IsKeyDown(KEY_F2) and !self.pressed then

				self.pressed = true
				net.Start("TeamkillPenalty")
				net.SendToServer()

			end

		end

	end

	timer.Simple(5, function()

		panel:SizeTo(0, 0, 0.5, 0, -1, function(anim, pnl)

			pnl:Remove()

		end)

	end)

end

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

net.Receive('killfeed_add', function()

	local victim 	= net.ReadString()
	local teamClr 	= net.ReadColor()
	local inflictor = net.ReadString()
	local attacker  = net.ReadString()
	local distance  = net.ReadUInt(32)
	local hitgroup  = net.ReadUInt(4)
	local dmgtype 	= net.ReadString()

	killfeed.Add(victim, teamClr, inflictor, attacker, distance, hitgroup, dmgtype)

end)