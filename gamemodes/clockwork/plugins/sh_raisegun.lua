--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

PLUGIN.name = "Raise Weapon"
PLUGIN.description = "Allows players to raise and lower their weapons."
PLUGIN.author = "Mr. Meow"
PLUGIN.compatibility = "1.2"

local Clockwork = Clockwork

local playerMeta = FindMetaTable("Player")
local blockedWeapons = {
	"weapon_physgun",
	"gmod_tool",
	"gmod_camera",
	"cw_senses",
	"cw_keys",
	"cw_adminasstool",
}

local rotationTranslate = {
	["default"] = Angle(30, -30, -25),
	["weapon_fists"] = Angle(30, -30, -50),
	["cw_hands"] = Angle(0, 0, -90)
}

function playerMeta:SetWeaponRaised(bIsRaised)
	if (SERVER) then
		self:SetDTBool(BOOL_WEAPON_RAISED, bIsRaised)

		hook.Run("OnWeaponRaised", self, self:GetActiveWeapon(), bIsRaised)
	end
end

function playerMeta:IsWeaponRaised(weapon)
	local weapon = weapon or self:GetActiveWeapon()

	if (!IsValid(weapon)) then
		return false
	end

	if (table.HasValue(blockedWeapons, weapon:GetClass())) then
		return true, weapon;
	end

	-- This doesn't seem to be used currently so I'm disabling it for now.
	--[[local shouldRaise = hook.Run("ShouldWeaponBeRaised", self, weapon)

	if (shouldRaise) then
		return shouldRaise
	end]]--

	return self:GetDTBool(BOOL_WEAPON_RAISED), weapon
end

function playerMeta:ToggleWeaponRaised()
	local activeWeapon = self:GetActiveWeapon();
	
	if (hook.Run("CanWeaponBeToggled", self, activeWeapon) != false) then
		if (self:IsWeaponRaised(activeWeapon)) then
			self:SetWeaponRaised(false)	
		else
			self:SetWeaponRaised(true)
		end
	end
end

function PLUGIN:StartChainsawLoop(player)
	if not SERVER then return end
	if not IsValid(player) then return end

	local weapon = player:GetActiveWeapon()
	if not IsValid(weapon) or weapon:GetClass() ~= "begotten_prelude_chainsword" then return end

	local plyID = player:SteamID()
	local timerName = "ChainsawLoop_" .. plyID

	if timer.Exists(timerName) then return end

	local duration = 5

	player:EmitSound("bgchainswordsfx/sfx_chainsaw_attack_start_0"..math.random(1, 2)..".ogg")

	timer.Create(timerName, duration, 0, function()
		if not IsValid(player) then
			timer.Remove(timerName)
			return
		end

		local wep = player:GetActiveWeapon()
		if not IsValid(wep) or wep:GetClass() ~= "begotten_prelude_chainsword" or not player:IsWeaponRaised() then
			timer.Remove(timerName)
			player:StopSound("bgchainswordsfx/sfx_chainsaw_idle_loop_01.ogg")
			return
		end

		player:EmitSound("bgchainswordsfx/sfx_chainsaw_idle_loop_01.ogg", 90, 100)
	end)

	player:EmitSound("bgchainswordsfx/sfx_chainsaw_idle_loop_01.ogg", 90, 100)
end

function PLUGIN:StopChainsawLoop(player)
	if not SERVER then return end
	if not IsValid(player) then return end

	local timerName = "ChainsawLoop_" .. player:SteamID()

	if timer.Exists(timerName) then
		timer.Remove(timerName)
	end

	player:StopSound("bgchainswordsfx/sfx_chainsaw_idle_loop_01.ogg")
	player:EmitSound("bgchainswordsfx/sfx_chainsaw_stop_0"..math.random(1, 2)..".ogg")
end


