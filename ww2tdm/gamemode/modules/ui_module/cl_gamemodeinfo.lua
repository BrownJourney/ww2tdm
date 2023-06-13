
function ShowGamemodeInfo()

	local gamemodeID = maploader.Gamemode()
	local adv = ""
	
	if TEAM_ATTACK then

		adv = LocalPlayer():Team() == TEAM_ATTACK and "_attack" or "_defend"

	end

	local name, desc = T(gamemodeID), T(gamemodeID .. "_desc" .. adv)

	local w, h = ScrW(), ScrH()

	local panel = vgui.Create("DPanel")
	panel:SetSize(w , h * 0.3)
	panel:SetPos(w / 2 - panel:GetWide() / 2, h * 0.25)
	panel:SetAlpha(0)
	panel:AlphaTo(255, 1, 0, function()
      	timer.Simple(7, function()
      		panel:AlphaTo(0, 2, 0, function()
      			panel:Remove()
      		end)
      	end)
	end)
	panel.Paint = function(self, w, h)
		local font = F("futura_40")
		local wide, height = surface.GetSize(name, font)
		wide = wide + wide * 0.2
		
		draw.SimpleLinearGradientPanel(self, w / 2 - wide / 2, 0, wide, height, Color(0, 0, 0, 0), Color(0, 0, 0, 50))
		draw.SimpleTextShadow(name, font, w / 2, 0, color_white, TEXT_ALIGN_CENTER)
		draw.RoundedBox(0, w / 2 - wide / 2, height, wide, 2, color_white)
		draw.SimpleTextShadow(desc, F("futura_25"), w / 2, height + 5, color_white, TEXT_ALIGN_CENTER)
	end

end

net.Receive("ShowGamemodeInfo", ShowGamemodeInfo)