local bonemerge = bonemerge;

local mPly = FindMetaTable('Player')
local mEnt = FindMetaTable('Entity')

function bonemerge:checkCompability(model)
    local models = self.precacheModels
    if models[model] then
        return true
    end

    return false
end

util.AddNetworkString('bm_add')
function mEnt:createBonemerge(model, bmType, bmSkin, bmBodygroups)
    if !util.IsValidModel(model) then return end
    if !isstring(bmType) then
        bmType = 'head'
    end
    if !isnumber(bmSkin) then
        bmSkin = 0
    end
    self:clearBonemerge(bmType, true)

    local parent = self
    local autoparent = BONEMERGE_AUTO_PARENT[bmType]
    if autoparent and IsValid(self:getBonemergeEntity(autoparent)) then
        parent = self:getBonemergeEntity(autoparent)
    end

    local bonemerge_ent = ents.Create('entity_bonemerge')
    bonemerge_ent:SetModel( model )
    bonemerge_ent:Spawn()
    bonemerge_ent:SetOwner( self )
    bonemerge_ent:SetParent( parent )
    bonemerge_ent:SetLocalPos( vector_origin )
    bonemerge_ent:SetLocalAngles( angle_zero )
    bonemerge_ent:SetMoveType( MOVETYPE_NONE )
    bonemerge_ent:AddEffects( EF_BONEMERGE )
    bonemerge_ent:AddEffects( EF_BONEMERGE_FASTCULL )
    bonemerge_ent:AddEffects( EF_PARENT_ANIMATES )
    bonemerge_ent:DrawShadow( true )
    bonemerge_ent.bmtype = bmType
    bonemerge_ent:SetSkin(bmSkin)
    for k, v in pairs(bmBodygroups or {}) do
        bonemerge_ent:SetBodygroup(k, v)
    end

    if BONEMERGE_HAIR_RESTRICTED[bmType] then
        self:clearBonemerge('hair')
    end

    return bonemerge_ent
end

function bonemerge.test(pl)
    local ply = IsValid(pl) and pl or Bro()
    ply:clearBonemerges()
    ply:SetModel("models/german/main_head/head_german.mdl")
    ply:SetSkin(math.random(1, 23))
    local body = ply:createBonemerge("models/german/body/m42_smock.mdl", "body")
    ply:createBonemerge("models/german/legs/cotton_pants_camo.mdl", "legs")
    body:createBonemerge("models/german/gear/gear_main.mdl", "gear", 0, {
        [1] = math.random(1, 3),
        [2] = math.random(1, 3),
        [3] = math.random(1, 3),
        [4] = math.random(1, 3),
    })
    local backpack_group = math.random(1, 8)
    print(backpack_group)
    body:createBonemerge("models/german/gear/gear_backpacks.mdl", "backpack", 0, {
        [0] = backpack_group
    })
    ply:createBonemerge("models/german/head/m38_helmet.mdl", "helmet", math.random(0, 1), {
        [1] = math.random(1, 2),
        [2] = math.random(0, 5)
    })
end

function mEnt:getBonemergeTable()
    local tbl = {}
    for k, v in pairs(self:getBonemergedEntities()) do
        tbl[v.bmtype] = v:GetModel()
    end

    return tbl
end

util.AddNetworkString('bm_addsub')
function mEnt:SetBonemergeSubmaterial(bmType, index, material)
    local ent = self:getBonemergeEntity(bmType)
    if !IsValid(ent) then return end
    ent:SetSubMaterial(index, material)
    if string.find(ent:GetMaterials()[1], 'eye') then
        ent:SetSubMaterial(index + 1, material)
    end
    self:SetNetString('BM_SubMat' .. index, material)
end

function bonemerge.reloadBonemerges(ply)
    local tbl = ply:getBonemergedEntities()
    for k, v in pairs(tbl) do
        ply:createBonemerge(v:GetModel(), v.bmtype, v:GetSkin())

        v:Remove()
    end
end

function mEnt:getBonemergeModel(bmType)
    local list = self:getBonemergedEntities()
    for k, v in pairs(list) do
        if v.bmtype == bmType then
            return v:GetModel()
        end
    end

    return nil
end

util.AddNetworkString('bm_clear')
function mEnt:clearBonemerges()
    local tbl = self:getBonemergedEntities()
    for k, ent in pairs(tbl) do
        ent:Remove()
    end
end

function mEnt:clearBonemerge(bmType)
    local tbl = self:getBonemergedEntities()
    for k, ent in pairs(tbl) do
        if ent.bmtype == bmType then
            ent:Remove()
        end
    end
end
