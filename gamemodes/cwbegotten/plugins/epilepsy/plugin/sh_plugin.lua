-- sh_plugin.lua
PLUGIN.name = "Epilepsy Safe Mode"
PLUGIN.author = "For Friend"
PLUGIN.desc = "Disables flashes/blur/color/shake effects, but keeps sanity ambiance (skeletons, cockroaches, voices)"

-- Список SteamID игроков, которые получают флаг автоматически
local EPILEPSY_STEAM_IDS = {
    ["STEAM_0:1:84808655"] = true,
    ["76561198129883039"] = true,
}

local function ShouldHaveEpilepsyFlag(ply)
    if not IsValid(ply) then return false end
    local steamID = ply:SteamID()
    local steamID64 = ply:SteamID64()
    return EPILEPSY_STEAM_IDS[steamID] == true or EPILEPSY_STEAM_IDS[steamID64] == true
end

if SERVER then
    print("[EpilepsySafe] Серверная часть загружена.")
    
    hook.Add("PlayerInitialSpawn", "EpilepsySafe_AutoGiveFlag", function(ply)
        timer.Simple(1, function()
            if not IsValid(ply) then return end
            
            local shouldHave = ShouldHaveEpilepsyFlag(ply)
            local currentHas = Clockwork.player:HasFlags(ply, "F")
            
            if shouldHave and not currentHas then
                Clockwork.player:AddFlags(ply, "F")
                print("[EpilepsySafe] Auto-granted flag F to " .. ply:Name() .. " (" .. ply:SteamID() .. ")")
            elseif not shouldHave and currentHas then
                Clockwork.player:RemoveFlags(ply, "F")
                print("[EpilepsySafe] Auto-removed flag F from " .. ply:Name() .. " (" .. ply:SteamID() .. ")")
            end
        end)
    end)
    
    hook.Add("PlayerLoadedChar", "EpilepsySafe_AutoGiveFlagChar", function(ply, char)
        timer.Simple(0.5, function()
            if not IsValid(ply) then return end
            
            local shouldHave = ShouldHaveEpilepsyFlag(ply)
            local currentHas = Clockwork.player:HasFlags(ply, "F")
            
            if shouldHave and not currentHas then
                Clockwork.player:AddFlags(ply, "F")
                print("[EpilepsySafe] Auto-granted flag F to " .. ply:Name() .. " (" .. ply:SteamID() .. ")")
            end
        end)
    end)
    
    local function SendFlagStatus(ply)
        if not IsValid(ply) then return end
        local hasFlag = Clockwork.player:HasFlags(ply, "F")
        netstream.Start(ply, "EpilepsySafe_SetStatus", hasFlag)
    end
    
    hook.Add("PlayerSpawn", "EpilepsySafe_PlayerSpawn", function(ply)
        timer.Simple(0.5, function() SendFlagStatus(ply) end)
    end)
    
    netstream.Hook("EpilepsySafe_RequestStatus", function(ply)
        SendFlagStatus(ply)
    end)
    
    hook.Add("ClockworkPlayerFlagsUpdated", "EpilepsySafe_FlagsUpdated", function(ply)
        timer.Simple(0.2, function() SendFlagStatus(ply) end)
    end)
    
    hook.Add("PlayerFlagsChanged", "EpilepsySafe_FlagsChanged", function(ply, flagsAdded, flagsRemoved)
        if flagsAdded and string.find(flagsAdded, "F") or flagsRemoved and string.find(flagsRemoved, "F") then
            timer.Simple(0.2, function() SendFlagStatus(ply) end)
        end
    end)
    
    timer.Create("EpilepsySafe_PeriodicCheck", 10, 0, function()
        for _, ply in ipairs(player.GetAll()) do
            if IsValid(ply) and ply:HasInitialized() then
                local hasFlag = Clockwork.player:HasFlags(ply, "F")
                netstream.Start(ply, "EpilepsySafe_SetStatus", hasFlag)
            end
        end
    end)
    
    local ADD_COMMAND = Clockwork.command:New("EpilepsyAdd")
    ADD_COMMAND.tip = "Add a SteamID to epilepsy auto-flag list."
    ADD_COMMAND.text = "<string SteamID>"
    ADD_COMMAND.access = "s"
    ADD_COMMAND.arguments = 1
    function ADD_COMMAND:OnRun(player, arguments)
        local steamID = arguments[1]
        EPILEPSY_STEAM_IDS[steamID] = true
        Schema:EasyText(player, "cornflowerblue", "Added " .. steamID .. " to epilepsy auto-flag list.")
        file.Write("epilepsy_steamids.txt", table.ToString(EPILEPSY_STEAM_IDS))
    end
    ADD_COMMAND:Register()
    
    local REMOVE_COMMAND = Clockwork.command:New("EpilepsyRemove")
    REMOVE_COMMAND.tip = "Remove a SteamID from epilepsy auto-flag list."
    REMOVE_COMMAND.text = "<string SteamID>"
    REMOVE_COMMAND.access = "s"
    REMOVE_COMMAND.arguments = 1
    function REMOVE_COMMAND:OnRun(player, arguments)
        local steamID = arguments[1]
        EPILEPSY_STEAM_IDS[steamID] = nil
        Schema:EasyText(player, "cornflowerblue", "Removed " .. steamID .. " from epilepsy auto-flag list.")
        file.Write("epilepsy_steamids.txt", table.ToString(EPILEPSY_STEAM_IDS))
    end
    REMOVE_COMMAND:Register()
    
    if file.Exists("epilepsy_steamids.txt", "DATA") then
        local data = file.Read("epilepsy_steamids.txt", "DATA")
        if data then
            local loaded = CompileString("return " .. data, "epilepsy_steamids")()
            if loaded and istable(loaded) then
                for k, v in pairs(loaded) do
                    EPILEPSY_STEAM_IDS[k] = v
                end
                print("[EpilepsySafe] Loaded " .. table.Count(EPILEPSY_STEAM_IDS) .. " SteamIDs from file.")
            end
        end
    end
