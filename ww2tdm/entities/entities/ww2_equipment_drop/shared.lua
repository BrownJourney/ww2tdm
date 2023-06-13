ENT.Type = "anim"
--ENT.Base = "base_gmodentity"

ENT.PrintName = "WW2 Equipment"

ENT.Spawnable = false

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "Equipment")
end
