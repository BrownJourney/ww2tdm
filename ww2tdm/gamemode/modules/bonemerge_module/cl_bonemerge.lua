local bonemerge = bonemerge;
bonemerge.info = bonemerge.info or {}
bonemerge.flexes = bonemerge.flexes or {}

hook.Add('NotifyShouldTransmit', 'bonemerge.NotifyShouldTransmit', function(ent, shouldTransmit) -- workaround-хук, так как в GMod при переходе в Dormant состояние parent с энтити спадает
    if ent:GetClass() == 'entity_bonemerge' then
        local owner = ent:GetOwner()
        if owner and owner:IsValid() and owner != ent:GetParent() then
            ent:SetParent(owner)
        end
    end
end)

function bonemerge:getModel(bmtype)
    if !bonemerge.info[bmtype] then
        return ''
    end
    
    return bonemerge.info[bmtype].model or ''
end

local ENTITY = FindMetaTable('Entity')

function ENTITY:clearBonemerges()
     for k, v in pairs(self:GetChildren()) do
        if v:GetClass() == 'entity_bonemerge' then
            v:Remove()
        end
    end
end

function ENTITY:createBonemerge( model, attach, bmskin, bmgroups )
    local parent = self
    local autoparent = BONEMERGE_AUTO_PARENT[attach]
    if autoparent and IsValid(self:getBonemergeEntity(autoparent)) then
        parent = self:getBonemergeEntity(autoparent)
    end
    attach = tostring(attach) or 'hands'

    for k, v in pairs(self:GetChildren()) do
        if v:GetClass() == 'entity_bonemerge' and v.attach == attach then
            v:Remove()
            break
        end
    end

    local bonemerge_ent = ents.CreateClientside('entity_bonemerge')
    bonemerge_ent:SetModel(model)
    bonemerge_ent:Spawn()

    if IsValid( parent ) then

        bonemerge_ent:SetOwner(parent)
        bonemerge_ent:SetParent(parent)

    end

    bonemerge_ent:SetMoveType( MOVETYPE_NONE )
    bonemerge_ent:SetLocalPos( vector_origin )
    bonemerge_ent:SetLocalAngles( angle_zero )
    bonemerge_ent:AddEffects( EF_BONEMERGE )
    bonemerge_ent:AddEffects( EF_BONEMERGE_FASTCULL )
    bonemerge_ent:AddEffects( EF_PARENT_ANIMATES )
    bonemerge_ent:DrawShadow( false )
    bonemerge_ent:SetSkin(bmskin or 0)
    for k, v in pairs(bmgroups or {}) do
        bonemerge_ent:SetBodygroup(k, v)
    end
    bonemerge_ent.attach = attach or 'head'
end
