
util.AddNetworkString('killfeed_add')

-- set 0 if you don't want to advertise donations
DONATION_ADVERT_FREQUENCY = 0

function GM:ScalePlayerDamage(ply, hitgroup, dmg)
	local multiply = 0.6

	if CVAR_ARCADE then
		if hitgroup == HITGROUP_HEAD then
			multiply = 1
		elseif hitgroup == HITGROUP_CHEST then
			multiply = 0.6
			ply:SlowDown()
		elseif hitgroup == HITGROUP_SPINE then
			multiply = 0.6
			ply:SlowDown()
		elseif hitgroup == HITGROUP_DICK then
			multiply = 1
		elseif hitgroup == HITGROUP_HEART then
			multiply = 1
		elseif hitgroup == HITGROUP_STOMACH then
			multiply = 0.5
		elseif hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM then
			multiply = 0.5
		end
	else
		if hitgroup == HITGROUP_HEAD then
			multiply = 10
		elseif hitgroup == HITGROUP_CHEST then
			multiply = 1.15
			ply:SlowDown()
		elseif hitgroup == HITGROUP_SPINE then
			multiply = 1.3
			ply:SlowDown()
		elseif hitgroup == HITGROUP_DICK then
			multiply = 10
		elseif hitgroup == HITGROUP_HEART then
			multiply = 10
		elseif hitgroup == HITGROUP_STOMACH then
			multiply = 0.9
			ply:SlowDown()
		elseif hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM then
			multiply = 0.9
			ply:SlowDown()
		elseif hitgroup == HITGROUP_RIGHTLEG or hitgroup == HITGROUP_LEFTLEG then
			ply:SlowDown()
		end
	end

	local attacker = dmg:GetAttacker()
	if IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == ply:Team() and !CVAR_NOTEAMS then
		multiply = 0.4
	end

	ply:UpdateLastWeapon()

	dmg:ScaleDamage(multiply)
end

function GM:EntityTakeDamage(ent, dmg)
	if ent:IsPlayer() then
		local ply = ent

		if ply:HasGodMode() then
			return
		end

		timer.Simple(0.1, function()
			if !IsValid(ply) then
				return
			end
			if !ply:IsAlive() then
				return
			end
			ply:Voice('damage', 70)
		end)

		if dmg:IsDamageType(DMG_BLAST) and ply:GetTrait() != TRAIT_BLASTPROTECTION then
			dmg:ScaleDamage(4)

			local time = math.min(dmg:GetDamage() / 10, 30)
			ply:SetNetInt('Confusion', CurTime() + time)
		end
		return
	end

	local damage = dmg:GetDamage() / 50
	if dmg:IsDamageType(DMG_BLAST) then
		damage = dmg:GetDamage() * 2
	elseif dmg:IsDamageType(DMG_CLUB) then
		damage = dmg:GetDamage()
	end

	if ent.isFortification and ent:GetCollisionGroup() == COLLISION_GROUP_NONE then
		ent:SetHealth(ent:Health() - damage)

		if ent:Health() <= 0 then
			ent:Remove()
		end
	end
end

function GM:OnInitTickets()
	gm.Call("OnInitTickets")
end

function GM:PlayerDeployed(...)
	gm.Call("PlayerDeployed", ...)
end

function GM:GetFallDamage( ply, speed )
	local dmg = (speed / 8)
	if ply:GetTrait() == TRAIT_DEPLOY then
		dmg = dmg * 0.25
	end
	return dmg
end

function GM:PlayerDeathSound()
	return true
end

function GM:CanPlayerSuicide()
	return false
end

function GM:PlayerSpray(ply)
	return not ply:IsSuperAdmin()
end

function GM:PlayerSwitchWeapon(ply, oldWeapon, newWeapon)
	if !IsValid(newWeapon) then
		return
	end
	ply:UpdateLastWeapon(newWeapon:GetClass())
end

