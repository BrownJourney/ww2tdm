
SWEP.BounceWeaponIcon  = false

SWEP.PrintName		= "cool base"
SWEP.Author			= "hoobsug"
SWEP.Contact		= "https://steamcommunity.com/id/hoobsucc/"
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModel		= "models/weapons/c_357.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"

SWEP.Ironsights = true

SWEP.IronsightPos = Vector(-2.651, -2, 1.049)
SWEP.IronsightAng = Vector(-0.5, 0, 0)

SWEP.IronsightZoom = 0
SWEP.SightsConeMul = 0.9
SWEP.AimMouseSensetivity = 0.5

SWEP.HoldType		= "pistol"

SWEP.Category		= "COOL BASE"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Recoil			= 0.5

SWEP.Primary.Damage			= 40  
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.2

SWEP.Primary.Delay			= 0.1

SWEP.Primary.Force			= 3

SWEP.Primary.ClipSize		= 30
SWEP.Primary.TakeAmmo		= 1
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "ar2"

SWEP.ProjectileVelocity		= 10000
SWEP.Throwable				= false
SWEP.Melee					= false
SWEP.MeleeRange				= 64

SWEP.MeleeHitSound = "weapons/loh"	--без рандомного числа и формата (ЕБАТЬ ТЫ РАЗУМИСТ, СУКА!)
SWEP.HitSoundMaxRand = 6
SWEP.HitSoundFormat = ".wav"

SWEP.UseHands = true

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.PrimarySound			= ""

SWEP.SwayScale			= 1.0
SWEP.BobScale			= 1.0

if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 50
	SWEP.ViewModelFlip		= false
	
end

function SWEP:SetupDataTables()

	self:NetworkVar( "Bool", 1, "AimBool" )
	self:NetworkVar( "Float", 1, "NextReload" )
	self:NetworkVar( "Bool", 2, "Holster" )
	self:NetworkVar( "Bool", 3, "Running" )
	self:NetworkVar( "Float", 2, "HolsterDelay" )
	self:NetworkVar( "Bool", 4, "Reloading" )
	self:NetworkVar( "Bool", 5, "ThrowHolding" )
	self:NetworkVar( "Float", 3, "MeleeStep" )
	self:NetworkVar( "Float", 4, "Alert" )
	
	self:SetAimBool( false )
	self:SetNextReload( 0 )
	self:SetHolster( false )
	self:SetRunning( false )
	self:SetHolsterDelay( 0 )
	self:SetReloading( false )
	self:SetThrowHolding( false )
	
	self:SetMeleeStep( 1 )
	self:SetAlert( 0 )
	
end

function SWEP:Initialize()

	self.FortProgress = 0
	
	self:SetHoldType( self.HoldType )

end

SWEP.DefaultAuto = false

function SWEP:Deploy()

	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Weapon:SequenceDuration())
	self.Weapon:SetNextSecondaryFire(CurTime() + self.Weapon:SequenceDuration())
	self:SetNextReload( CurTime() + self.Weapon:SequenceDuration() )
	self.idledelay = ( CurTime() + self.Weapon:SequenceDuration() )
	self.throw_delay = ( CurTime() + self.Weapon:SequenceDuration() )
	
	self:SetHolster(false)
	self:SetRunning(false)
	self:SetMeleeStep( 1 )

	return true
end

function SWEP:Reload()
	
end

function SWEP:CanReload()
	if self:GetNextReload() > CurTime() then 
		return false
	end
	return true
end

SWEP.melee_delay = 0
SWEP.melee_striking = false

SWEP.MeleeHitDelay = 0.1

