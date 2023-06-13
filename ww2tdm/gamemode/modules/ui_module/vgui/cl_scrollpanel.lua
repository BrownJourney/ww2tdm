local PANEL = {}

function PANEL:Init()

	local sbar = self:GetVBar()
	sbar:SetWide(2)
	sbar:SetHideButtons(true)

	function sbar:Paint() end
	function sbar.btnUp:Paint() end
	function sbar.btnDown:Paint() end

	function sbar.btnGrip:Paint(w, h)

		draw.RoundedBox(0, 0, 0, w, h, Color(200, 200, 200, 100))

	end

end

vgui.Register( "DefaultScroll", PANEL, 'DScrollPanel' )