function GM:DoPlayerDeath(ply, attacker, dmginfo)
	ply:SpawnRagdoll(attacker, dmginfo)
	ply:CloseUI('deploy_menu')

	ply.CameraReady = false
	ply:SetColor(Color(255, 255, 255, 0))

	if ply.onDeath then
		ply:onDeath()
	end

	local inflictor = ""
	local distance = 0
	local attackerName;
	local originalAttacker;

	local hitgroup = ply:LastHitGroup()

	if attacker:IsVehicle() then
		originalAttacker = attacker
		attacker = attacker:GetDriver()
		inflictor = originalAttacker:GetClass()
	end

	gm.Call("PlayerDeath", ply, attacker, dmginfo)

	local isThrowable = IsValid(dmginfo:GetInflictor()) and (dmginfo:GetInflictor():GetClass():find('nade') or dmginfo:GetInflictor():GetClass():find('bomb'))
	local isValidElimination;

	if IsValid(attacker) and attacker:IsPlayer() and attacker != ply then
		if attacker:GetTrait() == TRAIT_SUPPLYCRATE then
			for k, v in pairs(team.GetPlayers(attacker:Team())) do
				if v:GetPos():DistToSqr(attacker:GetPos()) <= 62500 then
					v:SetArmor(math.min(v:Armor() + 15, CFG.MaxPlayerArmor))
				end
			end
		end

		attackerName = attacker:Name()
		distance = ply:GetPos():Distance(attacker:GetPos())
		if ply:Team() != attacker:Team() and (!attacker.oldTeam or attacker.oldTeam != ply:Team()) or CVAR_NOTEAMS then
			isValidElimination = true
			hook.Run("EnemyKilled", attacker, ply, dmginfo)
			attacker:AddStatValue('PlayerKills')
			attacker:AddXP('kill')
			if ply:LastHitGroup() == HITGROUP_HEAD then
				attacker:AddXP('headshot_kill')
			end

			if distance > 2500 then
				attacker:AddXP('long_kill')
			end

			if !isThrowable then
				attacker.MaxLongshot = math.max(attacker.MaxLongshot or 0, math.floor(distance / 51))
			end
		end

		ply.lastKiller = attacker

		if hitgroup == HITGROUP_HEAD then
			attacker.i_Headshots = (attacker.i_Headshots or 0) + 1

			attacker.i_HeadshotStreak = (attacker.i_HeadshotStreak or 0) + 1
			timer.Create("DestroyHeadshotStreak"..attacker:SteamID64(), 10, 1, function()
				if IsValid(attacker) then
					attacker.i_HeadshotStreak = 0
				end
			end)
		end

		attacker.i_KillStreak = (attacker.i_KillStreak or 0) + 1
		timer.Create("DestroyKillStreak"..attacker:SteamID64(), 10, 1, function()
			if IsValid(attacker) then
				attacker.i_KillStreak = 0
			end
		end)

		attacker.i_FastStreak = (attacker.i_FastStreak or 0) + 1
		timer.Create("DestroyFastStreak"..attacker:SteamID64(), 1, 1, function()
			if IsValid(attacker) then
				attacker.i_FastStreak = 0
			end
		end)


		if IsValid(attacker:GetActiveWeapon()) and inflictor == "" then
			inflictor = attacker:GetActiveWeapon():GetClass()
			if inflictor:find('melee') then
				attacker:AddXP('melee_kill')
			end
		end
	else
		attackerName = ply:Name()
	end

	if IsValid(attacker) and !attacker:IsPlayer() then
		local owner = attacker:GetOwner()
		if IsValid(owner) and owner:IsPlayer() then
			inflictor = attacker:GetClass()
			attackerName = owner:Name()
			attacker = owner
		end
	end

	if isThrowable then
		inflictor = dmginfo:GetInflictor():GetClass()
	end

	if IsValid(attacker) and attacker:IsPlayer() and IsValid(attacker:GetSimfphys()) then
		inflictor = attacker:GetSimfphys():GetClass()
	end

	hook.Run("InflictorKillMade", attacker, ply, inflictor)

	if IsValid(attacker) and attacker:IsPlayer() and inflictor != "" then
		attacker:AddTableValue('weapons', inflictor)
	end

	local damageType = ''
	if dmginfo:IsDamageType(DMG_BLAST) then
		damageType = DAMAGE_EXPLOSION
	elseif dmginfo:IsDamageType(DMG_BURN) then
		damageType = DAMAGE_FIRE
	elseif dmginfo:IsDamageType(DMG_CLUB) then
		damageType = DAMAGE_BASH
	elseif dmginfo:IsDamageType(DMG_SLASH) then
		damageType = DAMAGE_BAYONET
	elseif dmginfo:IsFallDamage() then
		damageType = DAMAGE_FALL
	end

	net.Start('killfeed_add')
		net.WriteString(ply:Name())
		net.WriteColor(team.GetColor(ply:Team()))
		net.WriteString(inflictor)
		net.WriteString(attackerName)
		net.WriteUInt(math.floor(distance / 51), 32)
		net.WriteUInt(hitgroup, 4)
		net.WriteString(damageType)
	net.Broadcast()

	ply:SetNetBool('b_NotDeployed', true)
	ply:SetNetBool('DeathScreen', true)

	timer.Simple(5, function()
		if IsValid(ply) and !ply:Alive() then
			ply.AllowLeaveFromDeathscreen = true
		end
	end)

	timer.Simple(12, function()
		if IsValid(ply) and ply.AllowLeaveFromDeathscreen then
			local rag = ply:getRagdoll()
			if IsValid(rag) then rag:SetNetBool("Revivable", false) end
		end
	end)

	if ply:IsProne() then
		prone.Exit(ply)
	end