function SWEP:PrimaryAttack()

	if !self:CanPrimaryAttack() or self:GetRunning() or ((self:GetNextReload() > CurTime()) or (self:GetNextReload()-0.3 > CurTime())) then return end

	if self:GetMeleeStep() == 1 then
		self.Weapon:SendWeaponAnim(ACT_VM_HITRIGHT)
		self:SetMeleeStep(2)
		self.Owner:ViewPunch( Angle( 2, 2, -1 ) )
	elseif self:GetMeleeStep() == 2 then
		self.Weapon:SendWeaponAnim(ACT_VM_HITLEFT)
		self:SetMeleeStep(3)
		self.Owner:ViewPunch( Angle( 2, -2, 1 ) )
	elseif self:GetMeleeStep() == 3 then
		self.Weapon:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
		self:SetMeleeStep(1)
		self.Owner:ViewPunch( Angle( 4, 1, 0 ) )
	elseif self:GetMeleeStep() == 5 then
		self.Weapon:SendWeaponAnim(ACT_VM_MISSRIGHT)
		self.Owner:ViewPunch( Angle( 2, 1, 0 ) )
	elseif self:GetMeleeStep() == 6 then
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK_SILENCED)
		self.Owner:ViewPunch( Angle( 3, 1, 0 ) )
	end
	
	if self:GetMeleeStep() == 5 then
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay/1.5 )
		self:SetAlert( CurTime() + 4 )
	elseif self:GetMeleeStep() == 6 then
		self:SetNextPrimaryFire( CurTime() + self.Weapon:SequenceDuration() )
		self:SetAlert( CurTime() + self.Weapon:SequenceDuration() )
		local eyeang = self.Owner:EyeAngles()
		eyeang.p = 5
		self.Owner:SetEyeAngles(eyeang)
	else
		self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
		self:SetAlert( CurTime() + 4 )
	end

	self:EmitSound(Sound(self.Primary.Sound))
	self.melee_delay = CurTime() + self.Weapon:SequenceDuration()*self.MeleeHitDelay
	self.melee_striking = true
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	
	self.idledelay = CurTime() + self.Weapon:SequenceDuration()
	
	self:SetNextReload(CurTime() + self.Weapon:SequenceDuration())
	self:SetReloading(false)

	if CLIENT and self.BuildSpot then

		if (self.delay or 0) >= CurTime() then

			return

		end

		self.delay = CurTime() + self.Weapon:SequenceDuration() / 2

		local buildid  = self.BuildSpot.id
		local buildpos = self.BuildSpot.pos
		local buildang = self.BuildSpot.ang

		if LocalPlayer():GetPos():Distance(buildpos) < 100 then

			local fortProgress = 50
			if LocalPlayer():GetTrait() == TRAIT_BLASTPROTECTION then

				fortProgress = fortProgress * 1.5

			end

			self.FortProgress = self.FortProgress + fortProgress

			if self.FortProgress >= self.Fortifications[buildid].progress then

				self.FortProgress = 0
				self.BuildSpot = nil;

				net.Start("CreateFortification")

					net.WriteVector(buildpos)
					net.WriteAngle(buildang)
					net.WriteUInt(buildid, 5)

				net.SendToServer()

			end

		end

	end
	
end

SWEP.Fortifications = {
	{
		model = "models/props_fortifications/sandbags_line1.mdl",
		progress = 200,
	},
	{
		model = "models/props_fortifications/sandbags_corner2_tall.mdl",
		progress = 600,
	},
	{
		model = "models/props_fortifications/hedgehog_small1.mdl",
		progress = 500,
	},
}

SWEP.SelectedFort = 1

if SERVER then

	util.AddNetworkString("CreateFortification")

	net.Receive("CreateFortification", function(len, ply)

		local pos = net.ReadVector()
		local ang = net.ReadAngle()
		local id  = net.ReadUInt(5)

		if ply:GetNWBool("InZone") or ply:GetNWBool("SetToKilled") then

			notify.Add(ply, "notify_inzone", nil, 3)
			return

		end

		local wep = ply:GetActiveWeapon()

		if !IsValid(wep) or wep:GetClass() != "w_hammer" then return end
		if (ply.FortsLeft or 0) <= 0 then notify.Add(ply, "fortification_none", nil, 2) return end

		local fortData = wep.Fortifications or {}

		if !fortData[id] then return end

		ply.FortsLeft = ply.FortsLeft - 1

		ply:AddXP("support_fortification")

		if ply:GetPos():Distance(pos) > 200 then return end

		local fort = ents.Create("prop_physics")
		fort:SetModel(fortData[id].model)
		fort:SetPos(pos)
		fort:SetAngles(ang)
		fort:Spawn()
		fort.isFortification = true
		fort:SetHealth(fortData[id].progress)
		fort:SetMaxHealth(fortData[id].progress)
		fort:SetMoveType(MOVETYPE_NONE)
		fort:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		fort:SetRenderMode(RENDERMODE_TRANSALPHA)
		fort:SetColor(Color(255, 255, 255, 100))

		fort.Owner = ply
		fort:SetNetBool("Fortification", true)

		timer.Simple(2, function()

			if IsValid(fort) then

				fort:SetColor(Color(255, 255, 255, 255))
				fort:SetCollisionGroup(COLLISION_GROUP_NONE)

			end

		end)

		timer.Simple(CFG.FortificaionDuration or 5, function()

			if !IsValid(fort) then return end

			timer.Create("DestroyFort_"..fort:GetCreationID(), 5, 6, function()

				if !IsValid(fort) then return end

				fort:EmitSound("physics/cardboard/cardboard_box_break" .. math.random(1, 3) .. ".wav", 100, 80)
				fort:SetHealth(fort:Health() - fort:GetMaxHealth() / 6)

				if fort:Health() <= 0 then

					fort:Remove()

					if IsValid(fort.Owner) then

						fort.Owner.FortsLeft = (fort.Owner.FortsLeft or 0) + 1

					end

				end

			end)

		end)

	end)

