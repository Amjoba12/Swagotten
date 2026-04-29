--[[
    СИСТЕМА ЗАХВАТА ТОЧЕК - СЕРВЕРНАЯ ЧАСТЬ
--]]

if SERVER then
    util.AddNetworkString("Capture_UpdatePoints")
    util.AddNetworkString("Capture_CreatePoint")
    util.AddNetworkString("Capture_RemovePoint")
    util.AddNetworkString("Capture_UpdateConfig")
end

cwCaptureSystem.Config = cwCaptureSystem.Config or {
    Teams = CAPTURE_TEAMS or {},
    Points = {},
    CaptureSettings = {
        default_radius = 300,
        default_time = 120,
        update_interval = 1,
        render_distance = 5000,
        min_players_capture = 1,
        decay_rate = 0.02
    }
}

cwCaptureSystem.State = cwCaptureSystem.State or {
    Points = {},
    TeamStats = {}
}

function cwCaptureSystem:InitializeCaptureState()
    self.State.Points = {}
    self.State.TeamStats = {}
    
    for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
        self.State.TeamStats[teamName] = {
            total_time = 0,
            players_count = 0
        }
    end
    
    local index = 1
    
    for _, ent in pairs(ents.GetAll()) do
        if ent.CapturePoint then
            ent:Remove()
        end
    end
    
    for i, point in ipairs(self.Config.Points) do
        self.State.Points[index] = {
            name = point.name,
            position = point.pos,
            radius = point.radius,
            capture_time = point.time,
            capturing_team = nil,
            capture_progress = 0,
            owner_team = nil,
            progress_team = nil,

            players_inside = {},
            entity = nil,
            ownership_timers = {},
            last_update = CurTime()
        }

        
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            self.State.Points[index].ownership_timers[teamName] = 0
        end
        
        index = index + 1
    end
    
    for _, point in ipairs(self.State.Points) do
        local ent = ents.Create("prop_physics")
        if not IsValid(ent) then continue end
        
        ent:SetModel("models/hunter/plates/plate05x05.mdl")
        ent:SetPos(point.position)
        ent:SetColor(Color(120, 120, 120, 0))
        ent:SetMaterial("models/props_combine/stasisshield_sheet")
        ent:Spawn()
        ent:SetAngles(Angle(0, 0, 0))
        
        local phys = ent:GetPhysicsObject()
        if IsValid(phys) then
            phys:EnableMotion(false)
            phys:Sleep()
        end
        
        ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
        ent:SetSolid(SOLID_NONE)
        ent:SetMoveType(MOVETYPE_NONE)
        ent:SetRenderMode(RENDERMODE_TRANSALPHA)
        ent:SetModelScale(1.5, 0)
        
        ent.CapturePoint = true
        ent.PointData = point
        
        point.entity = ent
    end
    
    self.Config.Teams = CAPTURE_TEAMS or {}
    self:BroadcastConfig()
    self:BroadcastPointUpdate()
end

function cwCaptureSystem:BroadcastConfig()
    local configToSend = {
        Teams = CAPTURE_TEAMS or {},
        Points = self.Config.Points or {},
        CaptureSettings = self.Config.CaptureSettings or {}
    }
    
    net.Start("Capture_UpdateConfig")
        net.WriteTable(configToSend)
    net.Broadcast()
end

if SERVER then
    net.Receive("Capture_CreatePoint", function(len, ply)
        if not ply:IsAdmin() then
            return
        end
        
        local name = net.ReadString()
        local radius = net.ReadFloat()
        local time = net.ReadFloat()
        local pos = net.ReadVector()
        
        local newPoint = {
            name = name,
            pos = pos,
            radius = radius,
            time = time,
            creator = ply:SteamID(),
            created = os.time()
        }
        
        table.insert(cwCaptureSystem.Config.Points, newPoint)
        cwCaptureSystem:InitializeCaptureState()
        
        cwCaptureSystem:BroadcastPointUpdate()
    end)
    
    net.Receive("Capture_RemovePoint", function(len, ply)
        if not ply:IsAdmin() then
            return
        end
        
        local pointPos = net.ReadVector()
        local removed = false
        
        for i = #cwCaptureSystem.Config.Points, 1, -1 do
            local point = cwCaptureSystem.Config.Points[i]
            if point.pos:Distance(pointPos) < 100 then
                table.remove(cwCaptureSystem.Config.Points, i)
                removed = true
                break
            end
        end
        
        if removed then
            for _, point in ipairs(cwCaptureSystem.State.Points) do
                if point.entity and IsValid(point.entity) and 
                point.entity:GetPos():Distance(pointPos) < 100 then
                    point.entity:Remove()
                    break
                end
            end
            
            cwCaptureSystem:InitializeCaptureState()
            cwCaptureSystem:BroadcastPointUpdate()
        end
    end)
    
    function cwCaptureSystem:BroadcastPointUpdate()
        if not self.State.Points then 
            return 
        end
        
        net.Start("Capture_UpdatePoints")
            net.WriteUInt(#self.State.Points, 8)
            for _, point in ipairs(self.State.Points) do
                net.WriteVector(point.position)
                net.WriteFloat(point.capture_progress or 0)
                net.WriteString(point.owner_team or "")
                net.WriteString(point.capturing_team or "")
                net.WriteString(point.progress_team or "") -- Команда-владелец прогресса
                net.WriteString(point.name or "")
                net.WriteFloat(point.radius or 300)
                
                for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
                    net.WriteFloat(point.ownership_timers[teamName] or 0)
                end
            end
        net.Broadcast()
    end

    
    function cwCaptureSystem:SendPointsToPlayer(ply)
        if not IsValid(ply) or not self.State or not self.State.Points then 
            return 
        end
        
        net.Start("Capture_UpdateConfig")
            net.WriteTable(self.Config)
        net.Send(ply)
        
        net.Start("Capture_UpdatePoints")
            net.WriteUInt(#self.State.Points, 8)
            for _, point in ipairs(self.State.Points) do
                net.WriteVector(point.position)
                net.WriteFloat(point.capture_progress or 0)
                net.WriteString(point.owner_team or "")
                net.WriteString(point.capturing_team or "")
                net.WriteString(point.progress_team or "") -- Команда-владелец прогресса
                net.WriteString(point.name or "")
                net.WriteFloat(point.radius or 300)
                
                for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
                    net.WriteFloat(point.ownership_timers[teamName] or 0)
                end
            end
        net.Send(ply)

    end
end

hook.Add("PlayerInitialSpawn", "Capture_SendPointsToNewPlayer", function(ply)
    timer.Simple(3, function()
        if IsValid(ply) and cwCaptureSystem.SendPointsToPlayer then
            cwCaptureSystem:SendPointsToPlayer(ply)
        end
    end)
end)
