--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

notify = notify or {}

if SERVER then

	local PLAYER = FindMetaTable("Player")
	util.AddNetworkString("surface.PlaySound")
	function PLAYER:SurfacePlaySound(soundname)
		net.Start("surface.PlaySound")
			net.WriteString(soundname)
		net.Send(self)
	end

	util.AddNetworkString('AddNotification')
	function notify.Add(ply, title, desc, duration, soundeffect)

		if !ply then

			return

		end

		duration 	= tonumber(duration) or 5
		desc 		= tostring(desc) or ''

		if !istable(ply) then

			ply = {ply}

		end

		if !istable(soundeffect) then

			soundeffect = {soundeffect}

		end

		net.Start('AddNotification')
			net.WriteString(title)
			net.WriteString(desc)
			net.WriteUInt(duration, 5)
			net.WriteTable(soundeffect)
		net.Send(ply)

	end

	util.AddNetworkString('AddCustomNotification')
	function notify.Custom(ply, id, netvalue)

		if !ply then

			return

		end

		id = tostring(id) or ''

		if !istable(ply) then

			ply = {ply}

		end

		net.Start('AddCustomNotification')
			net.WriteString(id)
			net.WriteValue(netvalue)
		net.Send(ply)

	end

else

	notify.queue = notify.queue or {}

	function notify.Add(title, desc, duration, soundeffect)

		local w, h = ScrW(), ScrH()

		if Gui.IsValidVGUI('notify_panel') then

			table.insert(notify.queue, {
				title = title,
				desc = desc,
				duration = duration,
				soundeffect = soundeffect
			})

			return

		end

		local parent;

		if Gui.IsValidVGUI('deploy_menu') then

			parent = Gui.GetVGUI('deploy_menu')

		elseif Gui.IsValidVGUI('team_selection') then

			parent = Gui.GetVGUI('team_selection')

		else

			parent = Gui.GetVGUI('rewards_panel')

		end

		local panel_wide, panel_tall = w * 0.5, h * 0.1
		local titleFont, descFont = F('futura_45'), F('futura_30')
		local textMaxLength = 30
		local titleLength = utf8len(utf8upper(T(title)))

		if titleLength > textMaxLength then

			titleFont = F('futura_38')

		end

		if IsValid(parent) and !Gui.IsValidVGUI('rewards_panel') then
			
			panel_wide, panel_tall = w * 0.45, h * 0.08
			titleFont = F('futura_40')
			descFont = F('futura_25')

			if titleLength > textMaxLength then

				titleFont = F('futura_30')

			end


		end

		local titleFormatted = utf8upper(T(title))
		local wide, height = surface.GetSize(titleFormatted, titleFont)

		if wide > panel_wide then

			panel_wide = wide + 20

		end

		if soundeffect then

			if !istable(soundeffect) then soundeffect = {soundeffect} end

			for k, v in pairs(soundeffect) do

				surface.PlaySound(v)

			end

		end

		local isMat = false
		if title:find(".png") then

			panel_tall = h * 0.12
			isMat = true

		end

		local blur;
		local ease = -0.1
		local notify_panel = Gui.CreateVGUI('notify_panel', 'DPanel', parent)
		notify_panel:SetSize(0, panel_tall)
		notify_panel:SetPos(w / 2 - panel_wide / 2, h * 0.2)
		notify_panel:SizeTo(panel_wide, panel_tall, duration / 3, 0, ease, function()
			blur:AlphaTo(0, 0.1)
		end)
		notify_panel:SetMouseInputEnabled(false)
		notify_panel.Paint = function(self, pwide, ptall)
			local w, h = panel_wide, panel_tall
			Gui.FrameBlur(self, 1, 1)

			if IsValid(Gui.GetVGUI('team_selection')) then

				draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))

			end

			if isMat then

				surface.SetMaterial(Material(title))
				surface.SetDrawColor(255, 255, 255)

				local size = w * 0.16
				surface.DrawTexturedRect(w / 2 - size / 2, h / 2 - size / 2, size, size)

			else

				if desc == 'nil' then

					draw.SimpleTextShadow(titleFormatted, titleFont, w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

				else

					draw.SimpleTextShadow(titleFormatted, titleFont, w / 2, 5, color_white, TEXT_ALIGN_CENTER)
					draw.SimpleTextShadow(T(desc), descFont, w / 2, 5 + height, color_white, TEXT_ALIGN_CENTER)

				end

			end
		end

		blur = vgui.Create("DPanel", notify_panel)
		blur:Dock(RIGHT)
		blur:SetWide(w * 0.01)
		blur.Paint = function(self, w, h)
			Gui.FrameBlur(self, 1, 1)
		end

		local function nextNotify()

			local nextData = notify.queue[1]

			if !nextData then

				return

			end

			notify.Add(nextData.title, nextData.desc, nextData.duration, nextData.soundeffect)

			table.remove(notify.queue, 1)

		end

		timer.Simple(duration, function()

			local proceedNotification = function()
				Gui.RemoveVGUI('notify_panel')
				nextNotify()
			end

			if !IsValid(notify_panel) then

				proceedNotification()
				return

			end

			local sizeCallback;
			local animationTime = 0.5

			notify_panel:SizeTo(0, panel_tall, animationTime, 0, ease, function()
				
				proceedNotification()
				sizeCallback = true

			end)

			timer.Simple(animationTime + 0.5, function()

				if !sizeCallback then

					proceedNotification()

				end

			end)

		end)

	end


	net.Receive('AddNotification', function()
		local title = net.ReadString()
		local desc = net.ReadString()
		local duration = net.ReadUInt(5)
		local soundeffect = net.ReadTable()

		notify.Add(title, desc, duration, soundeffect)
	end)

	net.Receive('AddCustomNotification', function()
		local id = net.ReadString()
		local netvalue = net.ReadValue()
		local desc_id = id..'_desc'

		local title = T(id):format(T(netvalue))
		local desc = T(desc_id) == desc_id and 'nil' or T(desc_id)

		if id:find("point") then
			SOUNDS.ShowSubtitles(title)
			return
		end

		notify.Add(title, desc, 5)
	end)

	net.Receive("surface.PlaySound", function()
		surface.PlaySound(net.ReadString())
	end)

end