end

function SWEP:SecondaryAttack()	

end

function SWEP:CanPrimaryAttack()

	if self:GetNextPrimaryFire() > CurTime() or self:GetThrowHolding() then return end

	if !self.Melee then
		if (self:Clip1() <= 0 and self:Clip1() <= 1) then
					--self:DryFire()
				self:SetNextPrimaryFire( CurTime() + 0.3 )
				self:SetNextSecondaryFire( CurTime() + 0.3 )		
			return false
	 
		end
	end
 
	return true
end

SWEP.ChangeTo = nil
SWEP.gren_delay = 0

function SWEP:Think()

	if not self.Owner:IsPlayer() then return end

	self:DrawGhostEntity()
	
	if SERVER then
		
		local tr = self.Owner:GetEyeTrace()

		if self.melee_striking then
			if self.melee_delay < CurTime() then
				local tr = util.TraceHull( {
					start = self.Owner:GetShootPos(),
					endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * self.MeleeRange ),
					filter = self.Owner,
					mins = Vector( -10, -10, -10 ),
					maxs = Vector( 10, 10, 10 ),
					mask = MASK_SHOT_HULL
				} )
				
				if ( tr.Hit ) then
					local dmginfo = DamageInfo()
					dmginfo:SetDamageType(DMG_CLUB)
					dmginfo:SetAttacker(self.Owner)
					dmginfo:SetInflictor(self)
					dmginfo:SetDamage(45)
					
					self.Owner:EmitSound(self.MeleeHitSound..math.random(1, self.HitSoundMaxRand)..self.HitSoundFormat)
					self.Owner:ViewPunch( Angle( math.Rand(1,2), math.Rand(-1,1), 0 ) )

					if tr.Entity:IsNPC() or tr.Entity:IsPlayer() then
						dmginfo:SetDamageForce(self.Owner:GetForward()*3000)
						
						if self:GetMeleeStep() >= 5 then
							local fx = EffectData()
							fx:SetEntity(tr.Entity) 
							fx:SetOrigin(tr.HitPos)
							fx:SetNormal(tr.HitNormal)
							fx:SetColor(tr.Entity:GetBloodColor())
							if tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
								util.Effect("BloodImpact", fx)
							end
						end
						
					else
						if IsValid(tr.Entity:GetPhysicsObject()) then
							tr.Entity:GetPhysicsObject():ApplyForceCenter(self.Owner:GetForward()*3000)
						end
					end
					
					tr.Entity:TakeDamageInfo(dmginfo)
				else
					self.Owner:ViewPunch( Angle( 0.5, 0, 0 ) )
				end
				
				self.melee_striking = false
				
			end
		end
		
		if self.idledelay < CurTime() and !self.throwing and !self.StealthCharged and !self:GetHolster() and self:GetNextPrimaryFire() < CurTime() and !self:GetThrowHolding() and self:GetNextReload() < CurTime() then
			
			if self:GetAlert() < CurTime() and self:GetMeleeStep() != 1 and self:GetMeleeStep() != 5 then
				if self:GetMeleeStep() == 6 then
					self:SetMeleeStep(5)
				else
					self:SetMeleeStep(1)
				end
			end
			
			if self:GetMeleeStep() == 1 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
			elseif self:GetMeleeStep() == 2 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_LOWERED)
			elseif self:GetMeleeStep() == 3 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_SILENCED)
			elseif self:GetMeleeStep() == 5 then
				self.Weapon:SendWeaponAnim(ACT_VM_IDLE_EMPTY)
			end
			self:SetHoldType( self.HoldType )
			self.idledelay = CurTime() + self.Weapon:SequenceDuration()
		end

	end

	if self:GetHolster() and self:GetHolsterDelay() < CurTime() then
		if not IsFirstTimePredicted() then return end
		if SERVER then 
			if self.OneShot and self:Clip1() == 0 then
				self.Owner:StripWeapon(self.Weapon:GetClass())
			else
				self.Owner:SelectWeapon(self.ChangeTo)
			end		
		end
	end
	
