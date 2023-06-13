
math.randomseed(os.time()) -- so that the results are always different
function table.Shuffle( tInput )

    local tReturn = {}
    local tCopy = table.Copy(tInput)

    for i = #tInput, 1, -1 do

        local j = math.random(i)

        tCopy[i], tCopy[j] = tCopy[j], tCopy[i]

        table.insert(tReturn, tCopy[i])

    end

    return tReturn

end

MAX_MAPS = 6

if SERVER then

	util.AddNetworkString('ww2_receivevote')

	CURRENT_MAPPOOL = CURRENT_MAPPOOL or {}
	CURRENT_SCORES 	= CURRENT_SCORES  or {}

	function CollectResults(id, filter)

		local pl;
		local best;

		for k, v in pairs(player.GetAll()) do

			local amount = filter(v)

			if !best or amount > best then

				pl = v
				best = amount

			end

		end

		if !IsValid(pl) then

			return

		end

		pl:AddXP("top_player")

		table.insert(CURRENT_SCORES, {
			id = id,
			plyName = pl:Name(),
			count = best
		})

	end

	function MapSelection()

		local mapList = {}

		for k, v in pairs(maploader.stored) do

			if v.developer then

				continue

			end

			table.insert(mapList, k)

		end

		--[[-------------------------------------------------------------------------
		COLLECTING PLAYER RESULTS
		---------------------------------------------------------------------------]]

		CollectResults("results_kills", function(ply)
			return ply:GetNWInt('PlayerKills', 0)
		end)
		CollectResults("results_captures", function(ply)
			return ply.PointsCaptured or 0
		end)
		CollectResults("results_support", function(ply)
			return ply.SupportRewards or 0
		end)
		CollectResults("results_longshot", function(ply)
			return ply.MaxLongshot or 0
		end)

		--[[-------------------------------------------------------------------------
		RANDOMIZING MAP POOL
		---------------------------------------------------------------------------]]

		local shuffledMaps = table.Shuffle( mapList )

		local i = 0
		for k, mapid in pairs(shuffledMaps) do

			local mapData = maploader.Map(mapid)
			local mapname = mapData.name

			if mapname == game.GetMap() then

				continue

			end

			if mapData.maxplayers and mapData.maxplayers < player.GetCount() then

				continue

			end

			if mapData.minplayers and mapData.minplayers > player.GetCount() then

				continue

			end

			table.insert(CURRENT_MAPPOOL, mapid)

			i = i + 1

			if i == MAX_MAPS then

				break

			end

		end

		for k, v in pairs(player.GetAll()) do

			v:CloseAllUI()
			v:ShowUI("ww2_changemap", {mapPool = CURRENT_MAPPOOL, scores = CURRENT_SCORES})

		end

		if timer.Exists('MapSelectCountdown') then return end

		timer.Create('MapSelectCountdown', 30, 1, function()

			local Goals = 0
			local Map = ''

			for k, mapid in pairs(CURRENT_MAPPOOL) do

				if GetGlobalInt('map_'..mapid) > Goals then

					Goals = GetGlobalInt('map_'..mapid)

					Map = mapid

				end

			end

			if GetGlobalInt('map_refresh') > Goals then

				maploader.SetLoadMap(maploader.GetLoadedMap())
				-- game.ConsoleCommand('changelevel ' .. game.GetMap() .. '\n')

			elseif GetGlobalInt('map_random') > Goals or Map == '' then

				local randomKey = math.random(1, #CURRENT_MAPPOOL)
				local mapid = CURRENT_MAPPOOL[randomKey]
				maploader.SetLoadMap(mapid)
				-- Map = maploader.Map(mapid).name

				-- game.ConsoleCommand('changelevel ' .. Map .. '\n')

			else

				maploader.SetLoadMap(Map)
				-- Map = maploader.Map(Map).name
				-- game.ConsoleCommand('changelevel ' .. Map .. '\n')

			end

		end)

	end

	net.Receive('ww2_receivevote', function(len, ply)

		local map = 'map_' .. net.ReadString()

		SetGlobalInt(map, GetGlobalInt(map) + 1)

		if ply.lastMap then
			
			SetGlobalInt(ply.lastMap, GetGlobalInt(ply.lastMap) - 1)

		end

		ply.lastMap = map

	end)

else

	function MapMenu(mapPool, results)
		
		-- if !mapPool then

		-- 	mapPool = {
		-- 		'ww2_battle_for_wismars',
		-- 		'gm_construct',
		-- 		'ww2_bavaria',
		-- 		'ww2_fields',
		-- 		'ww2_station_wf'
		-- 	}

		-- end

		-- if !results then

		-- 	results = {
		-- 		{
		-- 			id = 'results_kills',
		-- 			plyName = 'Player [Beast] Brojou',
		-- 			count = 50
		-- 		},
		-- 		{
		-- 			id = 'results_captures',
		-- 			plyName = 'Mazafaka',
		-- 			count = 10
		-- 		},
		-- 		{
		-- 			id = 'results_support',
		-- 			plyName = 'Medic from BF4',
		-- 			count = 3000
		-- 		},
		-- 		{
		-- 			id = 'results_longshot',
		-- 			plyName = 'Sniper from TF2',
		-- 			count = 9999
		-- 		},
		-- 	}

		-- end

		local w, h = ScrW(), ScrH()

		local map_BG = vgui.Create('DFrame')
		map_BG:SetSize(w, h)
		map_BG:SetTitle('')
		map_BG:SetDraggable(false)
		map_BG:ShowCloseButton(false)
		map_BG:SetKeyboardInputEnabled(false)
		map_BG:SetMouseInputEnabled(true)
		map_BG:SetAlpha(0)
		map_BG:AlphaTo(255, 0.5)
		map_BG.Paint = function(self, w, h)
			gui.EnableScreenClicker(true)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 215))
			Gui.FrameBlur(self, 3, 3)
		end

		local resultsTitle = utf8upper(T('match_bestsoldiers'))
		local resultsFont = F('futuraBold_60')

		local results_panel = vgui.Create('DPanel', map_BG)
		results_panel:SetPos(10, 10)
		results_panel:SetSize(map_BG:GetWide() - 20, h / 2 - 150)
		results_panel.Paint = function(self, w, h)
			draw.SimpleText(resultsTitle, resultsFont, w / 2, 0, color_white, TEXT_ALIGN_CENTER)
		end

		for k, v in ipairs(results) do

			local _, dockTop = surface.GetSize(resultsTitle, resultsFont)
			local dockRight = 16
			local ply = player.GetByName(v.plyName)
			local avatarSize = 64

			local result = vgui.Create('DPanel', results_panel)
			result:Dock(LEFT)
			result:SetWide(results_panel:GetWide() * 1/#results - dockRight/#results)
			result:DockMargin(0, dockTop, dockRight/#results, 0)

			if #results == k then

				result:DockMargin(0, dockTop, 0, 0)

			end

			result.Paint = function(self, w, h)
				draw.SimpleText(T(v.id), F('futura_30'), w / 2, h * 0.1, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText(v.count .. ' ' .. T(v.id .. '_count'), F('futura_40'), w / 2, h * 0.2 + 5, color_white, TEXT_ALIGN_CENTER)

				local nameFont = F('futura_30')
				if IsValid(ply) then

					draw.SimpleText(v.plyName, nameFont, w / 2, h, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

				else

					draw.SimpleText(v.plyName, nameFont, w / 2, h * 0.4, color_white, TEXT_ALIGN_CENTER)

				end

				surface.SetDrawColor(200, 200, 200)
				surface.DrawOutlinedRect(0, 0, w, h * 0.2, 2)
			end

			if IsValid(ply) then

				local ph = results_panel:GetTall()

				local avatar = vgui.Create( "AvatarImage", result )
				avatar:SetSize( ph * 0.35, ph * 0.35 )
				avatar:SetPos( result:GetWide() / 2 - avatar:GetWide() / 2, ph * 0.35 )
				avatar:SetPlayer( ply, avatarSize )

				local avatar_button = vgui.Create("DButton", avatar)
				avatar_button:Dock(FILL)
				avatar_button:SetText('')
				avatar_button.Paint = function() end
				avatar_button.DoClick = function()
					ply:ShowProfile()
				end

			end

		end

		local map_panel = vgui.Create('DGrid', map_BG)
		map_panel:SetPos(w / 2 - 500, h / 2 - 100)
		map_panel:SetCols(3)
		map_panel:SetColWide(350)
		map_panel:SetRowHeight(200)
		for i = 1, #mapPool do
			local mapid = mapPool[i]
			local mapData = maploader.Map(mapid)
			if !mapData then continue end
			local mapIcon =  Material("map_preview/" .. mapData.name .. ".jpg", "smooth noclamp")
			local mapButton = vgui.Create( "DButton" )
			mapButton:SetText( '' )
			mapButton:SetSize( 300, 150 )
			mapButton.Paint = function(self, w, h)
				draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0))

				local mapGamemode = mapData.gametype or 'N/A'

				if !mapIcon:IsError() then
					surface.SetMaterial(mapIcon)
					surface.SetDrawColor(255, 255, 255)
					surface.DrawTexturedRect(0, 0, w, h)
				end

				local fontName = 'futura_30'
				local height = h * 0.22

				draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
				draw.RoundedBox(0, 0, 0, w, height, Color(0, 0, 0, 200))
				draw.RoundedBox(0, 0, h - height, w, height, Color(0, 0, 0, 200))

				draw.SimpleText(T(mapGamemode), fontName, w / 2, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
				draw.SimpleText(GetGlobalInt('map_'..mapid), fontName, 5, 0, Color(255, 255, 255))

				draw.SimpleText(mapid, fontName, w / 2, h * 0.97, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

				surface.SetDrawColor(255, 255, 255)
				surface.DrawOutlinedRect(0, 0, w, h)
			end
			mapButton.DoClick = function()
				net.Start('ww2_receivevote')
					net.WriteString(mapid)
				net.SendToServer()
			end
			map_panel:AddItem(mapButton)
		end

		local random = vgui.Create( "DButton", map_BG)
		random:SetText( '' )
		random:SetSize( map_panel:GetColWide() * 1.42, 50 )
		random:SetPos(w / 2 - 500, h - 100)
		random.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			surface.SetDrawColor(255, 255, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(T('map_random'), F('futuraBold_30'), w / 2, h / 2, Color(230, 230, 230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.SimpleText(GetGlobalInt('map_random'), F('futuraBold_30'), 5, 1, Color(255, 255, 255))
		end
		random.DoClick = function()
			net.Start('ww2_receivevote')
				net.WriteString('random')
			net.SendToServer()
		end

		local refresh = vgui.Create( "DButton", map_BG)
		refresh:SetText( '' )
		refresh:SetSize( map_panel:GetColWide() * 1.42, 50 )
		refresh:SetPos(w / 2 + 5, h - 100)
		refresh.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
			surface.SetDrawColor(255, 255, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			draw.SimpleText(T('map_refresh'), F('futuraBold_30'), w / 2, h / 2, Color(230, 230, 230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.SimpleText(GetGlobalInt('map_refresh'), F('futuraBold_30'), 5, 1, Color(255, 255, 255))
		end
		refresh.DoClick = function()
			net.Start('ww2_receivevote')
				net.WriteString('refresh')
			net.SendToServer()
		end
	end

	hook.Add('RequestedUI', 'ShowMapSelection', function(id, netData)

		if id == 'ww2_changemap' then

			if !netData then

				error("Empty netData for UI " .. id)
				return

			end

			MapMenu(netData.mapPool, netData.scores)

		end

	end)

end
