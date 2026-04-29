--[[
    СИСТЕМА ЗАХВАТА ТОЧЕК - КЛИЕНТСКАЯ ЧАСТЬ
--]]

cwCaptureSystem.CaptureData = cwCaptureSystem.CaptureData or {
    Points = {},
    Config = {
        Teams = {}
    }
}

net.Receive("Capture_UpdateConfig", function()
    local config = net.ReadTable()
    cwCaptureSystem.CaptureData.Config = config
    
    if config.Teams then
        CAPTURE_TEAMS = config.Teams
    end
    
    if not CAPTURE_TEAMS_ORDER then
        CAPTURE_TEAMS_ORDER = {}
        for teamName, _ in pairs(CAPTURE_TEAMS or {}) do
            table.insert(CAPTURE_TEAMS_ORDER, teamName)
        end
    end
end)

surface.CreateFont("CapturePointFont", {
    font = "Trebuchet24",
    size = 48,
    weight = 1000,
    antialias = true
})

surface.CreateFont("CapturePointLarge", {
    font = "Trebuchet24",
    size = 32,
    weight = 1000,
    antialias = true,
    shadow = true
})

surface.CreateFont("CapturePointSmall", {
    font = "Trebuchet24",
    size = 26,
    weight = 700,
    antialias = true,
    shadow = true,
    outline = false
})

surface.CreateFont("CaptureTeamInfo", {
    font = "Trebuchet24",
    size = 16,
    weight = 500,
    antialias = true
})

surface.CreateFont("CaptureTeamInfoBold", {
    font = "Trebuchet24",
    size = 16,
    weight = 700,
    antialias = true
})

surface.CreateFont("CaptureDefault", {
    font = "Trebuchet24",
    size = 14,
    weight = 400,
    antialias = true
})

surface.CreateFont("CaptureDefaultBold", {
    font = "Trebuchet24", 
    size = 14,
    weight = 700,
    antialias = true
})

surface.CreateFont("CaptureDefaultSmall", {
    font = "Trebuchet24",
    size = 12,
    weight = 400,
    antialias = true
})

surface.CreateFont("CaptureTimerNormal", {
    font = "Trebuchet24",
    size = 14,
    weight = 600,
    antialias = true
})

surface.CreateFont("CaptureTimer3D", {
    font = "Trebuchet24",
    size = 12,
    weight = 600,
    antialias = true
})

net.Receive("Capture_UpdatePoints", function()
    local count = net.ReadUInt(8)
    local newPoints = {}
    
    for i = 1, count do
        local point = {
            position = net.ReadVector(),
            progress = net.ReadFloat(),
            owner = net.ReadString(),
            capturing = net.ReadString(),
            progress_team = net.ReadString(),

            name = net.ReadString(),
            radius = net.ReadFloat(),
            ownership_timers = {},
            letter = string.char(64 + i)
        }

        
        local teamsOrder = CAPTURE_TEAMS_ORDER or {"Сиянисты", "Горы", "Мертвоземцы", "Истинные Сыны", "Скрапперы"}
        
        for _, teamName in ipairs(teamsOrder) do
            point.ownership_timers[teamName] = net.ReadFloat()
        end
        
        newPoints[i] = point
    end
    
    cwCaptureSystem.CaptureData.NewPoints = newPoints
end)

function cwCaptureSystem:Initialize()
    hook.Remove("PostDrawTranslucentRenderables", "Capture_DrawMarkers")
    hook.Remove("HUDPaint", "CaptureSystem_HUDPaint")
    
    hook.Add("PostDrawTranslucentRenderables", "Capture_DrawMarkers", cwCaptureSystem.PostDrawTranslucentRenderables)
end

hook.Add("InitPostEntity", "CaptureSystem_InitClient", function()
    timer.Simple(3, function()
        if cwCaptureSystem and cwCaptureSystem.Initialize then
            cwCaptureSystem:Initialize()
        end
    end)
end)
