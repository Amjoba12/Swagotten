--[[
    TDM РЕЖИМ - ОБЩАЯ ЧАСТЬ
--]]

PLUGIN:SetGlobalAlias("cwTDM");

TDM_CONFIG = TDM_CONFIG or {
    score_per_kill = 1,
    enabled = false,
    show_hud = false,
    active_factions = {}  -- список активных фракций в TDM
}

TDM_STATE = TDM_STATE or {
    teams_scores = {},
    teams_deaths = {},
    active_teams = {}  -- команды, участвующие в TDM
}

Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");

function GetPlayerTDMTeam(ply)
    if not IsValid(ply) then return nil end
    local faction = ply:GetFaction()
    if not faction then return nil end
    
    -- Проверяем, участвует ли фракция в TDM
    if not TDM_CONFIG.active_factions[faction] then
        return nil
    end
    
    -- Ищем команду для этой фракции
    if CAPTURE_TEAMS then
        for teamName, teamData in pairs(CAPTURE_TEAMS) do
            if teamData.factions then
                for _, factionName in ipairs(teamData.factions) do
                    if factionName == faction then
                        return teamName
                    end
                end
            end
        end
    end
    return nil
end

function AddTDMPoints(teamName, points)
    if not TDM_STATE.active_teams[teamName] then return end
    TDM_STATE.teams_scores[teamName] = (TDM_STATE.teams_scores[teamName] or 0) + points
    if SERVER then
        cwTDM:BroadcastScores()
    end
end

function AddTDMDeath(teamName)
    if not TDM_STATE.active_teams[teamName] then return end
    TDM_STATE.teams_deaths[teamName] = (TDM_STATE.teams_deaths[teamName] or 0) + 1
    if SERVER then
        cwTDM:BroadcastScores()
    end
end

function ResetTDMScores()
    for teamName, _ in pairs(TDM_STATE.active_teams) do
        TDM_STATE.teams_scores[teamName] = 0
        TDM_STATE.teams_deaths[teamName] = 0
    end
    if SERVER then
        cwTDM:BroadcastScores()
    end
end

function GetActiveFactionsList()
    local list = {}
    for faction, _ in pairs(TDM_CONFIG.active_factions) do
        table.insert(list, faction)
    end
    return list
end

function GetActiveTeamsList()
    local list = {}
    for team, _ in pairs(TDM_STATE.active_teams) do
        table.insert(list, team)
    end
    return list
end