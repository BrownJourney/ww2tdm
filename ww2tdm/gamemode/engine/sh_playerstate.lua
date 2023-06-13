STATE_ACTIVE = 0
STATE_WELCOME = 1
STATE_DEATH = 2
STATE_OBSERVER = 3

local GM = GM and GM or GAMEMODE

local PLAYER = FindMetaTable("Player")

function PLAYER:GetPlayerState()
	return self:GetNWInt("pState")
end

function PLAYER:IsPremium()
	return self:GetUserGroup() == "premium" or self:IsAdmin()
end

function PLAYER:GetFaction()
	return faction.Team(self:Team())
end

function PLAYER:GetTrait()
	if SERVER then
		return self.ClassTrait or self:GetNWString("ClassTrait")
	else
		return self:GetNWString("ClassTrait")
	end
end

function PLAYER:GetDeathStatus()
	return self:GetNWBool('b_Dead', true)
end

function PLAYER:GetFreezed()
	return self:GetNWBool("bFreezed", false)
end

function PLAYER:IsAlive()
	if self:Team() == TEAM_SPECTATOR then
		return false
	end

	return self:Alive() and !self:GetDeathStatus()
end

-- ЗАТЫЧКА
-- function PLAYER:GetSimfphys()
-- 	return NULL
-- end

PLAYER._SetWalkSpeed = PLAYER._SetWalkSpeed or PLAYER.SetWalkSpeed
function PLAYER:SetWalkSpeed(speed)
	self:_SetWalkSpeed(speed)
	self:SetSlowWalkSpeed(speed)
end

