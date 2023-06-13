AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end

	--self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self:SetUseType(SIMPLE_USE)

	timer.Simple(60, function()
		SafeRemoveEntity(self)
	end)


	self:PhysicsDisable()

	self:SetHealth(300)

	self:SetOwner(self.owner)

	self.GroundChecks = 0
	self.SuppliedPlayers = {}
	self.GainedRewardFor = {}

end

local velocityToStop = 50
function ENT:PhysicsDisable()
	timer.Create(self:GetCreationID()..'_physicsDisable', 2, 1, function()
		if !IsValid(self) then
			return
		end
		self.GroundChecks = self.GroundChecks + 1
		if self.GroundChecks >= 3 then
			return
		end
		if self:GetVelocity():Length() > velocityToStop then
			timer.Create(self:GetCreationID()..'_physicsDisable', 2, 1, function()
				self:PhysicsDisable()
			end)
			return
		end

		self:SetMoveType(MOVETYPE_NONE)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	end)
end

function ENT:RewardOwner(ply)
	local owner = self:GetOwner()
	if !IsValid(owner) then
		return
	end

	if owner == ply then
		return
	end

	if owner:Team() != ply:Team() then
		return
	end

	if self.SupplyType == "ammo" then
		owner:AddXP('support_resupply_ammo')
	elseif self.SupplyType == "health" then
		owner:AddXP('support_resupply_heal')
	end
end

function ENT:Think()
	if !self.team then
		return
	end

	if self:GetVelocity():Length() > velocityToStop then
		return
	end

	local owner = self:GetOwner()

	if !IsValid(owner) then
		return
	end

	if owner:GetPos():DistToSqr(self:GetPos()) > 62500 then
		return
	end

	for k, v in pairs(player.GetAll()) do
		if v:IsAlive() and v:GetPos():DistToSqr(self:GetPos()) < 10000 then
			if !self.SuppliedPlayers[v] then
				self.SuppliedPlayers[v] = 0
			end

			if self.SupplyType == "ammo" then
				for k, wep in pairs(v:GetWeapons()) do
					if !IsValid(wep) then
						continue
					end

					local wepClass = wep:GetClass()
					if wepClass:find('melee') or wepClass:find('grenade') or wepClass:find('bomb') or wepClass:find('rpg') or wepClass:find('special') then
						continue
					end

					if wepClass:find("melee") then
						continue
					end

					if self.SuppliedPlayers[v] == true then
						continue
					end

					local primaryAmmo, wepMag = wep:GetPrimaryAmmoType(), (wep.Primary.ClipSize or 0)
					if primaryAmmo == -1 then
						continue
					end

					if math.ceil(v:GetAmmoCount(primaryAmmo) / wepMag) >= CFG.MaxMags then
						continue
					end

					if (v.NextAmmoPickup or 0) - CurTime() >= 0 then
						continue
					end

					v.NextAmmoPickup = CurTime() + 5

					self:RewardOwner(v)
					self:EmitSound("items/ammo_pickup.wav", 80)
					self.SuppliedPlayers[v] = true
					v:GiveAmmo(math.min(wepMag * 3, 100), primaryAmmo, true)
				end
			elseif self.SupplyType == "health" then
				local maxHealth = v:GetMaxHealth()
				if v:Health() == maxHealth then
					continue
				end

				if self.SuppliedPlayers[v] >= maxHealth then
					continue
				end

				if (v.NextHealthPickup or 0) >= CurTime() then
					continue
				end

				v.NextHealthPickup = CurTime() + 0.5

				self:RewardOwner(v)
				self.SuppliedPlayers[v] = self.SuppliedPlayers[v] + 5
				v:SetHealth(math.min(v:Health() + 5, maxHealth))
			end
		end
	end
end

function ENT:PhysicsCollide(colData, collider)
	if IsValid(colData.HitEntity) and colData.HitEntity:IsPlayer() and (colData.HitEntity:Team() != self.team or colData.HitEntity == self.owner) and colData.Speed > 200 then
		self:EmitSound( Sound( "physics/wood/wood_box_impact_hard" .. math.random(1, 6) .. ".wav" ), 80 )
		local d = DamageInfo()
		d:SetDamage( colData.HitEntity:Health() )
		d:SetAttacker( self )
		d:SetDamageType( DMG_CLUB ) 

		colData.HitEntity:TakeDamageInfo( d )
	end

	if ( colData.Speed > 50 ) then
		self:EmitSound( Sound( "physics/wood/wood_box_impact_soft" .. math.random(1, 3) .. ".wav" ), 80 )
	end
end

function ENT:OnTakeDamage(cdmg)
	self:SetHealth(self:Health() - cdmg:GetDamage())
	if self:Health() <= 0 then
		self:Remove()
	end
end

function ENT:Use(act, call)
	if !IsValid(call) then
		return
	end

	if !call:IsPlayer() then
		return
	end

	if call:GetPos():Distance(self:GetPos()) > 100 then
		return
	end
end