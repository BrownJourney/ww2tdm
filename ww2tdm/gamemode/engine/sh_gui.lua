Gui = Gui or {}

if CLIENT then

    Gui._RegisteredPanels = Gui._RegisteredPanels or {}

    function Gui.CreateVGUI(id, classname, parent, flag)

        if Gui.IsValidVGUI(id) then

            return Gui.GetVGUI(id)

        end

        local panel = vgui.Create(classname, parent)

        Gui._RegisteredPanels[id] = {panel = panel, flag = flag}

        return panel

    end

    function Gui.GetVGUI(id)

        if !Gui._RegisteredPanels[id] then

            return;

        end

        local panel = Gui._RegisteredPanels[id].panel

        return panel:IsValid() and panel or nil

    end

    function Gui.IsValidVGUI(id)

        if !Gui._RegisteredPanels[id] then

            return false

        end

        return IsValid(Gui._RegisteredPanels[id].panel)

    end

    function Gui.RemoveVGUI(id)
        
        if !Gui.IsValidVGUI(id) then

            return

        end


        Gui.GetVGUI(id):Remove()
        Gui._RegisteredPanels[id] = nil;

    end

    function Gui.RemoveAllVGUI(exception)

        local flags = istable(exception) and exception or {}

        for k, v in pairs(Gui._RegisteredPanels) do

            if table.HasValue(flags, v.flag) then

                continue

            end

            Gui.RemoveVGUI(k)

        end

    end

    function Gui.AwaitLoad(id, callback, value)

        if !Gui.Callbacks then

            Gui.Callbacks = {}

        end

        Gui.Callbacks[id] = callback

        net.Start("GuiRequestLoad")

            net.WriteString(id)
            net.WriteString(value or "")

        net.SendToServer()

    end

    --[[-------------------------------------------------------------------------
    ACCESSORIES
    ---------------------------------------------------------------------------]]

    function Gui.FrameBlur(panel, amount)

        local blur = Material("pp/blurscreen");
        local x, y = panel:LocalToScreen(0, 0);
        local scrW, scrH = ScrW(), ScrH();

        surface.SetDrawColor(255, 255, 255);
        surface.SetMaterial(blur);
        surface.SetDrawColor(255, 255, 255)

        for i = 1, 3 do

            blur:SetFloat("$blur", (i / 3) * (amount or 6));
            blur:Recompute();
            render.UpdateScreenEffectTexture();
            surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH);

        end

    end

    --[[-------------------------------------------------------------------------
    NET
    ---------------------------------------------------------------------------]]

    net.Receive('ShowUI', function()

        local id 		= net.ReadString()
        local netData 	= net.ReadTable()

        hook.Run('RequestedUI', id, netData)

    end)

    net.Receive('CloseUI', function()

        local id = net.ReadString()

        Gui.RemoveVGUI(id)

    end)

    net.Receive('CloseAllUI', function()

        local exception = net.ReadTable()

        Gui.RemoveAllVGUI(exception)

    end)

    net.Receive('GuiRequestLoad', function()

        local id = net.ReadString()
        local data = net.ReadTable()

        if !Gui.Callbacks or !Gui.Callbacks[id] then

            return

        end

        Gui.Callbacks[id](data)

    end)

    --[[-------------------------------------------------------------------------
    CONCOMMANDS
    ---------------------------------------------------------------------------]]

    concommand.Add( "pos", function( ply, cmd, args ) -- because 'getpos' concommand is too fucking ugly. that is so much prettier
        local pos = ply:GetPos()
        local ang = ply:GetAngles()

        local FUCKING_GOOD_STRING = math.Round(pos.x)..', '..math.Round(pos.y)..', '..math.Round(pos.z)..'; '..math.Round(ang.p)..', '..math.Round(ang.y)..', '..math.Round(ang.r)

        print(FUCKING_GOOD_STRING)
    end )

    concommand.Add( "doorid", function( ply, cmd, args )

        print(ply:GetEyeTrace().Entity:EntIndex())
    end )

    concommand.Add( "hitpos", function( ply, cmd, args )
        local pos = ply:GetEyeTrace().HitPos

        local FUCKING_GOOD_STRING = math.Round(pos.x)..', '..math.Round(pos.y)..', '..math.Round(pos.z)..' '

        print(FUCKING_GOOD_STRING)
    end )


    concommand.Add( "entpos", function( ply, cmd, args )
        local ent = ply:GetEyeTrace().Entity
        local pos = ent:GetPos()
        local ang = ent:GetAngles()
        local FUCKING_GOOD_STRING = math.Round(pos.x)..', '..math.Round(pos.y)..', '..math.Round(pos.z)..'; '..math.Round(ang.p)..', '..math.Round(ang.y)..', '..math.Round(ang.r)

        print(FUCKING_GOOD_STRING)
    end )

    concommand.Add( "ent", function( ply, cmd, args )
        local ent = ply:GetEyeTrace().Entity

        print(ent)
    end )

