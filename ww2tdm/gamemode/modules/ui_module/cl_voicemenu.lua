--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local function OpenVoiceMenu()

	if Gui.IsValidVGUI('voice_panel') then

		return

	end

	local voice_panel = Gui.CreateVGUI('voice_panel', 'DPanel')
	voice_panel:SetSize(ScrW() * 0.4, ScrH() * 0.6)
	voice_panel:Center()
	voice_panel:SetAlpha(0)
	voice_panel:AlphaTo(255, 0.2)
	voice_panel.OnRemove = function(self)
		if self.lastID then
			net.Start('PlayVoiceSound')
				net.WriteString(self.lastID)
			net.SendToServer()
		end
	end

	voice_panel.Paint = function() end

	local w, h = voice_panel:GetWide(), voice_panel:GetTall()

	function voice_panel:AddVoice(id, x, y)
		local voice_command = vgui.Create('DButton', self)
		voice_command:SetText('')
		voice_command:SetSize(w * 0.2, h * 0.09)
		voice_command:SetPos(x, y)
		voice_command.Paint = function(self, w, h)
			local alpha = 200
			local FT = 500 * FrameTime()
			if self:IsHovered() then
				alpha = 255
			end

			draw.RoundedBox(4, 0, 0, w, h, Color(0, 0, 0, alpha))
			draw.SimpleText(T(id), F('futura_22'), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		voice_command.OnCursorEntered = function()
			self.lastID = id
		end
		voice_command.DoClick = function(self)
			net.Start('PlayVoiceSound')
				net.WriteString(id)
			net.SendToServer()
		end
	end

	voice_panel:AddVoice('yes', 0, 0)
	voice_panel:AddVoice('no', w * 0.02, h * 0.1)
	voice_panel:AddVoice('taunt', w * 0.04, h * 0.2)

	voice_panel:AddVoice('retreat', w / 2 - w * 0.1, 0)
	voice_panel:AddVoice('noammo', w / 2 - w * 0.1, h * 0.1)
	voice_panel:AddVoice('heal', w / 2 - w * 0.1, h * 0.2)

	voice_panel:AddVoice('rush', w - w * 0.2, 0)
	voice_panel:AddVoice('defend', w - w * 0.22, h * 0.1)
	voice_panel:AddVoice('attack', w - w * 0.24, h * 0.2)

	gui.EnableScreenClicker(true)

end

local function CloseVoiceMenu()

	Gui.RemoveVGUI('voice_panel')

	gui.EnableScreenClicker(false)

end

hook.Add('PlayerButtonDown', 'OpenVoiceMenu', function(ply, key)

	if key != ply:GetInfoNum("ww2_bind_commorse", -1) then

		return

	end

	OpenVoiceMenu()

end)

hook.Add('PlayerButtonUp', 'CloseVoiceMenu', function(ply, key)

	if key != ply:GetInfoNum("ww2_bind_commorse", -1) then

		return

	end

	CloseVoiceMenu()

end)

