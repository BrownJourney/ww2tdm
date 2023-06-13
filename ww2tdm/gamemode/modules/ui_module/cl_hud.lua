--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local GM = GM and GM or GAMEMODE

local _team = team

local color_transparent = Color(255, 255, 255, 230)

HUD = HUD or {}

HUD.CapturePointSize = 40

function draw.SimpleTextShadow(text, font, x, y, color, alignx, aligny, size)
	size = tonumber(size) or 2
	draw.SimpleText(text, font, x + size / 2, y + size / 2, Color(0, 0, 0, color.a), alignx, aligny)
	draw.SimpleText(text, font, x, y, color, alignx, aligny)
end

--[[-------------------------------------------------------------------------
---------------------------------------------------------------------------]]

function HUD:DrawPoint(posx, posy, word, team, status, isBottom, progress)

	local x, y = posx, posy;
	local neutralMat = "hud/point_neutral.png"
	local drawMat;
    local color = Color(200, 200, 200)

    local notAlive = !LocalPlayer():IsAlive()

    if isBottom and notAlive then

    	return

    end

    if TEAM_ATTACK then

    	if LocalPlayer():Team() == TEAM_ATTACK then

    		neutralMat = "hud/point_push_attack.png"

    	else

    		neutralMat = "hud/point_push_defend.png"

    	end

    end

	if team == TEAM_AXIS or team == TEAM_ALLIES then

		drawMat = "hud/point_" .. ( FACTION_REPLACE_ID[faction.GetID(team)] or faction.GetID(team) ) .. ".png"

	else

		if TEAM_ATTACK then

			drawMat = "hud/point_push_neutral.png"

		end

	end

    if status == FLAGSTATUS_CAPTURING_AXIS then

    	local teamClr = _team.GetColor(TEAM_AXIS)

    	color = Color(teamClr.r * self:Fluctuate(2), teamClr.g * self:Fluctuate(2), teamClr.b * self:Fluctuate(2))

    elseif status == FLAGSTATUS_CAPTURING_ALLIES then

    	local teamClr = _team.GetColor(TEAM_ALLIES)

    	color = Color(teamClr.r * self:Fluctuate(2), teamClr.g * self:Fluctuate(2), teamClr.b * self:Fluctuate(2))

    end

    local boxColor = Color(color.r, color.g, color.b, pointAlpha)

    local teamColor = _team.GetColor(team)

    if team != 0 then

   		boxColor = Color(teamColor.r, teamColor.g, teamColor.b, pointAlpha)

   	end

    local pointAlpha = 200

    if !isBottom then

    	pointAlpha = 200

    	x = math.Clamp(x, 15, ScrW() - 30)
    	y = math.Clamp(y, 15, ScrH() - 30)

    	if (x == 15 and (y == ScrH() - 30 or y == 15)) or (x == ScrW() - 30 and (y == 15 or y == ScrH() - 30)) then

    		return

    	end

    	local centerSize = ScrW() * .125

	    if posx > ScrW()/2-centerSize and posx < ScrW()/2+centerSize and posy > ScrH()/2-centerSize and posy < ScrH()/2+centerSize then

	    	pointAlpha = 30

	    end

	    if posx > ScrW()-50 or posx < 50 then 

	    	pointAlpha = 50

	   	elseif posx > ScrW()-100 or posx < 100 then

	   		pointAlpha = 100

	   	end

	   	if posy > ScrH()-50 or posy < 50 then 

	    	pointAlpha = 50

	   	elseif posy > ScrH()-100 or posy < 100 then

	   		pointAlpha = 100

	   	end

	   	if self:IsInSights() then

	   		pointAlpha = 10

	   	end

	end

	if notAlive then

		pointAlpha = 255

	end

	surface.SetMaterial(Material(neutralMat, "smooth noclamp"))
	surface.SetDrawColor(boxColor.r, boxColor.g, boxColor.b, pointAlpha)
   	surface.DrawTexturedRect(x - self.PointSize / 2, y - self.PointSize / 2, self.PointSize, self.PointSize)

   	local yOffest = 0
   	local fontScale = math.max(math.floor(20 * (tonumber(settings.GetSetting('pointsize')) / 100)), 3)

   	if drawMat then

   		surface.SetMaterial(Material(drawMat, "smooth noclamp"))
   		surface.SetDrawColor(255, 255, 255, pointAlpha)
   		surface.DrawTexturedRect(x - self.PointSize / 2, y - self.PointSize / 2, self.PointSize, self.PointSize)

   		draw.SimpleTextOutlined(word, 'futura_'..fontScale, x, y - self.PointSize + self.PointSize / 4, Color(color.r, color.g, color.b, pointAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0, 0, 0, pointAlpha))

   	else

   		draw.SimpleTextOutlined(word, 'futura_'..fontScale, x, y, Color(0, 0, 0, pointAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0, 0, 0, pointAlpha))

   	end

