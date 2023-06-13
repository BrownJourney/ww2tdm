--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local Gui = Gui;
Gui.Deploy = Gui.Deploy or {}

Gui.Deploy.OpenedAtOnce = false

function Gui.Deploy.confirmWindow(text, callback, parent)
		
	local w, h = ScrW(), ScrH()

	local deploy_panel = parent or Gui.GetVGUI('deploy_menu')

	text = tostring(text) or 'undefined'
	local font = F('futuraBold_30')
	local textSize = surface.GetSize(text, font) + 20

	local confirm_window = vgui.Create('DPanel', deploy_panel)
	confirm_window:SetSize(w, h)
	confirm_window:MakePopup()
	confirm_window.Paint = function(self, w, h)
		Gui.FrameBlur(self, 3, 3)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
	end

	local sizew = textSize > w * 0.4 and textSize or w * 0.4
	local sizeh = callback and h * 0.15 or h * 0.1

	local confirm_panel = vgui.Create('DPanel', confirm_window)
	confirm_panel:SetSize(sizew, sizeh)
	confirm_panel:Center()
	confirm_panel.Paint = function(self, w, h)
		surface.SetDrawColor(255, 255, 255, 50)
		surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleLinearGradientPanel(self, 0, 0, w, h, Color(0, 0, 0, 250), Color(0, 0, 0, 0))
		Gui.FrameBlur(self, 1, 1)

		draw.SimpleText(text or 'undefined', font, w / 2, h * 0.05, Color(255, 255, 255, 150), TEXT_ALIGN_CENTER)
	end

	local function draw_function(panel, w, h, text)
		local clr = color_white
		local FT = FrameTime() * 800
		if panel:IsHovered() then
			clr = Color(0, 0, 0)
			panel.alpha = math.min(panel.alpha + FT, 255)
		else
			panel.alpha = math.max(panel.alpha - FT, 5)
		end

		draw.SimpleLinearGradientPanel(panel, 0, 0, w, h, Color(255, 255, 255, panel.alpha), Color(color_white.r, color_white.g, color_white.b, 5), true)

		draw.SimpleText(T(text), F('futura_30'), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	if callback then
		local cancel_button = vgui.Create('DButton', confirm_panel)
		cancel_button:SetTall(h * 0.04)
		cancel_button:Dock(BOTTOM)
		cancel_button:DockMargin(5, 5, 5, 5)
		cancel_button:SetText('')
		cancel_button.DoClick = function()
			confirm_window:Remove()
			if istable(callback) then
				callback[2].callback()
				return
			end
		end
		cancel_button.alpha = 5
		cancel_button.Paint = function(self, w, h)
			draw_function(self, w, h, istable(callback) and callback[2].text or "menu_cancel")
		end
	end

	local confirm_button = vgui.Create('DButton', confirm_panel)
	confirm_button:SetTall(h * 0.04)
	confirm_button:Dock(BOTTOM)
	confirm_button:DockMargin(5, callback and 0 or 5, 5, callback and 0 or 5)
	confirm_button:SetText('')
	confirm_button.DoClick = function()
		confirm_window:Remove()
		if callback then
			if istable(callback) then
				callback[1].callback()
				return
			end
			callback()
		end
	end
	confirm_button.alpha = 5
	confirm_button.Paint = function(self, w, h)
		draw_function(self, w, h, istable(callback) and callback[1].text or "menu_confirm")
	end

end

function Gui.Deploy.GetSlider(panel, text)

	local slider = vgui.Create('DNumSlider', panel)
	slider.Paint = function(self, w, h)
		self.TextArea:SetText('')
	end
	slider.Slider.Knob:SetHeight(0)
	slider.Slider.Paint = function(self, w, h)
		local parent = self:GetParent()
		local alpha = 255
		if panel:GetParent().alpha then
			alpha = panel:GetParent().alpha
		end
		local val, max = parent:GetValue() - parent:GetMin(), parent:GetMax() - parent:GetMin()
		local pr = val / max
		local height = h * 0.65
		draw.RoundedBox(0, 0, h / 4 + 3, w, height, Color(100, 100, 100, alpha - 5))
		draw.SimpleLinearGradientPanel(self, 0, h / 4 + 3, w * pr, height, Color(255, 255, 255, alpha), Color(255, 255, 255, alpha * 0.1))
		draw.SimpleText(text..' ( '..math.Round(parent:GetValue())..'% )', F('futura_22'), w / 2, h / 4 + h * 0.36, Color(0, 0, 0, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.SetDrawColor(200, 200, 200, alpha)
		surface.DrawOutlinedRect(0, h / 4 + 3, w, height)
	end

	return slider

end

function Gui.Deploy.clear()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	deploy_panel.title = ''

	for k, v in pairs(deploy_panel:GetChildren()) do

		if !v.content then

			continue

		end

		v:Remove()

	end

end

function Gui.Deploy.drawScreenPoints()

	if !CVAR_MULT_SPAWNS then

		return

	end

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	for k, v in pairs(deploy_panel:GetChildren()) do

		if v.isPoint then

			v:Remove()

		end

	end

	local function add_point_to_screen(v, vpos, owner, word, round)

		local pointSize = (HUD.PointSize or 40) * 2
		local point = vgui.Create("DButton", deploy_panel)
		point:SetSize(pointSize, pointSize)
		point:SetText("")
		point.isPoint = true
		point.alpha = 0

		local teamOwner = IsValid(v) and v:GetControlledBy() or owner
		if (Gui.Deploy.location == (word or v:GetPoint()) and teamOwner == LocalPlayer():Team()) then

			point.alpha = 255

		end

		point.Think = function(self)
			if deploy_panel.title and deploy_panel.title != '' then
				self:SetMouseInputEnabled(false)
				self:SetEnabled(false)
			else
				self:SetEnabled(true)
				self:SetMouseInputEnabled(true)
			end
		end

		local pos;

		if IsValid(v) then

			pos = v:GetPos():ToScreen()

		else
			pos = vpos:ToScreen()

		end

		local x, y = pos.x - point:GetWide() / 2, pos.y - point:GetTall() / 2

		point:SetPos(math.Clamp(x, 0, w * 0.95), math.Clamp(y, h * 0.12, h * 0.92))

		point.Paint = function(self, w, h)
			if deploy_panel.title != "" then

				return

			end

			teamOwner = IsValid(v) and v:GetControlledBy() or owner

			local FT = FrameTime() * 1000

			if teamOwner != TEAM_AXIS and teamOwner != TEAM_ALLIES then

				return

			end

			if self:IsHovered() or (Gui.Deploy.location == (word or v:GetPoint()) and teamOwner == LocalPlayer():Team()) then

				self.alpha = math.min(self.alpha + FT, 255)

			else

				self.alpha = math.max(self.alpha - FT, 0)

			end

			local dColor = team.GetColor(teamOwner) or color_white
			if IsValid(v) then

				surface.SetDrawColor(dColor.r, dColor.g, dColor.b, self.alpha)
				surface.DrawOutlinedRect(0, 0, w, h, 4)

			else	

				if round then

					surface.SetDrawColor( dColor.r, dColor.b, dColor.g, 200)
					draw.NoTexture()
					local radius = w * 0.25
					HUD:Circle( w / 2, h / 2, radius, 50 )

					draw.SimpleTextShadow(word, "futuraBold_18", w / 2, 0, color_white, TEXT_ALIGN_CENTER)

				else

					draw.RoundedBox(0, 0 + w / 4, 0 + h / 4, w / 2, h / 2, Color(dColor.r, dColor.g, dColor.b))

					draw.SimpleTextShadow(word, "futura_20", w / 2, 0, color_white, TEXT_ALIGN_CENTER)

				end

				draw.RoundedBox(0, 0, 0, w, h, Color(dColor.r, dColor.g, dColor.b, self.alpha))

				local facLogo = faction.Team(teamOwner).icoBig
				if facLogo then

					surface.SetMaterial(facLogo)
					surface.SetDrawColor(255, 255, 255)
					local sizew, sizeh = w / 2 - 10, h / 2 - 10
					surface.DrawTexturedRect(w / 2 - sizew / 2, h / 2 - sizeh / 2, sizew, sizeh)

				end

			end
		end

		point.DoClick = function(self)
			local teamOwner = IsValid(v) and v:GetControlledBy() or owner

			if teamOwner != TEAM_AXIS and teamOwner != TEAM_ALLIES then

				return

			end

			if teamOwner != LocalPlayer():Team() then

				return

			end

			for k, v in pairs(deploy_panel:GetChildren()) do

				if v.isPoint then

					v.clicked = false

				end

			end

			self.clicked = true
			Gui.Deploy.location = IsValid(v) and v:GetPoint() or word
			notify.Add("deploy_location", "nil", 1)
		end

	end

	local points = ents.FindByClass("ww2_point_flag")

	for k, v in pairs(points) do

		add_point_to_screen(v)

	end

	local beacons = ents.FindByClass("ww2_spawn_beacon")

	for k, beacon in pairs(beacons) do

		if !beacon.GetTeam then continue end

		if beacon:GetTeam() != LocalPlayer():Team() then continue end

		add_point_to_screen(nil, beacon:GetPos(), beacon:GetTeam(), "BEACON", 10)

	end

	add_point_to_screen(nil, maploader.GetHQ(TEAM_AXIS), TEAM_AXIS, "HQ")
	add_point_to_screen(nil, maploader.GetHQ(TEAM_ALLIES), TEAM_ALLIES, "HQ")

end

function Gui.Deploy.Net()

	local loadoutSave = util.JSONToTable(file.Read("ww2tdm/loadout.txt", "DATA") or "") or {}

	Gui.Deploy.vector = true
	net.Start('DeployPlayer')
		net.WriteString(Gui.Deploy.location or "")
		net.WriteTable(loadoutSave)
	net.SendToServer()

end

function Gui.Deploy.menu()

	if (Gui._deployNext or 0) >= CurTime() then

		return

	end

	if LocalPlayer():GetNWBool('DeathScreen') == true then

		return

	end

	if !Gui.Deploy.OpenedAtOnce then

		net.Start("PlayerLoaded")
		net.SendToServer()

	end

	net.Start("UpdatePlayerCountry")
		net.WriteString(system.GetCountry())
	net.SendToServer()

	Gui.RemoveVGUI('deploy_menu')
	Gui.RemoveVGUI('hint_panel')
	Gui.RemoveVGUI('team_selection')

	Gui.Deploy.OpenedAtOnce = true

	RunConsoleCommand("gmod_mcore_test", "1")

	local isAlive = LocalPlayer():IsAlive()
		
	local w, h = ScrW(), ScrH()

	Gui.Deploy.location = ""

	local deploy_panel = Gui.CreateVGUI('deploy_menu', 'DFrame', nil, 'noclose')
	deploy_panel:SetSize(w, h)
	deploy_panel:SetDraggable(false)
	deploy_panel:ShowCloseButton(false)
	deploy_panel:MakePopup()
	deploy_panel:SetTitle('')
	deploy_panel:SetAlpha(0)
	deploy_panel:AlphaTo(255, 0.25)
	deploy_panel.preventInstantClose = true
	deploy_panel.title = ''

	local DEPLOY_BUTTONS = {
		{name = 'menu_deploy', outline = true, callback = function(parent)
			--if LocalPlayer() != Bro() then return end
			
			if maploader.Gamemode() == "war" and !LocalPlayer():IsAlive() then
				parent.clicked = false

				if deploy_panel.title == "" then
					Gui.Deploy.Net()
				else
					Gui.Deploy.clear()
				end
			else
				Gui.Deploy.Net()
			end
		end},
		{name = 'menu_changeteam', size_coeff = 0.3, callback = function()
			teamSelectionMenu()
		end},
		{name = 'menu_loadout', size_coeff = 0.3, callback = function(parent)
			Gui.Deploy.openClassList()
		end},
		{name = 'menu_stats', size_coeff = 0.19, callback = function(parent)
			Gui.Deploy.openStats()
		end},
		{name = 'menu_settings', size_coeff = 0.21, callback = function()
			Gui.Deploy.openSettings()
		end},
		{name = 'menu_quit', callback = function(parent)
			parent.clicked = false
			Gui.Deploy.confirmWindow(T("wanna_disconnect_bitch"), function()
				RunConsoleCommand('disconnect')
			end)
		end},
	}

	if isAlive then

		DEPLOY_BUTTONS[1].name = 'menu_redeploy'

	else

		Gui.Deploy.drawScreenPoints()

	end

	local gametype = maploader.Gamemode()

	-- timer.Create("SpawnPointsUpdate", 1, 0, function()

	-- 	if !LocalPlayer():IsAlive() then

	-- 		Gui.Deploy.drawScreenPoints()

	-- 	end

	-- end)

	local coinMat = Material("hud/coins.png", "smooth noclamp")
	local elitecoinMat = Material("hud/coins_gold.png", "smooth noclamp")
	deploy_panel.Paint = function(self, w, h)
		if gametype == "war" and !LocalPlayer():IsAlive() and self.title == '' then

			draw.SimpleLinearGradient(0, 0, w, h * 0.2, Color(0, 0, 0, 255), Color(0, 0, 0, 0))

		else

			Gui.FrameBlur(self, 1, 1)
			draw.SimpleLinearGradient(0, 0, w, h, Color(0, 0, 0, 240), Color(0, 0, 0, 200))

		end

		if self.title then

			draw.SimpleText(utf8upper(T(self.title)), F('futura_70'), 15, h * 0.07, color_white)

		end

		local sizew = w * 0.04
		local sizeh = sizew * 1.14
		surface.SetMaterial(coinMat)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawTexturedRect(5, h - sizeh - 5, sizew, sizeh)
		draw.SimpleTextShadow(LocalPlayer():GetCoins(), F("futura_40"), 10 + sizew, h - sizeh / 2 - 5, color_white, nil, TEXT_ALIGN_CENTER)
		local wide = surface.GetSize(LocalPlayer():GetCoins(), F("futura_40"))

		local offset = 10 + sizew + wide + 5
		surface.SetMaterial(elitecoinMat)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawTexturedRect(offset, h - sizeh - 5, sizew, sizeh)
		draw.SimpleTextShadow(LocalPlayer():GetEliteCoins(), F("futura_40"), offset + sizew + 5, h - sizeh / 2 - 5, color_white, nil, TEXT_ALIGN_CENTER)


		-- OBJECTIVE:
		if self.title == '' and LocalPlayer():Team() != TEAM_SPECTATOR then

			local offset = 5

			local adv = ''
			if TEAM_ATTACK then

				adv = LocalPlayer():Team() == TEAM_ATTACK and "_attack" or "_defend"

			end

			local descText, descFont = T(gametype.."_desc"..adv), F("futuraLight_25")
			local descWidth, descHeight = surface.GetSize(descText, descFont)
			draw.SimpleTextShadow(T(gametype), F("futura_35"), w - descWidth + surface.GetSize(T(gametype), F("futura_35")) - offset, h * 0.93 - offset, color_white, TEXT_ALIGN_RIGHT)
			draw.SimpleTextShadow(descText, descFont, w - offset, h - descHeight - offset, color_white, TEXT_ALIGN_RIGHT)

			if LocalPlayer():IsBoosting() then

				local timeLeft = LocalPlayer():GetBoost() - os.time()
				local str = T("seconds"):format(timeLeft)
				if timeLeft > INT_HOUR_IN_SECONDS then

					str = T("hours"):format(math.ceil(timeLeft / INT_HOUR_IN_SECONDS))

				elseif timeLeft > INT_MINUTE_IN_SECONDS then

					timeLeft = T("minutes"):format(math.ceil(timeLeft / INT_MINUTE_IN_SECONDS))

				end

				if LocalPlayer():GetBoost() == -1 then
		
					draw.SimpleTextShadow(T("double_xp"), F("futuraBold_30"), 5, h * 0.85, color_white)

				else

					draw.SimpleTextShadow(T("double_xp"), F("futuraBold_30"), 5, h * 0.8, color_white)
					draw.SimpleTextShadow(T("double_xp_time"):format(str), F("futura_22"), 5, h * 0.84, color_white)

				end

			end

		end
	end

	deploy_panel.OnRemove = function()
		gui.HideGameUI()

		if IsValid(Gui.Deploy.WepEntity) then

			Gui.Deploy.WepEntity:Remove()

		end

		timer.Remove("SpawnPointsUpdate")
	end

	deploy_panel.Think = function(self)
		if input.IsButtonDown(KEY_ESCAPE) and (LocalPlayer():IsAlive() or LocalPlayer():Team() == TEAM_SPECTATOR or !CVAR_RESPAWN_TIME) then
			if self.preventInstantClose then
				return
			end

			Gui._deployNext = CurTime() + 1
			Gui.RemoveVGUI('deploy_menu')
		else
			self.preventInstantClose = false
		end
	end

	/*
	local close_button = vgui.Create('DButton', deploy_panel)
	close_button:SetSize(25, 25)
	close_button:SetPos(deploy_panel:GetWide() - close_button:GetWide(), 0)
	close_button:SetText('')
	close_button.Paint = function(self, w, h)
		local clr, alpha = color_white, 0

		if self:IsHovered() then
			alpha = 255
			clr = Color(0, 0, 0)
		end

		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, alpha))
		draw.SimpleText('X', 'futuraBold_24', w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		surface.SetDrawColor(255, 255, 255, 100)
		surface.DrawOutlinedRect(0, 0, w, h, 1)
	end
	close_button.DoClick = function()
		deploy_panel:Remove()
	end
	*/

	local buttons_list = vgui.Create('DPanel', deploy_panel)
	buttons_list:SetSize(w * 0.603, h * 0.05)
	buttons_list:CenterHorizontal(0.5)
	buttons_list.perm = true
	buttons_list.Paint = function() end

	for k, v in pairs(DEPLOY_BUTTONS) do

		local font = F('futura_30')
		local centerAmount = #DEPLOY_BUTTONS - 2
		local wide = buttons_list:GetWide() / centerAmount
		if v.size_coeff then
			wide = buttons_list:GetWide() * v.size_coeff
		end
		local _wide = wide
		local cornerSize = w * 0.2
		local deploy_button;

		if k == 1 or k == #DEPLOY_BUTTONS then
			deploy_button = vgui.Create('DButton', deploy_panel)
			wide = cornerSize
		else
			deploy_button = vgui.Create('DButton', buttons_list)
			--wide = surface.GetSize(utf8upper(T(v.name)), font)
		end

		deploy_button:SetSize(wide, buttons_list:GetTall())

		if k == 1 then
			deploy_button:SetPos(0, 0)
		elseif k == #DEPLOY_BUTTONS then
			deploy_button:SetPos(w - wide, 0)
		else
			deploy_button:Dock(LEFT)
		end

		deploy_button:SetText('')
		deploy_button.boxScale = 0

		deploy_button.Paint = function(self, w, h)
			local FT = 5 * FrameTime()
			local clr = color_white

			if self:IsHovered() or self.clicked then

				self.boxScale = math.min(self.boxScale + FT, 1)
				clr = Color(0, 0, 0)

			else

				self.boxScale = math.max(self.boxScale - FT, 0)

			end

			draw.SimpleLinearGradientPanel(self, 0, 0, w, h * self.boxScale, color_white, Color(color_white.r, color_white.g, color_white.b, 0))

			local buttonName = v.name
			local bCanSpawn = LocalPlayer():GetNWBool('b_PassedWave') or !LocalPlayer():GetNWBool('b_InitSpawned')
			
			if buttonName == 'menu_deploy' and !bCanSpawn then

				buttonName = LocalPlayer():GetNWBool('b_SpawnReady') and 'menu_deploy_ready' or 'menu_deploy_notready'

			end

			local text = T(buttonName)

			if v.name == 'menu_deploy' and !bCanSpawn then

				local respawnTime = GetGlobalInt("NextSpawnWave")

				if maploader.Gamemode():find("push") then

					respawnTime = GetGlobalInt("NextSpawnWave"..LocalPlayer():Team())

				elseif CVAR_PERSONAL_SPAWNTIME then

					respawnTime = LocalPlayer():GetNWInt("NextSpawnWave")

				end

				local time = math.Round(math.max(respawnTime - CurTime(), 0), 1)
				text = text .. ' (' .. T('seconds'):format(time) .. ')'

				if time == 0 then

					text = T('menu_deploy_await')

				end

			end

			local align;
			local x = 5
			if !v.outline then

				align = TEXT_ALIGN_CENTER
				x = w / 2

				if k == #DEPLOY_BUTTONS then

					align = TEXT_ALIGN_RIGHT
					x = w - 5

				end

			end

			draw.SimpleText(utf8upper(text), font, x, h / 2, Color(clr.r, clr.g, clr.b, 200), align, TEXT_ALIGN_CENTER)
		end

		deploy_button.DoClick = function(self)
			for k, v in pairs(buttons_list:GetChildren()) do
				v.clicked = false
			end

			self.clicked = true
			v.callback(self)
		end

	end

end

function Gui.Deploy.classModel(clData)

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	local player_model;

	if Gui.IsValidVGUI("player_model") then

		player_model = Gui.GetVGUI("player_model")

	else

		player_model = Gui.CreateVGUI("player_model", 'DModelPanel', deploy_panel)

	end

	player_model:SetSize(deploy_panel:GetWide() * 0.38, deploy_panel:GetTall() * 0.9)
	player_model:SetPos(deploy_panel:GetWide() / 2 - player_model:GetWide() / 2, deploy_panel:GetTall() / 2 - player_model:GetTall() / 2)
	player_model:SetFOV(50)
	player_model:SetModel( LocalPlayer():GetHead() )
	player_model:SetAnimated(true)
	player_model:SetAmbientLight(team.GetColor(LocalPlayer():Team()))
	player_model:SetDirectionalLight(BOX_FRONT, Color(0, 0, 0))
	player_model.content = true
	player_model.Angles = Angle(0, 45, 0)
	if !player_model.posSet then

		player_model.posSet = true
		player_model:SetCamPos(player_model:GetCamPos() + Vector(30, 0, 0))

	end

	if IsValid(Gui.Deploy.WepEntity) then

		Gui.Deploy.WepEntity:Remove()

	end

	local clientWeaponEntity = ClientsideModel("models/weapons/w_irifle.mdl")
	clientWeaponEntity:Spawn()
	Gui.Deploy.WepEntity = clientWeaponEntity

	local ActIndex = {
		["smg"] = "hum_idle_relaxed_smg1_2",
		["ass"] = "hum_idle_relaxed_shotgun_2",
		["heavy"] = "hum_idle_relaxed_shotgun_9",
		["rifle"] = "hum_idle_relaxed_shotgun_4",
		["pistol"] = "ww2_pistol_idle",
	}

	local bonename = "ValveBiped.Bip01_R_Hand"

	function player_model:UpdateWeapon()

		local clWeps = clData and clData["Weapons"] or LocalPlayer():GetClassInfo("Weapons")
		if !clWeps then return end

		local primary = clWeps[1]
		local wep;
		local atts;
		local wepClass = primary
		if istable(primary) then

			wep = weapons.Get(primary.weapon)
			wepClass = primary.weapon
			atts = primary.attachments

		else

			wep = weapons.Get(primary)

		end

		if !wep then return end

		clientWeaponEntity:SetModel(wep.WorldModel)

		if wepClass:find("ger") or wepClass:find("usa") then

			clientWeaponEntity:SetAngles(Angle(0, 0, 180))

		end

		if wep.PreviewOffset then

			clientWeaponEntity:SetPos(clientWeaponEntity:GetPos() + wep.PreviewOffset.pos)
			clientWeaponEntity:SetAngles(clientWeaponEntity:GetAngles() + wep.PreviewOffset.ang)

		end

		if wep.WorldModelOffset then

			clientWeaponEntity:SetModelScale(wep.WorldModelOffset.scale or 1)

		end

		clientWeaponEntity:SetParent(self.Entity, self.Entity:LookupAttachment("anim_attachment_RH"))
		self.weapon = clientWeaponEntity

		for k, v in pairs(clientWeaponEntity:GetChildren()) do

			v:Remove()

		end

		for k, attname in pairs(atts or {}) do

			local atttable = ArcCW.AttachmentTable[attname]
			if atttable.HideWorldModel or !atttable.WorldModel then continue end

			local csAttachment = ClientsideModel(atttable.WorldModel)
			csAttachment:SetParent(clientWeaponEntity)
			csAttachment:AddEffects(EF_BONEMERGE)
			csAttachment:Spawn()

		end

		local holdtype = wep.HoldtypeActive or wep:GetHoldType()
		if REPLACE_HOLDTYPES[holdtype] then

			holdtype = REPLACE_HOLDTYPES[holdtype]

		end

		local anim = ActIndex[holdtype]
		self.CustomSequence = anim;

	end

	player_model:UpdateWeapon()

	function player_model:PerformBonemerge()

		local bonemerge = LocalPlayer():GetClassInfo("Bonemerge")

		if CFG.SnowMap then

			bonemerge = LocalPlayer():GetClassInfo("SnowBonemerge")

		end

		if clData then

			bonemerge = clData["Bonemerge"]

		end

		local ent = self:GetEntity()

		if !IsValid(ent) then return end

		ent:clearBonemerges()

		for bmtype, v in pairs(bonemerge or {}) do

			ent:createBonemerge( v.model, bmtype, v.skin, v.bodygroups )

		end

	end


	function player_model:Think()

		self:PerformBonemerge()

	end

	function player_model:LayoutEntity( ent )

		if ( self.Pressed ) then

			local mx, my = gui.MousePos()
			self.Angles = self.Angles - Angle( ( self.PressY or my ) - my, ( self.PressX or mx ) - mx, 0 )
			self.PressX, self.PressY = gui.MousePos()

		end

		ent:SetAngles( Angle(0, self.Angles.y, 0 ) )

		local seq = ent:LookupSequence(self.CustomSequence or 'idle_subtle')

		if seq != -1 then

			ent:SetSequence(seq)

		end

		self:RunAnimation()

	end

	function player_model:DragMousePress()

		self.PressX, self.PressY = gui.MousePos()
		self.Pressed = true

	end

	function player_model:DragMouseRelease()

		self.Pressed = false

	end

end

function Gui.Deploy.openClassList()

	if CVAR_CLASSES_DISABLED then

		notify.Add("class_list_disabled", "nil", 2)
		return

	end

	local w, h = ScrW(), ScrH()

	local factionData = faction.Team(LocalPlayer():Team())

	local deploy_panel = Gui.GetVGUI('deploy_menu')
	Gui.Deploy.clear()

	if !IsValid(deploy_panel) then

		return

	end

	if !factionData then

		return

	end

	deploy_panel.title = 'class_list'

	if CVAR_CUSTOM_LOADOUT then

		local loadoutSave = util.JSONToTable(file.Read("ww2tdm/loadout.txt", "DATA") or "") or {}

		local function createSelection(id, x, y, tableData)

			local panel = vgui.Create("DPanel", deploy_panel)
			panel:SetSize(w * 0.22, h * 0.16)
			panel:SetPos(x, y)
			panel.content = true
			panel.Paint = function(self, w, h)
				draw.SimpleText(T("loadout_"..id), F("futura_32"), 5, 5, color_white)
			end

			local selector = vgui.Create("DButton", panel)
			selector:Dock(FILL)
			selector:DockMargin(0, ScrH() * 0.05, 0, 0)
			selector:SetText("")
			selector.Paint = function(self, w, h)
				local text = loadoutSave[id] or T("loadout_none")
				local wepID = killfeed.FormatWepID(text)

				surface.SetDrawColor(255, 255, 255)
				surface.DrawOutlinedRect(0, 0, w, h)

				if wepID then
					draw.SimpleText(T(weapons.Get(text).PrintName), F("futura_20"), 5, 5, color_white)

					local ico = killfeed.textures[text] or Material('hud/feed/weapons/' .. wepID .. '.png', 'smooth')
					if ico:IsError() then
						draw.SimpleText("?", F("futuraBold_50"), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					else
						local scale = ico:GetInt("$realheight") / ico:GetInt("$realwidth")
						local wide = w * 0.5
						if text:find("pistol") or text:find("revolver") then
							wide = wide / 2
						end
						local height = wide * scale
						surface.SetMaterial(ico)
						surface.SetDrawColor(255, 255, 255)
						surface.DrawTexturedRect(w / 2 - wide / 2, h / 2 - height / 2, wide, height)
					end
				else
					draw.SimpleText(T(text), F("futura_30"), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			end
			selector.DoClick = function(self)
				local dmenu = vgui.Create("DMenu", deploy_panel)
				dmenu:SetPos(input.GetCursorPos())
				for k, v in SortedPairsByValue(tableData) do
					local wepID = killfeed.FormatWepID(v)
					if wepID and (!Gui.Deploy.LoadoutsAvailable or !Gui.Deploy.LoadoutsAvailable[v]) then continue end
					dmenu:AddOption(T(weapons.Get(v) and weapons.Get(v).PrintName or v), function()
						loadoutSave[id] = v

						file.Write("ww2tdm/loadout.txt", util.TableToJSON(loadoutSave))
					end)
				end
			end
		end

		local primaryWeapons, secondaryWeapons = {}, {}
		for k, v in ipairs(weapons.GetList()) do
			if !v.CanBash then continue end
			local class = v.ClassName
			if class:find("bomb") or class:find("grenade") or class:find("melee") or class:find("rpg") or class:find("pistol") or class:find("revolver") then
				continue
			end

			table.insert(primaryWeapons, class)
		end

		for k, v in ipairs(weapons.GetList()) do
			if !v.CanBash then continue end
			local class = v.ClassName
			if !class:find("pistol") and !class:find("revolver") then
				continue
			end

			table.insert(secondaryWeapons, class)
		end

		local traits = {TRAIT_TACSPRINT, TRAIT_QUICKRELOAD, TRAIT_SUPPRESSION, TRAIT_DEPLOY, TRAIT_MOBILITY, TRAIT_AMMO}

		createSelection("primary", w * 0.02, h * 0.2, primaryWeapons)
		createSelection("secondary", w * 0.02, h * 0.36 + 20, secondaryWeapons)
		createSelection("traits", w * 0.02, h * 0.52 + 40, traits)

	else

		local classes = factionData.Classes

		local class_list = vgui.Create("DefaultScroll", deploy_panel)
		class_list:SetSize(w * 0.25, h * 0.6)
		class_list:SetPos(w * 0.02, h * 0.2)
		class_list.Paint = function() end
		class_list:SetAlpha(0)
		class_list:AlphaTo(255, 0.2, 0)
		class_list.content = true
		class_list.Children = {}

		local function createClassFromCategories(tableCategories)

			for k, category in pairs(tableCategories) do

				local class_category = vgui.Create('DPanel', class_list)
				class_category:Dock(TOP)
				class_category:DockMargin(0, h * 0.03, 5, 0)
				class_category.Paint = function(self, w, h)
					local categoryName = utf8upper(T(category))
					local nameFont = F('futura_20')
					local textWide, textHeight = surface.GetSize(categoryName, nameFont)
					local lineColor, lineMargin = Color(255, 255, 255, 50), 5

					draw.RoundedBox(0, 0, h * 0.1 + textHeight / 2, w / 2 - textWide / 2 - lineMargin, 1, lineColor)
					draw.SimpleText(categoryName, nameFont, w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					draw.RoundedBox(0, w / 2 + textWide / 2 + lineMargin, h * 0.1 + textHeight / 2, w / 2 - textWide / 2, 1, lineColor)
				end
				table.insert(class_list.Children, class_category)

				for id, clData in pairs(classes) do

					if clData.Category != category then continue end

					local className = utf8upper( T(clData.Name) ) 

					local class_button = vgui.Create('DButton', class_list)
					class_button:Dock(TOP)
					class_button:DockMargin(0, h * 0.02, 5, 0)
					class_button:SetText('')
					class_button:SetTall(h * 0.04)
					class_button.alpha = 100
					table.insert(class_list.Children, class_button)
					class_button.numplayers = clData:NumPlayers(LocalPlayer():Team())
					class_button.Paint = function(self, w, h)
						local FT = 500 * FrameTime()
						if self:IsHovered() or LocalPlayer():GetClass() == id then
							self.alpha = math.min(self.alpha + FT, 255)
						else
							self.alpha = math.max(self.alpha - FT, 100)
						end

						if (self.NextNum or 0) < CurTime() then
							self.NextNum = CurTime() + 0.5
							self.numplayers = clData:NumPlayers(LocalPlayer():Team())
						end

						Gui.FrameBlur(self, 5, 5)
						draw.RoundedBox(0, 0, 0, h, h, Color(100, 100, 100, 20))

						local icoSize = h * 0.6

						if clData:GetIcon() then

							surface.SetDrawColor(255, 255, 255)
							surface.SetMaterial(clData:GetIcon())
							surface.DrawTexturedRect(0, 0, h, h)

						end

						local text, font = self.numplayers, F("futura_30")
						if clData:GetLimit() > 0 then
							text = text .. "/" .. clData:GetLimit()
						end
						draw.SimpleText(text, font, w - 5, h / 2, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

						surface.SetDrawColor(255, 255, 255)
						surface.SetMaterial(Material('hud/ico_soldier.png', 'smooth'))
						surface.DrawTexturedRect(w - icoSize - surface.GetSize(text, font) - 5, h / 2 - icoSize / 2, icoSize, icoSize)

						draw.RoundedBox(0, h + 5, 0, w, h, Color(100, 100, 100, 20))
						draw.SimpleText(className, F('futura_26'), h + 10, h / 2, Color(255, 255, 255, self.alpha), nil, TEXT_ALIGN_CENTER)
						draw.RoundedBox(0, 0, h - 2, w, 2, Color(255, 255, 153, self.alpha - 90))

						if !IsClassBought(id) then

							local lvl = (clData:GetLevel() or 0)

							if LocalPlayer():GetLevel() < lvl then

								local lvlStr, lvlFont = lvl .. " " .. T("level_short"), F('futura_25')
								draw.SimpleText(lvlStr, lvlFont, w - surface.GetSize(text, font) - w * 0.05 - surface.GetSize(lvlStr, lvlFont) - 10, h / 2, color_white, nil, TEXT_ALIGN_CENTER)

							end

							if clData.Cost > 0 then

								draw.SimpleText('X', F('futuraLight_60'), h / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

							end

						end
					end

					class_button.DoClick = function(self, fakeClick)

						if !IsClassBought(id) and !fakeClick and clData.Cost > 0 then

							if LocalPlayer():GetLevel() < (clData:GetLevel() or 0) then

								notify.Add("class_restricted_level", "nil", 3)

							else

								Gui.Deploy.classModel(ShowClassDetails(clData))

								Gui.AwaitLoad("canunlock", function(data)
									Gui.Deploy.viewClass(id, clData, true, nil, data[1])
								end, id)

							end

							return

						end

						if !fakeClick and clData:Limited(LocalPlayer():Team(), LocalPlayer()) then

							notify.Add(T("class_restricted_limit"):format(utf8upper(T(clData.Name))), "nil", 3)
							return

						end

						for k, v in pairs(class_list:GetChildren()[1]:GetChildren()) do
							v.selected = false
						end

						self.selected = true
						Gui.ClassProgression = nil;

						if LocalPlayer():GetClass() != id then
							LocalPlayer():SelectClass(id)
						end

						Gui.Deploy.classModel()
						Gui.RemoveVGUI('class_panel')

						Gui.AwaitLoad("classlevel", function(data)
							Gui.ClassProgression = data.progression
							Gui.Deploy.viewClass(id, clData, false, data.loadouts)
						end)

					end

					if id == LocalPlayer():GetClass() then

						class_button:DoClick(true)

					end

				end

			end

		end

		Gui.Deploy.BuildCategories(class_list, {
			{
				name = "roles_general",
				callback = function()
					createClassFromCategories(CFG.ClassCategories or {})
				end,
				isActive = true
			},
			{
				name = "roles_elite",
				callback = function(self)
					createClassFromCategories(CFG.EliteCategories or {})
				end
			}
		})

	end

	Gui.Deploy.classModel()
	
	local ribbonMat = LocalPlayer():FindRibbon() and Material(LocalPlayer():FindRibbon(), "smooth")
	local player_level = vgui.Create('DPanel', deploy_panel)
	player_level:SetSize(w * 0.35, h * 0.1)
	player_level:SetPos(w / 2 - player_level:GetWide() / 2, h * 0.85)
	player_level.content = true
	player_level.Paint = function(self, w, h)
		local plyLevel = LocalPlayer():GetLevel()

		if !ribbonMat then
			return
		end

		local ribbonSize = w * 0.18
		surface.SetMaterial(ribbonMat)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawTexturedRect(0, h / 2 - ribbonSize / 2, ribbonSize, ribbonSize)

		local offset = w * 0.22
		local facID = faction.GetID(LocalPlayer():Team())
		if facID:find("ger") then
			offset = w * 0.2
		end

		draw.SimpleText(plyLevel .. ' ' .. T('rank'), F('futura_30'), offset, 0, color_white)

		local barHeight = ScrH() * 0.01
		draw.RoundedBox(0, offset, h / 2 - barHeight / 2, w - offset, barHeight, Color(0, 0, 0, 200))

		local scale = 1
		local nld = PROGRESSION_LEVELS[plyLevel + 1]
		if nld then
			scale = LocalPlayer():GetPermXP() / nld.xp
			local xpCount = LocalPlayer():GetPermXP() .. ' / ' .. nld.xp
			local xpFont = F('futuraLight_20')
			draw.SimpleText(xpCount, xpFont, math.min(offset + w * scale, w - surface.GetSize(xpCount, F(xpFont))), h * 0.6, color_white)
		end

		draw.RoundedBox(0, offset, h / 2 - barHeight / 2, (w - offset) * scale, barHeight, Color(200, 200, 200, 200))

		surface.SetDrawColor(200, 200, 200, 100)
		surface.DrawOutlinedRect(offset, h / 2 - barHeight / 2, w - offset, barHeight)
	end

	local class_level = vgui.Create("DPanel", deploy_panel)
	class_level:SetSize(w * 0.2, h * 0.06)
	class_level:SetPos(w / 2 - class_level:GetWide() / 2, h * 0.16)
	class_level.content = true
	class_level.Paint = function(self, w, h)
		if !Gui.ClassProgression then return end

		local faction = LocalPlayer():GetFaction()
		if !faction then return end

		local class = faction:Class(LocalPlayer():GetClass())
		local level, xp = Gui.ClassProgression.level, Gui.ClassProgression.xp

		local offset = 0

		draw.SimpleText(class.Name .. ', ' .. utf8lower(T('level')) .. ' ' .. level, F('futuraLight_20'), offset, 0, color_white)

		local barHeight = ScrH() * 0.01
		draw.RoundedBox(0, offset, h / 2 - barHeight / 2, w - offset, barHeight, Color(0, 0, 0, 200))

		local scale = 1
		if level < CFG.ClassMaxLevel then
			scale = xp / GetXPForLevel(level)
			local xpCount = xp .. ' / ' .. GetXPForLevel(level)
			local xpFont = F('futuraLight_15')
	
			draw.SimpleText(xpCount, xpFont, math.min(math.max(offset + w * scale, 0), w - surface.GetSize(xpCount, F(xpFont))), h * 0.6, color_white)
		end

		draw.RoundedBox(0, offset, h / 2 - barHeight / 2, (w - offset) * scale, barHeight, Color(200, 200, 200, 200))

		surface.SetDrawColor(200, 200, 200, 100)
		surface.DrawOutlinedRect(offset, h / 2 - barHeight / 2, w - offset, barHeight)
	end

end

function Gui.Deploy.viewClass(classid, clData, shouldBuy, loadouts, canUnlock)

	if !clData then

		return

	end

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	local w, h = ScrW(), ScrH()

	Gui.RemoveVGUI('class_panel')
	Gui.RemoveVGUI('buy_button')

	local class_panel = Gui.CreateVGUI('class_panel', 'DPanel', deploy_panel)
	local class_panel_wide, class_panel_height = w * 0.25, h * 0.6
	local class_panel_x, class_panel_y = w - class_panel_wide - w * 0.06, h * 0.2
	class_panel:SetSize(0, class_panel_height)
	class_panel:SetPos(class_panel_x, class_panel_y)
	class_panel.weapons = {}
	class_panel.content = true
	class_panel.Paint = function(self, realw, realh)
		local w, h = class_panel_wide, class_panel_height
		local className = clData.Name or 'UNKNOWN'
		local nameFont = F('futura_30')
		local textWide, textHeight = surface.GetSize(className, nameFont)
		local lineColor, lineMargin = Color(255, 255, 255, 50), 5

		draw.RoundedBox(0, 0, h * 0.1 + textHeight / 2, w / 2 - textWide / 2 - lineMargin, 1, lineColor)
		draw.SimpleText(className, nameFont, w / 2, h * 0.1, color_white, TEXT_ALIGN_CENTER)
		draw.RoundedBox(0, w / 2 + textWide / 2 + lineMargin, h * 0.1 + textHeight / 2, w / 2 - textWide / 2, 1, lineColor)

		if self.category == 'category_loadout' then
			draw.SimpleText(utf8upper(T('category_loadout')), F('futuraBold_24'), 5, h * 0.65, color_white)

			local k = 0
			local metWeapons = {}
			for _, v in pairs(self.weapons) do -- LET'S DO SOME BUILDI... WEAPONS DRAWING
				local wepName;
				local attstr = ''
				if v == '' then
					continue
				end

				if weapons.Get(v) then
					wepName = weapons.Get(v).PrintName or 'UNKNOWN'
				else
					if !istable(v) then
						continue
					end
					wepName = weapons.Get(v.weapon).PrintName or 'UNKNOWN'
					for attid, attname in pairs(v.attachments) do
						local atttbl = ArcCW.AttachmentTable[attname]
						if !atttbl then continue end
						if atttbl.PrintName == "" then continue end
						local quot = ', '
						if attid == trickyTableLength(v.attachments) then quot = '' end
						attstr = attstr .. atttbl.PrintName .. quot
					end
				end

				if metWeapons[wepName] then continue end
				
				k = k + 1

				metWeapons[wepName] = true

				local wepLine = '- ' .. T(wepName)
				if attstr != '' then
					wepLine = wepLine .. ' | '
				end
				local wepY = h * 0.79 + h * 0.05 * (k - 1)
				draw.SimpleText(wepLine, F('futura_24'), 5, wepY, color_white)
				draw.SimpleText(attstr, F('futura_21'), 5 + surface.GetSize(wepLine, F('futura_24')), wepY + h * 0.05 / 2, color_white, nil, TEXT_ALIGN_CENTER)
			end
		end
	end

	if shouldBuy then

		local buy_button = Gui.CreateVGUI("buy_button", "DButton", Gui.GetVGUI('deploy_menu'))
		buy_button:SetSize(class_panel_wide, h * 0.05)
		buy_button:SetPos(class_panel_x, class_panel_y + class_panel_height + 10)
		buy_button:SetText("")
		buy_button.boxScale = 0
		buy_button.Think = function(self)
			if !IsValid(Gui.GetVGUI("class_panel")) then
				self:Remove()
			end
		end
		buy_button.Paint = function(self, w, h)
			local FT = FrameTime() * 5
			local clr = color_white

			if self:IsHovered() then

				self.boxScale = math.min(self.boxScale + FT, 1)
				clr = Color(0, 0, 0)

			else

				self.boxScale = math.max(self.boxScale - FT, 0)

			end

			draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 5))
			draw.SimpleLinearGradientPanel(self, 0, 0, w * self.boxScale, h, color_white, Color(color_white.r, color_white.g, color_white.b, 0), true)
			draw.SimpleText(T("buy_class_2"), F("futura_30"), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		buy_button.DoClick = function(self)
			if !canUnlock then

				local baseName = clData:Faction():Class(clData:GetBase()).Name
				notify.Add("Вы должны прокачать класс " .. baseName .. " для покупки данного класса!", "nil", 5)
				return

			end

			Gui.Deploy.confirmWindow(T("buy_class"):format(clData.Name, clData.Cost), function()

				if clData:GetBase() then

					if LocalPlayer():GetEliteCoins() >= clData.Cost then

						CLASS_STORED[classid] = {}

					end

				else

					if LocalPlayer():GetCoins() >= clData.Cost then

						CLASS_STORED[classid] = {}

					end

				end

				net.Start("BuyClass")

					net.WriteString(classid)

				net.SendToServer()

				LocalPlayer():SelectClass(classid)

				Gui.AwaitLoad("classlevel", function(data)
					Gui.ClassProgression = data.progression
					Gui.Deploy.viewClass(classid, clData, false, data.loadouts)
				end)

			end)
		end

	end

	class_panel:SizeTo(class_panel_wide + w * 0.3, class_panel_height, 0.5, 0, -4)

	local function addCategory(name, x, y, callback, isActive)

		local button_category = vgui.Create('DButton', class_panel)
		button_category:SetSize(class_panel_wide * 0.3, h * 0.05)
		button_category:SetPos(x, y)
		button_category.active = isActive
		button_category.category = true
		button_category:SetText('')

		button_category.Paint = function(self, w, h)
			local clr = Color(200, 200, 200, 50)
			if self:IsHovered() or self.active then
				clr = Color(255, 255, 204, 100)
				draw.RoundedBox(0, 0, h * 0.9, w, 2, clr)
			end

			draw.SimpleText(utf8upper(T(name)), F('futura_23'), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		button_category.DoClick = function(self)
			for k, v in pairs(class_panel:GetChildren()) do
				if v.category then
					v.active = false
				else
					v:Remove()
				end
			end
			class_panel.category = name
			self.active = true
			callback()
		end

		if isActive then

			button_category:DoClick()

		end

	end

	addCategory('category_loadout', class_panel_wide * 0.12, 5, function()

		local traitUnlocked = Gui.ClassProgression and Gui.ClassProgression.level >= CFG.ClassTraitLevel or clData.TraitInstant
		local classLoadouts = clData.Variants or {}
		local class = ShowClassDetails(clData, LocalPlayer():GetLoadout())

		local class_stats = vgui.Create("DPanel", class_panel)
		class_stats:SetSize(class_panel_wide, class_panel_height * 0.5)
		class_stats:SetPos(0, h * 0.1)
		class_stats.Paint = function(self, w, h)
			local stats = ShowClassDetails(clData, LocalPlayer():GetLoadout())
			local fontTitle, fontSmall = F("futura_30"), F("futura_22")
			draw.SimpleText(T("class_stats"), F(fontTitle), 0, 0, color_white)
			local status;

			status = "average"
			local ppoints = stats.AP + stats.HP
			if ppoints >= 200 then
				status = "high"
			elseif ppoints < 130 then
				status = "low"
			end

			draw.SimpleText("• " .. T("armor_"..status), F(fontSmall), 0, h * 0.12, color_white)

			status = "average"
			if stats.RunSpeed > 210 then
				status = "high"
			elseif stats.RunSpeed < 190 then
				status = "low"
			end

			draw.SimpleText("• " .. T("speed_"..status), F(fontSmall), 0, h * 0.22, color_white)

			draw.SimpleText(T("class_trait"), F(fontTitle), 0, h * 0.32, color_white)
			if stats.Trait then
				draw.SimpleText("• " .. T(stats.Trait), F(fontSmall), 0, h * 0.44, color_white)
			else
				draw.SimpleText("• " .. T("trait_none"), F(fontSmall), 0, h * 0.44, color_white)
			end

			if stats.Favourite then

				local text = stats.Favourite
				if istable(stats.Favourite) then
					
					text = ''
					for k, v in pairs(stats.Favourite) do

						text = text .. T(k) .. ', '

					end

					text = utf8sub(text, 1, utf8len(text) - 2)

				end
				draw.SimpleText(T("class_favourite"), F(fontTitle), 0, h * 0.72, color_white)
				draw.SimpleText("• " .. T(text), F(fontSmall), 0, h * 0.84, color_white)

			end
		end

		if class.Trait then

			local trait_desc = vgui.Create("DLabel", class_stats)
			trait_desc:SetWide(class_stats:GetWide())
			trait_desc:SetAutoStretchVertical(true)
			trait_desc:SetPos(0, class_stats:GetTall() * 0.54)
			trait_desc:SetFont(F("futura_20"))
			trait_desc:SetColor(color_white)
			trait_desc:SetText(T(class.Trait .. "_desc"))
			trait_desc:SetWrap(true)

		end

		if class.Trait and !traitUnlocked then

			local locked_panel = vgui.Create("DPanel", class_stats)
			locked_panel:SetSize(class_stats:GetWide(), class_stats:GetTall() * 0.16)
			locked_panel:SetPos(0, class_stats:GetTall() * 0.54)
			locked_panel.scale = 255
			locked_panel.Paint = function(self, w, h)
				local FT = FrameTime() * 1200
				if self:IsHovered() then
					self.scale = math.max(self.scale - FT, 0)
				else
					self.scale = math.min(self.scale + FT, 255)
				end

				draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, self.scale))
				draw.SimpleText(T("trait_locked"), F("futuraBold_20"), w / 2, h / 2, Color(255, 255, 255, self.scale), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end

		end

		local class_loadouts = vgui.Create('DHorizontalScroller', class_panel)
		class_loadouts:SetSize(class_panel_wide, class_panel_height * 0.06)
		class_loadouts:SetPos(0, class_panel_height * 0.55 + h * 0.1)
		class_loadouts.Paint = function() end
		class_loadouts:SetOverlap( -class_loadouts:GetWide() * 0.02 )

		classLoadouts[0] = {}

		for id = 0, #classLoadouts do

			local v = classLoadouts[id]

			local loadout = vgui.Create('DButton', class_loadouts)
			loadout:SetSize(class_loadouts:GetWide() * 0.4, class_loadouts:GetTall())
			loadout:SetText('')
			loadout.alpha = 0

			if id != #classLoadouts then

				loadout:DockMargin(0, 0, class_loadouts:GetWide() * 0.033333, 0)

			end

			if LocalPlayer():GetLoadout() == id then

				local loadoutInfo = ShowClassDetails(clData, id)
				class_panel.weapons = loadoutInfo.Weapons or {}

			end

			local lockMat = Material("hud/lock.png", "smooth")
			loadout.Paint = function(self, w, h)
				local loadoutName = T(v.Name or 'default_loadout')
				local clr, clr2 = color_white, Color(150, 150, 150, 255)
				local FT = FrameTime() * 400

				if self.hover or LocalPlayer():GetLoadout() == id then
					clr, clr2 = Color(0, 0, 0), Color(0, 0, 0)
					self.alpha = math.min(self.alpha + FT, 255)
				else
					self.alpha = math.max(self.alpha - FT, 0)
				end

				draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, self.alpha))
				draw.SimpleText(loadoutName, F('futuraBold_20'), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				if !IsLoadoutBought(classid, id) and id != 0 then

					draw.SimpleText("X", F("futuraLight_200"), w / 2, h / 2, clr2, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				end

				if v.Level and Gui.ClassProgression.level < v.Level then

					Gui.FrameBlur(self, 3, 3)
					local size = 24
					surface.SetMaterial(lockMat)
					surface.SetDrawColor(255, 255, 255)
					surface.DrawTexturedRect(w / 2 - size / 2, h / 2 - size / 2, size, size)

				end

				surface.SetDrawColor(200, 200, 200)
				surface.DrawOutlinedRect(0, 0, w, h, 2)
			end
			loadout.OnCursorEntered = function(self)
				self.hover = true
				local loadoutInfo = ShowClassDetails(clData, id)
				class_panel.weapons = loadoutInfo.Weapons or {}
			end
			loadout.OnCursorExited = function(self)
				self.hover = false
				class_panel.weapons = {}
			end
			loadout.DoClick = function()
				if !IsClassBought(classid) then

					return

				end

				if v.Level and Gui.ClassProgression.level < v.Level then

					Gui.Deploy.confirmWindow(T("loadout_level"):format(v.Level))
					return

				end

				if !IsLoadoutBought(classid, id) then

					local loadoutInfo = ShowClassDetails(clData, id)
					local cost = loadoutInfo.Cost

					if loadouts and table.HasValue(loadouts, id) then

						cost = cost - math.floor(cost * CFG.LoadoutDiscount)

					end

					Gui.Deploy.confirmWindow(T("buy_loadout"):format(loadoutInfo.Name, cost), function()

						if !CLASS_STORED[classid] then

							CLASS_STORED[classid] = {}

						end

						if LocalPlayer():GetCoins() >= cost then

							table.insert(CLASS_STORED[classid], id)

						end

						Gui.Deploy.viewClass(classid, clData)

						net.Start("BuyLoadout")

							net.WriteUInt(id, 5)

						net.SendToServer()

					end)
					return

				end

				LocalPlayer():SelectLoadout(id)

				Gui.Deploy.classModel()
			end

			class_loadouts:AddPanel(loadout)

		end

	end, true)

	addCategory('category_appearence', class_panel_wide - class_panel_wide * 0.3 - class_panel_wide * 0.12, 5, function()
		local class_description = vgui.Create('DLabel', class_panel)
		class_description:SetText(T('test_disabled'))
		class_description:SetFont(F('futura_30'))
		class_description:SetWide(class_panel_wide)
		class_description:SetAutoStretchVertical(true)
		class_description:SetWrap(true)
		class_description:CenterVertical(0.5)
	end)

end

--[[-------------------------------------------------------------------------
STATS
---------------------------------------------------------------------------]]

function Gui.Deploy.CreateSpace(title)

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	deploy_panel.title = title

	local work_field = Gui.CreateVGUI("work_field", "DefaultScroll", deploy_panel)
	work_field:Dock(FILL)
	work_field:DockMargin(5, h * 0.2, 5, h * 0.1)
	work_field.content = true
	work_field.SettingsData = {}
	work_field.Children = {}
	work_field.Paint = function(self, w, h)
		if isbool(self.loaded) and !self.loaded then

			draw.SimpleText(T("loading_info"), F("futura_50"), w / 2, h / 2, Color(255, 255, 255, 255 * HUD:Fluctuate(5)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		end

		if self.disabled then

			draw.SimpleText(T("test_disabled"), F("futura_50"), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		end
	end

	return work_field

end

function Gui.Deploy.BuildCategories(panel, categories)

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	local catlist = vgui.Create('DPanel', deploy_panel)
	catlist:SetSize(w, h * 0.05)
	catlist:SetPos(15, h * 0.15)
	catlist.content = true
	catlist.Paint = function() end

	local function addCategory(name, callback, isActive)

		local textWide = surface.GetSize(utf8upper(T(name)), F('futura_23'))
		local wide = w * 0.1
		if textWide > wide then
			wide = textWide + w * 0.02
		end

		local button_category = vgui.Create('DButton', catlist)
		button_category:SetWide(wide)
		button_category:Dock(LEFT)
		button_category:DockMargin(0, 0, w * 0.01, 0)
		button_category.active = isActive
		button_category.category = true
		button_category:SetText('')
		button_category.alpha = 0
		button_category.Paint = function(self, w, h)
			local clr = Color(200, 200, 200, 100)
			local FT = FrameTime() * 600
			if self:IsHovered() or self.active then
				clr = Color(0, 0, 0)
				self.alpha = math.min(self.alpha + FT, 255)
			else
				self.alpha = math.max(self.alpha - FT, 0)
			end

			draw.SimpleLinearGradientPanel(self, 0, 0, w, h, Color(255, 255, 255, self.alpha), Color(255, 255, 255, self.alpha * 0.1), true)

			draw.SimpleText(utf8upper(T(name)), F('futura_23'), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			surface.SetDrawColor(255, 255, 255, 50)
			surface.DrawOutlinedRect(0, 0, w, h)
		end

		button_category.DoClick = function(self)
			local parent = self:GetParent()
			if !IsValid(parent) then
				return
			end

			for k, v in pairs(parent:GetChildren()) do
				v.active = false
			end

			for k, v in pairs(panel.Children or {}) do
				if IsValid(v) then
					v:Remove()
				end
			end

			for k, v in pairs(panel.SettingsData or {}) do
				if v.panel then
					v.panel:Remove()
				end
			end
			panel.SettingsData = {}
			panel.disabled = false

			self.active = true
			callback(panel)
		end

		if isActive then

			button_category:DoClick()

		end

	end

	timer.Simple(0, function()

		for k, v in pairs(categories) do

			addCategory(v.name, v.callback, v.isActive)

		end

	end)

	return work_field

end

function Gui.Deploy.openStats()

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	Gui.Deploy.clear()

	local stats_panel = Gui.Deploy.CreateSpace("barracks")

	local function drawStats(playerStats)

		local function getNiceStat(id)

			return playerStats[id] or 0

		end

		local categories = {
			{
				name = "PlayerKills",
			},
			{
				name = "PlayerDeaths",
			},
			{
				name = "PlayerKD",
				computed = function(id)
					return math.Round(getNiceStat("PlayerKills") / math.max(getNiceStat("PlayerDeaths"), 1), 2)
				end
			},
			{
				name = "ObjectivesCaped"
			},
			{
				name = "weapons",
			},
			{
				name = "PlayerScores"
			},
		}

		for i = 1, math.ceil(#categories / 3) do

			if !stats_panel.Children then return end

			local categories_header = vgui.Create("DPanel", stats_panel)
			categories_header:Dock(TOP)
			categories_header:SetTall(h * 0.2)
			categories_header.Paint = function() end
			categories_header.content = true
			table.insert(stats_panel.Children, categories_header)

			local bestVal, bestTar
			local start = 3 * (i - 1) + 1
			for k = start, start + 2 do

				local v = categories[k]

				if !v then

					break;

				end

				local statData;
				if v.computed then

					statData = v.computed()

				else

					statData = playerStats[v.name] or "N/A"

				end

				if istable(statData) then

					for k, v in pairs(statData) do

						if !bestVal or v > bestVal then

							bestVal = v
							bestTar = k

						end

					end

					statData = bestTar

				end

				local header_stat = vgui.Create("DPanel", categories_header)
				header_stat:Dock(LEFT)
				header_stat:SetWide(w * 0.31113)
				if 3 * i - k == 1 then
					header_stat:DockMargin(w * 0.0333, 0, w * 0.0333, 0)
				end
				header_stat.Paint = function(self, w, h)
					local title, font = utf8upper(T(v.name)), F("futura_40")
					draw.SimpleText(title, font, w / 2, 5, color_white, TEXT_ALIGN_CENTER)

					local _, height = surface.GetSize(title, font)
					draw.SimpleLinearGradientPanel(self, 5, 7 + height, w - 10, 2, color_white, Color(255, 255, 255, 0), true)

					local displayText = statData
					local ico;

					if weapons.Get(statData) then

						displayText = weapons.Get(statData).PrintName .. ' (' .. bestVal .. ' ' .. utf8lower(T("PlayerKills")) .. ')'

						local wepID = killfeed.FormatWepID(statData)
						if wepID then

							ico = killfeed.textures[statData] or Material('hud/feed/weapons/' .. wepID .. '.png', 'smooth')

							if ico:IsError() then

								ico = nil;

							end

						end

					end

					draw.SimpleText(displayText, F("futura_40"), w / 2, height + 7 + h * 0.1, color_white, TEXT_ALIGN_CENTER)

					if ico then

						local scale = math.min(ico:GetInt("$realwidth") / ico:GetInt("$realheight"), 6)
						local sizeh = h * 0.35
						local sizew = sizeh * scale
						surface.SetMaterial(ico)
						surface.SetDrawColor(255, 255, 255)
						surface.DrawTexturedRect(w / 2 - sizew / 2, h * 0.65, sizew, sizeh)

					end
				end
				table.insert(stats_panel.Children, header_stat)

			end

		end

	end

	local function drawArsenal()

		local wep_list = vgui.Create("DefaultScroll", stats_panel)
		wep_list:SetSize(w * 0.25, stats_panel:GetTall())
		wep_list:SetPos(0, 0)
		table.insert(stats_panel.Children, wep_list)

		local wepList = weapons.GetList()
		local filterInfo = {
			[FACTION_GERMANY] = "ger",
			[FACTION_GERMANYWEST] = "ger",
			[FACTION_USSR] = "rus",
			[FACTION_USA] = "usa"
		}

		local faction = LocalPlayer():GetFaction()

		if !faction then

			return

		end

		local wep_info = vgui.Create("DPanel", stats_panel)
		wep_info:SetSize(w * 0.74 - 5, stats_panel:GetTall())
		wep_info:SetPos(w * 0.26, 0)
		table.insert(stats_panel.Children, wep_info)
		wep_info.Paint = function(self, w, h)
			local t = self.swep
			if !t then

				return

			end

			local class = t.ClassName

			local text, font = T(t.PrintName or "N/A"), F("futura_50")
			draw.SimpleText(text, font, 5, 5, color_white)

			local height = select(2, surface.GetSize(text, font)) + h * 0.02

			local stats = {}

			if class:find("grenade") or class:find("bomb") then

				local grenadeEnt = scripted_ents.Get(t.ShootEntity)
				if !grenadeEnt then return end
				if !grenadeEnt.DamageAmount then return end

				stats  = {
					{ text = "stat_fuse", data = t.FuseTime, ps = "stat_seconds" },
					{ text = "stat_damage", data = grenadeEnt.DamageAmount, projectBar = 500 },
					{ text = "stat_range", data = grenadeEnt.DamageRadius, projectBar = 1000 },
					{ text = "stat_throw", data = t.MuzzleVelocity, projectBar = 1500 },
				}

			elseif class:find("melee") then

				stats  = {
					{ text = "stat_range", data = t.MeleeRange, ps = "metres" },
					{ text = "stat_damage", data = t.MeleeDamage, projectBar = 100 },
				}

			else

				stats  = {
					{ text = "stat_clipsize", data = t.Primary.ClipSize, ps = "clipsize" },
					{ text = "stat_range", data = t.Range, ps = "metres" },
					{ text = "stat_rpm", data = 60 / t.Delay, ps = "rpm" },
					{ text = "stat_damage", data = t.Damage, projectBar = 100 },
					{ text = "stat_recoil", data = t.Recoil + t.RecoilSide + t.RecoilRise, projectBar = 10 },
					{ text = "stat_spread", data = t.AccuracyMOA, projectBar = 15, minuser = true },
					{ text = "stat_sway", data = t.Sway, projectBar = 5, minuser = true },
				}

			end

			local heightOffset = h * 0.01

			for k, v in ipairs(stats) do

				text, font = T(v.text), F("futura_30")
				draw.SimpleText(text, font, 5, height, color_white)

				height = height + select(2, surface.GetSize(text, font)) + heightOffset / 2

				if v.projectBar then

					local boxWidth, boxHeight = w * 0.05, h * 0.02
					local offset = 0

					if v.minuser then

						v.data = v.projectBar - v.data

					end

					for i = 1, 4 do

						local blockSize = v.projectBar / 4
						local boxScale = math.Clamp(v.data / blockSize, 0, 1)

						surface.SetDrawColor(color_white)
						surface.DrawOutlinedRect(5 + offset, height, boxWidth, boxHeight, 2)
						draw.RoundedBox(0, 5 + offset, height, boxWidth * boxScale, boxHeight, color_white)
						offset = offset + boxWidth + w * 0.004
						v.data = v.data - blockSize

					end

					height = height + boxHeight + heightOffset

				else

					text, font = v.data, F("futura_25")
					draw.SimpleText(text, font, 5, height, color_white)

					local wi, he = surface.GetSize(text, font)

					if v.ps then

						text, font = T(v.ps), F("futura_20")
						draw.SimpleText(text, font, wi + w * 0.008, height, color_white)

					end

					height = height + he + heightOffset

				end

			end
		end


		local weapon_model;
		wep_info.SetWeapon = function(self, swepData)
			self:SetAlpha(0)
			self.swep = swepData
			self:AlphaTo(255, 0.5, 0)

			if IsValid(weapon_model) then

				weapon_model:Remove()

			end

			local w, h = stats_panel:GetWide(), stats_panel:GetTall()

			weapon_model = vgui.Create("DModelPanel", self)
			weapon_model:SetSize(w * 0.5, h)
			weapon_model:SetPos(w * 0.2, 0)
			weapon_model:SetModel(swepData.WorldModel)
			weapon_model:SetFOV(60)

			local ent = weapon_model.Entity
			weapon_model:SetLookAt(ent:GetPos())

			local distance = 70
			local class = swepData.ClassName

			if class:find("pistol") or class:find("melee") or class:find("revolver") or class:find("grenade") or class:find("bomb") then

				distance = 40

			end

			weapon_model:SetCamPos(ent:GetPos() - Vector(-distance, 0, 0))

			weapon_model.Angles = Angle(0, -90, 0)
			function weapon_model:LayoutEntity( ent )

				if ( self.Pressed ) then

					local mx, my = gui.MousePos()
					self.Angles = self.Angles - Angle( ( self.PressY or my ) - my, ( self.PressX or mx ) - mx, 0 )
					self.PressX, self.PressY = gui.MousePos()

				end

				local previewAng = swepData.PreviewOffset and swepData.PreviewOffset.ang or Angle(0, 0, 0)
				local roll = previewAng.r

				if class:find("ger") or class:find("usa") then

					roll = roll + -180

				elseif swepData.ActivePos == swepData.SprintPos then

					roll = 0

				end

				ent:SetAngles( Angle(0, self.Angles.y, roll ) )

			end

			function weapon_model:DragMousePress()

				self.PressX, self.PressY = gui.MousePos()
				self.Pressed = true

			end

			function weapon_model:DragMouseRelease()

				self.Pressed = false

			end
		end

		local wepCategories = {
			"battlerifle",
			"semiauto",
			"rifle",
			"pistol",
			"revolver",
			"smg",
			"mg",
			"sniperrifle",
			"shotgun",
			"bomb",
			"grenade",
		}

		local watchedList = {}

		for id, cat in pairs(wepCategories) do

			local wep_category = vgui.Create('DPanel', wep_list)
			wep_category:Dock(TOP)
			wep_category:DockMargin(0, h * 0.03, 5, 0)
			wep_category.Paint = function(self, w, h)
				local categoryName = utf8upper(T(cat))
				local nameFont = F('futura_20')
				local textWide, textHeight = surface.GetSize(categoryName, nameFont)
				local lineColor, lineMargin = Color(255, 255, 255, 50), 5

				draw.RoundedBox(0, 0, h * 0.1 + textHeight / 2, w / 2 - textWide / 2 - lineMargin, 1, lineColor)
				draw.SimpleText(categoryName, nameFont, w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.RoundedBox(0, w / 2 + textWide / 2 + lineMargin, h * 0.1 + textHeight / 2, w / 2 - textWide / 2, 1, lineColor)
			end

			local foundAtLeast;

			for k, v in pairs(wepList) do

				local class = v.ClassName

				if !class or !class:find(filterInfo[faction.Name]) then

					continue

				end

				if !v.PreviewOffset and !class:find("grenade") and !class:find("bomb") and !class:find("melee") then

					continue

				end

				if !class:find(cat) or watchedList[class] then

					continue

				end

				watchedList[class] = true
				foundAtLeast = true

				local wep_button = vgui.Create('DButton', wep_list)
				wep_button:Dock(TOP)
				wep_button:DockMargin(0, h * 0.02, 5, 0)
				wep_button:SetText('')
				wep_button:SetTall(h * 0.04)
				wep_button.alpha = 100
				wep_button.Paint = function(self, w, h)
					local FT = 500 * FrameTime()
					if self:IsHovered() or self.selected then
						self.alpha = math.min(self.alpha + FT, 255)
					else
						self.alpha = math.max(self.alpha - FT, 100)
					end

					Gui.FrameBlur(self, 5, 5)
					draw.RoundedBox(0, 0, 0, w, h, Color(100, 100, 100, 20))

					draw.SimpleText(v.PrintName or "N/A", F('futura_26'), 5, h / 2, Color(255, 255, 255, self.alpha), nil, TEXT_ALIGN_CENTER)
					draw.SimpleLinearGradientPanel(self, 0, h - 2, w, 2, Color(255, 255, 153, self.alpha - 90), Color(255, 255, 153, 0), true)
				end
				wep_button.DoClick = function(self)
					wep_info:SetWeapon(v)

					for k, v in pairs(wep_list:GetChild(0):GetChildren()) do
						v.selected = false
					end

					self.selected = true
				end

			end

			if !foundAtLeast then

				wep_category:Remove()

			end

		end

	end

	local function drawHelp()

		local info_panel;

		local HELP_HINTS = "hints"
		local HELP_FAQ = "faq"
		local help_categories = {
			[HELP_HINTS] = function()
				info_panel.Paint = function() end
				for k, v in pairs(CFG.Hints) do

					local hint = vgui.Create("DLabel", info_panel)
					hint:Dock(TOP)
					hint:SetWide(info_panel:GetWide())
					hint:SetWrap(true)
					hint:SetAutoStretchVertical(true)
					hint:SetText("- ".. CFG.GetHint(v))
					hint:SetFont(F("futura_30"))
					hint:DockMargin(0, 0, 0, h * 0.02)
					hint.content = true

				end

			end,
			[HELP_FAQ] = function()
				info_panel.Paint = function(self, w, h)
					draw.SimpleText(T("test_disabled"), F("futuraBold_30"), 0, 0, color_white)
				end
			end,
		}

		-- wrapping functions
		for id, func in pairs(help_categories) do

			help_categories[id] = function()

				-- why the fuck, garry??? Fuck you nigger.
				for k, v in pairs(info_panel:GetChild(0):GetChildren()) do

					if v.content then

						v:Remove()

					end

				end

				func()

			end

		end

		local hints_selectable = vgui.Create("ww2_combobox", stats_panel)
		hints_selectable:SetPos(5, 5)
		hints_selectable:SetSize(w * 0.1, h * 0.05)
		hints_selectable:SetFont(F("futura_25"))
		hints_selectable:SetSubFont(F("futura_20"))
		local shouldSelect = true
		for k, v in pairs(help_categories) do
			hints_selectable:AddChoice(utf8upper(T(k)), k, shouldSelect)
			shouldSelect = false
		end
		hints_selectable.OnSelect = function(self, index, value, data)
			help_categories[data]()
		end
		table.insert(stats_panel.Children, hints_selectable)

		local offset = h * 0.1
		info_panel = vgui.Create("DefaultScroll", stats_panel)
		info_panel:SetSize(stats_panel:GetWide(), stats_panel:GetTall() - offset)
		info_panel:SetPos(0, offset)
		info_panel.Paint = function() end
		table.insert(stats_panel.Children, info_panel)

		help_categories[HELP_HINTS]()

	end

	local function drawLeaderboard(leaderboard)

		local function getNiceStat(id)

			return leaderboard[id] or 0

		end

		local categories = {
			{
				name = "TopKills",
			},
			{
				name = "TopObjectives",
			},
			{
				name = "TopLevel",
			},
		}

		for i = 1, math.ceil(#categories / 3) do

			if !stats_panel.Children then return end

			local categories_header = vgui.Create("DPanel", stats_panel)
			categories_header:Dock(TOP)
			categories_header:SetTall(h * 0.2)
			categories_header.Paint = function() end
			categories_header.content = true
			table.insert(stats_panel.Children, categories_header)

			local bestVal, bestTar
			local start = 3 * (i - 1) + 1
			for k = start, start + 2 do

				local v = categories[k]

				if !v then

					break;

				end

				local statData;
				if v.computed then

					statData = v.computed()

				else

					statData = playerStats[v.name] or "N/A"

				end

				local header_stat = vgui.Create("DPanel", categories_header)
				header_stat:Dock(LEFT)
				header_stat:SetWide(w * 0.31113)
				if 3 * i - k == 1 then
					header_stat:DockMargin(w * 0.0333, 0, w * 0.0333, 0)
				end
				header_stat.Paint = function(self, w, h)
					local title, font = utf8upper(T(v.name)), F("futura_40")
					draw.SimpleText(title, font, w / 2, 5, color_white, TEXT_ALIGN_CENTER)

					local _, height = surface.GetSize(title, font)
					draw.RoundedBox(0, 5, 7 + height, w - 10, 2, color_white)

					local displayText = statData
					local ico;

					if weapons.Get(statData) then

						displayText = weapons.Get(statData).PrintName .. ' (' .. bestVal .. ' ' .. utf8lower(T("PlayerKills")) .. ')'

						local wepID = killfeed.FormatWepID(statData)
						if wepID then

							ico = killfeed.textures[statData] or Material('hud/feed/weapons/' .. wepID .. '.png', 'smooth')

							if ico:IsError() then

								ico = nil;

							end

						end

					end

					draw.SimpleText(displayText, F("futura_40"), w / 2, height + 7 + h * 0.1, color_white, TEXT_ALIGN_CENTER)

					if ico then

						local scale = math.min(ico:GetInt("$realwidth") / ico:GetInt("$realheight"), 6)
						local sizeh = h * 0.35
						local sizew = sizeh * scale
						surface.SetMaterial(ico)
						surface.SetDrawColor(255, 255, 255)
						surface.DrawTexturedRect(w / 2 - sizew / 2, h * 0.65, sizew, sizeh)

					end
				end
				table.insert(stats_panel.Children, header_stat)

			end

		end

	end

	local function drawTransfer()
		local dentry = vgui.Create("DTextEntry", stats_panel)
		dentry:SetPlaceholderText("Сколько вы хотите получить элитных монет")
		dentry:SetSize(w * 0.2, h * 0.03)
		dentry:SetPos(5, 5)
		dentry:SetFont(F("futura_20"))
		dentry:SetDrawLanguageID(false)

		local buy_button = vgui.Create("DButton", stats_panel)
		buy_button:SetSize(w * 0.15, h * 0.05)
		buy_button:SetPos(5, h * 0.03 + 10)
		buy_button:SetText("")
		buy_button.boxScale = 0
		buy_button.DoClick = function()
			local value = tonumber(dentry:GetText())
			if !isnumber(value) then return end
			if value < 0 then return end
			value = math.ceil(value)

			local needCoins = value * CFG.CoinsToElite
			if LocalPlayer():GetCoins() < needCoins then

				notify.Add("notenough_coins", "nil", 3)
				return

			end

			net.Start("EliteCoinsExchange")
				net.WriteUInt(value, 32)
			net.SendToServer()
		end
		buy_button.Paint = function(self, w, h)
			local FT = FrameTime() * 5
			local clr = color_white

			if self:IsHovered() then

				self.boxScale = math.min(self.boxScale + FT, 1)
				clr = Color(0, 0, 0)

			else

				self.boxScale = math.max(self.boxScale - FT, 0)

			end

			draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 5))
			draw.SimpleLinearGradientPanel(self, 0, 0, w * self.boxScale, h, color_white, Color(color_white.r, color_white.g, color_white.b, 0), true)
			draw.SimpleText(T("transfer_coins"), F("futura_30"), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local label = vgui.Create("DLabel", stats_panel)
		label:SetSize(w * 0.2, h * 0.03)
		label:SetPos(5, h * 0.08 + 15)
		label:SetTextColor(color_white)
		label:SetFont(F("futura_18"))
		label:SetText(T("tranfer_help"):format(CFG.CoinsToElite))

		table.insert(stats_panel.Children, dentry)
		table.insert(stats_panel.Children, buy_button)
		table.insert(stats_panel.Children, label)
	end

	Gui.Deploy.BuildCategories(stats_panel, {
		{
			name = "barracks_stats",
			callback = function(self)
				self.loaded = false
				Gui.AwaitLoad("stats", function(data)
					if IsValid(self) then
						self.loaded = true
						drawStats(data)
					end
				end)
			end,
			isActive = true
		},
		{
			name = "barracks_tasks",
			callback = function(self)
				self.loaded = false
				--self.disabled = true
				--return;
				Gui.AwaitLoad("tasks", function(data)
					if IsValid(self) then
						self.loaded = true
						tasks.Gui(data)
					end
				end)
			end
		},
		{
			name = "barracks_weapons",
			callback = function(self)
				drawArsenal()
			end,
		},
		{
			name = "barracks_help",
			callback = function(self)
				drawHelp()
			end
		},
		{
			name = "barracks_transfer",
			callback = function(self)
				drawTransfer()
			end
		}
	})

end

--[[-------------------------------------------------------------------------
SETTINGS
---------------------------------------------------------------------------]]

function Gui.Deploy.openSettings()

	local w, h = ScrW(), ScrH()

	local deploy_panel = Gui.GetVGUI('deploy_menu')

	if !IsValid(deploy_panel) then

		return

	end

	Gui.Deploy.clear()

	local settings_panel = Gui.Deploy.CreateSpace("settings")
	settings_panel:DockMargin(5, h * 0.2, 5, h * 0.12)

	Gui.Deploy.BuildCategories(settings_panel, {
		{
			name = "settings_general",
			callback = function(self)
				self.SettingsData = {}
				for k, info in pairs(settings.list["general"]) do
					Gui.Deploy.AddSetting(settings_panel, info.sname, 10, 10 + h * 0.02 + (h * 0.08) * (k - 1), info.stype, T(info.sname))
				end
			end,
			isActive = true
		},
		{
			name = "settings_character",
			callback = function(self)
				Gui.AwaitLoad("charparams", function(charData)
					self.SettingsData = {}

					local heads_selectable = vgui.Create("ww2_combobox", settings_panel)
					heads_selectable:SetPos(5, 5)
					heads_selectable:SetText("")
					heads_selectable:SetSize(w * 0.1, h * 0.05)
					heads_selectable:SetFont(F("futura_25"))
					heads_selectable:SetSubFont(F("futura_20"))
					for i = 0, LocalPlayer():SkinCount() - 1 do
						local shouldBeSelected = i == LocalPlayer():GetSkin()
						heads_selectable:AddChoice("Голова #"..i, i, shouldBeSelected)
					end
					heads_selectable.OnSelect = function(self, index, value, data)
						net.Start("ChangeHeadSkin")
							net.WriteUInt(data, 6)
						net.SendToServer()
					end
					table.insert(settings_panel.Children, heads_selectable)

					local slider = Gui.Deploy.GetSlider(settings_panel, "Высота голоса")
					slider:SetDecimals(0)
					slider:SetMin(CFG.VoicePitch.min)
					slider:SetMax(CFG.VoicePitch.max)
					slider:SetValue(charData["pitch"])
					slider:SetSize(settings_panel:GetWide() - 10, settings_panel:GetTall() * 0.08)
					slider:SetPos(5 - slider:GetWide() / 2.4, h * 0.08 - slider:GetTall() / 4)

					table.insert(self.SettingsData, {type = "bar_pitch", panel = slider})

					if !LocalPlayer():IsPremium() then
						local dark_overlay = vgui.Create("DPanel", deploy_panel)
						dark_overlay:Dock(FILL)
						dark_overlay:DockMargin(0, h * 0.2, 0, 0)
						dark_overlay.Paint = function(self, w, h)
							draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))

							draw.SimpleText(T("buy_premium"), F("futura_30"), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
						end

						table.insert(settings_panel.Children, dark_overlay)
					end
				end)
			end
		}
	})

	local button_apply = vgui.Create('DButton', deploy_panel)
	button_apply:SetSize(deploy_panel:GetWide() * 0.2, deploy_panel:GetTall() * 0.05)
	button_apply:SetText('')
	button_apply:SetPos(deploy_panel:GetWide() - button_apply:GetWide() - 10, deploy_panel:GetTall() - button_apply:GetTall() - 2)
	button_apply.alpha = 0
	button_apply.content = true
	button_apply.Paint = function(self, w, h)
		local text = utf8upper(T('settings_apply'))
		local clr = color_white
		local FT = FrameTime() * 600
		if self:IsHovered() then
			clr = Color(0, 0, 0)
			self.alpha = math.min(self.alpha + FT, 255)
		else
			self.alpha = math.max(self.alpha - FT, 0)
		end

		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, self.alpha))

		draw.SimpleText(text, F('futuraLight_35'), w / 2, h / 2, clr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		surface.SetDrawColor(200, 200, 200)
		surface.DrawOutlinedRect(0, 0, w, h)
	end
	button_apply.DoClick = function()

		for k, v in pairs(settings_panel.SettingsData) do

			if v.type == 'checkBox' then

				settings.ChangeSetting(v.data, v.panel:GetChecked())

			elseif v.type == 'bar' then

				settings.ChangeSetting(v.data, math.Round(v.panel:GetValue()))

			elseif v.type == 'bar_pitch' then

				net.Start("ChangeCharPitch")

					net.WriteUInt(math.Round(v.panel:GetValue()), 16)

				net.SendToServer()

			elseif v.type == 'dcombobox' then

				settings.ChangeSetting(v.data, v.panel.selected)

			elseif v.type == 'dbinder' then

				settings.ChangeSetting(v.data, v.panel.bind)

			end

		end
		
		notify.Add('settings_applied', "nil", 3)
	end

end

function Gui.Deploy.AddSetting(panel, data, cx, cy, sType, text)

	if !IsValid(panel) then return end

	if sType == 'checkBox' then

		local dcheckBox = vgui.Create('DCheckBox', panel)
		dcheckBox:SetSize(panel:GetWide() - cx, panel:GetTall() * 0.08)
		dcheckBox:SetPos(cx, cy)
		dcheckBox:SetValue(!isstring(data) and data or settings.Get()[data])
		dcheckBox.setting = true

		dcheckBox.Paint = function(self, w, h)
			local alpha = 255
			if panel:GetParent().alpha then
				alpha = panel:GetParent().alpha
			end
			draw.RoundedBox(0, 0, 0, 20, 20, Color(0, 0, 0, alpha - 150))

			if self:GetChecked() then
				draw.RoundedBox(0, 0, 0, 20, 20, Color(255, 255, 255, alpha))
			end

			draw.SimpleText(text, F('futura_25'), 30, h * -0.001, Color(255, 255, 255, alpha))

			surface.SetDrawColor(200, 200, 200, alpha - 155)
			surface.DrawOutlinedRect(0, 0, 20, 20)
		end

		table.insert(panel.SettingsData, {type = sType, panel = dcheckBox, data = data})

	elseif sType:find('bar') then

		local value = settings.GetData(data)

		local slider = Gui.Deploy.GetSlider(panel, T(text))
		slider:SetDecimals(0)
		slider:SetMin(value.min or 0)
		slider:SetMax(value.max or 100)
		slider:SetValue(settings.Get()[data])
		slider:SetSize(panel:GetWide() - cx, panel:GetTall() * 0.08)
		slider:SetPos(cx - slider:GetWide() / 2.4, cy - slider:GetTall() / 4)

		table.insert(panel.SettingsData, {type = sType, panel = slider, data = data})

	elseif sType == 'dcombobox' then

		local combo = vgui.Create('DComboBox', panel)
		combo:SetSize(panel:GetWide() - cx - 10, panel:GetTall() * 0.08)
		combo:SetPos(cx, cy - combo:GetTall() / 4)
		combo:SetValue(T(settings.Get()[data]))
		combo:SetFont('futura_25')
		combo.selected = settings.Get()[data]
		combo.setting = true
		for k, v in pairs(settings.availableThemes) do
			combo:AddChoice(T(k), k)
		end
		combo.OnSelect = function(self, index, val, data)
			self.selected = data
		end
		table.insert(panel.SettingsData, {type = sType, panel = combo, data = data})

	elseif sType == 'dbinder' then

		local binder = vgui.Create('DBinder', panel)
		binder:SetSize(panel:GetWide() * 0.4, panel:GetTall() * 0.08)
		binder:SetPos(cx, cy - binder:GetTall() / 4)
		binder:SetValue(settings.Get()[data])
		binder:SetFont('futura_25')
		binder:SetTextColor(Color(0, 0, 0, 0))
		binder.bind = settings.Get()[data]
		binder.setting = true
		binder.Paint = function(self, w, h)
			draw.SimpleText(text, F('futura_25'), 5, h / 2, color_white, nil, TEXT_ALIGN_CENTER)
			local wide, height = w * 0.3, h
			local x, y = w * 0.5 + 5, 0
			draw.RoundedBox(0, x, y, wide, height, Color(0, 0, 0, 240))
			local str = input.GetKeyName(self.bind) or 'N/A'
			if self.Trapping then
				str = T("choose_button")
			end
			draw.SimpleText(utf8upper(str), F('futura_20'), x + wide / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			surface.SetDrawColor(200, 200, 200, 200)
			surface.DrawOutlinedRect(x, y, wide, height)
			if self.hover then
				surface.SetDrawColor(255, 255, 255)
			end
		end
		binder.OnCursorEntered = function(self) self.hover = true end
		binder.OnCursorExited = function(self) self.hover = false end
		binder.OnChange = function(self, iNum)
			for k, v in pairs(settings.list["general"]) do
				local convar = GetConVar(v.sname)
				if v.stype == sType and convar and convar:GetInt() == iNum and v.sname != data then
					-- Gui.Deploy.confirmWindow(T("replace_input"):format(T(v.sname)))
					-- return
				end
			end
			self.bind = iNum
		end
		table.insert(panel.SettingsData, {type = sType, panel = binder, data = data})

	end

end

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

net.Receive('DeploySpawnPos', function()
	local vector = net.ReadVector()

	Gui.Deploy.vector = vector
end)

net.Receive("SendAccessableWeapons", function()
	Gui.Deploy.LoadoutsAvailable = net.ReadTable()
end)

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

local LerpPos, LerpAng
hook.Add("CalcView", "DeploySpawnPos", function(ply, origin, angles, fov)
	local view = {}

	if ply:Health() <= 0 then return end
	if ply:IsAlive() and !Gui.Deploy.vector then return end
	if ply.GetSimfphys and IsValid(ply:GetSimfphys()) then return end

	if Gui.Deploy.vector and isvector(Gui.Deploy.vector) then

		if !LerpPos or !LerpAng then

			LerpPos, LerpAng = CFG.View.pos, CFG.View.ang

		end

		local startChangingAtDistance = 100
		local engineFracture = FrameTime() * 2.5
		local realFracture = (startChangingAtDistance - LerpPos:Distance(ply:EyePos())) / math.max(startChangingAtDistance - (FrameTime() * 10300), startChangingAtDistance)

		if maploader.Gamemode() == "war" then

			engineFracture = engineFracture * 2

		end

		local fracture = math.max(engineFracture, realFracture)

		LerpPos = LerpVector(fracture, LerpPos, ply:EyePos())
		LerpAng = LerpAngle(FrameTime() * 2.5, LerpAng, CFG.SpawnAng and CFG.SpawnAng[ply:Team()] or angles)
		view.origin = LerpPos
		view.angles = LerpAng
		view.drawviewer = false

		if LerpPos:Distance(origin) < 5 then

			Gui.Deploy.vector = nil;
			net.Start("DeployCameraReady")
			net.SendToServer()

		end

	else

		if IsValid(Gui.GetVGUI("deploy_menu")) then

			view.origin = CFG.View.pos
			view.angles = CFG.View.ang

			LerpPos, LerpAng = CFG.View.pos, CFG.View.ang

		end

	end

	view.fov = tonumber(settings.GetSetting("fov_slider"))

	return view
end)

hook.Add('PreRender', 'GmodMenuHide', function()
	if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if Gui.IsValidVGUI('deploy_menu') then
			gui.HideGameUI()
		else
			gui.HideGameUI()
			Gui.Deploy.menu()
		end
	end
end)

hook.Add('RequestedUI', 'ShowGui.Deploy.menu', function(id)
	if id == 'deploy_menu' then
		Gui.Deploy.menu()
	elseif id == 'deploy_menu_points' then
		Gui.Deploy.drawScreenPoints()
	end
end)

