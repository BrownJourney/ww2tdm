--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

function draw.Line(wide, x, y, color)
	
	draw.RoundedBox(0, x, y, wide, 2, color)

end

function teamSelectionMenu(fromServer, isAdmin)

	local bCanSpectate = LocalPlayer().CanSpectate and LocalPlayer():CanSpectate()
	isAdmin = isbool(isAdmin) and isAdmin or bCanSpectate

	local w, h = ScrW(), ScrH()

	local team_frame = Gui.CreateVGUI('team_selection', 'DFrame', nil, 'noclose')
	team_frame:SetSize(ScrW(), ScrH())
	team_frame:Center()
	team_frame:SetTitle("")
	team_frame:SetDraggable(false)
	team_frame:ShowCloseButton(false)
	team_frame:SetBackgroundBlur(true)
	team_frame:MakePopup()
	team_frame:SetAlpha(0)
	team_frame:AlphaTo(255, 0.25)

	team_frame.Paint = function(self, w, h)
		Gui.FrameBlur(self, 5, 5)
		draw.RoundedBox(0, 0, 0, w, h, Color(30, 30, 30, 200))
		draw.SimpleText(T('team_decide'), F('futuraBold_50'), w / 2, h / 2 - 250, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(T('want_play'), F('futura_24'), w / 2, h / 2 - 220, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(T(faction.Team(TEAM_AXIS).Name), F('futuraBold_32'), w / 2 - 250, h / 2 + 200, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.Line(300, w / 2 - 400, h / 2 + 170, Color(255, 255, 255))
		draw.SimpleText(T(faction.Team(TEAM_ALLIES).Name), F('futuraBold_32'), w / 2 + 250, h / 2  + 200, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.Line(300, w / 2 + 100, h / 2 + 170, Color(255, 255, 255))
	end

	team_frame.Callout = function(self)
		if fromServer then
			Gui.Deploy.menu()
		else
			local deploy_panel = Gui.GetVGUI("deploy_menu")
			if IsValid(deploy_panel) then
				deploy_panel:Remove()
			end
		end
	end

	local function createTeamButton(teamId, x, y)

		local team_button = vgui.Create("DButton", team_frame)
		team_button:SetPos(x, y)
		team_button:SetSize(300, 300)
		team_button:SetText("")
		team_button.DoClick = function()
			if LocalPlayer():Team() == teamId then
				return
			end

			if !fromServer then
				team_frame:Remove()
			end
			team_frame.Callout()
			net.Start("ChooseTeam")
				net.WriteUInt(teamId, 3)
			net.SendToServer()
		end

		local mat = faction.Team(teamId).icoLarge
		team_button.Paint = function(self, w, h)
			surface.SetMaterial(mat)
			surface.SetDrawColor(255, 255, 255)
			surface.DrawTexturedRect(0, 0, w, h)
		end

	end

	createTeamButton(TEAM_AXIS, w / 2 - 400, h / 2 - 150)
	createTeamButton(TEAM_ALLIES, w / 2 + 100, h / 2 - 150)

	local button_close = vgui.Create("DButton", team_frame)
	button_close:SetSize(250, 40)
	button_close:SetPos(w / 2 - (button_close:GetWide() / 2), h / 2 + 250)
	button_close:SetText("")
	button_close.DoClick = function()
		team_frame:Remove()
	end
	button_close.Paint = function(self, w, h)
		surface.SetDrawColor(255, 255, 255)
		surface.DrawOutlinedRect(0, 0, w, h)
		draw.SimpleText(T('derma_close'), F('futuraLight_24'), w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	if isAdmin then
		
		local button_spectator = vgui.Create("DButton", team_frame)
		button_spectator:SetSize(250, 40)
		button_spectator:SetPos(w / 2 - (button_close:GetWide() / 2), h / 2 + 300)
		button_spectator:SetText("")
		button_spectator.DoClick = function()
			team_frame:Remove()
			net.Start("ChooseTeam")
				net.WriteUInt(TEAM_SPECTATOR, 3)
			net.SendToServer()
		end
		button_spectator.Paint = function(self, w, h)
			surface.SetDrawColor(255, 255, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(T('derma_spectator'), F('futuraLight_24'), w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

	end

end

net.Receive('ShowTeamSelection', function()
	teamSelectionMenu(true, net.ReadBool())
end)

hook.Add("RequestedUI", "ShowPromtFaction", function(id)
	if id == "general_progression" then
		print("received UI request")
		local function makeChoice(factionid)
			net.Start("FactionSetGeneral")
				net.WriteString(factionid)
			net.SendToServer()

			teamSelectionMenu(true)
		end

		Gui.Deploy.confirmWindow("Выберите сторону, которую вы прокачали больше всего", {
			{text = "СССР", callback = function()
				makeChoice(FACTION_USSR)
			end},
			{text = "Германия", callback = function()
				makeChoice(FACTION_GERMANY)
			end},
		})
	end
end)