if SERVER then
	util.AddNetworkString("NWClassInfo")
	function PLAYER:NetworkPlayersClassInfo()
		local players = player.GetAll()
		net.Start("NWClassInfo")
			net.WriteUInt(#players, 7)
			for i = 1, #players do
				net.WriteUInt(players[i]:UserID(), 32)
				net.WriteString(players[i]:GetClass())
			end
		net.Send(self)
	end

	function PLAYER:GiveWeapon(class, attachments, shouldGiveAmmo)
		self:Give(class)
		local wep = self:GetWeapon(class)
		timer.Simple(0.1, function()
			if !IsValid(wep) or !IsValid(self) then
				return
			end

			for _, v in pairs(attachments or {}) do
				for i = 1, 10 do
					wep:Attach(i, v, true)
				end
			end
		end)

		if !class:find("grenade") and !class:find("bomb") and wep.Primary and shouldGiveAmmo then
			local magsAmount = math.ceil(CFG.MaxMags / 2)
			if self:GetTrait() == TRAIT_AMMO then
				magsAmount = math.ceil(magsAmount * 1.5)
			end
			if class:find("rpg") then
				magsAmount = 1
			end

			self:GiveAmmo(wep.Primary.ClipSize * magsAmount, wep:GetPrimaryAmmoType(), true)
		end

		return wep
	end

	function PLAYER:SetTrait(trait)
		self.ClassTrait = trait
		self:SetNetString("ClassTrait", trait)
	end

	function PLAYER:GetInternalTrait()
		local faction = self:GetFaction()
		if !faction then return end
		local classid = self:GetClass()
		local class = faction:Class(classid)
		if !class then return end

		if self:GetClassLevel() >= CFG.ClassTraitLevel then
			return class:GetTrait()
		end
	end

	function PLAYER:ApplyHead()
		timer.Simple(0, function()
			if !IsValid(self) then return end
			local factionData = self:GetFaction()
			if !factionData then return end
			
			self:SetModel(faction.GetHead(factionData.Name))

			local headSkin = self:GetStoredHead()
			if headSkin then
				self:SetSkin(headSkin)
			end
		end)
	end

	function PLAYER:RespawnClass(soft)
		local faction = self:GetFaction()

		if !faction then return end

		local class = faction:Class(self:GetClass(), self:GetLoadout())

		if !self.initClassSpawn then
			class:OnInitialSpawn(self)
		end

		self:ApplyHead()

		if soft then
			if self.wasClass then
				class = faction:Class(self.wasClass, self:GetLoadout())
			end
		else
			self:RemoveAllAmmo()
		end

		if gamestate.Get() == GS_ROUND_PREPARE then
			self:SetFreezed(true)
		end

		local loadoutInfo = self.LoadoutInfo
		if loadoutInfo and CVAR_CUSTOM_LOADOUT then
			if class then
				class:OnRespawn(self, soft)
			end

			if loadoutInfo.primary or loadoutInfo.secondary then
				self:StripWeapons()
			end

			if loadoutInfo.traits then
				self:SetTrait(loadoutInfo.traits)
			end

			if loadoutInfo.primary then
				if loadoutInfo.primary:find("smg") then
					self:SetRunSpeed(self:GetRunSpeed() * 1.3)
				elseif loadoutInfo.primary:find("mg") then
					self:SetRunSpeed(self:GetRunSpeed() * 0.75)
				end
				self:GiveWeapon(loadoutInfo.primary, nil, true)
			else
				self:SetRunSpeed(self:GetRunSpeed() * 1.5)
			end

			self:GiveWeapon(loadoutInfo.secondary or "", nil, true)
		else
			self:StripWeapons()

			self:SetTrait(self:GetInternalTrait() or '')

			if class then
				class:OnRespawn(self, soft)
			end

			if CVAR_GAMEMODE_KITS and self.SelectedKit then
				local data = self.SelectedKit[faction:GetID()] and self.SelectedKit[faction:GetID()] or self.SelectedKit
				if istable(data) then
					for k, v in pairs(data) do
						if istable(v) then
							self:GiveWeapon(v.wep, v.atts, true)
						else
							self:GiveWeapon(v, nil, true)
						end
					end
				else
					if istable(data) then
						self:GiveWeapon(data.wep, data.atts, true)
					else
						self:GiveWeapon(data, nil, true)
					end
				end
			end
		end

		self.SpawnRunSpeed = self:GetRunSpeed()
	end
	
	util.AddNetworkString("SendAccessableWeapons")	
	function PLAYER:FormatAccessableWeapons()
		local data = {}

		for fac, v in pairs(self:GetPerm("classBought") or {}) do
			local facData = faction.Get(fac)
			if !facData then continue end
			facData = facData.Classes
			for class, loadouts in pairs(v) do
				if !facData[class] then continue end
				for _, wep in pairs(facData[class].Weapons or {}) do
					if istable(wep) then
						wep = wep.weapon
					end
					data[wep] = true
				end

				for k, loadout in pairs(loadouts) do
					for id, variant in pairs(facData[class].Variants or {}) do
						for _, wep in pairs(variant.Weapons or {}) do
							if istable(wep) then
								wep = wep.weapon
							end
							data[wep] = true
						end
					end
				end
			end
		end

		net.Start("SendAccessableWeapons")
			net.WriteTable(data)
		net.Send(self)
	end

	function PLAYER:GetStoredHead()
		local faction = self:GetFaction()
		if !faction then return end
		local storedHeads = self:GetPerm('heads')
		if !storedHeads then return end
		return storedHeads[faction:GetName()]
	end

	function PLAYER:CollectParams()
		local data = {}
		data["pitch"] = self:GetPerm("voicePitch") or 100

		return data
	end

	util.AddNetworkString('UpdateGameInfo')
	function PLAYER:UpdateGameInfo()
		net.Start('UpdateGameInfo')
			net.WriteTable(faction.loaded)
		net.Broadcast()
	end

	function PLAYER:Voice(id, lvl, ignore, cooldown)
		if self.nextVoiceTime and self.nextVoiceTime >= CurTime() and !ignore then
			return
		end

		local faction = self:GetFaction()
		if !faction then return end

		if !self:IsAlive() then
			return
		end

		local voice = faction:GetVoice(id)

		if self.lastVoice then
			self:StopSound(self.lastVoice)
		end

		if id == "taunt" and self:GetTrait() == TRAIT_DEPLOY then
			self:SetHealth(math.min(self:Health() + 10, self:GetMaxHealth()))
		end
	
		if voice then
			-- print(voice)
			self:EmitSound(voice, lvl and lvl or 65, self:GetPerm("voicePitch") or 100, 1, CHAN_VOICE)
		end

		self.lastVoice = id
		self.nextVoiceTime = CurTime() + (isnumber(cooldown) and cooldown or 2)
	end

	function PLAYER:SetDeathStatus(status)
		self:SetNetBool('b_Dead', status)
	end

	function PLAYER:SetFreezed(bFreeze)
		if bFreeze then
			self:SetWalkSpeed(1)
			self:SetRunSpeed(1)
			self:SetJumpPower(1)
		else
			local faction = self:GetFaction()
			if !faction then
				return
			end
			
			local class = faction:Class(self:GetClass())
			local run = class and class.RunSpeed or 200

			self:SetWalkSpeed(CFG.WalkSpeed)
			self:SetRunSpeed(run)
			self:SetJumpPower(CFG.JumpPower)
		end

		self:SetNetBool("bFreezed", bFreeze)
	end

	function PLAYER:Revive(by)
		if self:Alive() then
			return
		end

		local rag = self:getRagdoll()

		if !IsValid(rag) then
			return
		end

		if !rag:GetNWBool("Revivable") then
			return
		end

		self:Spawn()
		self:SetPos(rag:GetPos())
		self:ConCommand("+duck")
		self:SetHealth(25)
		self:StripWeapons()
		self:RespawnClass(true)
		self:InitStats()
		self.Revived = true
		self:ScreenFade(SCREENFADE.IN, color_white, 1, 0.1)
		self:SetColor(Color(255, 255, 255, 255))

		if IsValid(self.equipmentEnt) then
			self.equipmentEnt:Remove()
		end

		if IsValid(by) then
			notify.Custom(self, "revived_by", by:Name())
		end

		hook.Run("PlayerRevived", self, by)

		rag:Remove()

		timer.Simple(1, function()
			if !IsValid(self) then return end
			self:ConCommand("-duck")
		end)
	end

	function PLAYER:SpawnRagdoll(attacker, dmgtype)
		if self:Team() == TEAM_SPECTATOR or self:GetDeathStatus() then return end
		if not IsValid(self) then return end

		if (self.nextRagdoll or 0) >= CurTime() then
			return
		end

		timer.Simple(0, function()
			game.RemoveRagdolls()
		end)

		local rag = ents.Create("prop_ragdoll")
		if not IsValid(rag) then return nil end

		self.nextRagdoll = CurTime() + 2

		rag:SetPos(self:GetPos())
		rag:SetModel(self:GetHead())
		rag:SetAngles(self:GetAngles())
		rag:SetColor(self:GetColor())
		rag:SetNetBool("Revivable", !self.Revived)
		rag:SetNetInt("Team", self:Team())

		local faction = self:GetFaction()
		local chance = math.random(1, 100)
		local voice = faction:GetVoice("death")
		if chance < 3 then
			voice = faction:GetVoice("long_death")
		end

		local hitgroup = self:LastHitGroup()
		rag.Hitgroup = hitgroup
		if hitgroup == HITGROUP_DICK then
			voice = faction:GetVoice("death_balls")
		elseif hitgroup == HITGROUP_HEART then
			voice = faction:GetVoice("death_heart")
		elseif hitgroup == HITGROUP_SPINE then
			voice = faction:GetVoice("death_spine")
		end

		if hitgroup == HITGROUP_HEAD then -- brainded lol
			local helmet = self:getBonemergeEntity('helmet')
			if IsValid(helmet) and (math.random(1, 100) < CFG.HelmetDropChance or dmgtype:GetDamage() > 100000) then
				hook.Run("HeadshotCritical", attacker, self, dmgtype)
				rag:EmitSound("physics/flesh/flesh_impact_hard1.wav")
				rag:SetModel("models/ww2/head_gore.mdl")
				local mdl = helmet:GetModel()
				local effect_prop = ents.Create('prop_ragdoll')
				effect_prop:SetPos(helmet:GetPos())
				effect_prop:SetAngles(helmet:GetAngles())
				effect_prop:SetSkin(helmet:GetSkin())
				for k, v in pairs(helmet:GetBodyGroups()) do
					effect_prop:SetBodygroup(v.id, helmet:GetBodygroup(v.id))
				end
				effect_prop:SetModel(mdl)
				effect_prop:SetAbsVelocity(Vector(math.random(-20, 20), math.random(-20, 20), math.random(10, 100)))
				effect_prop:Spawn()
				local eData = EffectData()
				local bottom, top = self:GetHull()
				local origin = helmet:GetPos() + Vector(0, 0, top.z)
				eData:SetOrigin(origin)
				util.Effect('StunstickImpact', eData)
				sound.Play('physics/metal/metal_solid_impact_bullet' .. math.random(1, 4) .. '.wav', origin, 75, {90, 110})
				helmet:Remove()
				timer.Simple(4, function()
					if IsValid(effect_prop) then
						effect_prop:Remove()
					end
				end)
			end
		else
			if voice then
				rag:EmitSound(voice, 80)
			end
		end

		rag:Spawn()
		rag:Activate()

		self:DropEquipment()
		self:DropAmmo(attacker)
		self:DropHealth(attacker)

		self:SetNetEntity( "Ragdollentity", rag )

		for k, v in pairs( self:GetBodyGroups() ) do
			rag:SetBodygroup( v.id, self:GetBodygroup(v.id) )
		end

		rag.Info = {}
		rag.Info.CorpseID = rag:GetCreationID()
		rag.Info.Self = self
		rag.Info.DamageType = dmgtype
		rag.Info.Time = CurTime()

		rag:SetNWInt( "CorpseID", rag.Info.CorpseID )

		rag:SetCollisionGroup(COLLISION_GROUP_DISSOLVING)
		timer.Simple(1, function()
			if IsValid( rag ) then
				rag:CollisionRulesChanged()
			end
		end)

		timer.Simple( 30, function() if IsValid( rag ) then rag:Remove() end end )

		hook.Run("CreateEntityRagdoll", self, rag)

		local num = rag:GetPhysicsObjectCount()-1
		local v = self:GetVelocity() * 0.35

		for i=0, num do
			local bone = rag:GetPhysicsObjectNum(i)
			if IsValid(bone) then
			local bp, ba = self:GetBonePosition(rag:TranslatePhysBoneToBone(i))
			if bp and ba then
				bone:SetPos(bp)
				bone:SetAngles(ba)
			end
			bone:SetVelocity(v * 0.2)
			end
		end
	end

	local BLOCKED_NETWORK_STATS = {
		["Shots"] = true,
		["Hits"] = true
	}

	function PLAYER:AddStatValue(stat, amount)
		if gamestate.Get() != GS_ROUND_PLAYING then return end

		local statTable = self:GetPerm('stats', {})

		amount = tonumber(amount) or 1
		statTable[stat] = (statTable[stat] or 0) + amount
		self:SetPerm('stats', statTable)

		if not BLOCKED_NETWORK_STATS[stat] then
			self:SetNetInt(stat, self:GetNWInt(stat) + amount)
		end
	end

	function PLAYER:AddTableValue(table, stat, amount)
		if gamestate.Get() != GS_ROUND_PLAYING then return end

		local statTable = self:GetPerm('stats', {})
		if !statTable[table] then
			statTable[table] = {}
		end

		amount = tonumber(amount) or 1
		statTable[table][stat] = (statTable[table][stat] or 0) + amount
		self:SetPerm('stats', statTable)
	end

	function PLAYER:DropEquipment()
		local weps = self:GetWeapons()

		if #weps == 0 then
			return
		end

		local primaryWep = weps[1]

		self:StripWeapon(primaryWep:GetClass())

		local dropEquipment = ents.Create('ww2_equipment_drop')
		dropEquipment:SetPos(self:EyePos() + self:GetAimVector() * 30)
		dropEquipment:Spawn()
		dropEquipment:ChangeEquipment(primaryWep)

		self.equipmentEnt = dropEquipment

		return dropEquipment
	end

	function PLAYER:DropAmmo(attacker)
		if !CVAR_DROP_MEDICINE and (!IsValid(attacker) or !attacker:IsPlayer() or attacker:GetTrait() != TRAIT_AMMODROP) then
			return
		end

		local drop = ents.Create('ww2_ammo_drop')
		drop:SetPos(self:GetPos() + self:GetAimVector() * 10)
		drop:Spawn()

		return dropAmmo
	end

	function PLAYER:DropHealth(attacker)
		if !CVAR_DROP_MEDICINE and (!IsValid(attacker) or !attacker:IsPlayer() or attacker:GetTrait() != TRAIT_HEALTH) then
			return
		end

		local drop = ents.Create('ww2_health_drop')
		drop:SetPos(self:GetPos() + self:GetAimVector() * 30)
		drop:Spawn()

		return drop
	end

	function PLAYER:UpdateLastWeapon(newWeapon)
		local wep = self:GetActiveWeapon()
		self.lastActiveWeapon = IsValid(wep) and wep:GetClass() or nil;

		if newWeapon then
			self.lastActiveWeapon = newWeapon
		end
	end

	util.AddNetworkString('PlayVoiceSound')
	net.Receive("PlayVoiceSound", function(len, ply)
		local id = net.ReadString()

		if (ply.NextVoiceMenu or 0) >= CurTime() then
			return
		end

		ply.NextVoiceMenu = CurTime() + 5

		if gamestate.Get() == GS_ROUND_PREPARE then
			notify.Add(ply, "game_begin")
			return
		end

		local nearbyPlayers = {}

		for k, v in pairs(team.GetPlayers(ply:Team())) do

			if v:GetPos():DistToSqr(v:GetPos()) < 250000 then

				table.insert(nearbyPlayers, v)

			end

		end

		ShowMessageTo(nearbyPlayers, Color(0, 200, 0), "(", "voice_command", ") ", team.GetColor(ply:Team()), ply:Name(), Color(255, 255, 255), ': ', id)

		ply:Voice(id, 75, true)
	end)

else
	local nextVoiceTime = 0

	net.Receive('UpdateGameInfo', function()
		faction.loaded = net.ReadTable()
	end)

	net.Receive("NWClassInfo", function()
		local playerCount = net.ReadUInt(7)

		for i = 1, playerCount do
			local ply = Player(net.ReadUInt(32))
			local class = net.ReadString()
			if !IsValid(ply) then continue end
			ply:SetNWString("selectedClass", class)
		end
	end)

	net.Receive("PlayGlobalSound", function()
		local voice = net.ReadString()
		local f = faction.Team(LocalPlayer():Team())
		local ingone = net.ReadBool()
		if nextVoiceTime and nextVoiceTime >= CurTime() and !ignore then
			return
		end

		if settings.GetSetting("announcer") == false then
			return
		end

		if !f then
			return
		end

		local s = f:GetVoice(voice)

		if s then
			surface.PlaySound(s)
		end

		nextVoiceTime = CurTime() + 3
	end)
end