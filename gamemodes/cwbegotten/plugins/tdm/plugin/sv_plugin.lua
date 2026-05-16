--[[
    TDM РЕЖИМ - СЕРВЕРНАЯ ЧАСТЬ
--]]

if SERVER then
    util.AddNetworkString("TDM_UpdateScores")
    util.AddNetworkString("TDM_HUDState")
    util.AddNetworkString("TDM_UpdateTeams")
end

-- Маппинг сокращений на список фракций (одно сокращение может включать несколько фракций)
FACTION_MAPPING = {
    ["GORE"] = {"Goreic Warrior"},
    ["HOLY"] = {"Holy Hierarchy", "Gatekeeper", "Hillkeeper"},  -- Все фракции Сиянистов
    ["COS"] = {"Children of Satan"},
    ["DEAD"] = {"Deadlander"},
    ["SCRAP"] = {"Wanderer"}
}

-- Обратный маппинг для поиска (фракция -> сокращение)
REVERSE_FACTION_MAPPING = {
    ["Goreic Warrior"] = "GORE",
    ["Holy Hierarchy"] = "HOLY",
    ["Gatekeeper"] = "HOLY",
    ["Hillkeeper"] = "HOLY",
    ["Children of Satan"] = "COS",
    ["Deadlander"] = "DEAD",
    ["Wanderer"] = "SCRAP"
}

-- Для отображения названия команды в чате
TEAM_DISPLAY_NAMES = {
    ["GORE"] = "Goreic Warrior",
    ["HOLY"] = "Сиянисты (Holy/Gatekeeper/Hillkeeper)",
    ["COS"] = "Children of Satan",
    ["DEAD"] = "Deadlander",
    ["SCRAP"] = "Wanderer"
}

