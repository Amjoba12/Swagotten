local squareAnimations = {}
local pointColors = {}

local function GetProgressColor(point)
    if point.progress_team and point.progress_team ~= "" and point.progress > 0 then
        local teamColor = GetTeamColor(point.progress_team)
        if teamColor then
            teamColor.a = 200
            return teamColor
        end
    end
    
    if point.owner and point.owner ~= "" then
        local teamColor = GetTeamColor(point.owner)
        if teamColor then
            teamColor.a = 200
            return teamColor
        end
    end
    
    if point.capturing and point.capturing ~= "" then
        local teamColor = GetTeamColor(point.capturing)
        if teamColor then
            teamColor.a = 120
            return teamColor
        end
    end
    
    return Color(180, 180, 180, 150)
end

local function GetAnimatedProgress(point)
    local pointID = point.name or "unknown"
    
    if not squareAnimations[pointID] then
        squareAnimations[pointID] = {
            currentProgress = 0,
            targetProgress = point.progress or 0,
            animationSpeed = 0.15,
            currentColor = Color(180, 180, 180, 150), 
            targetColor = Color(180, 180, 180, 150)
        }
    end
    
    local anim = squareAnimations[pointID]
    anim.targetProgress = point.progress or 0
    anim.targetColor = GetProgressColor(point)
    
    if anim.currentProgress < anim.targetProgress then
        anim.currentProgress = math.min(anim.currentProgress + anim.animationSpeed * FrameTime() * 60, anim.targetProgress)
    elseif anim.currentProgress > anim.targetProgress then
        anim.currentProgress = math.max(anim.currentProgress - anim.animationSpeed * FrameTime() * 60, anim.targetProgress)
    end
    
    if not pointColors[pointID] then
        pointColors[pointID] = anim.targetColor
    end
    
    local currentColor = pointColors[pointID]
    local lerpSpeed = 0.1 * FrameTime() * 60
    
    currentColor.r = Lerp(lerpSpeed, currentColor.r, anim.targetColor.r)
    currentColor.g = Lerp(lerpSpeed, currentColor.g, anim.targetColor.g)
    currentColor.b = Lerp(lerpSpeed, currentColor.b, anim.targetColor.b)
    currentColor.a = Lerp(lerpSpeed, currentColor.a, anim.targetColor.a)
    
    pointColors[pointID] = currentColor
    
    return anim.currentProgress, currentColor
end

