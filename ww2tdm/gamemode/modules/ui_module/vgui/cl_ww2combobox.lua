local PANEL = {}

DEFINE_BASECLASS("DComboBox")

function PANEL:Init()

	self:SetTextColor(Color(0, 0, 0, 0))
	self._Choices = {}
	self.SubFont = nil;
	self.Surround = {}

end

function PANEL:GetChoices()

	return self._Choices

end

function PANEL:AddChoice(value, data, select, icon)

	BaseClass.AddChoice(self, value, data, select, icon)
	table.insert(self._Choices, {data = data, value = value})

end

function PANEL:SetSubFont(font)

	self.SubFont = font

end

function PANEL:AddSurround(panel)

	table.insert(self.Surround, panel)

end

function PANEL:OnRemove()

	if IsValid(self.Menu) then

		self.Menu:Remove()

	end

end

function PANEL:OpenMenu()

	local choices = self:GetChoices()

	self.Menu = vgui.Create("DPanel", self:GetParent())
	local x, y = self:GetPos()
	self.Menu:SetPos(x, y + self:GetTall())
	self.Menu:SetSize(self:GetWide(), self:GetTall() * #choices)
	self.Menu.Paint = function(_, w, h)
		draw.RoundedBox(0, 0, 0, w, h, color_white)
	end

	for k, v in pairs(choices) do

		local button = vgui.Create("DButton", self.Menu)
		button:Dock(TOP)
		button:SetText("")
		button:SetTall(self:GetTall())
		button.alpha = 0
		button.Paint = function(_, w, h)
			local font = self.SubFont or self:GetFont()
			local textColor = Color(0, 0, 0)
			local FT = FrameTime() * 1000
			if _:IsHovered() or _.selected then
				textColor = color_white
				_.alpha = math.min(_.alpha + FT, 255)
			else
				_.alpha = math.max(_.alpha - FT, 0)
			end
			draw.RoundedBox(0, 0, 0, w, h, Color(50, 50, 50, _.alpha))
			draw.SimpleText(v.value, font, w / 2, h / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		button.DoClick = function(_)
			_.selected = true
			self:ChooseOption(v.value, k)
			self:CloseMenu()
		end

	end

end

function PANEL:Paint(w, h)

	draw.SimpleText(self:GetValue(), self:GetFont(), 5, h / 2, color_white, nil, TEXT_ALIGN_CENTER)

	surface.SetDrawColor(255, 255, 255)
	surface.DrawOutlinedRect(0, 0, w, h)

end

vgui.Register( "ww2_combobox", PANEL, 'DComboBox' )