end

local aimlerp = 0

function SWEP:GetViewModelPosition( pos, ang )

	if !CLIENT then return end

	pos = pos + ang:Up() * -3
	
	return pos, ang
	
end

local att_ang = Angle(0,0,0)
local att_pos = Vector(0,0,0)

local newang = Angle(0,0,0)
local zeroang = Angle(0,0,0)
local zeropos = Vector(0,0,0)
local clamped = 0

local alert_mul = 0

SWEP.ReloadBobMul = 1

function SWEP:CalcView( ply, pos, ang, fov ) 

	if self:GetNextReload()-0.2 >= CurTime() then
		newang = LerpAngle(FrameTime()*25, newang, (ang-att_ang)*0.1)
	else
		newang = LerpAngle(FrameTime()*1, newang, zeroang)
	end
	
	if (self:GetMeleeStep() != 1 and self:GetMeleeStep() != 5 and self:GetMeleeStep() != 6) or self:GetThrowHolding() then
		alert_mul = Lerp(FrameTime() * 5, alert_mul, 0.5)
	else
		alert_mul = Lerp(FrameTime() * 5, alert_mul, 0)
	end
	
	ang:RotateAroundAxis( ang:Right(), (newang.p*0.8)*-1*self.ReloadBobMul )
	
	--===========sick fixes===========--
	clamped = Lerp(FrameTime()*10, clamped, math.Clamp(newang.y, -1, 1))
	
	ang:RotateAroundAxis( ang:Up(), clamped*self.ReloadBobMul + (math.sin(CurTime()*2)*alert_mul))
	ang:RotateAroundAxis( ang:Forward(), ((newang.p + newang.r) * 0.1)*self.ReloadBobMul)
	ang:RotateAroundAxis( ang:Right(), (math.sin(CurTime()*4)*alert_mul))

	return pos, ang, fov

end

function SWEP:Holster(wep)
	if not IsFirstTimePredicted() then return end

	self:RemoveGhostEntity()

	return true
end

function SWEP:OnRemove()

	self:RemoveGhostEntity()

end

function SWEP:DrawHUD()

	local vm = self.Owner:GetViewModel()
	local att = vm:GetAttachment(3)

	local w, h = ScrW(), ScrH()

	--PrintTable(vm:GetAttachments())

	if att then
		att_ang = att.Ang
		att_pos = att.Pos
	end

	local sizew, sizeh = w * 0.25, h * 0.18
	draw.RoundedBox(0, w * 0.02, h / 2 - sizeh / 2, sizew, sizeh, Color(0, 0, 0, 100))

	local controls = {
		{ctrl = "LMB", text = "fortification_primary"},
		{ctrl = "RMB", text = "fortification_secondary"},
		{ctrl = "R", text = "fortification_reload"}
	}
	local font = F("futura_32")

	for k, v in pairs(controls) do

		local bindStr = '[' .. v.ctrl .. ']'
		draw.SimpleText(T(bindStr), font, w * 0.02 + 5, h / 2 - sizeh / 2 + (h * 0.06) * (k - 1) + 10, color_white)
		draw.SimpleText(T(v.text), F("futuraLight_28"), w * 0.02 + 5 + surface.GetSize(bindStr, font) + 5, h / 2 - sizeh / 2 + (h * 0.06) * (k - 1) + h * 0.015, color_white)

	end

	if !self.Fortifications[self.SelectedFort] then return end
	if !self.BuildSpot then return end

	local scale = self.FortProgress / self.Fortifications[self.SelectedFort].progress

	draw.RoundedBox(0, w / 2 - w * 0.05 / 2, h / 2 - 5 / 2, w * 0.05, 5, Color(0, 0, 0, 200))
	draw.RoundedBox(0, w / 2 - w * 0.05 / 2, h / 2 - 5 / 2, w * 0.05 * scale, 5, Color(0, 200, 0, 200))

end

function SWEP:RemoveGhostEntity()

	if SERVER then return end
	if !IsValid(self.Owner.GhostEntity) then return end

	self.Owner.GhostEntity:Remove()

end

