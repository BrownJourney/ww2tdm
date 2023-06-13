local PLAYER = FindMetaTable('Player')

local function getWeaponTable()
	
	local weps = LocalPlayer():GetWeapons()
	local sorted = {}
	local translateHoldtype = {
		['pistol'] = 2,
		['revolver'] = 2,
		['knife'] = 2,
		['melee'] = 3,
		['etool'] = 3,
		['grenade'] = 4,
		['slam'] = 5,
		['unility'] = 6
	}

	for k, wep in pairs(weps) do

		if wep.FuckingShit then continue end

		-- translateHoldtype[wep.HoldtypeActive] or 1
		local id = translateHoldtype[wep.HoldtypeActive or wep:GetHoldType()] or 1
		if sorted[id] then

			id = wep.Slot or 5

		end

		sorted[id] = {wep = wep};

	end

	return sorted

end

local isToggled, isAmmoToggled, lastSelectedWeapon;

local hudAlpha 	= 0
local ammoAlpha = 0
local plyWeps;
local lastSlot;

local function activateSelection(bWeapon)

	plyWeps = getWeaponTable()

	if bWeapon then

		isAmmoToggled = true

		timer.Create('HideAmmoHUD', 5, 1, function()

			isAmmoToggled = false

		end)

	else

		isToggled, isAmmoToggled = true, true


		timer.Create('HideWeaponSelection', 3, 1, function()

			isToggled, isAmmoToggled = false, false

		end)

	end

end

function PLAYER:SelectWeapon( class )

	if self.GetSimfphys and IsValid(self:GetSimfphys()) then

		return

	end

	if( not self:HasWeapon( class ) ) then 

		return

	end

	local activeWep = self:GetActiveWeapon()

	if IsValid(activeWep) and activeWep:GetClass() == class then

		return

	end

	if IsValid(activeWep) and activeWep.ArcCW and activeWep:GetGrenadePrimed() then

		return

	end

	plyWeps = getWeaponTable()
	
	self.DoWeaponSwitch = self:GetWeapon( class );

	lastSelectedWeapon 	= class
	plyWeps 			= getWeaponTable()

	activateSelection()

end

