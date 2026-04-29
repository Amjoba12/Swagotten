function cwCaptureSystem.ThinkCapture()
    if not cwCaptureSystem.State or not cwCaptureSystem.State.Points then 
        return 
    end
    
    if not cwCaptureSystem.State.TeamStats then
        cwCaptureSystem.State.TeamStats = {}
    end
    
    local teamPlayers = {}
    for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
        teamPlayers[teamName] = 0
        
        if not cwCaptureSystem.State.TeamStats[teamName] then
            cwCaptureSystem.State.TeamStats[teamName] = {
                total_time = 0,
                players_count = 0
            }
        end
    end
    
    for _, ply in pairs(player.GetAll()) do
        local teamName = GetPlayerTeam(ply)
        if teamName and teamPlayers[teamName] then
            teamPlayers[teamName] = teamPlayers[teamName] + 1
        end
    end
    
    for teamName, count in pairs(teamPlayers) do
        if cwCaptureSystem.State.TeamStats[teamName] then
            cwCaptureSystem.State.TeamStats[teamName].players_count = count
        end
    end
    
    for _, point in ipairs(cwCaptureSystem.State.Points) do
        point.players_inside = {}
        
        for _, ply in pairs(player.GetAll()) do
            if IsValid(ply) and ply:Alive() then
                local isRagdolled = ply:GetRagdollState() and ply:GetRagdollState() == RAGDOLL_FALLENOVER
                local isKnockedOut = ply:GetRagdollState() and ply:GetRagdollState() == RAGDOLL_KNOCKEDOUT
                local isUnconscious = ply:GetSharedVar("IsUnconscious")
                local isPossessing = ply:GetSharedVar("IsPossessing")
                
                if not isRagdolled and not isKnockedOut and not isUnconscious and not isPossessing then
                    local dist = ply:GetPos():Distance(point.position)
                    if dist <= point.radius then
                        local teamName = GetPlayerTeam(ply)
                        if teamName then
                            table.insert(point.players_inside, ply)
                        end
                    end
                end
            end
        end
        
        local teamCounts = {}
        local totalPlayersOnPoint = 0
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            teamCounts[teamName] = 0
        end
        
        for _, ply in ipairs(point.players_inside) do
            local teamName = GetPlayerTeam(ply)
            if teamName and teamCounts[teamName] then
                teamCounts[teamName] = teamCounts[teamName] + 1
                totalPlayersOnPoint = totalPlayersOnPoint + 1
            end
        end
        
        local teamPercentages = {}
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            local count = teamCounts[teamName] or 0
            local total = teamPlayers[teamName] or 0
            if total > 0 then
                teamPercentages[teamName] = count / total
            else
                teamPercentages[teamName] = 0
            end
        end
        
        local dominantTeam = nil
        local maxPercentage = 0
        local secondMaxPercentage = 0
        
        for _, teamName in ipairs(CAPTURE_TEAMS_ORDER) do
            local percentage = teamPercentages[teamName]
            if percentage > 0 then
                if percentage > maxPercentage then
                    secondMaxPercentage = maxPercentage
                    maxPercentage = percentage
                    dominantTeam = teamName
                elseif percentage > secondMaxPercentage then
                    secondMaxPercentage = percentage
                end
            end
        end
        
        local hasConflict = false
        if math.abs(maxPercentage - secondMaxPercentage) < 0.01 and maxPercentage > 0 then
            hasConflict = true
        end
        
        local captureSpeed = 1.0 / (point.capture_time * 22)
        local decaySpeed = captureSpeed * 0.5
        
        if dominantTeam and not hasConflict and maxPercentage >= 0.4 then
            if point.progress_team == nil then
                point.progress_team = dominantTeam
                point.capturing_team = dominantTeam
                point.capture_progress = math.min(point.capture_progress + captureSpeed, 1.0)
                
            elseif point.progress_team == dominantTeam then
                point.capturing_team = dominantTeam
                
                if point.owner_team == dominantTeam then
                    if maxPercentage >= 0.25 then
                        point.capture_progress = math.min(point.capture_progress + captureSpeed, 1.0)
                        if point.capture_progress >= 1.0 then
                            point.owner_team = dominantTeam
                        end
                    else
                        point.capture_progress = math.max(point.capture_progress - decaySpeed, 0)
                        if point.capture_progress <= 0 then
                            point.owner_team = nil
                            point.progress_team = nil
                            point.capturing_team = nil
                        end
                    end
                else
                    point.capture_progress = math.min(point.capture_progress + captureSpeed, 1.0)
                    if point.capture_progress >= 1.0 then
                        point.owner_team = dominantTeam
                    end
                end
                
            else
                point.capturing_team = dominantTeam
                point.capture_progress = math.max(point.capture_progress - captureSpeed, 0)
                
                if point.capture_progress <= 0 then
                    point.progress_team = dominantTeam
                    point.capture_progress = captureSpeed
                    point.owner_team = nil
                end
            end
            
        elseif hasConflict then
            point.capturing_team = nil
            
        elseif dominantTeam and maxPercentage >= 0.25 and maxPercentage < 0.4 then
            point.capturing_team = nil
            
            if not point.owner_team and point.progress_team then
                point.capture_progress = math.max(point.capture_progress - decaySpeed, 0)
                if point.capture_progress <= 0 then
                    point.progress_team = nil
                end
            elseif point.owner_team and point.progress_team == dominantTeam then
                point.capture_progress = math.min(point.capture_progress + captureSpeed, 1.0)
            elseif point.owner_team and point.progress_team ~= dominantTeam then
                point.capture_progress = math.max(point.capture_progress - captureSpeed, 0)
                if point.capture_progress <= 0 then
                    point.progress_team = dominantTeam
                    point.capture_progress = captureSpeed
                    point.owner_team = nil
                end
            end
            
        else
            point.capturing_team = nil
            
            if point.progress_team and point.capture_progress > 0 then
                point.capture_progress = math.max(point.capture_progress - decaySpeed, 0)
                if point.capture_progress <= 0 then
                    point.progress_team = nil
                    point.owner_team = nil
                end
            end
        end
        
        if point.owner_team and point.capture_progress >= 1.0 then
            point.ownership_timers[point.owner_team] = (point.ownership_timers[point.owner_team] or 0) + (1.0 / 22)
            
            if cwCaptureSystem.State.TeamStats[point.owner_team] then
                cwCaptureSystem.State.TeamStats[point.owner_team].total_time = 
                    cwCaptureSystem.State.TeamStats[point.owner_team].total_time + (1.0 / 22)
            end
        end
        
        point.last_update = CurTime()
    end
    
    cwCaptureSystem:BroadcastPointUpdate()
end

function cwCaptureSystem:PluginInitialized()
    timer.Simple(2, function()
        if self.InitializeCaptureState then
            self:InitializeCaptureState()
        end
        
        if self.BroadcastPointUpdate then
            self:BroadcastPointUpdate()
        end
    end)
    
    hook.Add("Think", "CaptureSystem_Update", cwCaptureSystem.ThinkCapture)
end

hook.Add("InitPostEntity", "CaptureSystem_InitServer", function()
    timer.Simple(5, function()
        if cwCaptureSystem and cwCaptureSystem.PluginInitialized then
            cwCaptureSystem:PluginInitialized()
        end
    end)
end)
