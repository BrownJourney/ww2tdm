include("shared.lua")

function ENT:Initialize()

end

function ENT:Draw()
    local parent = self:GetParent()
    local bDraw = true
    if IsValid(parent) and parent:IsPlayer() then
        bDraw = !parent:GetNoDraw()
    end

    if self:GetOwner() == LocalPlayer() then
        self:DestroyShadow()
    end

    if self:GetOwner() == LocalPlayer() and !LocalPlayer():InVehicle() or !bDraw then
        if parent == LocalPlayer() then
            self:DrawModel()
        end
    else
        self:DrawModel()
    end
end

function ENT:Think()
    local parent = self:GetParent()

    if (!IsValid(parent) and self:EntIndex() == -1) then self:Remove() return end
end
