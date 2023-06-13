
local function mg_fire(ply,vehicle,shootOrigin,Attachment,damage)
	vehicle:EmitSound("weapons/cultist/mg42/mg42_fp.wav", 100, 100, 1, CHAN_WEAPON)

	local bullet = {}
		bullet.Num 			= 1
		bullet.Src 			= shootOrigin
		bullet.Dir 			= Attachment.Ang:Forward()
		bullet.Spread 		= Vector(0.04,0.04,0)
		bullet.Tracer		= 1
		bullet.TracerName 	= "arccw_tracer"
		bullet.Force		= damage
		bullet.Damage		= damage
		bullet.HullSize		= 1
		bullet.DisableOverride = true
		bullet.Callback = function(att, tr, dmginfo)
			dmginfo:SetDamageType(DMG_BULLET)
			
			local effectdata = EffectData()
				effectdata:SetOrigin(  tr.HitPos + tr.HitNormal )
				effectdata:SetNormal( tr.HitNormal )
				effectdata:SetRadius( (damage > 1) and 8 or 3 )
		end
		bullet.Attacker 	= ply
		
	vehicle:FireBullets( bullet )
end

function simfphys.weapon:ValidClasses()
	
	local classes = {
		"sim_fphys_ww2_m3a1",
	}
	
	return classes
end

function simfphys.weapon:Initialize( vehicle )
	-- local ID = vehicle:LookupAttachment( "gun_ref" )
	-- local attachmentdata = vehicle:GetAttachment( ID )

	simfphys.RegisterCrosshair( vehicle.pSeat[1] , { Attachment = "muzzle_mg", Type = 5 } )
	-- simfphys.RegisterCamera( vehicle.pSeat[1], Vector(0,0,0), Vector(0,0,0), true, "cam2" )
	
	-- simfphys.RegisterCamera( vehicle.pSeat[1], Vector(0,0,0), Vector(0,0,0), true )
end

function simfphys.weapon:AimWeapon( ply, vehicle, pod )	
	local Aimang = ply:EyeAngles()
	local AimRate = 250
	
	local Angles = vehicle:WorldToLocalAngles( Aimang ) - Angle(0,90,0)
	
	vehicle.sm_pp_yaw = vehicle.sm_pp_yaw and math.ApproachAngle( vehicle.sm_pp_yaw, Angles.y, AimRate * FrameTime() ) or 0
	vehicle.sm_pp_pitch = vehicle.sm_pp_pitch and math.ApproachAngle( vehicle.sm_pp_pitch, Angles.p, AimRate * FrameTime() ) or 0
	
	local TargetAng = Angle(vehicle.sm_pp_pitch,vehicle.sm_pp_yaw,0)
	TargetAng:Normalize()

	local TargetYaw = ((-TargetAng.y) - 90) / 45
	local TargetPitch = ((-TargetAng.p) - 10) / 10
	vehicle:SetPoseParameter("vehicle_mg_yaw", TargetYaw )
	vehicle:SetPoseParameter("vehicle_mg_pitch", TargetPitch )
	
	return Aimang
end

function simfphys.weapon:Think( vehicle )
	local pod = vehicle:GetPassengerSeats()[1]
	if not IsValid( pod ) then return end
	
	local ply = pod:GetDriver()

	local curtime = CurTime()
	
	if not IsValid( ply ) then 
		if vehicle.wpn then
			vehicle.wpn:Stop()
			vehicle.wpn = nil
		end
		
		return
	end
	
	local ID = vehicle:LookupAttachment( "muzzle_mg" )
	local Attachment = vehicle:GetAttachment( ID )
	
	self:AimWeapon( ply, vehicle, pod )
	
	vehicle.wOldPos = vehicle.wOldPos or Vector(0,0,0)
	local deltapos = vehicle:GetPos() - vehicle.wOldPos
	vehicle.wOldPos = vehicle:GetPos()

	local shootOrigin = Attachment.Pos + deltapos * engine.TickInterval()
	
	vehicle.charge = vehicle.charge or 100
	
	local fire = ply:KeyDown( IN_ATTACK )
	
	if fire then
		self:PrimaryAttack( vehicle, ply, shootOrigin, Attachment, ID )
	end
	
	-- vehicle.OldFire = vehicle.OldFire or false
	-- if vehicle.OldFire ~= fire then
	-- 	vehicle.OldFire = fire
	-- 	if fire then
	-- 		vehicle.wpn = CreateSound( vehicle, "weapons/cultist/mg42/mg42_fp.wav" )
	-- 		vehicle.wpn:Play()
	-- 		vehicle:CallOnRemove( "stopmesounds", function( vehicle )
	-- 			if vehicle.wpn then
	-- 				vehicle.wpn:Stop()
	-- 			end
	-- 		end)
	-- 	else
	-- 		if vehicle.wpn then
	-- 			vehicle.wpn:Stop()
	-- 			vehicle.wpn = nil
	-- 		end

	-- 		vehicle:EmitSound("weapons/airboat/airboat_gun_lastshot"..math.random(1,2)..".wav")
	-- 	end
	-- end
end

function simfphys.weapon:CanPrimaryAttack( vehicle )
	vehicle.NextShoot = vehicle.NextShoot or 0
	return vehicle.NextShoot < CurTime()
end

function simfphys.weapon:SetNextPrimaryFire( vehicle, time )
	vehicle.NextShoot = time
end

function simfphys.weapon:PrimaryAttack( vehicle, ply, shootOrigin, Attachment, ID )
	if not self:CanPrimaryAttack( vehicle ) then return end
	
	local effectdata = EffectData()
		effectdata:SetOrigin( shootOrigin )
		effectdata:SetAngles( Attachment.Ang )
		effectdata:SetEntity( vehicle )
		effectdata:SetAttachment( ID )
		effectdata:SetScale( 1 )
	util.Effect( "CS_MuzzleFlash_X", effectdata, true, true )

	mg_fire(ply,vehicle,shootOrigin,Attachment,(vehicle.charge / 5))
	
	self:SetNextPrimaryFire( vehicle, CurTime() + 0.1 )
end
