--[[
    TDM РЕЖИМ - КЛИЕНТСКАЯ ЧАСТЬ
--]]

surface.CreateFont("TDMCounterFont", {
    font = "Trebuchet24",
    size = 28,
    weight = 800,
    antialias = true
})

surface.CreateFont("TDMLabelFont", {
    font = "Trebuchet24",
    size = 18,
    weight = 600,
    antialias = true
})

TDM_ClientData = TDM_ClientData or {
    teams_scores = {},
    teams_deaths = {},
    active_teams = {},
    show_hud = false
}

net.Receive("TDM_UpdateScores", function()
    local count = net.ReadUInt(8)
    
    TDM_ClientData.teams_scores = {}
    TDM_ClientData.teams_deaths = {}
    
    for i = 1, count do
        local teamName = net.ReadString()
        local score = net.ReadUInt(16)
        local deaths = net.ReadUInt(16)
        TDM_ClientData.teams_scores[teamName] = score
        TDM_ClientData.teams_deaths[teamName] = deaths
    end
end)

net.Receive("TDM_HUDState", function()
    TDM_ClientData.show_hud = net.ReadBool()
end)

net.Receive("TDM_UpdateTeams", function()
    local count = net.ReadUInt(8)
    TDM_ClientData.active_teams = {}
    
    for i = 1, count do
        local teamName = net.ReadString()
        table.insert(TDM_ClientData.active_teams, teamName)
    end
end)

function cwTDM:DrawCounter()
    if not TDM_ClientData.show_hud then return end
    if #TDM_ClientData.active_teams == 0 then return end
    
    local screenW = ScrW()
    local screenH = ScrH()
    
    local boxWidth = 400
    local boxHeight = 50
    local boxX = screenW / 2 - boxWidth / 2
    local boxY = screenH - 100
    
    draw.RoundedBox(4, boxX, boxY, boxWidth, boxHeight, Color(0, 0, 0, 180))
    surface.SetDrawColor(100, 100, 120, 200)
    surface.DrawOutlinedRect(boxX, boxY, boxWidth, boxHeight, 1)
    
    local teamCount = #TDM_ClientData.active_teams
    
    local teamWidth = (boxWidth - 40) / teamCount
    local currentX = boxX + 15
    local centerY = boxY + boxHeight / 2
    local index = 0
    
    for _, teamName in ipairs(TDM_ClientData.active_teams) do
        local score = TDM_ClientData.teams_scores[teamName] or 0
        local teamColor = GetTeamColor(teamName)
        local shortName = GetTeamShortName(teamName)
        
        draw.SimpleText(shortName, "TDMLabelFont", currentX + teamWidth / 2, centerY - 12, 
            teamColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        draw.SimpleText(tostring(score), "TDMCounterFont", currentX + teamWidth / 2, centerY + 8, 
            Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        if index < teamCount - 1 then
            surface.SetDrawColor(80, 80, 100, 150)
            surface.DrawRect(currentX + teamWidth + 2, boxY + 10, 1, boxHeight - 20)
        end
        
        currentX = currentX + teamWidth + 8
        index = index + 1
    end
end

hook.Add("HUDPaint", "TDM_HUDPaint", function()
    if cwTDM and cwTDM.DrawCounter then
        cwTDM:DrawCounter()
    end
end)