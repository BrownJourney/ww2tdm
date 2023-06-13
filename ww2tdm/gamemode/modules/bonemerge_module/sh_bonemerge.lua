bonemerge = bonemerge or {}

BONEMERGE_HAIR_RESTRICTED = {
    ['head'] = true,
    ['helmet'] = true,
    ['headup'] = true,
    ['head_extra'] = true,
}

BONEMERGE_AUTO_PARENT = {
    ['gear'] = "body",
    ['backpack'] = "body"
}

local mPly = FindMetaTable('Player')
local mEnt = FindMetaTable('Entity')

function mPly:getRagdoll()
    return self:GetNWEntity('Ragdollentity')
end

function mPly:GetBody()
	if SERVER then
		return self:getBonemergeModel("body")
	else
		return bonemerge:getModel("body")
	end
end

function mPly:GetHead()
    return self:GetModel()
end

function mEnt:GetSubHead()
	local value = self:GetNWString('BM_SubMat0', '')
	if value == '' then value = 0 end
	return value
end

function mEnt:GetBodygroupByName(name)
	for k, v in pairs(self:GetBodyGroups()) do
		if v.name == name then
			return v.id
		end
	end

	return -1
end

function mEnt:getBonemergedEntities()
    local bmEntities = {}
    for k, v in pairs(self:GetChildren()) do
        if v:GetClass() == 'entity_bonemerge' then
            table.insert(bmEntities, v)
        end
    end

    return bmEntities
end

function mEnt:getBonemergeEntity(bmType)
    local list = self:getBonemergedEntities()
    for k, v in pairs(list) do
        if v.bmtype == bmType then
            return v
        end
    end

    return nil
end