end

function HUD:Zones()

	local w, h = ScrW(), ScrH()

	if LocalPlayer():GetNWBool("SetToKilled") then

		local timeleft = math.Round(timer.TimeLeft('DeathCountdown') or (CVAR_ZONE_TIME or 5), 1)

		if timeleft > 10 then return end

		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
		draw.RoundedBox(0, w / 2 - 200, h * 0.35, 400, 110, Color(50, 50, 50, 50))

		surface.SetDrawColor(200, 200, 200, 200)
		surface.DrawOutlinedRect(w / 2 - 200, h * 0.35, 400, 110)

		draw.SimpleText(T(CVAR_ZONE_TEXT or 'rest_area'), 'futura_30', w / 2, h * 0.35 + 55 - 20, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(T('will_die').." "..T('seconds'):format(timeleft), 'futura_30', w / 2, h * 0.35 + 55 + 20, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end

end

local currentList;
function HUD:EquipmentPickups()

	if (self.NextListing or 0) < CurTime() then

		currentList = ents.FindByClass('ww2_equipment_drop')

		self.NextListing = CurTime() + 0.1

	end

	for k, v in pairs(currentList or {}) do

		if !IsValid(v) then continue end

		local wepClass = v:GetEquipment()
		local wepData = weapons.Get(wepClass)

		if !wepData then

			continue

		end

		if LocalPlayer():GetPos():DistToSqr(v:GetPos()) > 10000 then

			continue

		end

		local pos = v:GetPos():ToScreen()
		local x, y = pos.x, pos.y

		draw.RoundedBox(4, x - 25, y - 10, 20, 20, Color(0, 0, 0, 200))
		draw.SimpleText(input.LookupBinding('+use'):upper(), F('futura_20'), x - 15, y, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		draw.SimpleText(wepData.PrintName or 'UNKNOWN WEAPON', F('futura_25'), x, y, color_white, nil, TEXT_ALIGN_CENTER)

	end

end

local breathMat = Material("hud/breath.png")
function HUD:HoldBreath()

	local w, h = ScrW(), ScrH()
	local wep = LocalPlayer():GetActiveWeapon()

	if !IsValid(wep) then

		return

	end

	if !wep.ArcCW then

		return

	end

	if wep.NoBreath then

		return

	end

	if wep:GetState() != ArcCW.STATE_SIGHTS then

		return

	end

	-- local asight = wep:GetActiveSights()
	-- if (asight.ScopeMagnification or 0) <= 1 then

	-- 	return

	-- end

	local drawText = T('hold_breath'):format(input.GetKeyName(LocalPlayer():GetInfoNum("ww2_bind_breath", -1)))
	local breathAmount = math.Round(wep._BreathAmount or 100)

	-- if wep.HoldingBreath then

	-- 	drawText = T('breath_left'):format(breathAmount, "%")

	-- end

	-- draw.SimpleText(drawText, F('futuraLight_30'), w / 2, h * 0.8, color_white, TEXT_ALIGN_CENTER)

	local scale = 1 - (math.max(breathAmount - 20, 1) / 100)

	surface.SetMaterial(breathMat)
	surface.SetDrawColor(255, 255, 255, 255 * scale)
	surface.DrawTexturedRect(0, 0, w, h)

end

function HUD:BipodHint()

	local w, h = ScrW(), ScrH()
	local wep = LocalPlayer():GetActiveWeapon()

	if !IsValid(wep) then

		return

	end

	if !wep.ArcCW then

		return

	end


	if !wep:CanBipod() or wep:GetInBipod() then

		return

	end

	local keyName = input.GetKeyName(LocalPlayer():GetInfoNum("ww2_bind_bipod", -1))
	local text = T("place_bipod"):format(utf8upper(keyName))

	draw.SimpleTextShadow(text, F("futura_30"), w / 2, h * 0.75, color_white, TEXT_ALIGN_CENTER)

end

function HUD:ShouldWarModeHide()

	if LocalPlayer():Team() == TEAM_SPECTATOR then

		return false

	end

	return maploader.Gamemode() == "war" and !LocalPlayer():IsAlive()

end

HUD.AxisTickets = 0
HUD.AlliesTickets = 0
HUD.AttackTickets = 0
function HUD:Tickets()

	if CVAR_NO_TICKETS then

		return

	end

	local w, h = ScrW(), ScrH()
    local font = 'futura_24'

    self.AxisTickets = Lerp(0.01, self.AxisTickets, CVAR_USE_PEOPLE and GM:CountAlivePlayers(TEAM_AXIS) or gamestate.GetTickets(TEAM_AXIS))
    self.AlliesTickets = Lerp(0.01, self.AlliesTickets, CVAR_USE_PEOPLE and GM:CountAlivePlayers(TEAM_ALLIES) or gamestate.GetTickets(TEAM_ALLIES))

    if self:ShouldWarModeHide() then return end

	local colorAxis = team.GetColor(TEAM_AXIS)
	local colorAllies = team.GetColor(TEAM_ALLIES)

    if TEAM_ATTACK then

    	self.AttackTickets = Lerp(0.01, self.AttackTickets, gamestate.GetTickets(TEAM_ATTACK))

    	local boxCorner = 2
    	local bgSize = 50

    	draw.RoundedBox(0, ScrW() / 2 - 10 - boxCorner, 10 - boxCorner, 20 + boxCorner * 2, 20 + boxCorner * 2, Color(0, 0, 0, 200))
    	surface.SetDrawColor(255, 255, 255, 20)
    	surface.DrawOutlinedRect(ScrW() / 2 - 10 - boxCorner, 10 - boxCorner, 20 + boxCorner * 2, 20 + boxCorner * 2)

    	surface.SetDrawColor(255, 255, 255);
	    surface.SetMaterial(faction.Team(TEAM_ATTACK).icoSmall);
	    surface.DrawTexturedRect(ScrW()/2-10, 10, 20, 20);

	    draw.RoundedBox(0, ScrW() / 2 - bgSize / 2, 30 + boxCorner + 1, bgSize, 20, Color(0, 0, 0, 200))

		local attackColor = team.GetColor(TEAM_ATTACK)
    	draw.SimpleTextOutlined(math.Round(self.AttackTickets), font, ScrW()/2, 30 + boxCorner + 1 + 10, Color(attackColor.r, attackColor.g, attackColor.b, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0, 0, 0));
    	surface.SetDrawColor(255, 255, 255, 20)
    	surface.DrawOutlinedRect(ScrW() / 2 - bgSize / 2, 30 + boxCorner + 1, bgSize, 20)

    else

    	draw.RoundedBox(0, ScrW()/2-200, h - 29, 150, 24, Color(0, 0, 0, 180));
	    draw.RoundedBox(0, ScrW()/2+50, h - 29, 150, 24, Color(0, 0, 0, 180));
	    
	    surface.SetDrawColor(255, 255, 255, 10);
	    surface.DrawOutlinedRect(ScrW()/2-200, h - 29, 150, 24);
	    surface.DrawOutlinedRect(ScrW()/2+50, h - 29, 150, 24);
	    
	    surface.SetDrawColor(255, 255, 255, 100);
	    surface.SetMaterial(faction.Team(TEAM_AXIS).icoSmall);
	    surface.DrawTexturedRect(ScrW()/2-50-22, h - 27, 20, 20);
	    
	    surface.SetMaterial(faction.Team(TEAM_ALLIES).icoSmall);
	    surface.DrawTexturedRect(ScrW()/2+52, h - 27, 20, 20);

	    draw.SimpleTextOutlined(math.Round(self.AxisTickets), font, ScrW()/2-74-125/2, h - 17, Color(colorAxis.r, colorAxis.g, colorAxis.b, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0, 0, 0));
	    draw.SimpleTextOutlined(math.Round(self.AlliesTickets), font, ScrW()/2+74+125/2, h - 17, Color(colorAllies.r, colorAllies.g, colorAllies.b, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0.5, Color(0, 0, 0));

	end

end

function HUD:TargetID()

	local w, h = ScrW(), ScrH()


	if CVAR_NOTEAMS then

		return

	end

	local traceEnt = LocalPlayer():GetEyeTrace().Entity

	if !IsValid(traceEnt) then

		return

	end

	if !traceEnt:IsPlayer() then

		return

	end

	if !traceEnt:IsAlive() then

		return

	end

	if traceEnt:Team() != LocalPlayer():Team() and LocalPlayer():Team() != TEAM_SPECTATOR then

		return

	end

	if settings.GetSetting('targetid') == false then
		
		return

	end

	draw.SimpleText(traceEnt:Name(), F('futuraLight_30'), w / 2, h * 0.6, color_white, TEXT_ALIGN_CENTER)

end

function HUD:TargetEnt()

	local w, h = ScrW(), ScrH()

	if !LocalPlayer():GetClass():find("medic") then

		return

	end

	local traceEnt = LocalPlayer():GetEyeTrace().Entity

	if !IsValid(traceEnt) then

		return

	end

	if !traceEnt:IsRagdoll() then

		return

	end

	if traceEnt:GetPos():DistToSqr(LocalPlayer():GetPos()) > 10000 then

		return

	end

	if !traceEnt:GetNWBool("Revivable") then

		return

	end

	if traceEnt:GetNWInt("Team") != LocalPlayer():Team() then

		return

	end

	draw.SimpleText(T("revive_action"):format(utf8upper(input.GetKeyName(LocalPlayer():GetInfoNum("ww2_bind_revive", -1)))), F('futuraLight_30'), w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

end

function HUD:FortID()

	local w, h = ScrW(), ScrH()

	local traceEnt = LocalPlayer():GetEyeTrace().Entity

	local wep = LocalPlayer():GetActiveWeapon()

	if !IsValid(wep) then

		return

	end

	if wep:GetClass() != "w_hammer" then

		return

	end

	if !IsValid(traceEnt) then

		return

	end

	if !traceEnt:GetNWBool("Fortification") then

		return

	end

	if traceEnt:GetPos():DistToSqr(LocalPlayer():GetPos()) > 125000 then

		return

	end

	draw.SimpleText(T("fortification_health"):format(traceEnt:Health(), traceEnt:GetMaxHealth()), F('futuraLight_30'), w / 2, h * 0.6, color_white, TEXT_ALIGN_CENTER)

end


local healthMat = Material('hud/player_health.png')
HUD.PlyHealth = 100
HUD.PlyArmor = 0
function HUD:DrawHealth()

	local w, h = ScrW(), ScrH()
	local plyHealth = LocalPlayer():Health() / LocalPlayer():GetMaxHealth()
	local plyArmor = LocalPlayer():Armor() / CFG.MaxPlayerArmor
	local lifeAmount = plyHealth + plyArmor
	self.PlyHealth = Lerp(FrameTime() * 10, self.PlyHealth, plyHealth)
	self.PlyArmor = Lerp(FrameTime() * 10, self.PlyArmor, plyArmor)
	local FT = FrameTime() * 500

	if (self.LastHealth or 0) != lifeAmount or plyHealth < 0.5 then

		self.VisibleTime = CurTime() + 5

	end

	if !self.HealthAlpha then

		self.HealthAlpha = 0
		self.VisibleTime = CurTime()

	end

	if self.VisibleTime > CurTime() then

		self.HealthAlpha = math.min(self.HealthAlpha + FT, 255)

	else

		self.HealthAlpha = math.max(self.HealthAlpha - FT, 0)

	end

	if settings.GetSetting('health') == false or !LocalPlayer():IsAlive() then

		self.HealthAlpha = 0

	end

	self.LastHealth = lifeAmount

	surface.SetMaterial(healthMat)
	surface.SetDrawColor(255, 0, 0, self.HealthAlpha - 155)
	surface.DrawTexturedRect(5, h - 128, 64, 128)

	local startx, starty = 5, h - 128 - 5
	render.SetScissorRect(startx, starty, startx + 64, starty + 132 * self.PlyHealth, true)
		surface.SetMaterial(healthMat)
		surface.SetDrawColor(150 * (1 - self.PlyHealth), 150 * self.PlyHealth, 0, self.HealthAlpha)
		surface.DrawTexturedRect(5, h - 128, 64, 128)
	render.SetScissorRect(5, h - 128 - 5, 64, 132 * self.PlyHealth, false)

	local startx, starty = 5, h - 128 - 5
	render.SetScissorRect(startx, starty, startx + 64, starty + 132 * self.PlyArmor, true)
		surface.SetMaterial(healthMat)
		surface.SetDrawColor(51, 153, 255, self.HealthAlpha)
		surface.DrawTexturedRect(5, h - 128, 64, 128)
	render.SetScissorRect(5, h - 128 - 5, 64, 132 * self.PlyHealth, false)


end

local points = ents.FindByClass("ww2_point_flag")
function HUD:ScreenPoints()

	local w, h = ScrW(), ScrH()

	if (self.PointsUpdate or 0) < CurTime() then

		points = ents.FindByClass('ww2_point_flag')

		self.PointsUpdate = CurTime() + 5

	end

	for k, v in ipairs(points or {}) do

		if !IsValid(v) then continue end

		local amount = #points
		local curPos;
		if amount % 2 != 0 then
			curPos = ((k - math.ceil(amount / 2)) / amount) * (amount * (self.PointSize + 10))
		else
			curPos = (((k - 0.5) - math.ceil(amount / 2)) / amount) * (amount * (self.PointSize + 10))
		end

		if !self:ShouldWarModeHide() then

			self:DrawPoint(w / 2 + curPos, h - 55, v:GetPoint(), v:GetControlledBy(), v:GetStatus(), true)

		end

		if LocalPlayer():GetPos():Distance(v:GetPos()) < v:GetRadius() then

			continue

		end

		local pos = v:GetPos():ToScreen()
		
		self:DrawPoint(pos.x, pos.y, v:GetPoint(), v:GetControlledBy(), v:GetStatus())

	end

end

function HUD:SpectatorControls()

	if LocalPlayer():Team() != TEAM_SPECTATOR then

		return

	end

	if Gui.IsValidVGUI('deploy_menu') then

		return

	end

	local w, h = ScrW(), ScrH()

	draw.SimpleTextShadow(T("spectator"), F("futuraBold_20"), w / 2, 5, color_white, TEXT_ALIGN_CENTER)

	local OBSTarget = LocalPlayer():GetObserverTarget()

	if IsValid(OBSTarget) then

		draw.SimpleTextShadow(OBSTarget:Name(), F("futura_30"), w / 2, 5 + h * 0.03, team.GetColor(OBSTarget:Team()), TEXT_ALIGN_CENTER)

	end

end

local invisibleColor = Color(255, 255, 255, 0)
function HUD:Main()

	local w, h = ScrW(), ScrH()

	local CVarDev = GetConVar("developer")

	if CVarDev:GetInt() == 1 and LocalPlayer():IsSuperAdmin() then
		draw.RoundedBox(0, w / 2 - 4, h / 2 - 4, 2, 2, Color(0, 255, 0))

		for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), 500)) do
			if v:GetClass() == "prop_dynamic" then continue end
			local pos = v:GetPos():ToScreen()
			draw.SimpleTextShadow(v:GetClass() .. "[" .. v:EntIndex() .. "]", F("futura_15"), pos.x, pos.y, color_white)
		end
	end

	local roundTime, roundFont = string.ToMinutesSeconds(math.abs(CurTime() - gamestate.GetRoundTime())), 'futura_24'

	local _, height = surface.GetSize(roundTime, roundFont)

	draw.SimpleTextOutlined(roundTime, roundFont, w / 2, h - height - 5, color_transparent, TEXT_ALIGN_CENTER, nil, 0.5, Color(0, 0, 0))

	self:ScreenPoints()
	self:DrawHealth()
	self:SpectatorControls()

	if gamestate.Get() == GS_WAITING_PLAYERS then

		draw.SimpleText("WAITING FOR PLAYERS...", F("futuraBold_50"), w / 2, h * 0.2, Color(255, 255, 255, 100 * self:Fluctuate(3)), TEXT_ALIGN_CENTER)

	end

	local activeWep = LocalPlayer():GetActiveWeapon()

	if IsValid(activeWep) and activeWep.Jamming and activeWep:GetHeatLocked() then

		draw.SimpleTextShadow(T("weapon_heated"), F("futura_25"), w, h * 0.85, Color(255, 255, 255, 255 * HUD:Fluctuate(3)), TEXT_ALIGN_RIGHT)

	end

end

function HUD:Think()

	self.PointSize = self.CapturePointSize * (tonumber(settings.GetSetting('pointsize')) / 100)

	if (self.NextThink or 0) >= CurTime() then

		return

	end

	-- for k, v in pairs(ents.FindByClass("class C_BaseFlex")) do

	-- 	if v:GetPos() == vector_origin then

	-- 		v:Remove()

	-- 	end

	-- end

	local lp = LocalPlayer()
	local gEnt = lp.GhostEntity

	self.NextThink = CurTime() + 0.5

	local wep = lp:GetActiveWeapon()

	if !IsValid(gEnt) then

		return

	end

	if !IsValid(wep) or wep:GetClass() != "w_hammer" or IsValid(lp:GetSimfphys()) then

		gEnt:SetColor(Color(255, 255, 255, 0))

	end

end

function HUD:MedicsAround()

	local w, h = ScrW(), ScrH()
	local medics = 0

	for k, v in pairs(player.GetAll()) do

		if v:Team() != LocalPlayer():Team() then

			continue

		end

		if !v:IsAlive() then

			continue

		end

		if v == LocalPlayer() then

			continue

		end
		
		if v:GetTrait() != TRAIT_REVIVE then

			continue

		end

		local distMetres = math.Round(v:GetPos():Distance(LocalPlayer():GetPos()) / 51)
		draw.SimpleText(v:Name() .. " (" .. distMetres .. "м)", F("futura_20"), w - 5, h * 0.8 + (h * 0.05 * medics), color_white, TEXT_ALIGN_RIGHT)

		medics = medics + 1

	end

	if medics > 0 then

		draw.SimpleText(T("medics_around"), F("futura_30"), w - 5, h * 0.76, color_white, TEXT_ALIGN_RIGHT)

	end

end

local mat = Material("hud/revive-mark.png", "smooth noclamp")
function HUD:CorpsesAround()

	local w, h = ScrW(), ScrH()

	if LocalPlayer():GetTrait() != TRAIT_REVIVE then

		return

	end

	for k, v in pairs(player.GetAll()) do

		if v:Team() != LocalPlayer():Team() then

			continue

		end

		if !v:GetNWBool("DeathScreen") then

			continue

		end

		if v == LocalPlayer() then

			continue

		end

		if v:IsAlive() then

			continue

		end

		if v:GetPos():DistToSqr(LocalPlayer():GetPos()) > 1000000 then

			continue

		end

		local pos = v:GetPos():ToScreen()

		local size = 32
		surface.SetMaterial(mat)
		surface.SetDrawColor(0, 204, 102)
		surface.DrawTexturedRect(pos.x - size / 2, pos.y - size / 2, size, size)

	end

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add("HUDPaint", "MainHUDElements", function()
	if !TEAM_AXIS or !TEAM_ALLIES then return end

	HUD:Think()

	if settings.GetSetting('huddisable') == true then
		
		return

	end


	if LocalPlayer():Health() > 0 then

		HUD:Main()
		HUD:Zones()
		HUD:Tickets()
		HUD:TargetID()
		HUD:TargetEnt()
		HUD:FortID()
		HUD:EquipmentPickups()
		HUD:HoldBreath()
		HUD:BipodHint()
		HUD:CorpsesAround()

	else

		HUD:MedicsAround()

	end

end)

hook.Add("PrePlayerDraw", "HideSpectators", function(ply)
	local inVehicle = ply.GetSimfphys and IsValid(ply:GetSimfphys())

	if !ply:IsAlive() or ply:GetNWBool('b_NotDeployed') or (ply:GetMoveType() == MOVETYPE_NOCLIP and !inVehicle) then
		return true
	end
end)

hook.Add("CalcView", "FirstPersonDeath", function(ply, origin, angles, fov)
   	if ply.GetSimfphys and IsValid(ply:GetSimfphys()) then return end
	if ply:Health() > 0 then return end
	local ragdoll = ply:GetNWEntity("Ragdollentity")

	if not IsValid(ragdoll) then return end
	local head = ragdoll:LookupAttachment("eyes")
	head = ragdoll:GetAttachment(head)
	if not head or not head.Pos then return end

	local view = {}

	if not ragdoll.BonesRattled then
	    ragdoll.BonesRattled = true
	    ragdoll:InvalidateBoneCache()
	    ragdoll:SetupBones()
	    local matrix

	    for bone = 0, (ragdoll:GetBoneCount() or 1) do
	        if ragdoll:GetBoneName(bone):lower():find("head") then
	            matrix = ragdoll:GetBoneMatrix(bone)
	            break
	        end
	    end

	    if IsValid(matrix) then
	        matrix:SetScale(Vector(0, 0, 0))
	    end
	end

	view.origin = head.Pos + head.Ang:Up() * 8
	view.angles = head.Ang

	return view
end)

local FT, CT, vm, att, cyc, seq, vel, cos1, cos2, intensity
local Ang0, curang, curviewbob = Angle(0, 0, 0), Angle(0, 0, 0), Angle(0, 0, 0)
local LerpBackSpeed = 10
local fixPos, fixAng, bWorking;
concommand.Add("fix_point", function(ply, cmd, args)
	if bWorking then
		fixPos = nil;
		fixAng = nil;
	else
		fixPos = ply:EyePos()
		fixAng = ply:EyeAngles()
	end

	bWorking = !bWorking
end)

local ISLEANINGCV = false

hook.Add("CalcView", "HeadBobbing", function(ply, origin, angles, fov, ...)
	if ply:Health() <= 0 then return end
	if ply.GetSimfphys and IsValid(ply:GetSimfphys()) then hook.Run("CalcView_WW2", ply, origin, angles, fov) return end

	local bone = LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")
   	if (bone) then
   	    LocalPlayer():ManipulateBoneScale(bone, Vector(1,1,1))
   	end

   	local view = {}
   	local wep = ply:GetActiveWeapon()

   	if bWorking then
   		view.origin = fixPos
   		view.angles = fixAng
   		view.drawviewer = true
   		return view
   	end

	FT, CT = FrameTime(), CurTime()
	intensity = 3
	if ply:GetTrait() == TRAIT_TACSPRINT and ply:IsSprinting() then
		intensity = 6
	end

	if ply.IsProne and ply:IsProne() then
		intensity = 4
	end

	intensity = intensity * (tonumber(settings.GetSetting("headbob_slider")) / 100)
	
	if intensity > 0 then
		vel = LocalPlayer():GetVelocity():Length()

		if ply.IsProne and ply:IsProne() then

			vel = vel * 10

		end

		if LocalPlayer():OnGround() and vel > LocalPlayer():GetWalkSpeed() * 0.3 then
			if vel < LocalPlayer():GetWalkSpeed() * 1.2 then
				cos1 = math.cos(CT * 7)
				cos2 = math.cos(CT * 10)
				curviewbob.p = cos1 * 0.15 * intensity
				curviewbob.y = cos2 * 0.1 * intensity
			else
				cos1 = math.cos(CT * 12)
				cos2 = math.cos(CT * 15)
				curviewbob.p = cos1 * 0.25 * intensity
				curviewbob.y = cos2 * 0.15 * intensity
			end
		else
			curviewbob = LerpAngle(FT * 10, curviewbob, Ang0)
		end
	end

	view.origin = origin
	view.angles = angles + curviewbob
	
	if !IsValid(wep) or !wep.ArcCW then
		view.fov = tonumber(settings.GetSetting("fov_slider"))
	end

	return view
end)

local blur = Material("pp/blurscreen")
hook.Add("RenderScreenspaceEffects", "DeathEffectFromRO2", function()
	if LocalPlayer():Health() <= 0 then
		DrawMotionBlur( 0.27, 0.5, 0.01 )
		DrawSharpen( 3,2 )
		local tab = {
				[ "$pp_colour_addr" ] = 0,
				[ "$pp_colour_addg" ] = 0,
				[ "$pp_colour_addb" ] = 0,
				[ "$pp_colour_brightness" ] = 0,
				[ "$pp_colour_contrast" ] = 0.7,
				[ "$pp_colour_colour" ] = 0.2,
				[ "$pp_colour_mulr" ] = 0,
				[ "$pp_colour_mulg" ] = 0.02,
				[ "$pp_colour_mulb" ] = 0
		}
		DrawColorModify( tab )

		DrawToyTown( 3, ScrH() / 1.8 )

		local W = ScrW()
		local H = ScrH()

		surface.SetMaterial(blur)
		surface.SetDrawColor(255, 255, 255, 255)

		for i = 0.33, 2, 0.33 do
			blur:SetFloat("$blur", 2 * i)
			blur:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(0, 0, W, H)
		end
	end
end)

local FogDist = 0;
local function draw_fog()
	local ply = LocalPlayer()
	if ply:Health() > 0 then FogDist = 512 return end

	if FogDist > 0 then

		FogDist = math.max(FogDist - FrameTime() * 200, 0)

	end

	render.SetFogZ(5)
	render.FogMode(1)
	render.FogStart(0)
	render.FogEnd(FogDist)
	render.FogMaxDensity(0.999)

	local c = render.GetLightColor(ply:EyePos())

	c.r = c.r * 0
	c.g = c.g * 0
	c.b = c.b * 0

	c = c * 255

	render.FogColor(c.r, c.g, c.b)

	return true
end

hook.Add("SetupSkyboxFog", "water", function()
	return draw_fog()
end)

hook.Add("SetupWorldFog", "water", function()
	return draw_fog()
end)

local view = {
	origin = Vector(0, 0, 0),
	angles = Angle(0, 0, 0),
	fov = 90,
	znear = 1
}

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

local hookid = 'ShowUIProgress'
local flag, progress
net.Receive(hookid, function()
	flag = Entity(net.ReadUInt(32))
	progress = net.ReadFloat()
end)

hook.Add('HUDPaint', hookid, function()
	local w, h = ScrW(), ScrH()

	if !IsValid(flag) then

		return

	end

	if !LocalPlayer():Alive() then

		return

	end

	if gamestate.Get() == GS_ROUND_END then

		return

	end

	if LocalPlayer():GetPos():Distance(flag:GetPos()) > flag:GetRadius() + 15 then

		return

	end

	local status = flag:GetStatus()
	local owner = flag:GetControlledBy()
	local flagProgression;
	local teamColor = _team.GetColor(owner)

	if status != FLAGSTATUS_CAPTURING_ALLIES and status != FLAGSTATUS_CAPTURING_AXIS then

		if ( status == FLAGSTATUS_IDLE or status == FLAGSTATUS_PREVENTED ) and ( owner != LocalPlayer():Team() or owner == 0 ) then

			flagProgression = 0

		else

			flagProgression = 1

		end

	else

		if progress <= 0 then

			return

		end

		if owner != 0 and ( ( status == FLAGSTATUS_CAPTURING_ALLIES and owner != TEAM_ALLIES ) or ( status == FLAGSTATUS_CAPTURING_AXIS and owner != TEAM_AXIS ) ) then

			flagProgression = 1 - ( progress / FLAG_MAX_PROGRESS )

		else

			flagProgression = progress / FLAG_MAX_PROGRESS
			
		end

		if owner == 0 then

			if status == FLAGSTATUS_CAPTURING_AXIS then

				teamColor = _team.GetColor(TEAM_AXIS)

			else

				teamColor = _team.GetColor(TEAM_ALLIES)

			end

		end


	end

	if !flagProgression then

		return

	end

	local wBox = w * 0.1
	local fromTop = h * 0.12

	local boxAlpha = 180

	if HUD:IsInSights() then

   		boxAlpha = 30

   	end

	--draw.RoundedBox(0, w / 2 - wBox / 2, fromTop, wBox, 10, Color(0, 0, 0, boxAlpha))

	if status == FLAGSTATUS_CAPTURING_AXIS or status == FLAGSTATUS_CAPTURING_ALLIES then

		draw.Arc(w / 2, fromTop, HUD.PointSize * 0.55, 4, 90, 90 + 360 * math.min(flagProgression, 1), 1, Color(teamColor.r, teamColor.g, teamColor.b, math.max(boxAlpha, 0)))

	end
	--draw.RoundedBox(0, w / 2 - wBox / 2, fromTop, wBox * math.min(progress, 1), 10, Color(teamColor.r, teamColor.g, teamColor.b, boxAlpha))

	-- surface.SetDrawColor(255, 255, 255, boxAlpha)
	-- surface.DrawOutlinedRect(w / 2 - wBox / 2, fromTop, wBox, 10)

	HUD:DrawPoint(w / 2, fromTop, flag:GetPoint(), owner, status, false, flagProgression)
end)
--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add('NetworkBoolReceived', 'zones_startTimer', function(ply, id, var)
	if id == 'SetToKilled' and ply == LocalPlayer() then
		local time = CVAR_ZONE_TIME
		if TEAM_ATTACK and (ply:Team() == TEAM_ATTACK or !ply:GetNWBool('isFallingBack')) then
			time = 5
		end

		if var then
			timer.Create('DeathCountdown', time, 1, function() end)
		else
			timer.Remove('DeathCountdown')
		end
	end
end)

--[[-------------------------------------------------------------------------
UTILITIES
---------------------------------------------------------------------------]]


function HUD:Fluctuate(c)

	return ( math.cos( CurTime() * c ) + 1 ) / 2

end

function HUD:Pulsate(c)

  	return ( math.abs( math.sin( CurTime() * c ) ) )

end

function HUD:IsInSights()

	local plyWep = LocalPlayer():GetActiveWeapon()

   	return IsValid(plyWep) and plyWep.EnterSights and plyWep:GetState() == ArcCW.STATE_SIGHTS

end

function HUD:Circle( x, y, radius, seg )

	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )

end

function draw.Arc(cx,cy,radius,thickness,startang,endang,roughness,color)
	draw.NoTexture()
	surface.SetDrawColor(color)
	surface.DrawArc(surface.PrecacheArc(cx,cy,radius,thickness,startang,endang,roughness),color)
end

function surface.PrecacheArc(cx,cy,radius,thickness,startang,endang,roughness)
	local triarc = {}
	-- local deg2rad = math.pi / 180

	-- Define step
	local roughness = math.max(roughness or 1, 1)
	local step = roughness

	-- Correct start/end ang
	local startang,endang = startang or 0, endang or 0

	if startang > endang then
		step = math.abs(step) * -1
	end

	-- Create the inner circle's points.
	local inner = {}
	local r = radius - thickness
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*r), cy+(-math.sin(rad)*r)
		table.insert(inner, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end

	-- Create the outer circle's points.
	local outer = {}
	for deg=startang, endang, step do
		local rad = math.rad(deg)
		-- local rad = deg2rad * deg
		local ox, oy = cx+(math.cos(rad)*radius), cy+(-math.sin(rad)*radius)
		table.insert(outer, {
			x=ox,
			y=oy,
			u=(ox-cx)/radius + .5,
			v=(oy-cy)/radius + .5,
		})
	end

	-- Triangulize the points.
	for tri=1,#inner*2 do -- twice as many triangles as there are degrees.
		local p1,p2,p3
		p1 = outer[math.floor(tri/2)+1]
		p3 = inner[math.floor((tri+1)/2)+1]
		if tri%2 == 0 then --if the number is even use outer.
			p2 = outer[math.floor((tri+1)/2)]
		else
			p2 = inner[math.floor((tri+1)/2)]
		end

		table.insert(triarc, {p1,p2,p3})
	end

	-- Return a table of triangles to draw.
	return triarc
end

function surface.DrawArc(arc,color) //Draw a premade arc.
	for k,v in ipairs(arc) do
		surface.DrawPoly(v)
	end
end