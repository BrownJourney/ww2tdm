local shockDistance = 50 --Maximum distance, within which you will be effected.
local maxShock = 30 --Maximum shocked you can be.  Probably don't change this.
local defaultFadeSpeed = 0.35 --Speed at which shock goes away.
local minCrack = 1 --Minimum time between "crack" shots

local meta = FindMetaTable("Player")

if SERVER then

    CreateConVar( "shell_fadespeed", defaultFadeSpeed, _, "How quickly should shellshock fade away?"  )
    CreateConVar( "shell_enabled", 1, _, "Should shellshock be active?"  )

    util.AddNetworkString( "ShotAt" )

    function util.SimpleEffect(effectname, pos, parent)
        ParticleEffect(effectname, pos, Angle(0, 0, 0), parent)
    end

    --Handles whether or not a player or NPC should be effected by a bullet
    hook.Add( "EntityFireBullets", "ShellshockGettingBullets", function(ent, data)
        -- if ( not IsValid( ent ) or not GetConVar( "shell_enabled" ):GetBool() ) then return end

        -- data._Callback = data.Callback
        -- data.Callback = function( ply, tr, dmginfo )
        --     if data._Callback then
        --         data._Callback(ply, tr, dmginfo)
        --     end
        --     --Handles players getting shot at
        --     -- for k, v in pairs( player.GetAll() ) do
        --     --     if v != ent and v:GetTrait() != TRAIT_SUPPRESSION then
        --     --         if ply:IsPlayer() and ply:Team() == v:Team() then
        --     --             continue
        --     --         end
                    
        --     --         local dist = util.DistanceToLine( tr.StartPos, tr.HitPos, v:EyePos() )
        --     --         if dist <= shockDistance then
        --     --             if !v:IsAlive() then return end
        --     --             if v:Team() == TEAM_SPECTATOR then return end
        --     --             local shock = math.Clamp( ( v:GetNWFloat( "ShellshockLevel", 0 ) + ( ( shockDistance - dist ) / shockDistance ) ) * ( 1 + dmginfo:GetDamage() / 750 ), 0, maxShock )
        --     --             v:SetNWFloat( "ShellshockLevel", shock )

        --     --             net.Start( "ShotAt" )
        --     --             net.Send( v )
        --     --             v:ViewPunch( Angle( math.random( -1, 1 )/( ( maxShock + 1 ) - shock ), math.random( -1, 1 )/( ( maxShock + 1 ) - shock ), math.random( -1, 1 )/( ( maxShock + 1 ) - shock ) ) )
        --     --             timer.Create( "Shellshock"..v:EntIndex(), 0.25, 0, function()
        --     --                 if not IsValid( v ) then return end
        --     --                 local shock = math.max( v:GetNWFloat( "ShellshockLevel", 0 ) - GetConVar( "shell_fadespeed" ):GetFloat(), 0 )
        --     --                 v:SetNWFloat( "ShellshockLevel", shock )
        --     --             end)
        --     --             if (v.ShockNextSound or 0) > CurTime() then return end
        --     --             v.ShockNextSound = CurTime() + 5
        --     --             v:ScreenFade(SCREENFADE.IN, Color(0, 0, 0, 255), 0.2, 0.1)
        --     --             timer.Simple(.1, function()
        --     --                 if !IsValid(v) then return end
        --     --                 if v:Health() <= 0 then return end
        --     --                 if !v:IsAlive() then return end
        --     --                 v:Voice('underfire', 100)
        --     --             end)
        --     --         end
        --     --     end
        --     -- end
        -- end
        -- return true
    end)

    function meta:ApplyShock()
        self:SetNWFloat("ShellshockLevel", self:GetNWFloat("ShellshockLevel") + maxShock)

        timer.Create( "Shellshock"..self:EntIndex(), 0.25, 0, function()
            if not IsValid( self ) then return end
            local shock = math.max( self:GetNWFloat( "ShellshockLevel", 0 ) - GetConVar( "shell_fadespeed" ):GetFloat(), 0 )
            self:SetNWFloat( "ShellshockLevel", shock * math.Rand(0.8, 0.9) )

            if shock <= 0 then
                timer.Remove( "Shellshock"..self:EntIndex() )
            end
        end)
    end

    hook.Add("EnemyKilled", "ApplySuppEffect", function(attacker, victim)
        if attacker:GetTrait() != TRAIT_SUPPRESSION then return end

        for k, v in pairs(team.GetPlayers(victim:Team())) do
            local dist = v:GetPos():DistToSqr(victim:GetPos())
            if dist < 90000 then
                v:ApplyShock()
            end
        end
    end)

    --Removes the effect on death
    hook.Add( "PlayerSpawn", "ShellshockReset", function( ply )
        ply:SetNWFloat( "ShellshockLevel", 0 )
    end)
else

    local nearMissSounds = {
        "weapons/fx/nearmiss/bulletLtoR03.wav",
        "weapons/fx/nearmiss/bulletLtoR04.wav",
        "weapons/fx/nearmiss/bulletLtoR05.wav",
        "weapons/fx/nearmiss/bulletLtoR06.wav",
        "weapons/fx/nearmiss/bulletLtoR07.wav",
        "weapons/fx/nearmiss/bulletLtoR09.wav",
        "weapons/fx/nearmiss/bulletLtoR10.wav",
        "weapons/fx/nearmiss/bulletLtoR11.wav",
        "weapons/fx/nearmiss/bulletLtoR12.wav",
        "weapons/fx/nearmiss/bulletLtoR13.wav",
        "weapons/fx/nearmiss/bulletLtoR14.wav"
    }

    --Handles near miss sounds
    net.Receive( "ShotAt", function()
        if not IsValid( LocalPlayer() ) then return end

        if not LocalPlayer().SuppressNearMiss then
            LocalPlayer():EmitSound( nearMissSounds[ math.random( 1, #nearMissSounds ) ], 180, 100, 1 )
            LocalPlayer().SuppressNearMiss = true
            timer.Simple( minCrack, function()
                if not IsValid( LocalPlayer() ) then return end

                LocalPlayer().SuppressNearMiss = false
            end)
        end
    end)

    --Draws the screen effects
    hook.Add( "RenderScreenspaceEffects", "ShellshockDrawEffects", function()
        if not IsValid( LocalPlayer() ) then return end
        local level = LocalPlayer():GetNWFloat( "ShellshockLevel", 0 )

        if level > 0 then
            DrawToyTown( 10 * ( level / maxShock ), ScrH() )
        end

    end)
end
