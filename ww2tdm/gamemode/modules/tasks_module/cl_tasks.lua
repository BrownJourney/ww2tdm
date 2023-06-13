local tasks = tasks;

function tasks.Gui(data)

	local parent = Gui.GetVGUI("work_field")

	if !IsValid(parent) then

		return

	end

	local w, h = ScrW(), ScrH()

	for k, category in ipairs(tasks.GetCategories()) do

		local categoryStr = category

		local task_category = vgui.Create('DPanel', parent)
		task_category:Dock(TOP)
		task_category:DockMargin(0, h * 0.03, 0, h * 0.03)
		task_category.Paint = function(self, w, h)
			local categoryName = utf8upper(T(categoryStr))
			local nameFont = F('futura_20')
			local textWide, textHeight = surface.GetSize(categoryName, nameFont)
			local lineColor, lineMargin = Color(255, 255, 255, 50), 5

			draw.RoundedBox(0, 0, h * 0.1 + textHeight / 2, w / 2 - textWide / 2 - lineMargin, 1, lineColor)
			draw.SimpleText(categoryName, nameFont, w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.RoundedBox(0, w / 2 + textWide / 2 + lineMargin, h * 0.1 + textHeight / 2, w / 2 - textWide / 2, 1, lineColor)
		end
		table.insert(parent.Children, task_category)

		local task_grid = vgui.Create("DGrid", parent)
		task_grid:Dock(TOP)
		task_grid:SetColWide(w * 0.333)
		task_grid:SetCols(3)
		task_grid:SetRowHeight(parent:GetTall() * 0.3)
		table.insert(parent.Children, task_grid)

		local foundActive = 0

		for id, info in pairs(data) do

			local taskData = tasks.GetData(id)

			if taskData.Category != category then

				continue

			end

			foundActive = foundActive + 1

			local wide, height;
			local task_panel = vgui.Create("DPanel")
			task_panel:SetSize(w * 0.3, h * 0.28)
			task_panel.Paint = function(self, w, h)
				local text, font =  T(id), F("futura_35")
				draw.SimpleText(text, font, 0, 0, color_white)
				wide, height = surface.GetSize(text, font)
				draw.SimpleLinearGradientPanel(self, 0, height + h * 0.01, w, 2, color_white, Color(255, 255, 255, 0), true)
				height = height + h * 0.02

				text, font = T("task_objectives"), F("futura_25")
				draw.SimpleText(text, font, 0, height, color_white)
				local wide2, height2 = surface.GetSize(text, font)
				height = height + height2 + h * 0.01

				for k, v in pairs(taskData.Objectives) do

					text, font = T(v.id), F("futura_18")
					if utf8len(text) > 50 then
						font = F("futura_15")
					end
					wide2, height2 = surface.GetSize(text, font)
					draw.RoundedBox(0, 0, height, w, height2, Color(0, 0, 0))

					local currentProgress = info.progress[v.id]

					if v.requirement > 1 then

						draw.SimpleText(utf8upper(text:format(currentProgress, v.requirement)), font, w * 0.01, height, color_white)

					else

						draw.SimpleText(utf8upper(text:format(currentProgress, v.requirement)), font, w * 0.01, height, color_white)

					end

					surface.SetDrawColor(255, 255, 255, 100)
					surface.DrawOutlinedRect(0, height, w, height2)

					height = height + height2 +  h * 0.01

				end

				if taskData.Rewards then

					text = T("task_rewards")
					draw.SimpleText(text, font, 0, height, color_white)
					wide2, height2 = surface.GetSize(text, font)
					height = height + height2 + h * 0.01

					local str = ""

					for k, v in pairs(taskData.Rewards) do
						
						local bonusAmount = tasks.GetPremiumBonus(k, v)
						local bonusStr = bonusAmount > 0 and " (+" .. bonusAmount .. "XP)" or ''

						str = str .. T(k):format(v) .. bonusStr .. ", "

					end

					text, font = string.sub(str, 1, -3), F("futura_18")
					draw.SimpleText(text, font, 0, height, color_white)
					wide2, height2 = surface.GetSize(text, font)
					height = height + height2 + h * 0.01

				end

				self:CreateButton(height)
			end
			task_panel.CreateButton = function(self, height)
				if self.buttonCreated then

					return

				end

				if !info.finished then

					return

				end

				self.buttonCreated = true

				local button = vgui.Create("DButton", self)
				button:SetSize(self:GetWide(), h * 0.05)
				button:SetPos(0, height)
				button:SetText('')
				button.Paint = function(self, w, h)
					draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255))
					draw.SimpleText(utf8upper(T("task_complete")), F("futura_30"), w / 2, h / 2, Color(0, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
				button.DoClick = function(self)
					self:Remove()
					net.Start("tasks.Complete")
						net.WriteString(id)
					net.SendToServer()
				end
			end
			task_grid:AddItem(task_panel)

		end

		if foundActive == 0 then

			task_category:Remove()
			continue

		end

	end

end