local outlineMat = Material("hud/outlined.png", "smooth")
local function CustomWeaponSelection()

	if !plyWeps then

		return

	end

	local w, h = ScrW(), ScrH()

	local FT = FrameTime() * 400

	if isToggled then

		hudAlpha = math.min(hudAlpha + FT, 255)

	else

		hudAlpha = math.max(hudAlpha - FT, 0)

	end

	if isAmmoToggled then

		ammoAlpha = math.min(ammoAlpha + FT, 255)

	else

		ammoAlpha = math.max(ammoAlpha - FT, 0)

	end

	local activeWep = LocalPlayer():GetActiveWeapon()

	local i = 0
	for id, v in SortedPairs(plyWeps) do

		i = i + 1

		local wep = v.wep

		if !IsValid(wep) then

			continue

		end

		if !v.barcolor then

			v.barcolor = Color(0, 0, 0)

		end

		local wepName = utf8upper(T(wep.PrintName or "UNKNOWN WEAPON"))
		if wep.RestoreSupply and wep.RestoreSupply - CurTime() >= 0 then

			local time = wep.RestoreSupply - CurTime()

			wepName = wepName .. " (" .. T("restore_left"):format(string.ToMinutesSeconds(time)) .. ")"

		end

		local wepFont = F('futura_26')
		local wepW, wepH = surface.GetSize(wepName, wepFont)

		wepW = wepW + 100
		wepH = wepH + 10

		local x, y = w - wepW - 10, h * 0.7 + (wepH + h * 0.01) * (i - 1)
		local offset = 15
		local barColor = v.barcolor
		local textColor = Color(255, 255, 255, hudAlpha)

		if lastSelectedWeapon == wep:GetClass() then

			barColor.r = math.min(barColor.r + FT, 255)
			barColor.g = math.min(barColor.g + FT, 255)
			barColor.b = math.min(barColor.b + FT, 255)

			textColor = Color(0, 0, 0, hudAlpha)

		else

			barColor.r = math.max(barColor.r - FT, 0)
			barColor.g = math.max(barColor.g - FT, 0)
			barColor.b = math.max(barColor.b - FT, 0)

		end

		local wepMat;
		local wepClass = wep:GetClass()
		local scale;
		if killfeed.textures[wepClass] then

			wepMat = killfeed.textures[wepClass]

			if !wepMat:IsError() then
				scale = math.min(wepMat:GetInt("$realwidth") / wepMat:GetInt("$realheight"), 4)

				wepW = wepW + wepH * scale / 1.5
				x, y = w - wepW - 10, h * 0.7 + h * 0.05 * (i - 1)
			end

		else

			if !killfeed.textures[wepClass] then

				local wepID = killfeed.FormatWepID(wepClass)

				if wepID then

					killfeed.textures[wepClass] = Material('hud/feed/weapons/' .. wepID .. ".png", 'smooth noclamp')

				end

			end

		end

		draw.SimpleLinearGradient(x - offset - 10, y, wepW + 25, wepH, Color(barColor.r, barColor.g, barColor.b, 0), Color(barColor.r, barColor.g, barColor.b, hudAlpha - 55), true)

		local wepWide;
		if wepMat and !wepMat:IsError() then
			local weaponSize = wepH * 0.98
			if scale > 3.5 then
				weaponSize = wepH * 0.8
			elseif scale > 3 then
				weaponSize = wepH * 0.95
			end
			wepWide = weaponSize * scale

			surface.SetMaterial(wepMat)
			surface.SetDrawColor(255, 255, 255, hudAlpha)
			surface.DrawTexturedRect(x + wepW - offset - 40 - wepWide, y + wepH / 2 - weaponSize / 2, wepWide, weaponSize)

		end

		draw.SimpleText(wepName, wepFont, x - offset - 25 + wepW / 2 - (wepWide and wepWide / 2 + 5 or 0), y + wepH / 2, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		local textX, textY = x + wepW - offset - 10, y + wepH / 2
		draw.SimpleText(id, 'futuraBold_24', textX, textY, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		surface.SetMaterial(outlineMat)
		surface.SetDrawColor(0, 0, 0, textColor.a - 10)
		local size = wepH - 4
		surface.DrawTexturedRect(textX - size / 2, textY - size / 2, size, size)

	end

	if IsValid(activeWep) and activeWep:GetMaxClip1() > 0 then

		local rounds = math.ceil( LocalPlayer():GetAmmoCount( activeWep:GetPrimaryAmmoType() ) / activeWep:GetMaxClip1() )

		local ammoType = 'rounds'
		if activeWep.ArcCW then

			local wepType = string.Split(activeWep:GetClass(), "_")[2]

			if wepType == "rifle" or wepType == "revolver" or wepType == "shotgun" then
				
				ammoType = "bullets"

			elseif wepType == "grenade" or wepType == "bomb" then

				ammoType = "grenades"

			end
		
		end

		if ammoType == 'bullets' then

			rounds = LocalPlayer():GetAmmoCount( activeWep:GetPrimaryAmmoType() )

		end

		local roundsText = utf8upper(T(ammoType))
		local textColor = Color(255, 255, 255, ammoAlpha - 105)

		draw.SimpleTextShadow(rounds, F('futuraBold_55'), w - 10 - surface.GetSize(roundsText, F('futura_30')) - 2, h * 0.935, textColor, TEXT_ALIGN_RIGHT)
		draw.SimpleTextShadow(roundsText, F('futura_30'), w - 10, h * 0.955, textColor, TEXT_ALIGN_RIGHT)

	end

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

function trickyTableLength(tbl)
	local length = 0
	for k, v in pairs(tbl) do
		length = k
	end

	return length
end

hook.Add( "PlayerBindPress", "weaponselection_PlayerBind", function( ply, bind, down )

	if( not down or not ply:IsValid() or not ply:Alive() ) then 

		return

	end

	local wepTable = getWeaponTable()
	local activeWep = ply:GetActiveWeapon()

	if IsValid(activeWep) and activeWep:GetClass() == "weapon_physgun" then
	
		if( bind ~= "+attack" and input.IsMouseDown( MOUSE_LEFT ) ) then

			return

		end
	
	end

	if( bind:sub( 1, 4 ) == "slot" ) then

		local slot = tonumber( bind[5] );
		local wepData = wepTable[slot]

		if !wepData then

			return

		end

		lastSlot = slot

		local wepClass = wepData.wep:GetClass()
		LocalPlayer():SelectWeapon(wepClass)

	elseif bind == "+reload" then

		if isToggled then

			return

		end

		activateSelection(true)

	elseif bind == "invprev" then

		if #wepTable == 0 then

			return

		end

		lastSlot = (lastSlot or 0) - 1

		if !wepTable[lastSlot] then

			if lastSlot <= 1 then

				lastSlot = trickyTableLength(wepTable)

			else

				for i = lastSlot, 1, -1 do

					if wepTable[i] then

						lastSlot = i
						break;

					end

				end

			end

		end

		local wepData = wepTable[lastSlot]

		local wepClass = wepData.wep:GetClass()
		LocalPlayer():SelectWeapon(wepClass)

	elseif bind == "invnext" then

		if #wepTable == 0 then

			return

		end

		lastSlot = (lastSlot or 0) + 1

		if !wepTable[lastSlot] then

			if lastSlot >= trickyTableLength(wepTable) then

				lastSlot = 1

			else

				for i = lastSlot, trickyTableLength(wepTable) do

					if wepTable[i] then

						lastSlot = i
						break;

					end

				end

			end

		end

		local wepData = wepTable[lastSlot]

		if wepData then
			
			local wepClass = wepData.wep:GetClass()
			LocalPlayer():SelectWeapon(wepClass)

		end

	end
end)

hook.Add( "CreateMove", "WeaponSwitch", function( cmd )
	local lp = LocalPlayer();
	
	if( not IsValid( lp.DoWeaponSwitch ) ) then
		return 
	end

	cmd:SelectWeapon( lp.DoWeaponSwitch );

	if( lp:GetActiveWeapon() == lp.DoWeaponSwitch ) then
		lp.DoWeaponSwitch = nil
	end
end )

hook.Add('HUDPaint', 'CustomWeaponSelection', CustomWeaponSelection)

--[[-------------------------------------------------------------------------
LINEAR GRADIENT
---------------------------------------------------------------------------]]

local mat_white = Material("vgui/white")

function draw.SimpleLinearGradient(x, y, w, h, startColor, endColor, horizontal)
	draw.LinearGradient(x, y, w, h, { {offset = 0, color = startColor}, {offset = 1, color = endColor} }, horizontal)
end

function draw.SimpleLinearGradientPanel(panel, x, y, w, h, startColor, endColor, horizontal)
	x, y = panel:LocalToScreen(x, y);
	draw.SimpleLinearGradient(x, y, w, h, startColor, endColor, horizontal)
end

function draw.LinearGradient(x, y, w, h, stops, horizontal)
	if #stops == 0 then
		return
	elseif #stops == 1 then
		surface.SetDrawColor(stops[1].color)
		surface.DrawRect(x, y, w, h)
		return
	end

	table.SortByMember(stops, "offset", true)

	render.SetMaterial(mat_white)
	mesh.Begin(MATERIAL_QUADS, #stops - 1)
	for i = 1, #stops - 1 do
		local offset1 = math.Clamp(stops[i].offset, 0, 1)
		local offset2 = math.Clamp(stops[i + 1].offset, 0, 1)
		if offset1 == offset2 then continue end

		local deltaX1, deltaY1, deltaX2, deltaY2

		local color1 = stops[i].color
		local color2 = stops[i + 1].color

		local r1, g1, b1, a1 = color1.r, color1.g, color1.b, color1.a
		local r2, g2, b2, a2
		local r3, g3, b3, a3 = color2.r, color2.g, color2.b, color2.a
		local r4, g4, b4, a4

		if horizontal then
			r2, g2, b2, a2 = r3, g3, b3, a3
			r4, g4, b4, a4 = r1, g1, b1, a1
			deltaX1 = offset1 * w
			deltaY1 = 0
			deltaX2 = offset2 * w
			deltaY2 = h
		else
			r2, g2, b2, a2 = r1, g1, b1, a1
			r4, g4, b4, a4 = r3, g3, b3, a3
			deltaX1 = 0
			deltaY1 = offset1 * h
			deltaX2 = w
			deltaY2 = offset2 * h
		end

		a1, a2, a3, a4 = math.max(a1, 0), math.max(a2, 0), math.max(a3, 0), math.max(a4, 0)

		mesh.Color(r1, g1, b1, a1)
		mesh.Position(Vector(x + deltaX1, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r2, g2, b2, a2)
		mesh.Position(Vector(x + deltaX2, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r3, g3, b3, a3)
		mesh.Position(Vector(x + deltaX2, y + deltaY2))
		mesh.AdvanceVertex()

		mesh.Color(r4, g4, b4, a4)
		mesh.Position(Vector(x + deltaX1, y + deltaY2))
		mesh.AdvanceVertex()
	end
	mesh.End()
end

--[[-------------------------------------------------------------------------
LINEAR GRADIENT
---------------------------------------------------------------------------]]