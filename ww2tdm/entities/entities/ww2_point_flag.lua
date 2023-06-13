AddCSLuaFile()

ENT.Base = "base_point"
ENT.Type = "anim"

FLAGSTATUS_IDLE 			= 0
FLAGSTATUS_PREVENTED 		= 1
FLAGSTATUS_CAPTURING_AXIS 	= 2
FLAGSTATUS_CAPTURING_ALLIES = 3

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 	0, "Status")
	self:NetworkVar("Int", 1, "ControlledBy")
	self:NetworkVar("Float", 0, "Radius")
	self:NetworkVar("String", 0, "Point")
end

FLAG_MAX_PROGRESS = 100

if SERVER then
	function ENT:Initialize()
		self:SetModel('models/hunter/blocks/cube025x025x025.mdl')
		
		self:AddEFlags(EFL_FORCE_CHECK_TRANSMIT)

		self:SetNoDraw(false)
		self:SetSolid(SOLID_NONE)
		self:DrawShadow(false)

		self:SetTrigger(true)
		self:UseTriggerBounds(true)

		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

		self.Players = {
			[TEAM_AXIS] = {},
			[TEAM_ALLIES] = {}
		}
	end

	function ENT:Touch(pEntity)
		if !IsValid(pEntity) or !pEntity:IsPlayer() then
			return
		end

		local teamID = pEntity:Team()

		if !self.Players[teamID] then
			return
		end

		self.Players[teamID][pEntity] = nil

		local oppositeTeam = teamID == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS
		if self.Players[oppositeTeam][pEntity] then
			self.Players[oppositeTeam][pEntity] = nil
		end

		if !pEntity:IsAlive() then
			return
		end
			
		self.Players[teamID][pEntity] = true

		self:ShowUIProgress(pEntity)
	end
	
	function ENT:EndTouch(pEntity)
		if !IsValid(pEntity) or !pEntity:IsPlayer() then
			return
		end

		local teamID = pEntity:Team()

		if !self.Players[teamID] then
			return
		end

		self.Players[teamID][pEntity] = nil

		local oppositeTeam = teamID == TEAM_AXIS and TEAM_ALLIES or TEAM_AXIS
		if self.Players[oppositeTeam][pEntity] then
			self.Players[oppositeTeam][pEntity] = nil
		end
	end

	util.AddNetworkString('ShowUIProgress')
	function ENT:ShowUIProgress(ply)
		if !ply:IsAlive() then return end

		if (ply.NextUIProgress or 0) >= CurTime() then return end
		ply.NextUIProgress = CurTime() + 0.1

		local progress = self.captureProgress or 0

		net.Start('ShowUIProgress')
			net.WriteUInt(self:EntIndex(), 32)
			net.WriteFloat(progress)
		net.Send(ply)
	end

	function ENT:ChangeStatus(status, force)
		if !force and self:GetStatus() == status then
			return
		end

		self:SetStatus(status)

		if status == FLAGSTATUS_CAPTURING_ALLIES or status == FLAGSTATUS_CAPTURING_AXIS then
			local teamCapturing = status == FLAGSTATUS_CAPTURING_ALLIES and TEAM_ALLIES or TEAM_AXIS
			if self.capturingBy == teamCapturing and self.lastProgress then
				self.captureProgress = self.lastProgress
				self.lastProgress = nil;
			else
				self.captureProgress = 0
			end
			self.capturingBy = teamCapturing

			if status == FLAGSTATUS_CAPTURING_ALLIES then
				if self:GetControlledBy() == TEAM_AXIS then
					faction.SendVoice("point_loosing", TEAM_AXIS)
				end
			elseif status == FLAGSTATUS_CAPTURING_AXIS then
				if self:GetControlledBy() == TEAM_ALLIES then
					faction.SendVoice("point_loosing", TEAM_ALLIES)
				end
			end
		else
			if (self.captureProgress or 0) >= 0 and !CFG.Points.HardcoreReset and !self.lastProgress then
				self.lastProgress = self.captureProgress
			end
		end
	end

	function ENT:Think()
		local axisCount = table.Count(self.Players[TEAM_AXIS])
		local alliesCount = table.Count(self.Players[TEAM_ALLIES])

		if gamestate.Get() != GS_ROUND_PLAYING then
			self:SetStatus(FLAGSTATUS_IDLE)
			return
		end

		if (self.nextReward or 0) < CurTime() and self:GetControlledBy() != 0 then
			self.nextReward = CurTime() + 10
			for ply, v in pairs(self.Players[self:GetControlledBy()] or {}) do
				if ply:Team() != self:GetControlledBy() then
					self.Players[self:GetControlledBy()][ply] = nil;
					continue
				end
				local sqrRadius = self:GetRadius() * self:GetRadius()
				if ply:GetPos():Distance(self:GetPos()) > sqrRadius then
					self.Players[self:GetControlledBy()][ply] = nil;
					continue
				end
				ply:AddXP('point_objective')
			end
		end

		local toAddValue = CFG.Points.CaptureRate

		if axisCount > 0 or alliesCount > 0 then
			if axisCount == alliesCount then
				self:SetStatus(FLAGSTATUS_PREVENTED)
			elseif self:GetControlledBy() != TEAM_ALLIES and alliesCount > axisCount then
				self:ChangeStatus(FLAGSTATUS_CAPTURING_ALLIES)
				toAddValue = toAddValue * (alliesCount - axisCount)
			elseif self:GetControlledBy() != TEAM_AXIS and axisCount > alliesCount then
				self:ChangeStatus(FLAGSTATUS_CAPTURING_AXIS)
				toAddValue = toAddValue * (axisCount - alliesCount)
			else
				self:ChangeStatus(FLAGSTATUS_IDLE, true)
			end
		else
			self:ChangeStatus(FLAGSTATUS_IDLE, true)
		end

		if maploader.Gamemode() == "tdm" then
			toAddValue = CFG.Points.CaptureRate
		end

		self.captureProgress = (self.captureProgress or 0) + toAddValue

		if self:GetStatus() == FLAGSTATUS_CAPTURING_ALLIES or self:GetStatus() == FLAGSTATUS_CAPTURING_AXIS then
			if self.captureProgress and self.captureProgress >= FLAG_MAX_PROGRESS then
				local oldCapturedBy = self:GetControlledBy()
				local capturedBy = 0

				if self:GetStatus() == FLAGSTATUS_CAPTURING_ALLIES then
					capturedBy = TEAM_ALLIES
				else
					capturedBy = TEAM_AXIS
				end

				for ply, v in pairs(self.Players[capturedBy]) do
					if oldCapturedBy == 0 then
						ply:AddXP('point_capture')
						ply.PointsCaptured = (ply.PointsCaptured or 0) + 1
					else
						ply:AddXP('point_release')
					end
				end

				if oldCapturedBy != 0 then
					capturedBy = 0
				end

				faction.SendVoice("point_captured", capturedBy)
				
				if !TEAM_ATTACK then
					if capturedBy != 0 then
						notify.Custom(team.GetPlayers(capturedBy), "notify_point_capture", self:GetPoint())
					end
					notify.Custom(team.GetPlayers(oldCapturedBy), "notify_point_lost", self:GetPoint())
				end

				if oldCapturedBy != capturedBy and oldCapturedBy != 0 then
					faction.SendVoice("point_lost", oldCapturedBy)
				end

				self.captureProgress = 0
				self.lastTime = nil;

				self:SetControlledBy(capturedBy)
				self:ChangeStatus(FLAGSTATUS_IDLE)

				local playersOnSite = self.Players[self:GetControlledBy()] or {}

				hook.Run("OnPointCaptured", playersOnSite, self:GetControlledBy())
			end
		end

		self:NextThink(CurTime() + 1)
	end
end