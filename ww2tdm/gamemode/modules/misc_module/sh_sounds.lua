
SOUNDS = SOUNDS or {}
SOUNDS.Info = SOUNDS.Info or {}

SOUNDS.MaxMusicVolume = 10

if CLIENT then

	function SOUNDS.ShowSubtitles(subtitle)
		if settings.GetSetting('showSubtitles') == false then
			return
		end

		if IsValid(SOUNDS.Subtitles) then
			SOUNDS.Subtitles:Remove()
		end

		local w, h = ScrW(), ScrH()
		local text, font = subtitle, F('futuraLight_29')
		local wide, height = surface.GetSize(text, font)

		local background = vgui.Create('DPanel')
		SOUNDS.Subtitles = background
		background:SetSize(wide, height + 10)
		background:SetAlpha(0)
		background:AlphaTo(255, 0.5, 0)
		background:SetPos(w / 2 - background:GetWide() / 2, h - background:GetTall() - h * 0.15)
		background.Paint = function(self, w, h)
			draw.SimpleTextOutlined(text, font, 0, h / 2, color_white, nil, TEXT_ALIGN_CENTER, 0.5, color_black)
		end

		timer.Simple(5, function()
			if !IsValid(background) then return end
			background:AlphaTo(0, 0.5, 0, function()
				if IsValid(background) then
					background:Remove()
				end
			end)
		end)
	end

	function SOUNDS.PlaySound(ply, id, soundname, volume, pitch, bSlide)
		local info = SOUNDS.Info[id]

		if info and info.IsPlaying and info:IsPlaying() then
			info:Stop()

			SOUNDS.Info[id] = nil
		end

		SOUNDS.Info[id] = {}

		if settings.MusicSounds[id] then

			volume = volume * (settings.GetSetting('music_volume') / 100)

		end

		if !IsValid(ply) then return end

		local csound = CreateSound(ply, soundname)
		if bSlide then
			csound:PlayEx(0, pitch)
			csound:ChangeVolume(volume / 100, 3)
		else
			csound:PlayEx(volume / 100, pitch)
		end

		SOUNDS.Info[id] = csound
	end

	function SOUNDS.ChangeVolume(id, newvolume)
		if !SOUNDS.IsPlaying(id) then
			return
		end

		SOUNDS.Info[id]:ChangeVolume(newvolume)
	end

	function SOUNDS.IsPlaying(id)
		local info = SOUNDS.Info[id]

		if !info then
			return false
		end

		if !info.IsPlaying then
			return false
		end

		return info:IsPlaying()
	end

	function SOUNDS.StopSound(id, bSlide)
		local info = SOUNDS.Info[id]

		if !info then
			return
		end

		if info:IsPlaying() then
			local delta = 1
			if bSlide then
				delta = 3
			end
			info:ChangeVolume(0, delta)

			timer.Simple(delta + 1, function()
				info:Stop()
			end)
		end
	end

	function SOUNDS.CutSound(id)
		local info = SOUNDS.Info[id]

		if !info then
			return
		end

		if info:IsPlaying() then
			info:Stop()
		end
	end

	net.Receive('playSound', function()
		local ply = LocalPlayer()
		local soundname = net.ReadString()
		local id = net.ReadString()
		local volume = net.ReadUInt(10)
		local pitch = net.ReadUInt(10)

		SOUNDS.PlaySound(ply, id, soundname, volume, pitch)
	end)

	net.Receive('stopSound', function()
		local id = net.ReadString()
		local bSlide = net.ReadBool()

		SOUNDS.StopSound(id, bSlide)
	end)

	-- hook.Add("OnSettingChanged", "ChangeActiveMusicVolume", function(setting, value)
	-- 	if setting != "music_volume" then
	-- 		return
	-- 	end

	-- 	for k, v in pairs(settings.MusicSounds) do
	-- 		SOUNDS.ChangeVolume(k, SOUNDS.MaxMusicVolume * (value / 100))
	-- 	end
	-- end)

else

	util.AddNetworkString('playSound')
	function SOUNDS.PlaySound(soundname, id, ply, volume, pitch)
		if !isstring(soundname) then return end
		id = tostring(id) or 'music'
		if !istable(ply) then
			ply = player.GetAll()
		end
		volume = tonumber(volume) or 100
		pitch = tonumber(pitch) or 100

		net.Start('playSound')
			net.WriteString(soundname)
			net.WriteString(id)
			net.WriteUInt(volume, 10)
			net.WriteUInt(pitch, 10)
		net.Send(ply)
	end

	util.AddNetworkString('stopSound')
	function SOUNDS.StopSound(id, bSlide, ply)
		if !istable(ply) then
			ply = player.GetAll()
		end

		net.Start('stopSound')
			net.WriteString(id)
			net.WriteBool(bSlide)
		net.Send(ply)
	end

	function SOUNDS.PlayTeam(teamID, trackid, volume, players)
		local factionData = faction.Get(faction.GetID(teamID))
		if !factionData then return end
		if !factionData.Music then return end
		if !factionData.Music[trackid] then return end
		SOUNDS.PlaySound(factionData.Music[trackid], trackid, players or team.GetPlayers(teamID), volume or 100)
	end

	hook.Add("OnGameState", "PlaySoundtrack", function(oldGS, newGS)
		if newGS == GS_ROUND_END then
			SOUNDS.StopSound("winning", true)
			SOUNDS.PlayTeam(gamestate.GetWinner(), "victory", 60, player.GetAll())
		end
	end)

end