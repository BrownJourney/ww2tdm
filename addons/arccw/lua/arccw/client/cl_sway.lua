local enabled = GetConVar("arccw_enable_sway")
local mult = GetConVar("arccw_mult_sway")

ArcCW.SwayDir = 0

function ArcCW.Sway(cmd)

    local ply = LocalPlayer()
    local wpn = ply:GetActiveWeapon()

    if !wpn.ArcCW then return end

    local ang = cmd:GetViewAngles()

    local actual_sway = wpn:GetBuff("Sway")
    local breathTaker = FrameTime() * 25
    if !wpn._BreathAmount then
        wpn._BreathAmount = 100
    end

    if !wpn._Sway then
        wpn._Sway = actual_sway
    end

    if !wpn.HoldingBreath then
        wpn._BreathAmount = math.min(wpn._BreathAmount + breathTaker / 2, 100)
    end

    if wpn:GetState() == ArcCW.STATE_SIGHTS and !wpn.NoSway and enabled:GetBool() then
        local asight = wpn:GetActiveSights()
        if !wpn.NoBreath then
            if wpn:GetSightDelta() < 1 and (wpn.BreathReset or 0) < CurTime() then
                if input.IsButtonDown(wpn:GetOwner():GetInfoNum("ww2_bind_breath", -1)) and wpn._BreathAmount > 0 then
                    wpn.HoldingBreath = true
                    actual_sway = 0.1
                    wpn._BreathAmount = wpn._BreathAmount - breathTaker
                    if wpn._BreathAmount <= 0 then
                        wpn.BreathReset = CurTime() + CFG.BreathPenalty
                    end
                else
                    if wpn.HoldingBreath then
                        actual_sway = wpn._Sway
                        wpn.HoldingBreath = false
                    end
                end
            else
                if wpn.HoldingBreath then
                    actual_sway = wpn._Sway
                    wpn.HoldingBreath = false
                end
            end
        end

        local sway = mult:GetFloat() * actual_sway
        --sway = sway * math.Clamp(1 / (wpn:GetActiveSights().ScopeMagnification or 1), 0.1, 1)
        if wpn:InBipod() then
            sway = sway * (wpn.BipodDispersion * wpn:GetBuff_Mult("Mult_BipodDispersion"))
        else
            if wpn:CanBipod(true) then
                sway = sway * 0.5
            end
        end
        if sway > 0.05 then
            ang.p = math.Clamp(ang.p + math.sin(CurTime() * 1.25) * FrameTime() * sway, -89, 89)

            ArcCW.SwayDir = ArcCW.SwayDir + math.Rand(-360, 360) * FrameTime() / math.min(sway, 1)

            ang.p = ang.p + math.sin(ArcCW.SwayDir) * FrameTime() * sway
            ang.y = ang.y + math.cos(ArcCW.SwayDir) * FrameTime() * sway

            -- ang.p = ang.p + math.Rand(-1, 1) * FrameTime() * sway
            -- ang.y = ang.y + math.Rand(-1, 1) * FrameTime() * sway

            cmd:SetViewAngles(ang)
        end
    else
        wpn.HoldingBreath = false
    end
end

hook.Add("CreateMove", "ArcCW_Sway", ArcCW.Sway)