end

function GM:PlayerDeathThink(ply)
	if ply.AllowLeaveFromDeathscreen == true or ply.freeLeave then
		if ply:KeyPressed(IN_ATTACK) || ply:KeyPressed(IN_ATTACK2) || ply:KeyPressed(IN_JUMP) then
			ply.AllowLeaveFromDeathscreen = false
			ply.freeLeave = false
			ply:SetNetBool('DeathScreen', false)
			ply:AddStatValue('PlayerDeaths')
			teams.SetSpectator(ply)
			local rag = ply:getRagdoll()
			if IsValid(rag) then
				rag:SetNetBool("Revivable", false)
			end
			return true
		end
	end
	return false
end

function GM:PlayerInitialSpawn(ply)
	ply:SetRenderMode(RENDERMODE_TRANSCOLOR)

	ply.TicketsTaken = {}

	if !ply:GetPerm('voicePitch') then
		ply:SetPerm('voicePitch', math.random(CFG.VoicePitch.min, CFG.VoicePitch.max))
	end

	if CVAR_TRIGGER_POS then
		ply:SetPos(CVAR_TRIGGER_POS)
	end

	if !ply:GetPerm('heads') then
		local data = {}
		for k, v in pairs(faction.stored) do
			data[k] = math.random(0, 23)
		end
		ply:SetPerm('heads', data)
	end

	ply:NetworkPlayersClassInfo()

	if ply:GetPerm("ulx_gagged") then
		ply:SetNWBool("ulx_gagged", true)
	end

	if ply:GetPerm("ulx_muted") then
		ply:SetNWBool("ulx_muted", true)
	end

	ply:FormatAccessableWeapons()

	ShowMessage("· ", Color(0, 204, 102), ply:Name(), Color(255, 255, 255), " connected to the server")
end


function GM:PlayerDisconnected(ply)
	ShowMessage("· ", Color(204, 0, 0), ply:Name(), Color(255, 255, 255), " disconnected from the server")

	local rag = ply:getRagdoll()

	if IsValid(rag) then
		rag:Remove()
	end

	if ply:Team() != TEAM_SPECTATOR then
		notify.Custom(team.GetPlayers(TEAM_SPECTATOR) or {}, "slot_appeared", faction.Team(ply:Team()).Name)
	end

	if vote.IsPlayerOnVote(ply) then
		AC.KickPlayer(ply, "Disconnected during votekick")
	end
