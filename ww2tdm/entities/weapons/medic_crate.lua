SWEP.Base = "base_supplycrate"
SWEP.PrintName = "Medic crate"
SWEP.SupplyType = "health"
SWEP.ViewModel = "models/bf1/gadgets/medicine crate.mdl"
SWEP.WorldModel = "models/bf1/gadgets/medicine crate.mdl"
SWEP.Spawnable = true

function SWEP:DrawHUD()
	local w, h = ScrW(), ScrH()

	for k, v in pairs(player.GetAll()) do
		if v == self.Owner then
			continue
		end
		if v:GetPos():DistToSqr(self.Owner:GetPos()) > 50000 then
			continue
		end
		if v:Team() != self.Owner:Team() then
			continue
		end

		local pos = v:GetPos():ToScreen()
		local wide, height = w * 0.05, h * 0.01
		local scale = math.min(math.max(v:Health(), 0) / v:GetMaxHealth(), 1)
		draw.RoundedBox(0, pos.x - wide / 2, pos.y, wide, height, Color(0, 0, 0, 200))
		draw.RoundedBox(0, pos.x - wide / 2, pos.y, wide * scale, height, Color(0, 200, 0))
		-- draw.SimpleTextShadow(v:Health(), F("futura_30"), pos.x, pos.y, color_white)
	end
end