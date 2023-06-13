local GM = GM or GAMEMODE
--[[-------------------------------------------------------------------------
DATA-TABLES
---------------------------------------------------------------------------]]
GLOBAL_ANIMATION_LIST = {
    ['rifle'] = {
        active = {
            idle = "ww2_rifle_idle",
            idle_aim = "ww2_rifle_idle_aim",
            walk = 'ww2_rifle_walk',
            walk_aim = 'ww2_rifle_walk_aim',
            run = 'hum_run_alert_holding_AR2_all',
            crouch = {
                idle = "ww2_rifle_cidle",
                walk = "ww2_rifle_cwalk",
            },
            crouch_aim = {
                idle = "ww2_rifle_cidle_aim",
                walk = "ww2_rifle_cwalk_aim",
            },
            prone = {
                idle = "ww2_prone_ar2",
                walk = "ww2_prone_walktwohand"
            }
        },
        shoot = 'range_rpg',
        reload = 'reload_smg1_alt'
    },
    ['smg'] = {
        active = {
            idle = "ww2_smg_idle",
            idle_aim = "ww2_smg_idle_aim",
            walk = 'ww2_smg_walk',
            walk_aim = 'ww2_smg_walk_aim',
            run = 'hum_run_alert_holding_all',
            crouch = {
                idle = "ww2_smg_cidle",
                walk = "ww2_smg_cwalk",
            },
            crouch_aim = {
                idle = "ww2_smg_cidle_aim",
                walk = "ww2_smg_cwalk_aim",
            },
            prone = {
                idle = "ww2_prone_ar2",
                walk = "ww2_prone_walktwohand"
            }
        },
        shoot = 'dod_tommy_attack',
        reload = 'reload_smg1'
    },  
    ['ass'] = {
        active = {
            idle = "ww2_ass_idle",
            idle_aim = "ww2_ass_idle_aim",
            walk = 'ww2_ass_walk',
            walk_aim = 'ww2_ass_walk_aim',
            run = 'hum_run_alert_holding_all',
            crouch = {
                idle = "ww2_ass_cidle",
                walk = "ww2_ass_cwalk",
            },
            crouch_aim = {
                idle = "ww2_ass_cidle_aim",
                walk = "ww2_ass_cwalk_aim",
            },
            prone = {
                idle = "ww2_prone_ar2",
                walk = "ww2_prone_walktwohand"
            }
        },
        shoot = 'dod_tommy_attack',
        reload = 'reload_smg1'
    },
    ['heavy'] = {
        active = {
            idle = "ww2_heavy_idle",
            idle_aim = "ww2_heavy_idle_aim",
            walk = 'ww2_heavy_walk',
            walk_aim = 'ww2_heavy_walk_aim',
            run = 'hum_run_ar2_relaxed_all',
            crouch = {
                idle = "ww2_heavy_cidle",
                walk = "ww2_heavy_cwalk",
            },
            crouch_aim = {
                idle = "ww2_heavy_cidle_aim",
                walk = "ww2_heavy_cwalk_aim",
            },
            prone = {
                idle = "ww2_prone_ar2",
                walk = "ww2_prone_walktwohand"
            }
        },
        shoot = 'dod_mg_attack',
        reload = 'reload_ar2'
    },  
    
    ['pistol'] = {
        active = {
            idle = "ww2_pistol_idle",
            idle_aim = "ww2_pistol_idle_aim",
            walk = 'ww2_pistol_walk',
            walk_aim = 'ww2_pistol_walk_aim',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "ww2_pistol_cidle",
                walk = "ww2_pistol_cwalk",
            },
            crouch_aim = {
                idle = "ww2_pistol_cidle_aim",
                walk = "ww2_pistol_cwalk_aim",
            },
            prone = {
                idle = "ww2_prone_pistol",
                walk = "ww2_prone_walkonehand"
            }
        },
        shoot = 'range_pistol',
        reload = 'reload_pistol'
    },

    
    ['grenade'] = {
        active = {
            idle = "ww2_grenade_idle",
            walk = 'ww2_grenade_walk',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "ww2_grenade_cidle",
                walk = "ww2_grenade_cwalk",
            },
            prone = {
                idle = "ww2_prone_grenade",
                walk = "ww2_prone_walkpassive"
            }
        },
        shoot = 'dod_gren_stick_attack',
    },      

    ['etool'] = {
        active = {
            idle = "ww2_melee_idle",
            walk = 'ww2_melee_walk',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "ww2_melee_cidle",
                walk = "ww2_melee_cwalk",
            },
            prone = {
                idle = "ww2_prone_knife",
                walk = "ww2_prone_walkpassive"
            }
        },
        shoot = 'dod_spade_attack',
    },  
    
   ['knife'] = {
        active = {
            idle = "ww2_melee_idle",
            walk = 'ww2_melee_walk',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "ww2_melee_cidle",
                walk = "ww2_melee_cwalk",
            },
            prone = {
                idle = "ww2_prone_knife",
                walk = "ww2_prone_walkpassive"
            }
        },
        shoot = 'dod_knife_attack',
    },  

   ['unility'] = {
        active = {
            idle = "ww2_unility_idle",
            walk = 'ww2_unility_walk',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "ww2_unility_cidle",
                walk = "ww2_unility_cwalk",
            },
            prone = {
                idle = "ww2_prone_passive",
                walk = "ww2_prone_walkpassive"
            }
        },
        shoot = 'range_melee2_b',
    },

   ['unarmed'] = {
        active = {
            idle = "idle_all_angry",
            walk = 'hum_walk_panicked_all',
            run = 'hum_run_all_panicked',
            crouch = {
                idle = "hum_crouchidlehide",
                walk = "hum_crouch_walk_all",
            },
            prone = {
                idle = "ww2_prone_passive",
                walk = "ww2_prone_walkpassive"
            }
        },
    },
        
}
 
