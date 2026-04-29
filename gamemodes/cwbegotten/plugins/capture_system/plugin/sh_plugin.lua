--[[
    СИСТЕМА ЗАХВАТА ТОЧЕК - ОБЩАЯ ЧАСТЬ
    Для Clockwork (Begotten III)
--]]

PLUGIN:SetGlobalAlias("cwCaptureSystem");

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

CAPTURE_TEAMS = CAPTURE_TEAMS or {
    ["Сиянисты"] = {
        name = "Сиянисты",
        short_name = "СИ",
        color = Color(255, 255, 0),
        factions = {"Holy Hierarchy", "Gatekeeper", "Hillkeeper"}
    },
    ["Горы"] = {
        name = "Горы",
        short_name = "ГОР",
        color = Color(139, 69, 19),
        factions = {"Goreic Warrior"}
    },
    ["Мертвоземцы"] = {
        name = "Мертвоземцы",
        short_name = "МЗ",
        color = Color(220, 220, 220),
        factions = {"Deadlander"}
    },
    ["Истинные Сыны"] = {
        name = "Истинные Сыны",
        short_name = "ИС",
        color = Color(255, 0, 0),
        factions = {"Children of Satan"}
    },
    ["Скрапперы"] = {
        name = "Скрапперы",
        short_name = "СКР",
        color = Color(183, 65, 14),
        factions = {"Wanderer"}
    }
}

CAPTURE_TEAMS_ORDER = CAPTURE_TEAMS_ORDER or {
    "Сиянисты",
    "Горы", 
    "Мертвоземцы",
    "Истинные Сыны",
    "Скрапперы"
}

FACTION_TO_TEAM = FACTION_TO_TEAM or {}
for teamName, teamData in pairs(CAPTURE_TEAMS) do
    for _, factionName in ipairs(teamData.factions) do
        FACTION_TO_TEAM[factionName] = teamName
    end
end

function GetPlayerTeam(ply)
    if not IsValid(ply) then return nil end
    local faction = ply:GetFaction()
    if not faction then return nil end
    return FACTION_TO_TEAM[faction]
end

function FormatCaptureTime(seconds)
    if not seconds then return "0s" end
    seconds = math.floor(seconds)
    
    if seconds < 60 then
        return string.format("%.0fs", seconds)
    elseif seconds < 3600 then
        local minutes = math.floor(seconds / 60)
        local secs = math.floor(seconds % 60)
        return string.format("%d:%02d", minutes, secs)
    else
        local hours = math.floor(seconds / 3600)
        local minutes = math.floor((seconds % 3600) / 60)
        return string.format("%dh%02d", hours, minutes)
    end
end

function GetTeamColor(teamName)
    if not teamName or teamName == "" then 
        return Color(200, 200, 200)
    end
    
    local teamData = CAPTURE_TEAMS[teamName]
    if teamData and teamData.color then
        return Color(teamData.color.r, teamData.color.g, teamData.color.b)
    end
    
    if type(teamName) == "string" then
        for name, data in pairs(CAPTURE_TEAMS) do
            if string.lower(name) == string.lower(teamName) then
                return Color(data.color.r, data.color.g, data.color.b)
            end
        end
    end
    
    return Color(200, 200, 200)
end

function GetTeamName(teamName)
    if not teamName or teamName == "" then return "Нейтральная" end
    local teamData = CAPTURE_TEAMS[teamName]
    if teamData and teamData.name then
        return teamData.name
    end
    return teamName
end

function GetTeamShortName(teamName)
    if not teamName or teamName == "" then return "НТР" end
    local teamData = CAPTURE_TEAMS[teamName]
    if teamData and teamData.short_name then
        return teamData.short_name
    end
    return string.sub(teamName, 1, 3)
end

function PLUGIN:Initialize()
    cwCaptureSystem.Config = cwCaptureSystem.Config or {
        Teams = CAPTURE_TEAMS or {},
        Points = {},
        CaptureSettings = {
            default_radius = 300,
            default_time = 120,
            update_interval = 1,
            render_distance = 5000,
            min_players_capture = 1,
            decay_rate = 0.02,
            min_capture_percent = 0.01,    -- 1% для захвата
            ownership_threshold = 1.0      -- 100% для статистики
        }
    }
    
    cwCaptureSystem.State = cwCaptureSystem.State or {
        Points = {},
        TeamStats = {}
    }