function cwCaptureSystem.HUDPaint_Points()
    if not cwCaptureSystem.CaptureData then 
        return 
    end
    
    if not cwCaptureSystem.CaptureData.Points or #cwCaptureSystem.CaptureData.Points == 0 then 
        return 
    end
    
    local pointSpacing = 20
    local totalPoints = #cwCaptureSystem.CaptureData.Points
    local totalWidth = totalPoints * 80 + (totalPoints - 1) * pointSpacing
    local startX = ScrW() / 2 - totalWidth / 2 + 40
    local yPos = 120
    
    for i, point in ipairs(cwCaptureSystem.CaptureData.Points) do
        local x = startX + (i - 1) * (80 + pointSpacing)
        local letter = point.letter or string.char(64 + i)
        
        local animatedProgress, progressColor = GetAnimatedProgress(point)
        
        if not progressColor then
            progressColor = Color(180, 180, 180, 150)
        end
        
        local size = 60
        local half = size / 2
        
        draw.RoundedBox(0, x - half, yPos - half, size, size, Color(40, 40, 40, 200))
        
        local ownerColor = progressColor
        local neutralColor = Color(120, 120, 120, 150)
        
        surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, ownerColor.a)
        surface.DrawRect(x - half, yPos - half, size, size)
        
        if point.capturing ~= "" and point.progress_team ~= "" and point.capturing ~= point.progress_team then
            local neutralHeight = size * (1 - animatedProgress)
            surface.SetDrawColor(neutralColor.r, neutralColor.g, neutralColor.b, neutralColor.a)
            surface.DrawRect(x - half, yPos - half, size, neutralHeight)
        elseif point.capturing ~= "" and point.progress_team == "" then
            local teamColor = GetTeamColor(point.capturing) or ownerColor
            local fillHeight = size * animatedProgress
            local fillY = yPos + half - fillHeight
            
            surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, 180)
            surface.DrawRect(x - half, fillY, size, fillHeight)
        else
            if animatedProgress > 0 then
                local fillHeight = size * animatedProgress
                local fillY = yPos + half - fillHeight
                
                surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, ownerColor.a)
                surface.DrawRect(x - half, fillY, size, fillHeight)
            end
        end
        
        surface.SetDrawColor(0, 0, 0, 200)
        surface.DrawOutlinedRect(x - half, yPos - half, size, size, 2)
        
        draw.SimpleText(letter, "CapturePointLarge", x, yPos, 
            Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        local percentText = math.Round(animatedProgress * 100) .. "%"
        local percentColor = Color(255, 255, 255, 220)
        
        if point.progress_team and point.progress_team ~= "" and animatedProgress > 0 then
            percentColor = GetTeamColor(point.progress_team) or Color(255, 255, 255, 220)
        end
        
        draw.SimpleText(percentText, "CaptureDefaultBold", x, yPos + half + 12, 
            percentColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
        
        local timerY = yPos + half + 28
        local timerHeight = 14
        
        local sortedTimers = {}
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            local timer = point.ownership_timers[teamName] or 0
            if timer > 0 then
                table.insert(sortedTimers, {
                    teamName = teamName,
                    timer = timer,
                    shortName = GetTeamShortName(teamName)
                })
            end
        end
        
        table.sort(sortedTimers, function(a, b) return a.timer > b.timer end)
        
        for i, data in ipairs(sortedTimers) do
            if i > 3 then break end
            
            local y = timerY + (i - 1) * timerHeight
            local color = GetTeamColor(data.teamName)
            if not color then color = Color(200, 200, 200) end
            
            local text = data.shortName .. ": " .. FormatCaptureTime(data.timer)
            draw.SimpleText(text, "CaptureTimerNormal", x, y, 
                color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
        end
    end
end

function cwCaptureSystem.HUDPaint_PlayerInfo()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    
    for _, point in ipairs(cwCaptureSystem.CaptureData.Points) do
        local dist = ply:GetPos():Distance(point.position)
        if dist < point.radius then
            local barWidth = 400
            local barHeight = 30
            local barX = ScrW()/2 - barWidth/2
            local barY = ScrH() - 150
            
            local animatedProgress, progressColor = GetAnimatedProgress(point)
            
            surface.SetDrawColor(0, 0, 0, 200)
            surface.DrawRect(barX, barY, barWidth, barHeight)
            
            local ownerColor = progressColor
            local neutralColor = Color(100, 100, 100, 150)
            
            surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, ownerColor.a)
            surface.DrawRect(barX, barY, barWidth, barHeight)
            
            if point.capturing ~= "" and point.progress_team ~= "" and point.capturing ~= point.progress_team then
                local neutralWidth = barWidth * (1 - animatedProgress)
                surface.SetDrawColor(neutralColor.r, neutralColor.g, neutralColor.b, neutralColor.a)
                surface.DrawRect(barX + barWidth - neutralWidth, barY, neutralWidth, barHeight)
            elseif point.capturing ~= "" and point.progress_team == "" then
                local teamColor = GetTeamColor(point.capturing) or ownerColor
                surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, 200)
                surface.DrawRect(barX, barY, barWidth * animatedProgress, barHeight)
            else
                if animatedProgress > 0 then
                    surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, 200)
                    surface.DrawRect(barX, barY, barWidth * animatedProgress, barHeight)
                end
            end
            
            surface.SetDrawColor(0, 0, 0, 255)
            surface.DrawOutlinedRect(barX, barY, barWidth, barHeight, 2)
            
            draw.SimpleText(point.name, "CapturePointFont", ScrW()/2, barY - 40, 
                color_white, TEXT_ALIGN_CENTER)
            
            local percentColor = Color(0, 0, 0, 255)
            draw.SimpleText(math.Round(animatedProgress * 100) .. "%", "CaptureDefaultBold", 
                ScrW()/2, barY + barHeight/2, percentColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            
            local timerY = barY + barHeight + 15
            local timerHeight = 18
            
            local sortedTimers = {}
            for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
                local timer = point.ownership_timers[teamName] or 0
                if timer > 0 then
                    table.insert(sortedTimers, {
                        teamName = teamName,
                        timer = timer,
                        shortName = GetTeamShortName(teamName)
                    })
                end
            end
            
            table.sort(sortedTimers, function(a, b) return a.timer > b.timer end)
            
            for i, data in ipairs(sortedTimers) do
                if i > 5 then break end
                
                local y = timerY + (i - 1) * timerHeight
                local color = GetTeamColor(data.teamName)
                if not color then color = Color(200, 200, 200) end
                
                local text = data.shortName .. ": " .. FormatCaptureTime(data.timer)
                draw.SimpleText(text, "CaptureTimerNormal", ScrW()/2, y, 
                    color, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
            end
            
            break
        end
    end
end

function cwCaptureSystem.PostDrawTranslucentRenderables()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    
    if not cwCaptureSystem.CaptureData or not cwCaptureSystem.CaptureData.Points then return end
    
    local eyePos = ply:EyePos()
    local eyeAng = ply:EyeAngles()
    
    local bobOffset = math.sin(RealTime() * 2) * 5
    
    for i, point in ipairs(cwCaptureSystem.CaptureData.Points) do
        local dist = eyePos:Distance(point.position)
        if dist > 5000 then continue end
        
        local animatedProgress, progressColor = GetAnimatedProgress(point)
        
        if not progressColor then
            progressColor = Color(180, 180, 180, 150)
        end
        
        local scale = math.Clamp(0.15 + (1 - dist / 2000) * 0.6, 0.15, 0.45)
        local zOffset = (i - 1) * 15
        local squarePos = point.position + Vector(0, 0, 200 + zOffset + bobOffset)
        local letter = point.letter or string.char(64 + i)
        
        cam.Start3D2D(squarePos, Angle(0, eyeAng.y - 90, 90), scale)
            local size = 140
            local half = size / 2
            
            surface.SetDrawColor(40, 40, 40, 200)
            surface.DrawRect(-half, -half, size, size)
            
            local ownerColor = progressColor
            local neutralColor = Color(120, 120, 120, 150)
            
            surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, ownerColor.a)
            surface.DrawRect(-half, -half, size, size)
            
            if point.capturing ~= "" and point.progress_team ~= "" and point.capturing ~= point.progress_team then
                local neutralHeight = size * (1 - animatedProgress)
                surface.SetDrawColor(neutralColor.r, neutralColor.g, neutralColor.b, neutralColor.a)
                surface.DrawRect(-half, -half, size, neutralHeight)
            elseif point.capturing ~= "" and point.progress_team == "" then
                local teamColor = GetTeamColor(point.capturing) or ownerColor
                local fillHeight = size * animatedProgress
                local fillY = half - fillHeight
                
                surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, 180)
                surface.DrawRect(-half, fillY, size, fillHeight)
            else
                if animatedProgress > 0 then
                    local fillHeight = size * animatedProgress
                    local fillY = half - fillHeight
                    
                    surface.SetDrawColor(ownerColor.r, ownerColor.g, ownerColor.b, ownerColor.a)
                    surface.DrawRect(-half, fillY, size, fillHeight)
                end
            end
            
            surface.SetDrawColor(0, 0, 0, 200)
            surface.DrawOutlinedRect(-half, -half, size, size, 3)
            
            if point.owner ~= "" then
                local pulse = math.sin(RealTime() * 2) * 0.2 + 0.8
                local teamColor = GetTeamColor(point.owner)
                if teamColor then
                    surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, 200 * pulse)
                    surface.DrawOutlinedRect(-half - 3, -half - 3, size + 6, size + 6, 4)
                end
            end
            
            draw.SimpleText(letter, "CapturePointSmall", 0, 0, 
                Color(0, 0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            
            local percentText = math.Round(animatedProgress * 100) .. "%"
            local textColor = Color(255, 255, 255, 220)
            
            if point.progress_team and point.progress_team ~= "" and animatedProgress > 0 then
                textColor = GetTeamColor(point.progress_team) or Color(255, 255, 255, 220)
            end
            
            draw.SimpleText(percentText, "CaptureDefaultBold", 
                0, -half - 20, textColor, TEXT_ALIGN_CENTER)
        cam.End3D2D()
        
        if dist < 2000 then
            local circlePos = point.position + Vector(0, 0, 15)
            
            cam.Start3D2D(circlePos, Angle(0, 0, 0), 1)
                local ringColor = progressColor
                ringColor.a = 40
                
                surface.SetDrawColor(ringColor)
                surface.DrawCircle(0, 0, point.radius, ringColor.r, ringColor.g, ringColor.b, ringColor.a, 10)
                
                if point.owner ~= "" then
                    local pulse = math.sin(RealTime() * 2) * 0.2 + 0.8
                    local teamColor = GetTeamColor(point.owner)
                    if teamColor then
                        teamColor.a = 60 * pulse
                        
                        surface.SetDrawColor(teamColor)
                        surface.DrawCircle(0, 0, point.radius, teamColor.r, teamColor.g, teamColor.b, teamColor.a, 5)
                        
                        teamColor.a = 40
                        surface.SetDrawColor(teamColor)
                        surface.DrawCircle(0, 0, point.radius * 0.95, teamColor.r, teamColor.g, teamColor.b, teamColor.a, 3)
                    end
                end
            cam.End3D2D()
        end
    end
end

local lastUpdate = 0
local updateInterval = 0.2

hook.Add("Think", "CaptureSystem_ClientUpdate", function()
    local curTime = CurTime()
    if curTime - lastUpdate >= updateInterval then
        lastUpdate = curTime
        
        if cwCaptureSystem.CaptureData and cwCaptureSystem.CaptureData.NewPoints then
            cwCaptureSystem.CaptureData.Points = cwCaptureSystem.CaptureData.NewPoints
            cwCaptureSystem.CaptureData.NewPoints = nil
        end
    end
end)

function cwCaptureSystem.HUDPaint_TeamInfo()
    if not cwCaptureSystem.CaptureData then 
        return 
    end
    
    if not CAPTURE_TEAMS or not CAPTURE_TEAMS_ORDER then
        return
    end
    
    local ply = LocalPlayer()
    if not IsValid(ply) then return end
    
    local CAPTURE_TEAMS = CAPTURE_TEAMS or cwCaptureSystem.CaptureData.Config.Teams or {}
    
    local teamCounts = {}
    local totalPlayers = 0
    
    for _, p in pairs(player.GetAll()) do
        local faction = p:GetFaction()
        if faction then
            for teamName, teamData in pairs(CAPTURE_TEAMS) do
                if teamData.factions then
                    for _, teamFaction in ipairs(teamData.factions) do
                        if faction == teamFaction then
                            teamCounts[teamName] = (teamCounts[teamName] or 0) + 1
                            totalPlayers = totalPlayers + 1
                            break
                        end
                    end
                end
            end
        end
    end
    
    if totalPlayers == 0 then return end
    
    local boxWidth = 200
    local margin = 20
    local lineHeight = 30
    local spacing = 5
    
    local visibleTeams = 0
    for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
        if teamCounts[teamName] and teamCounts[teamName] > 0 then
            visibleTeams = visibleTeams + 1
        end
    end
    
    if visibleTeams == 0 then return end
    
    local boxHeight = 40 + (visibleTeams * (lineHeight + spacing))
    
    local boxX = ScrW() - boxWidth - margin
    local boxY = margin
    
    surface.SetDrawColor(30, 30, 40, 220)
    draw.RoundedBox(6, boxX, boxY, boxWidth, boxHeight, Color(30, 30, 40, 220))
    
    draw.SimpleText("ФРАКЦИИ НА СЕРВЕРЕ", "CaptureTeamInfoBold", 
        boxX + boxWidth/2, boxY + 12, 
        Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    
    surface.SetDrawColor(80, 80, 100, 180)
    surface.DrawRect(boxX + 10, boxY + 32, boxWidth - 20, 2)
    
    local yPos = boxY + 40
    local teamIndex = 0
    
    for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
        local count = teamCounts[teamName] or 0
        if count > 0 then
            local teamData = CAPTURE_TEAMS[teamName]
            if not teamData then continue end
            
            local y = yPos + teamIndex * (lineHeight + spacing)
            
            surface.SetDrawColor(40, 40, 50, 150)
            surface.DrawRect(boxX + 10, y, boxWidth - 20, lineHeight)
            
            surface.SetDrawColor(teamData.color or Color(200, 200, 200))
            surface.DrawRect(boxX + 10, y, 4, lineHeight)
            
            draw.SimpleText("●", "CaptureDefaultBold", boxX + 20, y + lineHeight/2, 
                teamData.color or Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            
            local displayName = teamData.name or teamName
            
            draw.SimpleText(displayName, "CaptureTeamInfo", boxX + 40, y + 8, 
                Color(220, 220, 220), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            
            draw.SimpleText(tostring(count), "CaptureTeamInfoBold", 
                boxX + boxWidth - 25, y + lineHeight/2, 
                Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            
            teamIndex = teamIndex + 1
        end
    end
    
    if totalPlayers > 0 then
        surface.SetDrawColor(50, 50, 70, 180)
        surface.DrawRect(boxX + 10, yPos + teamIndex * (lineHeight + spacing) - spacing, 
                        boxWidth - 20, 2)
        
        local totalY = yPos + teamIndex * (lineHeight + spacing) + 2
        draw.SimpleText("Всего игроков: " .. totalPlayers, "CaptureDefault", 
            boxX + boxWidth/2, totalY, 
            Color(200, 200, 220), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    end
end

hook.Add("HUDPaint", "CaptureSystem_HUDPaint", function()
    if cwCaptureSystem and cwCaptureSystem.HUDPaint_Points then
        cwCaptureSystem.HUDPaint_Points()
    end
    
    if cwCaptureSystem and cwCaptureSystem.HUDPaint_PlayerInfo then
        cwCaptureSystem.HUDPaint_PlayerInfo()
    end
    
    if cwCaptureSystem and cwCaptureSystem.HUDPaint_TeamInfo then
        cwCaptureSystem.HUDPaint_TeamInfo()
    end
end)