function PLUGIN:StartGuitarLoop(player)
    if not SERVER then return end
    if not IsValid(player) then return end

    local weapon = player:GetActiveWeapon()
    if not IsValid(weapon) or weapon:GetClass() ~= "begotten_scrappers_guitar" then return end

    local timerName = "GuitarLoop_" .. player:SteamID()
    if timer.Exists(timerName) then return end

    local function PlayNextSong()
        if not IsValid(player) then
            timer.Remove(timerName)
            return
        end

        local wep = player:GetActiveWeapon()
        if not IsValid(wep)
        or wep:GetClass() ~= "begotten_scrappers_guitar"
        or not player:IsWeaponRaised() then

            timer.Remove(timerName)
            return
        end


        local last = player.LastGuitarSound or 0
        local newID

        repeat
            newID = math.random(1, #GuitarSounds)
        until newID ~= last or #GuitarSounds <= 1

        player.LastGuitarSound = newID

        local song = GuitarSounds[newID]
        local duration = GuitarLength[newID]

        player:EmitSound(song, 90, 100)


        timer.Create(timerName, duration, 1, PlayNextSong)
    end

    PlayNextSong()
end

function PLUGIN:StopGuitarLoop(player)
    if not SERVER then return end
    if not IsValid(player) then return end

    local timerName = "GuitarLoop_" .. player:SteamID()
    timer.Remove(timerName)


    for _, soundPath in ipairs(GuitarSounds) do
        player:StopSound(soundPath)
    end

    player.LastGuitarSound = nil
end

function PLUGIN:OnWeaponRaised(player, weapon, bIsRaised)
	if (IsValid(weapon)) then
		local curTime = CurTime()
		
		if weapon:GetClass() == "begotten_scrappers_guitar" then
			if bIsRaised and not player:GetNetVar("ThrustStance") then
				self:StartGuitarLoop(player)
			else
				self:StopGuitarLoop(player)
			end
		elseif weapon:GetClass() == "begotten_prelude_chainsword" then
			if bIsRaised then
				self:StartChainsawLoop(player)
			else
				self:StopChainsawLoop(player)
			end
		end
		
		hook.Run("UpdateWeaponRaised", player, weapon, bIsRaised, curTime)
	end
end

function PLUGIN:UpdateWeaponRaised(player, weapon, bIsRaised, curTime)
	if (bIsRaised or table.HasValue(blockedWeapons, weapon:GetClass())) then
		weapon:SetNextPrimaryFire(curTime)
		weapon:SetNextSecondaryFire(curTime)

		if (weapon.OnRaised) then
			weapon:OnRaised(player, curTime)
		end
	else
		weapon:SetNextPrimaryFire(curTime + 60)
		weapon:SetNextSecondaryFire(curTime + 60)

		if (weapon.OnLowered) then
			weapon:OnLowered(player, curTime)
		end
	end
end

function PLUGIN:PlayerThink(player, curTime)
	local weapon = player:GetActiveWeapon()

	if (IsValid(weapon)) then
		if (!player:IsWeaponRaised()) then
			weapon:SetNextPrimaryFire(curTime + 60)
			weapon:SetNextSecondaryFire(curTime + 60)
		end
	end
end

function PLUGIN:ModelWeaponRaised(player, model)
	return player:IsWeaponRaised()
end

function PLUGIN:PlayerSwitchWeapon(player, oldWeapon, newWeapon)
	local action = Clockwork.player:GetAction(player);
	
	if action == "raise" then
		Clockwork.player:SetAction(player, nil);
	end
end

function PLUGIN:PlayerSetupDataTables(player)
	player:DTVar("Bool", BOOL_WEAPON_RAISED, "WeaponRaised")
end

if CLIENT then
	function PLUGIN:GetProgressBarInfoAction(action, percentage)
		if (action == "raise") then
			local raiseText = "RAISING...";

			if (Clockwork.Client:IsWeaponRaised()) then
				raiseText = "LOWERING..."
			end;
						
			return {text = raiseText, percentage = percentage, flash = percentage < 10}
		end
	end
	
	function PLUGIN:ClockworkInitialized()
		Clockwork.ConVars.Binds.RAISEWEAPON = Clockwork.kernel:CreateClientConVar("cwRaiseBind", KEY_F, true, true)
		Clockwork.setting:AddKeyBinding("Key Bindings", "Raise Weapon: ", "cwRaiseBind", "begotten_raise");
	end
end
