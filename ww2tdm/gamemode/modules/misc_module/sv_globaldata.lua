gData = gData or {}
gData.Data = gData.Data or {}

function gData.InitializeData()
	if !file.IsDir('globaldata', 'DATA') then
		file.CreateDir('globaldata')
	end
end

function gData.LoadData()
	gData.InitializeData()

	local files, folders = file.Find('globaldata/' .. "*", "DATA")
	for _, f in pairs(files) do
		local index = string.Split(f, '.')[1]
		gData.Data[index] = util.JSONToTable(file.Read('globaldata/'..f, "DATA"))
	end
end

function gData.Get()
	return gData.Data
end

function gData.SaveData(index, data)
	local json = util.TableToJSON(data)
	if !json then return end
	file.Write('globaldata/'..index..'.txt', json)
end

--[[-------------------------------------------------------------------------
UTIL
---------------------------------------------------------------------------]]

function gData.CreateTable(index, basetable)
	if gData.TableExists(index) then
		return gData.get(index)
	end

	local tbl = {}
	if istable(basetable) then
		tbl = basetable
	end

	gData.Data[index] = tbl

	gData.SaveData(index, tbl)

	return tbl
end

function gData.TableExists(index)
	if !gData.Data then
		gData.InitializeData()
	end
	
	if gData.Data[index] then
		return true
	end

	return false
end

function gData.get(index)
	if gData.TableExists(index) then
		return gData.Data[index]
	end

	return nil
end

function gData.ChangeTable(index, tbl)
	if !gData.TableExists(index) then
		gData.CreateTable(index, tbl)
	end

	gData.Data[index] = tbl

	gData.SaveData(index, tbl)
end

function gData.RemoveTable(index)
	if !gData.TableExists(index) then
		return
	end

	gData.Data[index] = nil
	file.Delete('globaldata/'..index..'.txt')
end

gData.LoadData()

--[[-------------------------------------------------------------------------
VARS
---------------------------------------------------------------------------]]

gVars = {}

function gVars.SetVar(id, value)
	gData.CreateTable("vars")

	local data = gData.get("vars")
	data[id] = value

	gData.ChangeTable("vars", data)
end

function gVars.GetVar(id)
	local data = gData.get("vars")

	if !data then return nil end

	return data[id]
end