function cwTDM:BroadcastScores()
    net.Start("TDM_UpdateScores")
        local teamsList = GetActiveTeamsList()
        net.WriteUInt(#teamsList, 8)
        for _, teamName in ipairs(teamsList) do
            net.WriteString(teamName)
            net.WriteUInt(TDM_STATE.teams_scores[teamName] or 0, 16)
            net.WriteUInt(TDM_STATE.teams_deaths[teamName] or 0, 16)
        end
    net.Broadcast()
end

function cwTDM:BroadcastHUDState()
    net.Start("TDM_HUDState")
        net.WriteBool(TDM_CONFIG.show_hud and TDM_CONFIG.enabled)
    net.Broadcast()
end

function cwTDM:BroadcastTeamsUpdate()
    net.Start("TDM_UpdateTeams")
        local teamsList = GetActiveTeamsList()
        net.WriteUInt(#teamsList, 8)
        for _, teamName in ipairs(teamsList) do
            net.WriteString(teamName)
        end
    net.Broadcast()
end

function cwTDM:SendDataToPlayer(ply)
    net.Start("TDM_UpdateScores")
        local teamsList = GetActiveTeamsList()
        net.WriteUInt(#teamsList, 8)
        for _, teamName in ipairs(teamsList) do
            net.WriteString(teamName)
            net.WriteUInt(TDM_STATE.teams_scores[teamName] or 0, 16)
            net.WriteUInt(TDM_STATE.teams_deaths[teamName] or 0, 16)
        end
    net.Send(ply)
    
    net.Start("TDM_HUDState")
        net.WriteBool(TDM_CONFIG.show_hud and TDM_CONFIG.enabled)
    net.Send(ply)
    
    net.Start("TDM_UpdateTeams")
        local teamsList = GetActiveTeamsList()
        net.WriteUInt(#teamsList, 8)
        for _, teamName in ipairs(teamsList) do
            net.WriteString(teamName)
        end
    net.Send(ply)
end

function cwTDM:HandlePlayerKill(victim, attacker)
    if not IsValid(victim) or not IsValid(attacker) then return end
    if victim == attacker then return end
    if not TDM_CONFIG.enabled then return end
    
    local victimTeam = GetPlayerTDMTeam(victim)
    local attackerTeam = GetPlayerTDMTeam(attacker)
    
    if victimTeam and attackerTeam and victimTeam ~= attackerTeam then
        AddTDMPoints(attackerTeam, TDM_CONFIG.score_per_kill)
        AddTDMDeath(victimTeam)
        
        local victimShort = REVERSE_FACTION_MAPPING[victimTeam] or GetTeamShortName(victimTeam)
        local attackerShort = REVERSE_FACTION_MAPPING[attackerTeam] or GetTeamShortName(attackerTeam)
        
        local message = string.format("💀 [%s] убил [%s] | +1 очко для %s (Всего: %d)", 
            attackerShort, victimShort, attackerShort, TDM_STATE.teams_scores[attackerTeam])
        
        Clockwork.chatBox:Add(nil, nil, nil, nil, message)
    end
end

function cwTDM:SetupTDM(factionShortcuts)
    -- Очищаем старые данные
    TDM_CONFIG.active_factions = {}
    TDM_STATE.active_teams = {}
    TDM_STATE.teams_scores = {}
    TDM_STATE.teams_deaths = {}
    
    local normalizedShortcuts = {}
    local allFactions = {}
    
    -- Для каждого сокращения добавляем ВСЕ связанные с ним фракции
    for _, shortcut in ipairs(factionShortcuts) do
        local upperShortcut = string.upper(shortcut)
        local factionsList = FACTION_MAPPING[upperShortcut]
        
        if factionsList then
            table.insert(normalizedShortcuts, upperShortcut)
            
            for _, factionName in ipairs(factionsList) do
                table.insert(allFactions, factionName)
                TDM_CONFIG.active_factions[factionName] = true
                
                -- Находим команду для этой фракции
                if CAPTURE_TEAMS then
                    for teamName, teamData in pairs(CAPTURE_TEAMS) do
                        if teamData.factions then
                            for _, f in ipairs(teamData.factions) do
                                if f == factionName then
                                    TDM_STATE.active_teams[teamName] = true
                                    TDM_STATE.teams_scores[teamName] = 0
                                    TDM_STATE.teams_deaths[teamName] = 0
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    local activeTeamsList = GetActiveTeamsList()
    if #activeTeamsList < 2 then
        return false, "Нужно минимум 2 валидные фракции! Доступно: HOLY, GORE, COS, DEAD, SCRAP"
    end
    
    TDM_CONFIG.enabled = true
    TDM_CONFIG.show_hud = true
    
    self:BroadcastTeamsUpdate()
    self:BroadcastScores()
    self:BroadcastHUDState()
    
    -- Создаём красивое название для анонса
    local displayNames = {}
    for _, shortcut in ipairs(normalizedShortcuts) do
        table.insert(displayNames, TEAM_DISPLAY_NAMES[shortcut] or shortcut)
    end
    
    local shortcutsText = table.concat(displayNames, " vs ")
    Clockwork.chatBox:Add(nil, nil, nil, nil, "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    Clockwork.chatBox:Add(nil, nil, nil, nil, string.format("⚔️ TDM РЕЖИМ ВКЛЮЧЁН! ⚔️"))
    Clockwork.chatBox:Add(nil, nil, nil, nil, string.format("Участвуют: %s", shortcutsText))
    Clockwork.chatBox:Add(nil, nil, nil, nil, "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    
    return true
end

function cwTDM:DisableTDM()
    TDM_CONFIG.enabled = false
    TDM_CONFIG.show_hud = false
    TDM_CONFIG.active_factions = {}
    TDM_STATE.active_teams = {}
    TDM_STATE.teams_scores = {}
    TDM_STATE.teams_deaths = {}
    
    self:BroadcastTeamsUpdate()
    self:BroadcastScores()
    self:BroadcastHUDState()
    
    Clockwork.chatBox:Add(nil, nil, nil, nil, "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    Clockwork.chatBox:Add(nil, nil, nil, nil, "⏸️ TDM РЕЖИМ ВЫКЛЮЧЕН ⏸️")
    Clockwork.chatBox:Add(nil, nil, nil, nil, "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
end

hook.Add("PlayerDeath", "TDM_PlayerDeath", function(victim, inflictor, attacker)
    cwTDM:HandlePlayerKill(victim, attacker)
end)

hook.Add("PlayerInitialSpawn", "TDM_InitialSpawn", function(ply)
    timer.Simple(3, function()
        if IsValid(ply) then
            cwTDM:SendDataToPlayer(ply)
        end
    end)
end)

-- Функция для разбора аргументов
local function ParseArguments(args)
    if not args or #args == 0 then return {} end
    
    if #args == 1 and string.find(args[1], " ") then
        local parts = {}
        for part in string.gmatch(args[1], "%S+") do
            table.insert(parts, part)
        end
        return parts
    end
    
    return args
end

-- Команда: включить TDM
local COMMAND = Clockwork.command:New("TDMEnable")
COMMAND.tip = "Включить TDM. Пример: /tdmenable HOLY GORE"
COMMAND.text = "<HOLY/GORE/COS/DEAD/SCRAP> ..."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

function COMMAND:OnRun(player, arguments)
    local parsedArgs = ParseArguments(arguments)
    
    if #parsedArgs < 2 then
        Clockwork.player:Notify(player, "Нужно указать минимум 2 фракции! Пример: /tdmenable HOLY GORE")
        return
    end
    
    local shortcuts = {}
    for i = 1, #parsedArgs do
        local cleanArg = string.Trim(parsedArgs[i])
        local upperArg = string.upper(cleanArg)
        
        if FACTION_MAPPING[upperArg] then
            table.insert(shortcuts, upperArg)
        else
            Clockwork.player:Notify(player, string.format("Неизвестная фракция: '%s'. Доступно: HOLY, GORE, COS, DEAD, SCRAP", cleanArg))
            return
        end
    end
    
    if #shortcuts < 2 then
        Clockwork.player:Notify(player, "Нужно указать минимум 2 фракции!")
        return
    end
    
    local success, message = cwTDM:SetupTDM(shortcuts)
    if success then
        Clockwork.player:Notify(player, string.format("TDM режим включён с фракциями: %s", table.concat(shortcuts, ", ")))
    else
        Clockwork.player:Notify(player, message or "Ошибка при включении TDM режима!")
    end
end
COMMAND:Register()

-- Команда: выключить TDM
local COMMAND = Clockwork.command:New("TDMDisable")
COMMAND.tip = "Выключить TDM режим"
COMMAND.text = ""
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

function COMMAND:OnRun(player, arguments)
    cwTDM:DisableTDM()
    Clockwork.player:Notify(player, "TDM режим выключен!")
end
COMMAND:Register()

-- Команда: сброс счёта
local COMMAND = Clockwork.command:New("TDMReset")
COMMAND.tip = "Сбросить счёт TDM"
COMMAND.text = ""
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

function COMMAND:OnRun(player, arguments)
    if not TDM_CONFIG.enabled then
        Clockwork.player:Notify(player, "TDM режим не активен!")
        return
    end
    ResetTDMScores()
    Clockwork.player:Notify(player, "Счёт TDM сброшен!")
end
COMMAND:Register()

-- Команда: показать счёт
local COMMAND = Clockwork.command:New("TDMScores")
COMMAND.tip = "Показать текущий счёт TDM"
COMMAND.text = ""
COMMAND.flags = CMD_DEFAULT

function COMMAND:OnRun(player, arguments)
    if not TDM_CONFIG.enabled then
        player:ChatPrint("TDM режим не активен!")
        return
    end
    
    player:ChatPrint("=== ТЕКУЩИЙ СЧЁТ TDM ===")
    for teamName, score in pairs(TDM_STATE.teams_scores) do
        local shortName = REVERSE_FACTION_MAPPING[teamName] or GetTeamShortName(teamName)
        player:ChatPrint(string.format("%s: %d", shortName, score))
    end
end
COMMAND:Register()