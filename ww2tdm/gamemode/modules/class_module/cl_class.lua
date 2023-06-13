
local PLAYER = FindMetaTable('Player')

CLASS_STORED = CLASS_STORED or {}

IS_WARRIOR_PACKAGE_PURCHASED = IS_WARRIOR_PACKAGE_PURCHASED or false

function ShowClassDetails(clData, selectedLoadout)

	local loadout = clData.Variants

	if loadout and loadout[selectedLoadout] then

		local clMerged = table.Copy(clData)

		table.SafeMerge(clMerged, loadout[selectedLoadout])

		return clMerged

	end

	return clData

end

function IsClassBought(id)

	local faction = LocalPlayer():GetFaction()
	if !faction then

		return false

	end

	local class = faction:Class(id)
	if !class then

		return false

	end

	if id == BASE_CLASS or class.Cost == 0 then

		return true

	end

	if LocalPlayer():HasUnlockedEverything() then

		return true

	end

	return CLASS_STORED[id]

end

function IsLoadoutBought(classid, loadoutid)

	if loadoutid == 0 then
		
		return true

	end

	local faction = LocalPlayer():GetFaction()
	if !faction then

		return false

	end

	local class = faction:Class(LocalPlayer():GetClass())
	if !class then

		return false

	end

	local loadoutInfo = ShowClassDetails(class, loadoutid)
	if !loadoutInfo then

		return false

	end

	if LocalPlayer():HasUnlockedEverything() then

		return true

	end

	if loadoutInfo:GetCost() == 0 then

		return true

	end

	local clStored = CLASS_STORED[classid]

	if !clStored then

		return false

	end

	return table.ContainValue(clStored, loadoutid)

end

--[[-------------------------------------------------------------------------
HOOKS
---------------------------------------------------------------------------]]

hook.Add("NetworkIntReceived", "CatchWarriorPackage", function(ply, id, var)
	if id == "warrior_package" and var == 1 then
		IS_WARRIOR_PACKAGE_PURCHASED = true
	end
end)

--[[-------------------------------------------------------------------------
NET
---------------------------------------------------------------------------]]

net.Receive("ClearClassInfo", function()

	CLASS_STORED = {}

end)

net.Receive("UpdateClassInfo", function()

	local classid = net.ReadString()
	local loadouts = net.ReadTable()

	CLASS_STORED[classid] = loadouts

end)