end

PLUGIN:Initialize();

local COMMAND = Clockwork.command:New("CaptureCreate");
COMMAND.tip = "Создать точку захвата.";
COMMAND.text = "<string Название> <number Радиус> <number Время>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 3;

function COMMAND:OnRun(player, arguments)
    local name = arguments[1] or "Точка"
    local radius = tonumber(arguments[2]) or 300
    local time = tonumber(arguments[3]) or 30
    
    local tr = player:GetEyeTrace()
    if not tr.Hit then
        Clockwork.player:Notify(player, "Смотри на поверхность!")
        return
    end
    
    if SERVER then
        local newPoint = {
            name = name,
            pos = tr.HitPos,
            radius = radius,
            time = time,
            creator = player:SteamID(),
            created = os.time()
        }
        
        table.insert(cwCaptureSystem.Config.Points, newPoint)
        cwCaptureSystem:InitializeCaptureState()
        Clockwork.player:Notify(player, "Точка '" .. name .. "' создана!")
        
        cwCaptureSystem:BroadcastPointUpdate()
    end
end

COMMAND:Register();

local COMMAND = Clockwork.command:New("CaptureList");
COMMAND.tip = "Показать список точек захвата.";
COMMAND.flags = CMD_DEFAULT;

function COMMAND:OnRun(player, arguments)
    if SERVER then
        if not cwCaptureSystem.State.Points then return end
        
        player:ChatPrint("=== ТОЧКИ ЗАХВАТА ===")
        for i, point in ipairs(cwCaptureSystem.State.Points) do
            local owner = point.owner_team or "Никто"
            local progress = math.floor((point.capture_progress or 0) * 100)
            player:ChatPrint(string.format("%d. %s - %s (%d%%)", i, point.name, owner, progress))
        end
        
        player:ChatPrint("=== СТАТИСТИКА ПО ВРЕМЕНИ ===")
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            local stats = cwCaptureSystem.State.TeamStats[teamName]
            if stats then
                player:ChatPrint(string.format("%s: %s", 
                    teamName, 
                    FormatCaptureTime(stats.total_time or 0)
                ))
            end
        end
    end
end

COMMAND:Register();

local COMMAND = Clockwork.command:New("CaptureClear");
COMMAND.tip = "Удалить все точки захвата.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";

function COMMAND:OnRun(player, arguments)
    if SERVER then
        for _, ent in pairs(ents.GetAll()) do
            if ent.CapturePoint then
                ent:Remove()
            end
        end
        
        cwCaptureSystem.Config.Points = {}
        
        cwCaptureSystem:InitializeCaptureState()
        cwCaptureSystem:BroadcastPointUpdate()
        
        Clockwork.player:Notify(player, "Все точки удалены!")
    end
end

COMMAND:Register();

local COMMAND = Clockwork.command:New("CaptureRemove")
COMMAND.tip = "Удалить ближайшую точку захвата."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

function COMMAND:OnRun(player, arguments)
    if SERVER then
        local plyPos = player:GetPos()
        local closestDist = math.huge
        local closestPoint = nil
        local closestIndex = 0
        
        for i, point in ipairs(cwCaptureSystem.Config.Points or {}) do
            local dist = plyPos:Distance(point.pos)
            if dist < closestDist then
                closestDist = dist
                closestPoint = point
                closestIndex = i
            end
        end
        
        if closestPoint then
            for _, ent in pairs(ents.GetAll()) do
                if ent.CapturePoint and ent:GetPos():Distance(closestPoint.pos) < 50 then
                    ent:Remove()
                    break
                end
            end
            
            table.remove(cwCaptureSystem.Config.Points, closestIndex)
            
            if cwCaptureSystem.InitializeCaptureState then
                cwCaptureSystem:InitializeCaptureState()
            end
            
            if cwCaptureSystem.BroadcastPointUpdate then
                cwCaptureSystem:BroadcastPointUpdate()
            end
            
            Clockwork.player:Notify(player, "Точка '" .. closestPoint.name .. "' удалена!")
        else
            Clockwork.player:Notify(player, "Рядом нет точек!")
        end
    end
end

COMMAND:Register()