end

function GM:PlayerDeathSound()
	return true
end

function GM:PlayerSwitchFlashlight(ply, enabled)
	return !enabled
end

function GM:GrabEarAnimation(ply)

end

function GM:PlayerButtonDown( ply, btn ) 
	numpad.Activate( ply, btn )
end

function GM:PlayerButtonUp( ply, btn ) 
	numpad.Deactivate( ply, btn )
end

function GM:PlayerSetHandsModel( ply, ent )
	if !ply:GetBody() or !ply:IsAlive() then
		local simplemodel = player_manager.TranslateToPlayerModelName(ply:GetModel())
		local info = player_manager.TranslatePlayerHands(simplemodel)
		if info then
			ent:SetModel(info.model)
			ent:SetSkin(info.skin)
			ent:SetBodyGroups(info.body)
		end
		return
	end
	
	local modelpath = string.Split(ply:GetBody(), '/')
	local bodyname = modelpath[#modelpath]:StripExtension()
	if bodyname:find("body") then
		local spl = string.Split(bodyname, "_")
		table.remove(spl, 1)
		bodyname = table.concat(spl, "_")
	end
	local handsmodel = "hands_" .. bodyname
	modelpath[#modelpath] = "arms"
	modelpath[#modelpath + 1] = handsmodel
	local modelname = table.concat(modelpath, "/") .. ".mdl"
	local classHands = ply:GetClassInfo("Hands")
	if classHands then
		modelname = classHands
	end

	ent:SetModel(modelname)
	local bodyEnt = ply:getBonemergeEntity("body")
	ent:SetSkin(bodyEnt:GetSkin())
	local bgArms, bgBody = bodyEnt:GetBodygroup(bodyEnt:GetBodygroupByName("arms")), bodyEnt:GetBodygroup(bodyEnt:GetBodygroupByName("body"))
	if bodyEnt:GetBodygroupByName("body") == -1 then
		ent:SetBodygroup(1, bgArms)
	else
		ent:SetBodygroup(0, bgBody)
		ent:SetBodygroup(1, bgArms)
	end
end

function GM:PlayerCanSeePlayersChat(text, teamOnly, listener, speaker)
	if speaker:IsAlive() != listener:IsAlive() then
		return false
	end

	if teamOnly and speaker:Team() != listener:Team() then
		return false
	end

	return true
end

hook.Add("PlayerButtonDown", "StartReviving", function(ply, button)
	if button != ply:GetInfoNum("ww2_bind_revive", -1) then
		return
	end

	if !ply:GetClass():find("medic") then
		return
	end

	if (ply.NextRevive or 0) >= CurTime() then
		return
	end

	local ent = ply:GetEyeTrace().Entity

	if !IsValid(ent) then
		return
	end

	if ent:GetPos():Distance(ply:GetPos()) > 100 then
		return
	end

	if !ent.Info then
		return
	end

	ply.NextRevive = CurTime() + 1

	local target = ent.Info.Self

	if ply:Team() != ent:GetNWInt("Team") then
		return
	end

	if !IsValid(ply) then
		notify.Add(ply, "cant_revive")
		return
	end

	if !ent:GetNWBool("Revivable") then
		notify.Add(ply, "cant_revive")
		return
	end

	timer.Create("Reviving_"..ply:SteamID64(), 2, 1, function()
		if !IsValid(ply) then return end
		if !IsValid(target) then return end
		if !ply:Alive() then return end
		if !ent:GetNWBool("Revivable") then return end
		if ply:Team() != ent:GetNWInt("Team") then return end
		if ent:GetPos():Distance(ply:GetPos()) > 100 then return end
		target:Revive(ply)
		ply:AddXP("support_revive")
	end)
end)


hook.Add("PlayerButtonDown", "WeaponChangeFiremode", function(ply, button)
	if button != ply:GetInfoNum("ww2_bind_firemode", -1) then
		return
	end

	local wep = ply:GetActiveWeapon()

	if !IsValid(wep) then

		return

	end

	if !wep.ArcCW then

		return

	end

	if (ply.NextFiremode or 0) >= CurTime() then

		return

	end

	ply.NextFiremode = CurTime() + 0.75

	wep:ChangeFiremode(true)
end)

hook.Add("PlayerGainedXP", "AddSupportXP", function(ply, reward, amount)
	if !reward:find('support') then
		return
	end

	ply.SupportRewards = (ply.SupportRewards or 0) + amount
end)

hook.Add("PlayerGainedXP", "AddCaptureStat", function(ply, reward, amount)
	if reward != "point_capture" then return end

	ply:AddStatValue("ObjectivesCaped")
end)

hook.Add("EnemyKilled", "AddDriverReward", function(attacker, victim, inflictor)
	if !IsValid(attacker:GetSimfphys()) then
		return
	end

	local driver = attacker:GetVehicle():GetDriver()
	if IsValid(driver) and driver != attacker then
		driver:AddXP("kill")
	end
end)

hook.Add("PlayerSpawn", "ResetPlayerModel", function(ply)
	ply:ApplyHead()
end)

hook.Add("PlayerButtonUp", "StopReviving", function(ply, button)
	if button != ply:GetInfoNum("ww2_bind_revive", -1) then
		return
	end

	timer.Remove("Reviving_"..ply:SteamID64())
end)

hook.Add("PlayerShouldTaunt", "RemoveFuckingTaunts", function()
	return false
end)

hook.Add('PostGamemodeLoaded', 'RemoveWidgets', function()
	hook.Remove( "PlayerTick", "TickWidgets" )
end)

hook.Add('PlayerSpawnProp', 'WW2_SandboxDisable', function( ply, model )
	return ply:IsSuperAdmin()
end)

hook.Add('PlayerSpawnRagdoll', 'WW2_SandboxDisable', function( ply, model )
	return ply:IsSuperAdmin()
end)

hook.Add( "AllowPlayerPickup", "AllowAdminsPickUp", function( ply, ent )
    return ply:IsAlive()
end )

hook.Add('PlayerSpawnNPC', 'WW2_SandboxDisable', function( ply )
	return ply:IsSuperAdmin()
end)

hook.Add( "PlayerGiveSWEP", "BlockPlayerSWEPs", function( ply, class, swep )
	return ply:IsSuperAdmin()
end )

hook.Add( "PlayerSpawnSENT", "BlockPlayerSENTs", function( ply, class, swep )
	return ply:IsSuperAdmin()
end )

hook.Add( "PlayerSpawnVehicle", "BlockPlayerVehicles", function( ply, class, swep )
	return ply:IsSuperAdmin()
end )

hook.Add( "PlayerSpawnEffect", "BlockPlayerEffects", function( ply, class, swep )
	return ply:IsSuperAdmin()
end )

hook.Add("Initialize", "AdvertDonations", function()
	if DONATION_ADVERT_FREQUENCY == 0 then return end
	timer.Create("AdvertDonates", DONATION_ADVERT_FREQUENCY, 0, function()
		ShowMessage(Color(255, 255, 0), "Хотите поддержать сервер? Нажмите F4 или введите в чат /donate")
	end)
end)

hook.Add("InitPostEntity", "CheckTableCorruption", function()
	for k, v in pairs(ents.GetAll()) do
		if isnumber(v) then
			maploader.SetLoadMap(maploader.GetLoadedMap())
			return
		end
	end
end)

hook.Add("PostCleanupMap", "RemoveProps", function()
	for k, v in pairs(ents.GetAll()) do
		if v:GetClass():find("prop_physics") then
			v:Remove()
		end
	end
end)