end

if SERVER then

    local dataLoaders = {}
    local PLAYER = FindMetaTable('Player')

    util.AddNetworkString('ShowUI')
    function PLAYER:ShowUI(id, netData)

        net.Start('ShowUI')
            net.WriteString(id)
            net.WriteTable(netData or {})
        net.Send(self)

    end

    util.AddNetworkString('CloseUI')
    function PLAYER:CloseUI(id)

        net.Start('CloseUI')
            net.WriteString(id)
        net.Send(self)

    end

    util.AddNetworkString('CloseAllUI')
    function PLAYER:CloseAllUI(exception)

        exception = istable(exception) and exception or {}

        net.Start('CloseAllUI')
            net.WriteTable(exception)
        net.Send(self)

    end

    --[[-------------------------------------------------------------------------
    NET
    ---------------------------------------------------------------------------]]

    util.AddNetworkString("GuiRequestLoad")
    net.Receive("GuiRequestLoad", function(len, ply)

        local id = net.ReadString()
        local value = net.ReadString()
        local dataLoader = dataLoaders[id]

        if !dataLoader then

            return

        end

        local playerData = dataLoader(ply, value)
        net.Start("GuiRequestLoad")

            net.WriteString(id)
            net.WriteTable(playerData)

        net.Send(ply)

    end)

    util.AddNetworkString("PlayerLoaded")
    net.Receive("PlayerLoaded", function(len, ply)
        hook.Run("PlayerFullyLoaded", ply)
    end)

    --[[-------------------------------------------------------------------------
    LOADERS
    ---------------------------------------------------------------------------]]

    local function AddLoader(id, callback)
        dataLoaders[id] = callback
    end

    AddLoader("stats", function(ply)
        return ply:GetPerm("stats", {})
    end)

    AddLoader("classlevel", function(ply)
        local loadout = {}
        local classData = ply:GetPerm("classBought", {})[CLASS_GENERAL]

        if classData and classData[ply:GetClass()] then

            loadout = classData[ply:GetClass()]

        end

        return {progression = ply:GetClassProgression(ply:GetClass()), loadouts = loadout}
    end)

    AddLoader("canunlock", function(ply, id)
        local canUnlock = true
        local faction = ply:GetFaction()
        if !faction then
            return false
        end

        local class = faction:Class(id)
        if !class then
            return
        end

        if class:GetBase() then
            canUnlock = ply:GetClassProgression(class:GetBase()).level >= CFG.ClassMaxLevel
        end

        return {canUnlock}
    end)

    AddLoader("tasks", function(ply)
        return ply:GetPerm("tasks", {})
    end)

    AddLoader("leaderboard", function(ply)
        return gData.get("leaderboard")
    end)

    AddLoader("charparams", function(ply)
        return ply:CollectParams()
    end)

end