end

if CLIENT then
    local isSafe = false
    
    netstream.Hook("EpilepsySafe_SetStatus", function(safe)
        isSafe = safe
        if isSafe then
            RunConsoleCommand("mat_bloomscale", "0")
            RunConsoleCommand("mat_disable_bloom", "1")
            RunConsoleCommand("mat_motion_blur_enabled", "0")
        end
    end)
    
    netstream.Start("EpilepsySafe_RequestStatus")
    
    hook.Add("CharacterMenuOpened", "EpilepsySafe_CharMenu", function()
        netstream.Start("EpilepsySafe_RequestStatus")
    end)
    
    hook.Add("CharacterMenuClosed", "EpilepsySafe_CharMenuClosed", function()
        timer.Simple(0.5, function()
            netstream.Start("EpilepsySafe_RequestStatus")
        end)
    end)
    
    -- ==================== БЛОКИРОВКА NETSTREAM (кроме sanity эффектов) ====================
    local oldNetstreamStart = netstream.Start
    function netstream.Start(target, name, ...)
        if isSafe then
            local blocked = {
                "Stunned", "MorphineDream", "Disorient",
                "BloodEffect", "ScreenFade", "FlashEffect", "BlackStunned",
                "MotionBlurStunned", "Flashed", "ClearEffects",
                "CosmicRupture", "StartNearestTVHallucination", "ScarePlayer",
                "UpgradedWarcry", "DeceitfulHighlight", "TasteofBloodHighlight"
            }
            for _, v in ipairs(blocked) do
                if name == v then return end
            end
            -- SpookyScarySkeletons и SanitySpeech НЕ блокируем (возвращаем скелетов и голоса)
        end
        return oldNetstreamStart(target, name, ...)
    end
    
    -- ==================== БЛОКИРОВКА SCREENSHAKE ====================
    local oldScreenShake = util.ScreenShake
    function util.ScreenShake(pos, amplitude, frequency, duration, radius, callback)
        if isSafe then
            if amplitude > 5 or duration > 1 then
                return
            end
            return oldScreenShake(pos, amplitude, frequency, duration, radius, callback)
        end
        return oldScreenShake(pos, amplitude, frequency, duration, radius, callback)
    end
    
    -- ==================== БЛОКИРОВКА SCREENFADE (красные вспышки при убийстве/уроне) ====================
    local oldScreenFade = screenfade
    screenfade = function(...)
        if isSafe then return end
        return oldScreenFade(...)
    end
    
    if Clockwork and Clockwork.player then
        local oldCWScreenFade = Clockwork.player.ScreenFade
        if oldCWScreenFade then
            function Clockwork.player:ScreenFade(player, type, color, duration, holdTime, flags)
                if isSafe then return end
                return oldCWScreenFade(self, player, type, color, duration, holdTime, flags)
            end
        end
    end
    
    if Clockwork.Client and Clockwork.Client.ScreenFade then
        local oldClientFade = Clockwork.Client.ScreenFade
        function Clockwork.Client:ScreenFade(type, color, duration, holdTime, flags)
            if isSafe then return end
            return oldClientFade(self, type, color, duration, holdTime, flags)
        end
    end
    
    -- ==================== БЛОКИРОВКА MotionBlur ====================
    local oldDrawMotionBlur = DrawMotionBlur
    function DrawMotionBlur(...)
        if isSafe then return end
        return oldDrawMotionBlur(...)
    end
    
    -- ==================== БЛОКИРОВКА ColorModulation ====================
    local oldSetColorModulation = render.SetColorModulation
    function render.SetColorModulation(...)
        if isSafe then return end
        return oldSetColorModulation(...)
    end
    
    -- ==================== БЛОКИРОВКА DrawSharpen ====================
    local oldDrawSharpen = DrawSharpen
    function DrawSharpen(...)
        if isSafe then return end
        return oldDrawSharpen(...)
    end
    
    -- ==================== БЛОКИРОВКА DrawColorModify ====================
    local oldDrawColorModify = DrawColorModify
    function DrawColorModify(...)
        if isSafe then return end
        return oldDrawColorModify(...)
    end
    
    -- ==================== БЛОКИРОВКА DrawMaterialOverlay ====================
    local oldDrawMaterialOverlay = DrawMaterialOverlay
    function DrawMaterialOverlay(...)
        if isSafe then return end
        return oldDrawMaterialOverlay(...)
    end
    
    -- ==================== ПЕРЕХВАТ Schema ЭФФЕКТОВ ====================
    if Schema then
        local oldAddFlashEffect = Schema.AddFlashEffect
        if oldAddFlashEffect then
            function Schema:AddFlashEffect()
                if isSafe then return end
                return oldAddFlashEffect(self)
            end
        end
        
        local oldAddStunEffect = Schema.AddStunEffect
        if oldAddStunEffect then
            function Schema:AddStunEffect(duration)
                if isSafe then return end
                return oldAddStunEffect(self, duration)
            end
        end
        
        local oldAddMotionBlurStun = Schema.AddMotionBlurStunEffect
        if oldAddMotionBlurStun then
            function Schema:AddMotionBlurStunEffect(duration)
                if isSafe then return end
                return oldAddMotionBlurStun(self, duration)
            end
        end
        
        local oldSanityZoom = Schema.SanityZoom
        if oldSanityZoom then
            function Schema:SanityZoom(zoom, inverse)
                if isSafe then return end
                return oldSanityZoom(self, zoom, inverse)
            end
        end
        
        local oldRenderEffects = Schema.RenderScreenspaceEffects
        if oldRenderEffects then
            function Schema:RenderScreenspaceEffects()
                if isSafe then return end
                return oldRenderEffects(self)
            end
        end
        
        local oldCalcView = Schema.CalcView
        if oldCalcView then
            function Schema:CalcView(player, origin, angles, fov)
                if isSafe then
                    return {origin = origin, angles = angles, fov = fov}
                end
                return oldCalcView(self, player, origin, angles, fov)
            end
        end
    end
    
    -- ==================== ПЕРЕХВАТ cwSanity ЭФФЕКТОВ ====================
    if cwSanity then
        -- Оставляем скелетов, тараканов и голоса — НЕ блокируем их функции
        -- Блокируем только вредные визуальные эффекты
        local oldRenderEffects = cwSanity.RenderScreenspaceEffects
        if oldRenderEffects then
            function cwSanity:RenderScreenspaceEffects()
                if isSafe then
                    -- Не рисуем цветокоррекцию и размытие, но оставляем всё остальное
                    -- Просто пропускаем опасные эффекты
                    return
                end
                return oldRenderEffects(self)
            end
        end
        
        -- Блокируем скачок контраста (Scaresae без звука)
        local oldScaresae = cwSanity.Scaresae
        if oldScaresae then
            function cwSanity:Scaresae()
                if isSafe then
                    -- Только звук, без визуала
                    LocalPlayer():EmitSound("begotten/npc/sle/scare"..math.random(1, 2)..".mp3")
                    return
                end
                return oldScaresae(self)
            end
        end
    end
    
    -- ==================== ПЕРЕХВАТ cwMelee ЭФФЕКТОВ ====================
    if cwMelee then
        local oldAddParryEffect = cwMelee.AddParryEffect
        if oldAddParryEffect then
            function cwMelee:AddParryEffect(duration)
                if isSafe then
                    util.ScreenShake(LocalPlayer():GetPos(), 2, 1, 0.3, 50)
                    return
                end
                return oldAddParryEffect(self, duration)
            end
        end
        
        local oldHUDPaint = cwMelee.HUDPaintForeground
        if oldHUDPaint then
            function cwMelee:HUDPaintForeground()
                if isSafe then return end
                return oldHUDPaint(self)
            end
        end
        
        local oldDisorient = cwMelee.Disorient
        if oldDisorient then
            function cwMelee:Disorient(blurAmount)
                if isSafe then return end
                return oldDisorient(self, blurAmount)
            end
        end
        
        local oldRenderEffects = cwMelee.RenderScreenspaceEffects
        if oldRenderEffects then
            function cwMelee:RenderScreenspaceEffects()
                if isSafe then return end
                return oldRenderEffects(self)
            end
        end
    end
    
    -- ==================== БЛОКИРОВКА cwAnomalous ====================
    if cwAnomalous then
        local oldCosmicRupture = cwAnomalous.CosmicRupture
        if oldCosmicRupture then
            function cwAnomalous:CosmicRupture()
                if isSafe then return end
                return oldCosmicRupture(self)
            end
        end
        
        local oldRenderEffects = cwAnomalous.RenderScreenspaceEffects
        if oldRenderEffects then
            function cwAnomalous:RenderScreenspaceEffects()
                if isSafe then return end
                return oldRenderEffects(self)
            end
        end
    end
    
    -- ==================== БЛОКИРОВКА ГЛОБАЛЬНОЙ КАМЕРЫ ====================
    hook.Add("CalcView", "EpilepsySafe_CalcView", function(ply, origin, angles, fov)
        if isSafe then
            return {origin = origin, angles = angles, fov = fov}
        end
    end)
    
    -- ==================== ПРИНУДИТЕЛЬНЫЙ СБРОС ====================
    hook.Add("PreRender", "EpilepsySafe_ResetEffects", function()
        if not isSafe then return end
        
        CRAZYBOB = 0
        SWIRLPO = 0
        CINEMATICLERP = 1
        
        if Schema then
            Schema.stunEffects = {}
            Schema.flashEffect = nil
            Schema.motionBlurStunEffect = nil
            Schema.parryEffects = {}
            Schema.HeadbobAngle = 0
            Schema.HeadbobInfo = nil
            Schema.blurAdd = 0
            Schema.cwBlackFade = nil
            Schema.cwBlackAlpha = nil
            Schema.contrastAdd = 0
            Schema.cwVignetteAlpha = 0
            Schema.cwDrownEffect = nil
        end
        
        if cwMelee then
            cwMelee.parryEffects = {}
            cwMelee.blurAmount = 0
        end
        
        if Clockwork.Client then
            Clockwork.Client.CosmicRuptureRender = false
            Clockwork.Client.Scares = 0
            Clockwork.Client.ScareTime = 0
            Clockwork.Client.Rangers1 = 0
            Clockwork.Client.Rangers2 = 0
            Clockwork.Client.SanityZoom = 0
            Clockwork.Client.SkelesColor = 0
        end
        
        render.SetColorModulation(1, 1, 1)
    end)
    
    -- ==================== ПЕРЕХВАТ ЧАСТИЦ ====================
    local oldEffect = util.Effect
    function util.Effect(name, data, ...)
        if isSafe then
            local blocked = {"bloodsplat", "bleedingsplat", "MetalSpark", "bloodspray", "cball_explode"}
            for _, v in ipairs(blocked) do
                if name == v then return end
            end
        end
        return oldEffect(name, data, ...)
    end
    
    print("[EpilepsySafe] Клиентская часть загружена")
end