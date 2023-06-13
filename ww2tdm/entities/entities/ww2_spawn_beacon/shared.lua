ENT.Type = "anim"
--ENT.Base = "base_gmodentity"

ENT.PrintName = "WW2 Spawn Beacon"

ENT.Spawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "Team")
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end