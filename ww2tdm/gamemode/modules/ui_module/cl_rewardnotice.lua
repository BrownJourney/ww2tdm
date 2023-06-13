rewardnotice = rewardnotice or {}
rewardnotice.list = {}

function rewardnotice.PosForKey(basepos, height, key)

	return basepos + (height) * (key - 1)

end

function rewardnotice.Add(reward, amount)

	local w, h = ScrW(), ScrH()

	local key = #rewardnotice.list + 1
	local panelw, panelh = w * 0.2, h * 0.04
	local basepos = h * 0.7

	local panel = vgui.Create("DPanel")
	panel:SetSize(0, panelh)
	panel:SetPos(w / 2 - panelw / 2, rewardnotice.PosForKey(basepos, panelh, key))
	panel:SizeTo(panelw, panelh, 0.75, 0, 0.99)
	panel.Paint = function(self, ow, oh)
		local w, h = panelw, panelh
		draw.SimpleTextShadow("+"..amount .. "XP " .. T(reward), F("futuraLight_20"), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local wide = w * 0.05
		if ow / w < 0.9 then
			draw.SimpleLinearGradientPanel(self, ow, 0, wide, h, Color(255, 255, 255, 50), Color(255, 255, 255, 0), true)
		end
	end

	rewardnotice.list[key] = panel

	timer.Simple(3, function()

		panel:AlphaTo(0, 0.4)
		panel:SizeTo(0, panelh, 0.5, 0, -1, function()

			panel:Remove()

		end)

		for k, pnl in pairs(rewardnotice.list) do

			if pnl == panel then

				key = k
				continue

			end 

			if k > key then

				pnl:MoveTo(w / 2 - panelw / 2, rewardnotice.PosForKey(basepos, panelh, k - 1), 0.25)

			end

		end

		table.remove(rewardnotice.list, key)

	end)

end

net.Receive("ShowXPReward", function()

	if settings.GetSetting("xpfeed") == false then return end

	rewardnotice.Add(net.ReadString(), net.ReadInt(20))

end)