JUMP_SEQUENCE = "dod_jump"
SIT_SEQUENCE = "sit"
PRONE_ANIMS = {
    standup = "ww2_proneup_stand",
    standup_crouch = "ww2_proneup_crouch",
    down = "ww2_pronedown_stand",
    down_crouch = "ww2_pronedown_crouch"
}

GLOBAL_ANIMATION_REFERENCE = table.Copy(GLOBAL_ANIMATION_LIST)

REPLACE_HOLDTYPES = {
    ['ar2'] = 'smg',
    ['shotgun'] = 'smg',
    ['revolver'] = 'pistol',
    ['normal'] = 'unarmed'
}

DEFAULT_HOLDTYPES = {
    ["gmod_tool"] = "pistol",
    ["weapon_357"] = "pistol",
    ["weapon_ar2"] = "smg",
    ["weapon_smg1"] = "smg",
    ["weapon_frag"] = "grenade",
    ["weapon_slam"] = "slam",
    ["weapon_pistol"] = "pistol",
    ["weapon_crowbar"] = "blunt",
    ["weapon_physgun"] = "heavy",
    ["weapon_shotgun"] = "smg",
    ["weapon_crossbow"] = "smg",
    ["weapon_stunstick"] = "blunt",
    ["weapon_physcannon"] = "heavy"
}

--[[-------------------------------------------------------------------------
---------------------------------------------------------------------------]]

function GM:HandlePlayerDucking(ply, vel)

    if ply:Crouching() then

        return true

    end

end

function GM:HandlePlayerJumping(ply, vel)

    if !ply:IsOnGround() and ply:WaterLevel() <= 0 then

        if ply.bJumpFirstFrame then

            ply.CalcIdeal = nil;
            ply.bJumpFirstFrame = false
            ply:AnimRestartMainSequence()

        end

        return true

    end

end

function GM:CalcMainActivity(ply, vel)

    local wep = ply:GetActiveWeapon()
    local act
    local plystate, substate = 'idle'
    local firemode = 'active'
    local holdtype = 'unarmed'

    local playerVelocity = ply:GetVelocity():LengthSqr()

    if ply:Crouching() then

        plystate = 'crouch'

        if playerVelocity > 0 then

            substate = 'walk'

        else

            substate = 'idle'

        end

    else

        if playerVelocity > 22500 and ply:IsSprinting() then

            plystate = 'run'

        elseif playerVelocity > 0 then

            plystate = 'walk'

        end

    end

    if ply.IsProne and ply:IsProne() then

        plystate = "prone"

        if playerVelocity > 0 then

            substate = 'walk'

        else

            substate = 'idle'

        end

    end

    if IsValid(wep) then

        holdtype = wep.HoldtypeActive or wep:GetHoldType()

        if wep.ArcCW then

            if wep:GetState() == ArcCW.STATE_SIGHTS then
                
                plystate = plystate .. "_aim"

            end

        end

        if REPLACE_HOLDTYPES[holdtype] then

            holdtype = REPLACE_HOLDTYPES[holdtype]

        end

        if DEFAULT_HOLDTYPES[wep:GetClass()] then

            holdtype = DEFAULT_HOLDTYPES[wep:GetClass()] 

        end

        if GLOBAL_ANIMATION_LIST[holdtype] then
            
            if GLOBAL_ANIMATION_LIST[holdtype].safe then

                -- do nothing
                
            end

        else

            holdtype = 'unarmed'

        end

    end

    local seq

    if !GLOBAL_ANIMATION_LIST[holdtype][firemode][plystate] and plystate:find("aim") then
        plystate = string.Split(plystate, '_')[1]
    end
    
    if firemode then

        act = GLOBAL_ANIMATION_REFERENCE[holdtype][firemode][plystate]
        seq = GLOBAL_ANIMATION_LIST[holdtype][firemode][plystate]

    else

        act = GLOBAL_ANIMATION_REFERENCE[holdtype][plystate]
        seq = GLOBAL_ANIMATION_LIST[holdtype][plystate]

    end

    if istable(act) then

        act = act[substate]

        if firemode then

            seq = GLOBAL_ANIMATION_LIST[holdtype][firemode][plystate][substate]

        else

            seq = GLOBAL_ANIMATION_LIST[holdtype][plystate][substate]

        end

    end

    -- if !ply:IsOnGround() and ply:WaterLevel() <= 0 then

    --     seq = JUMP_SEQUENCE

    -- end

    if ply:InVehicle() then

        seq = SIT_SEQUENCE

    end

    if !seq then return end

    -- print(seq)

    seq = ply:LookupSequence(seq)

    local eyeAngles = ply:EyeAngles();
    local yaw = vel:Angle().yaw;
    local normalized = math.NormalizeAngle(yaw - eyeAngles.y);

    ply:SetPoseParameter("move_yaw", normalized);

    return act, seq

