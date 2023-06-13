--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local PLAYER = FindMetaTable("Player")

local Scoreboard = {}
local playerOpt = nil;

if IsValid(ScoreboardFrame) then
	ScoreboardFrame:Remove()
end

function Scoreboard:Show()
	local w, h = ScrW(), ScrH()

	local ScoreboardTable = {
	    {name = "№", xt = w * 0.059, yt = 5 },
	    {name = T('nickname'), xt = w * 0.075, yt = 5},
	    {name = T('level'), xt = w * 0.17, yt = 5},
	    {name = T('class'), xt = w * 0.22, yt = 5 },
	    {name = T('score'), xt = w * 0.315, yt = 5},
	    {name = T('kd'), xt = w * 0.375, yt = 5},
	    {name = T('ping'), xt = w * 0.43, yt = 5},
	};


    if !IsValid(ScoreboardFrame) then
        ScoreboardFrame = vgui.Create("DFrame");
        ScoreboardFrame:SetSize(w, h);
        ScoreboardFrame:Center();
        ScoreboardFrame:SetTitle("");
        ScoreboardFrame:SetDraggable(false);
        ScoreboardFrame:ShowCloseButton(false);
        ScoreboardFrame:SetAlpha(0)
        ScoreboardFrame:AlphaTo(255, 0.25)
        function ScoreboardFrame:Paint(w, h)
        	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 100))
            Gui.FrameBlur(self, 8);

            if CVAR_NOTEAMS then

            	for i = 1, #ScoreboardTable do
		            draw.SimpleText(utf8upper(ScoreboardTable[i].name), F('futura_14'), ScoreboardTable[i].xt + w * 0.225, ScoreboardTable[i].yt, Color(236,240,241,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP);
		        end

		        local wide = w / 2 - w * 0.05 - 10
		        draw.RoundedBox(0, w / 2 - wide / 2, 20, wide, 1, Color(236, 240, 241, 230));

            else

				local colorAllies = team.GetColor(TEAM_ALLIES)
				local colorAxis = team.GetColor(TEAM_AXIS)

	            draw.RoundedBox(0, 0, 0, w * 0.05, 75, Color(colorAllies.r, colorAllies.g, colorAllies.b, 240));
	            draw.RoundedBox(0, 0, 75, w * 0.05, h-75, Color(colorAllies.r, colorAllies.g, colorAllies.b, 150));

	            surface.SetDrawColor(255, 255, 255, 100);
	            surface.SetMaterial(faction.Team(TEAM_ALLIES).icoBig);
	            surface.DrawTexturedRect(w * 0.05 / 2 - 55 / 2, 10, 55, 55);

	            draw.RoundedBox(0, w / 2, 0, w * 0.05, 75, Color(colorAxis.r, colorAxis.g, colorAxis.b));
	            draw.RoundedBox(0, w / 2, 75, w * 0.05, h-75, Color(colorAxis.r, colorAxis.g, colorAxis.b, 150));

	            surface.SetDrawColor(255, 255, 255, 100);
	            surface.SetMaterial(faction.Team(TEAM_AXIS).icoBig);
	            surface.DrawTexturedRect(w / 2 + w * 0.05 / 2 - 55 / 2, 10, 55, 55);

	            for i = 1, 10 do
                	draw.SimpleText(string.upper(string.sub(faction.Team(TEAM_ALLIES).ScoreboardName, i-1, i-1)), F("futura_40"), w * 0.05 / 2, 95+h*0.04*(i-1), Color(236,240,241,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);
                	draw.SimpleText(string.upper(string.sub(faction.Team(TEAM_AXIS).ScoreboardName, i-1, i-1)), F("futura_40"), w / 2 + w * 0.05 / 2, 95+ h*0.04*(i-1), Color(236,240,241,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER);
            	end

            	surface.SetDrawColor(255, 255, 255, 100);
	            surface.SetMaterial(Material("hud/ico_soldier.png"));
	            surface.DrawTexturedRect(w * 0.05 / 2 - 25 / 2, h-75, 25, 25);
	            draw.SimpleText(#team.GetPlayers(TEAM_ALLIES), "futuraBold_15", w * 0.05 / 2, h-40, Color(236,240,241,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP);
	          
	            surface.SetDrawColor(255, 255, 255, 100);
	            surface.SetMaterial(Material("hud/ico_soldier.png"));
	            surface.DrawTexturedRect(w / 2 + w * 0.05 / 2 - 25 / 2, h-75, 25, 25);
	            draw.SimpleText(#team.GetPlayers(TEAM_AXIS), "futuraBold_15", w / 2 + w * 0.05 / 2, h-40, Color(236,240,241,100), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP);

	            for i = 1, #ScoreboardTable do
		            draw.SimpleText(utf8upper(ScoreboardTable[i].name), F('futura_14'), ScoreboardTable[i].xt, ScoreboardTable[i].yt, Color(236,240,241,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP);
		        end

		        draw.RoundedBox(0, w * 0.05 + 5, 20, w / 2 - w * 0.05 - 10, 1, Color(236, 240, 241, 230));

		        for i = 1, #ScoreboardTable do
		            draw.SimpleText(utf8upper(ScoreboardTable[i].name), F('futura_14'), w / 2 + ScoreboardTable[i].xt, ScoreboardTable[i].yt, Color(236,240,241,200), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP);
		        end

		        draw.RoundedBox(0, w / 2 + w * 0.05 + 5, 20, w / 2 - w * 0.05 - 10, 1, Color(236, 240, 241, 230));

	        end

        end

		local function CreateTeamList(teamID, w, h, x, y)
			local TeamTable = vgui.Create('DScrollPanel', ScoreboardFrame)
	        TeamTable:SetSize(w, h)
	        TeamTable:SetPos(x, y)
	        TeamTable.Paint = function() end

	        TeamTable:GetVBar():SetWide(2)

	        local teamPlayers = teamID and team.GetPlayers(teamID) or player.GetAll()
	        table.sort(teamPlayers, function(a, b) return a:GetNWInt('fragscount') > b:GetNWInt('fragscount') end)

	        for k, v in pairs(teamPlayers) do
	       		local isPremium = v:GetUserGroup() == "premium"
	       		local fontSize = 16
	        	local PlayerPanel = vgui.Create("DButton", TeamTable)
				PlayerPanel:SetSize(TeamTable:GetWide() * 0.9, TeamTable:GetTall() * 0.04)
				if isPremium then
					PlayerPanel:SetTall(TeamTable:GetTall() * 0.045)
					fontSize = fontSize + 2
				end
				PlayerPanel:Dock(TOP)
				PlayerPanel:SetText("")
				local flag = Material("flags16/" .. v:GetNWString("ISO-Country"):lower() .. ".png")
				PlayerPanel.Paint = function(self, w, h)
					if !IsValid(v) then
						self:Remove()
						return
					end
					local faction = v:GetFaction()
					if !faction then
						self:Remove()
						return
					end

					local clr
					if v == LocalPlayer() then
						clr = Color(95, 255, 140)
					else
						clr = team.GetColor(v:Team())
					end

					if isPremium then
						clr = Color(253, 243, 103)
					end

					draw.SimpleLinearGradientPanel(self, 0, 0, w, h, Color(clr.r, clr.g, clr.b, 50), Color(clr.r, clr.g, clr.b, 20))
					surface.SetDrawColor(200, 155, 155, 200)
					surface.DrawOutlinedRect(0, 0, w, h)
					draw.SimpleText(tostring(k), F('futura_'..fontSize), PlayerPanel:GetWide() * 0.02, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					
					if !flag:IsError() then
						surface.SetMaterial(flag)
						surface.SetDrawColor(255, 255, 255)
						surface.DrawTexturedRect(w * 0.05, h / 2 - 6, 16, 12)
					end

					draw.SimpleText(string.sub(v:IsBot() and "Раб буржуя" or v:Name(), 1, 30), F('futura_'..fontSize), w * 0.05 + 20, h / 2, Color(255, 255, 255), nil, TEXT_ALIGN_CENTER)

					local className = ''
					local class = faction:Class(v:GetClass())
					if class then
						className = class:GetName()
					end

					draw.SimpleText(v:GetLevel(), F('futura_'..fontSize), w * 0.27, h / 2, Color(255, 255, 255), nil, TEXT_ALIGN_CENTER)
					draw.SimpleText(utf8.sub(className, 1, 18), F('futura_'..fontSize), w * 0.376, h / 2, Color(255, 255, 255), nil, TEXT_ALIGN_CENTER)

					draw.SimpleText(v:GetNWInt('fragscount'), F('futura_'..fontSize), w * 0.59, h / 2, Color(255, 255, 255), nil, TEXT_ALIGN_CENTER)
					draw.SimpleText(v:GetNWInt('PlayerKills') .. ':' .. v:GetNWInt('PlayerDeaths'), F('futura_'..fontSize), w * 0.725, h / 2, Color(255, 255, 255), nil, TEXT_ALIGN_CENTER)
					
					local ping
					if v:IsBot() then
						ping = "SLAVE"
					else
						ping = v:Ping().." MS"
					end
					draw.SimpleText(string.sub(ping, 1, 6), F('futura_16'), PlayerPanel:GetWide() * 0.89, h / 2, Color(255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				end
				PlayerPanel.DoClick = function()
					playerOpt = DermaMenu()
					playerOpt:SetPos(gui.MouseX(), gui.MouseY())
					playerOpt:AddOption(T('open_profile'), function()
						v:ShowProfile()
					end)
					playerOpt:AddOption(T('copy_steamid'), function()
						SetClipboardText(v:SteamID())
					end)
					if v:Team() == LocalPlayer():Team() then
						playerOpt:AddOption(T('kick_player'), function()
							vote.SendToServer(v:Name(), VOTE_KICK)
						end)
					end

					if v:GetClass() == "officer" then
						playerOpt:AddOption(T('kick_player_role'), function()
							vote.SendToServer(v:Name(), VOTE_KICK_ROLE)
						end)
					end
				end

				local MuteButton = vgui.Create("DButton", PlayerPanel)
				MuteButton:Dock(RIGHT)
				MuteButton:DockMargin(0, 0, 5, 0)
				MuteButton:SetWide(16)
				MuteButton:SetText('')
				MuteButton.DoClick = function()
					v:SetMuted(!v:IsMuted())
				end
				local muteMat = Material('icon16/sound.png')
				local unmuteMat = Material('icon16/sound_mute.png')
				MuteButton.Paint = function(self, w, h)
					if !IsValid(v) then
						self:GetParent():Remove()
						return;
					end

					local useMat = muteMat
					if v:IsMuted() then
						useMat = unmuteMat
					end

					local size = 16

					surface.SetMaterial(useMat)
					surface.SetDrawColor(255, 255, 255)
					surface.DrawTexturedRect(w / 2 - size / 2, h / 2 - size / 2, size, size)
				end

	        end
		end

		local wide = w / 2 - w * 0.05 - 10
		if CVAR_NOTEAMS then
			CreateTeamList(nil, wide, h * 0.945, w / 2 - wide / 2, ScoreboardFrame:GetTall() * 0.05)
		else
			CreateTeamList(TEAM_ALLIES, wide, h * 0.945, w * 0.05 + 5, ScoreboardFrame:GetTall() * 0.05)
			CreateTeamList(TEAM_AXIS, wide, h * 0.945, w / 2 + w * 0.05 + 5, ScoreboardFrame:GetTall() * 0.05)
		end
    else
        ScoreboardFrame:Show();
        ScoreboardFrame:MakePopup();
        ScoreboardFrame:SetKeyboardInputEnabled(false);
    end
end

function Scoreboard:Hide()
    if IsValid(ScoreboardFrame) then
        ScoreboardFrame:Close();
        if IsValid(playerOpt) then
        	playerOpt:Remove()
        end
    end
end

function GM:ScoreboardShow()
    Scoreboard:Show();
    gui.EnableScreenClicker(true)
end

function GM:ScoreboardHide()
    Scoreboard:Hide();
    gui.EnableScreenClicker(false)
end