function SWEP:DrawGhostEntity()

    if SERVER then return end

    local model = self.Fortifications[self.SelectedFort].model
    local lp = self.Owner

    if self:GetHolster() then return end

    if IsValid(lp.GhostEntity) then

        local tr = util.GetPlayerTrace(self.Owner)
        local trace = util.TraceLine(tr)

        if (!trace.Hit) then return end

        local ang = self.Owner:GetAimVector():Angle() - Angle(0, 180, 0)
        local BBMin, BBCenter, BBMax = lp.GhostEntity:OBBMins(), lp.GhostEntity:OBBCenter(), lp.GhostEntity:OBBMaxs()
        local pos = Vector(trace.HitPos.X, trace.HitPos.Y, trace.HitPos.Z - (trace.HitNormal.z * BBMin.z))

        local goodSpawn = !util.QuickTrace(lp.GhostEntity:LocalToWorld(BBMin), Vector(0, 0, 0), lp.GhostEntity).Hit
        	and !util.QuickTrace(lp.GhostEntity:LocalToWorld(BBMax), Vector(0, 0, 0), lp.GhostEntity).Hit
        	and !util.QuickTrace(lp.GhostEntity:LocalToWorld(BBCenter), BBMin, lp.GhostEntity).Hit
        	and !util.QuickTrace(lp.GhostEntity:LocalToWorld(BBCenter), BBMax, lp.GhostEntity).Hit
        	and trace.HitNormal.z > 0
        	and !IsValid(trace.Entity)

        if goodSpawn then

        	lp.GhostEntity:SetColor(Color(0, 255, 0, 100))

        else

        	lp.GhostEntity:SetColor(Color(255, 0, 0, 100))

        end

        if self.BuildSpot then

        	lp.GhostEntity:SetColor(Color(255, 255, 255, 100))
        	lp.GhostEntity:SetPos(self.BuildSpot.pos)
	        lp.GhostEntity:SetAngles(self.BuildSpot.ang)

        else

	        lp.GhostEntity:SetPos(pos)
	        lp.GhostEntity:SetAngles(Angle(0, ang.Yaw, 0))

	    end

	    if lp.GhostEntity:GetModel() != model then

	    	lp.GhostEntity:SetModel( model )

	    end

        lp.GhostEntity:SetNoDraw(false)

        if self.Owner:KeyDown(IN_ATTACK2) and goodSpawn then

        	if (self.NextSpot or 0) >= CurTime() then

        		return

        	end

        	self.NextSpot = CurTime() + 2

        	if self.Owner:GetNWBool("InZone") or self.Owner:GetNWBool("SetToKilled") then

        		notify.Add("notify_inzone", "nil", 3)
        		return

        	end

	        if self.BuildSpot then

	        	self.BuildSpot = nil;
	        	self.FortProgress = 0

	        else

				self.BuildSpot = {
					id = self.SelectedFort,
					pos = pos,
					ang = Angle(0, ang.Yaw, 0)
				}

			end

		end

		if self.Owner:KeyDown(IN_RELOAD) and !self.BuildSpot then

			if (self.NextReload or 0) >= CurTime() then

				return

			end

			self.NextReload = CurTime() + 0.5

			self.SelectedFort = self.SelectedFort + 1

			if self.SelectedFort > #self.Fortifications then

				self.SelectedFort = 1

			end

		end

    else

    	util.PrecacheModel( model )

    	lp.GhostEntity = ents.CreateClientProp()

        lp.GhostEntity:SetModel( model )
        lp.GhostEntity:SetPos( Vector(0, 0, 0) )
        lp.GhostEntity:SetAngles( Angle(0, 0, 0) )
        lp.GhostEntity:Spawn()
        
        lp.GhostEntity:SetSolid( SOLID_VPHYSICS );
        lp.GhostEntity:SetMoveType( MOVETYPE_NONE )
        lp.GhostEntity:SetNotSolid( true );
        lp.GhostEntity:SetRenderMode( RENDERMODE_TRANSALPHA )
        lp.GhostEntity:SetColor( Color( 255, 255, 255, 150 ) )

    end

end

function SWEP:PreDrawViewModel(vm, wep, ply)

end


function SWEP:TranslateFOV( current_fov )

end

function SWEP:ResetBones()

	local vm = self.Owner:GetViewModel()
	if not IsValid(vm) then return end
	
	if (!vm:GetBoneCount()) then return end
	
	for i = 0, vm:GetBoneCount() do
		vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
		vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
		vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
	end
	
end