end

function GM:DoAnimationEvent(ply, event, data)

    local wep = ply:GetActiveWeapon()

    if !IsValid(wep) then

        return

    end

    local holdtype = wep.HoldtypeActive or wep:GetHoldType()
    
    if DEFAULT_HOLDTYPES[wep:GetClass()] then

        holdtype = DEFAULT_HOLDTYPES[wep:GetClass()]

    end

    if REPLACE_HOLDTYPES[holdtype] then

        holdtype = REPLACE_HOLDTYPES[holdtype]

    end

    if event == PLAYERANIMEVENT_ATTACK_PRIMARY then

        if !GLOBAL_ANIMATION_LIST[holdtype] then return end
        local gestSequence = ply:LookupSequence(GLOBAL_ANIMATION_LIST[holdtype].shoot or '')

        if gestSequence then

            ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, gestSequence, 0, true )

        end

        return ACT_VM_PRIMARYATTACK

    elseif event == PLAYERANIMEVENT_RELOAD then

        if !GLOBAL_ANIMATION_LIST[holdtype] then return end
        local gestSequence = ply:LookupSequence(GLOBAL_ANIMATION_LIST[holdtype].reload or '')

        if gestSequence then

            ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, gestSequence, 0, true )

        end

        return ACT_VM_RELOAD

    elseif event == PLAYERANIMEVENT_JUMP then

        local gestSequence = ply:LookupSequence(JUMP_SEQUENCE)

        if gestSequence then

            ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_JUMP, gestSequence, 0, true )

        end

        return ACT_INVALID

    elseif event == PLAYERANIMEVENT_CUSTOM then

        local gestSequence;

        if data == 211 then

            if ply:Crouching() then

                gestSequence = ply:LookupSequence(PRONE_ANIMS["down_crouch"])

            else

                gestSequence = ply:LookupSequence(PRONE_ANIMS["down"])

            end

        elseif data == 212 then

            if ply:Crouching() then

                gestSequence = ply:LookupSequence(PRONE_ANIMS["standup_crouch"])

            else

                gestSequence = ply:LookupSequence(PRONE_ANIMS["standup"])

            end

        end

        if gestSequence then

            ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_CUSTOM, gestSequence, 0, true )

        end

    end

end

---[[-------------------------------------------------------------------------
---------------------------------------------------------------------------]]

function AnimLoadSequences()
    local ent
    if SERVER then
        ent = ents.Create('base_anim')
    else
        ent = ents.CreateClientside('base_anim')
    end
    ent:SetModel('models/german/main_head/head_german.mdl')

    local seq_list = ent:GetSequenceList()
    for i = 1, #seq_list do

        seq_list[ seq_list[i] ] = i

    end

    for ht, cats in pairs(GLOBAL_ANIMATION_LIST) do

        for id, seq_id in pairs(cats) do

            if istable(seq_id) then

                for subid, subseq in pairs(seq_id) do

                    if istable(subseq) then

                        for lastid, lastseq in pairs(subseq) do

                            if isstring(lastseq) then

                                GLOBAL_ANIMATION_REFERENCE[ht][id][subid][lastid] = seq_list[lastseq] or lastseq

                            end

                        end

                    elseif isstring(subseq) then

                        GLOBAL_ANIMATION_REFERENCE[ht][id][subid] = seq_list[subseq] or subseq

                    end

                end

            elseif isstring(seq_id) then

                GLOBAL_ANIMATION_REFERENCE[ht][id] = seq_list[seq_id] or seq_id

            end

        end

    end

    timer.Simple(10, function()

        if IsValid(ent) then

            ent:Remove()

        end

    end)

end
hook.Add('InitPostEntity', 'loadSequences', AnimLoadSequences)