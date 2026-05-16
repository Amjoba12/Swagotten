--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

--setskin
--setattribute

local COMMAND = Clockwork.command:New("CfgListVars");
	COMMAND.tip = "List the Clockwork config variables.";
	COMMAND.text = "[string Find]";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local searchData = arguments[1] or "";
			netstream.Start(player, "CfgListVars", searchData);
		Clockwork.player:Notify(player, "The config variables have been printed to the console.");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CfgSetVar");
	COMMAND.tip = "Set a Clockwork config variable.";
	COMMAND.text = "<string Key> [all Value] [string Map]";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local key = arguments[1];
		local value = arguments[2] or "";
		local configObject = config.Get(key);
		
		if (configObject:IsValid()) then
			local keyPrefix = "";
			local useMap = arguments[3];
			
			if (useMap == "") then
				useMap = nil;
			end;
			
			if (useMap) then
				useMap = string.lower(Clockwork.kernel:Replace(useMap, ".bsp", ""));
				keyPrefix = useMap.."'s ";
				
				if (!file.Exists("maps/"..useMap..".bsp", "GAME")) then
					Clockwork.player:Notify(player, useMap.." is not a valid map!");
					return;
				end;
			end;
			
			if (!configObject("isStatic")) then
				value = configObject:Set(value, useMap);
				
				if (value != nil) then
					local printValue = tostring(value);
					
					if (configObject("isPrivate")) then
						if (configObject("needsRestart")) then
							Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..string.rep("*", string.len(printValue)).."' for the next restart.");
						else
							Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..string.rep("*", string.len(printValue)).."'.");
						end;
					elseif (configObject("needsRestart")) then
						Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..printValue.."' for the next restart.");
					else
						Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..printValue.."'.");
					end;
				else
					Clockwork.player:Notify(player, key.." was unable to be set!");
				end;
			else
				Clockwork.player:Notify(player, key.." is a static config key!");
			end;
		else
			Clockwork.player:Notify(player, key.." is not a valid config key!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("Announce");
	COMMAND.tip = "Notify all players on the server.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local text = table.concat(arguments, " ");
		
		if (text) then
			if Schema.EasyText then
				for _, v in _player.Iterator() do
					if IsValid(v) and v:HasInitialized() then
						Schema:EasyText(v, "icon16/bell.png", "goldenrod", "[ANNOUNCEMENT] "..text);
						v:SendLua([[Clockwork.Client:EmitSound("ui/pickup_secret01.wav", 80, 80)]]);
					end
				end
			else
				Clockwork.player:Notify(PlayerCache or _player.GetAll(), text);
			end
		end;
	end;
COMMAND:Register();

--[[local COMMAND = Clockwork.command:New("ClearItems");
	COMMAND.tip = "Clear all items from the map.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local items = 0;
		
		for k, v in pairs (ents.FindByClass("cw_item")) do
			if (hook.Run("CanClearItem", v)) then
				v:Remove();
				items = items + 1;
			end;
		end;
		
		if (items > 0) then
			Clockwork.player:Notify(player, "You removed "..items.." items.");
		else
			Clockwork.player:Notify(player, "There were no items to remove.");
		end;
	end;
COMMAND:Register();]]--

local COMMAND = Clockwork.command:New("ClearNPCs");
	COMMAND.tip = "Clear all decals.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local npcs = 0;
		
		for k, v in pairs (ents.GetAll()) do
			if (v:IsNPC() or v:IsNextBot()) then
				v:Remove();
				npcs = npcs + 1;
			end;
		end;
		
		if (npcs > 0) then
			Clockwork.player:Notify(player, "You removed "..npcs.." NPCs.");
		else
			Clockwork.player:Notify(player, "There were no npcs to remove.");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyStopSound");
	COMMAND.tip = "Stop all sounds on a specific player.";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"CharStopSound", "StopSoundTarget", "StopSoundPlayer"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);

		if (!target) then
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
			
			return;
		end;
	
		target:SendLua([[RunConsoleCommand("stopsound")]]);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("StopSoundGlobal");
	COMMAND.tip = "Stop all sounds for all players.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:SendLua([[RunConsoleCommand("stopsound")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("StopSoundRadius");
	COMMAND.tip = "Stops all sounds to all players in a specified radius. Default radius is 512.";
	COMMAND.optionalArguments = 1;
	COMMAND.access = "s";
	COMMAND.text = "[int Radius]";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local players = {};
		
		for k, v in pairs (ents.FindInSphere(player:GetPos(), arguments[1] or 512)) do
			if (v:IsPlayer()) then
				players[#players + 1] = v;
			end;
		end;
		
		for k, v in pairs(players) do
			v:SendLua([[RunConsoleCommand("stopsound")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ClearDecals");
	COMMAND.tip = "Clear all decals.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:SendLua([[RunConsoleCommand("r_cleardecals")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyReset");
	COMMAND.tip = "Reset a player.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "a";
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"Reset", "CharReset"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);

		if (!target) then
			target = player;
		end;
		
		local name = target:Name();
			if (target == player) then
				name = "yourself";
			end;
		local position = target:GetPos();
		local angles = target:GetAngles();
		local eyeAngles = target:EyeAngles();

		target:KillSilent();
		target:Spawn();
		target:SetPos(position);
		target:SetAngles(angles);
		target:SetEyeAngles(eyeAngles);
		
		Clockwork.player:Notify(player, "You have reset "..name..".");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyExtinguish");
	COMMAND.tip = "Extinguish a player.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"CharExtinguish", "Extinguish"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local name = target:Name();
			local playerName = player:Name();
			
			if (target:IsOnFire()) then
				target:Extinguish();
				Clockwork.player:Notify(player, "You have extinguished "..name);
			else
				Clockwork.player:Notify(player, name.." is not on fire!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyIgnite");
	COMMAND.tip = "Ignite a player.";
	COMMAND.text = "<string Name> <int Seconds>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharIgnite", "Ignite"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local name = target:Name();
			local playerName = player:Name();
			
			if (!target:IsOnFire()) then
				local time = tonumber(arguments[2]);
				
				for _, v in _player.Iterator() do
					if (v != player and v != target and v:IsAdmin() or v:IsUserGroup("operator")) then
						Clockwork.player:Notify(player, playerName.." has ignited "..name.." for "..time.." seconds.")
					end;
				end;
			
				Clockwork.player:Notify(player, "You have ignited "..name.." for "..time.." seconds.")
					if (target:IsAdmin()) then
						Clockwork.player:Notify(target, "You have been ignited by "..playerName.."!");
					end;
				target:Ignite(time, 0);
			else
				Clockwork.player:Notify(player, name.." is already on fire!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyWarn");
	COMMAND.tip = "Add a player to a whitelist.";
	COMMAND.text = "<string Name> <string Warning>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharWarn", "Warn"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local playerName = player:Name();
			local name = target:Name();
			local message = table.concat(arguments, " ", 2);
			
			for _, v in _player.Iterator() do
				if (v != player and v != target and v:IsAdmin() or v:IsUserGroup("operator")) then
					Clockwork.player:Notify(v, playerName.." has warned "..name.." with the following message: \""..message.."\"")
				end;
			end;
			
			Clockwork.kernel:PrintLog(LOGTYPE_MAJOR, playerName.." has warned "..name.." with the following message: \""..message.."\"");
			Clockwork.player:Notify(target, "You have been warned by "..playerName..": \""..message.."\"");
			Clockwork.player:Notify(player, "You have warned "..name..": \""..message.."\"");
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ListColors");
	COMMAND.tip = "Print all available colors to your console. First argument allows a search of the table.";
	COMMAND.text = "<string Search>";
	COMMAND.access = "a";
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local search = arguments[1];
		local colorTable = colors;
		local printTable = {};

		for k, v in pairs (colorTable) do
			if (search != nil and isstring(search)) then
				if (string.match(k, search)) then
					printTable[k] = v;
				else
					continue;
				end;
			else
				printTable[k] = v;
			end;
		end;
		
		if (printTable and !table.IsEmpty(printTable)) then
			netstream.Start(player, "PrintWithColor", "----- START COLOR LIST -----", Color(100, 255, 100));
				netstream.Heavy(player, "PrintTableWithColor", pon.encode(printTable));
			netstream.Start(player, "PrintWithColor", "----- END COLOR LIST -----", Color(100, 255, 100));
		elseif (isstring(search)) then
			Clockwork.player:Notify(player, "No colors found with the search argument '"..search.."'!")
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PluginLoad");
	COMMAND.tip = "Attempt to load a plugin.";
	COMMAND.text = "<string Name>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local plugin = plugin.FindByID(arguments[1]);
		
		if (!plugin) then
			Clockwork.player:Notify(player, "This plugin is not valid!");
			return;
		end;
		
		local unloadTable = Clockwork.command:FindByID("PluginLoad");
		local loadTable = Clockwork.command:FindByID("PluginLoad");
		
		if (!plugin.IsDisabled(plugin.name)) then
			local bSuccess = plugin.SetUnloaded(plugin.name, false);
			local recipients = {};
			
			if (bSuccess) then
				Clockwork.player:NotifyAll(player:Name().." has loaded the "..plugin.name.." plugin for the next restart.");
				
				for _, v in _player.Iterator() do
					if (v:HasInitialized()) then
						if (Clockwork.player:HasFlags(v, loadTable.access)
						or Clockwork.player:HasFlags(v, unloadTable.access)) then
							recipients[#recipients + 1] = v;
						end;
					end;
				end;
				
				if (#recipients > 0) then
					netstream.Start(recipients, "SystemPluginSet", {plugin.name, false});
				end;
			else
				Clockwork.player:Notify(player, "This plugin could not be loaded!");
			end;
		else
			Clockwork.player:Notify(player, "This plugin depends on another plugin!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PluginUnload");
	COMMAND.tip = "Attempt to unload a plugin.";
	COMMAND.text = "<string Name>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local plugin = plugin.FindByID(arguments[1]);
		
		if (!plugin) then
			Clockwork.player:Notify(player, "This plugin is not valid!");
			return;
		end;
		
		local unloadTable = Clockwork.command:FindByID("PluginLoad");
		local loadTable = Clockwork.command:FindByID("PluginLoad");
		
		if (!plugin.IsDisabled(plugin.name)) then
			local bSuccess = plugin.SetUnloaded(plugin.name, true);
			local recipients = {};
			
			if (bSuccess) then
				Clockwork.player:NotifyAll(player:Name().." has unloaded the "..plugin.name.." plugin for the next restart.");
				
				for _, v in _player.Iterator() do
					if (v:HasInitialized()) then
						if (Clockwork.player:HasFlags(v, loadTable.access)
						or Clockwork.player:HasFlags(v, unloadTable.access)) then
							recipients[#recipients + 1] = v;
						end;
					end;
				end;
				
				if (#recipients > 0) then
					netstream.Start(recipients, "SystemPluginSet", {plugin.name, true});
				end;
			else
				Clockwork.player:Notify(player, "This plugin could not be unloaded!");
			end;
		else
			Clockwork.player:Notify(player, "This plugin depends on another plugin!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ShutDown");
	COMMAND.tip = "Shut down the server safely (this is the only way the save data functions will be called, so use this instead of the control panel). Leave the optional argument blank if you want the shut down to be immediate.";
	COMMAND.text = "[seconds Delay]";
	COMMAND.access = "s";
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local delay = arguments[1];
	
		if delay and tonumber(delay) and tonumber(delay) > 0 then
			local message = "The server will be shutting down in "..tostring(delay).." seconds!";
		
			for _, v in _player.Iterator() do
				Clockwork.player:Notify(v, message);
			end
			
			timer.Create("ServerShutdownTimer", delay, 1, function()
				RunConsoleCommand("disconnect");
			end);
		else
			RunConsoleCommand("disconnect");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ShutDownAbort");
	COMMAND.tip = "Cancel the timer of a server shutdown.";
	COMMAND.access = "s";
	COMMAND.alias = {"CancelShutDown", "ShutDownCancel", "AbortShutDown"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if timer.Exists("ServerShutdownTimer") then
			timer.Remove("ServerShutdownTimer");
			
			for _, v in _player.Iterator() do
				Clockwork.player:Notify(v, "The server shutdown has been aborted!");
			end
		else
			Clockwork.player:Notify(player, "There is no server shutdown currently in progress!");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("SaveData");
	COMMAND.tip = "Save the server state manually.";
	COMMAND.access = "s";
	
	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		Clockwork.kernel:ProcessSaveData(false, true);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ToggleCharSwapping");
	COMMAND.tip = "Toggle whether or not charswapping should be enabled. Will only apply to alive characters and non-admins.";
	COMMAND.access = "s";
	COMMAND.alias = {"CharSwappingToggle", "DisableCharSwapping", "EnableCharSwapping"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if Clockwork.charSwappingDisabled then
			Clockwork.charSwappingDisabled = false;
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has enabled charswapping for non-admins.");
			
			if Schema.fuckerJoeActive then
				Schema.fuckerJoeActive = false;
			end
		else
			Clockwork.charSwappingDisabled = true;
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has disabled charswapping for non-admins.");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ToggleFactionRatio");
	COMMAND.tip = "Toggle whether or not the faction ratio system should be enabled.";
	COMMAND.access = "s";
	COMMAND.alias = {"ToggleRatio", "FactionRatio", "RatioToggle"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if Clockwork.config:Get("faction_ratio_enabled"):Get() then
			Clockwork.config:Get("faction_ratio_enabled"):Set(false);
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has disabled the faction ratio system.");
		else
			Clockwork.config:Get("faction_ratio_enabled"):Set(true);
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has enabled the faction ratio system.");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("Respawn");
	COMMAND.tip = "Respawn yourself at your faction's spawn point and heal.";
	COMMAND.text = "";
	COMMAND.access = "";
	COMMAND.alias = {"respawn"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		-- Получаем текущее действие игрока
		local action = Clockwork.player:GetAction(player)
		
		-- ПРОВЕРКА: не находится ли игрок в состоянии смерти
		if (action == "die" or action == "die_bleedout") then
			Clockwork.player:Notify(player, "You cannot respawn while dying!")
			return
		end
		
		-- Проверяем, жив ли игрок
		if (player:Alive()) then
			Clockwork.player:Notify(player, "You are already alive!");
			return;
		end
		
		-- Получаем фракцию игрока
		local faction = player:GetFaction()
		local factionTable = Clockwork.faction:FindByID(faction)
		
		-- ПРОВЕРКА: не отключена ли фракция
		if (factionTable and factionTable.disabled == true) then
			Clockwork.player:Notify(player, "Your faction is currently disabled! You cannot respawn.")
			return
		end
		
		local class = Clockwork.class:FindByID(player:Team())
		local spawnPoints = cwSpawnPoints.spawnPoints
		local position = nil
		local rotate = nil
		
		-- Проверяем спавны по классу
		if (class and spawnPoints and spawnPoints[class.name] and #spawnPoints[class.name] > 0) then
			local randomSpawn = math.random(1, #spawnPoints[class.name])
			position = spawnPoints[class.name][randomSpawn].position
			rotate = spawnPoints[class.name][randomSpawn].rotate
		end
		
		-- Если нет спавна по классу, проверяем по фракции
		if (!position and spawnPoints and spawnPoints[faction] and #spawnPoints[faction] > 0) then
			local randomSpawn = math.random(1, #spawnPoints[faction])
			position = spawnPoints[faction][randomSpawn].position
			rotate = spawnPoints[faction][randomSpawn].rotate
		end
		
		-- Если ничего не нашли, используем дефолтный спавн
		if (!position and spawnPoints and spawnPoints["default"] and #spawnPoints["default"] > 0) then
			local randomSpawn = math.random(1, #spawnPoints["default"])
			position = spawnPoints["default"][randomSpawn].position
			rotate = spawnPoints["default"][randomSpawn].rotate
		end
		
		-- Если всё ещё нет позиции, используем info_player_start
		if (!position) then
			local infoStarts = ents.FindByClass("info_player_start")
			if (#infoStarts > 0) then
				position = infoStarts[1]:GetPos()
			end
		end
		
		-- Выполняем респавн
		if (position) then
			-- Сбрасываем звание (ранг) до 1
			local oldRank = player:GetCharacterData("rank", 1)
			if (oldRank and oldRank > 1) then
				player:SetCharacterData("rank", 1)
			end
			
			-- СТАВИМ ПОЛНОЕ СТИМОВСКОЕ ИМЯ
			local steamName = player:SteamName()
			if steamName and steamName ~= "" then
				Clockwork.player:SetName(player, steamName)
				player:SetCharacterData("RealName", steamName)
				player:SetNetVar("NameOverride", steamName)
			end
			
			-- Синхронизируем NetVar ранга
			player:SetNetVar("rank", 1)
			
			-- Убиваем и воскрешаем игрока
			player:KillSilent()
			player:Spawn()
			
			-- Устанавливаем позицию
			player:SetPos(position + Vector(0, 0, 8))
			
			-- Устанавливаем поворот
			if (rotate) then
				player:SetEyeAngles(Angle(0, rotate, 0))
			end
			
			-- Лечим здоровье
			player:SetHealth(player:GetMaxHealth())
			player:SetArmor(0)
			
			-- Лечим конечности
			if (Clockwork.limb and Clockwork.limb.ResetDamage) then
				Clockwork.limb:ResetDamage(player)
			elseif (Clockwork.limb and Clockwork.limb.HealBody) then
				Clockwork.limb:HealBody(player, 100)
			end
			
			-- ВОССТАНАВЛИВАЕМ СТАМИНУ
			local maxStamina = player:GetMaxStamina()
			if maxStamina then
				if player.SetStamina then
					player:SetStamina(maxStamina)
				elseif player.SetCharacterData then
					player:SetCharacterData("Stamina", maxStamina)
					player:SetNWInt("Stamina", maxStamina)
				end
			end
			
			-- Восстанавливаем мелевую стамину
			if cwMelee then
				local maxPoise = 100
				if player.GetMaxPoise then
					maxPoise = player:GetMaxPoise()
				end
				if player.SetNWInt then
					player:SetNWInt("meleeStamina", maxPoise)
				end
			end
			
			-- Восстанавливаем стабильность
			local maxStability = player:GetMaxStability()
			if maxStability and player.SetNWInt then
				player:SetNWInt("stability", maxStability)
				player:SetCharacterData("stability", maxStability)
			end
			
			-- ВОССТАНАВЛИВАЕМ ВАРКРАЯ
			player.lastWarCry = nil
			if player.warCryVictims then
				player.warCryVictims = nil
			end
			
			local entIndex = player:EntIndex()
			local timersToRemove = {
				"warcryTimer_"..entIndex,
				"RavenTimer_"..entIndex,
				"IconoclastTimer_"..entIndex,
				"FearsomeWolfTimer_"..entIndex,
				"DaringTroutTimer_"..entIndex
			}
			
			for _, timerName in ipairs(timersToRemove) do
				if timer.Exists(timerName) then
					timer.Remove(timerName)
				end
			end
			
			timer.Simple(0.1, function()
				if IsValid(player) then
					player:SendLua([[
						if cwBeliefs then
							cwBeliefs.upgradedWarcryActive = nil
							cwBeliefs.raven = nil
							cwBeliefs.iconoclast = nil
							cwBeliefs.highlightTargetOverride = nil
						end
						if timer.Exists("warcryTimer") then
							timer.Remove("warcryTimer")
						end
						if timer.Exists("tasteOfBloodTimer") then
							timer.Remove("tasteOfBloodTimer")
						end
						for _, v in pairs(player.GetAll()) do
							if v.warcryTarget then
								v.warcryTarget = nil
							end
						end
					]])
				end
			end)
			
			-- ВОССТАНАВЛИВАЕМ ЕДУ, ЖАЖДУ И СОН
			if cwCharacterNeeds then
				if player.SetNeed then
					player:SetNeed("hunger", 0)
					player:SetNeed("thirst", 0)
					player:SetNeed("sleep", 0)
					
					player:SetNetVar("hunger", 0)
					player:SetNetVar("thirst", 0)
					player:SetNetVar("sleep", 0)
				elseif player.HandleNeed then
					player:HandleNeed("hunger", -player:GetNeed("hunger", 0))
					player:HandleNeed("thirst", -player:GetNeed("thirst", 0))
					player:HandleNeed("sleep", -player:GetNeed("sleep", 0))
				end
			end
			
			-- Сбрасываем порчу
			if (cwCharacterNeeds and player.HandleNeed) then
				player:HandleNeed("corruption", -player:GetNeed("corruption", 0))
			elseif (player.SetCharacterData) then
				player:SetCharacterData("corruption", 0)
				player:SetLocalVar("corruption", 0)
			end
			
			-- Сбрасываем флаг COLLECTED_GEAR и таймер
			player:SetCharacterData("collectedGear", false)
			player:SetLocalVar("collectedGear", false)
			player:SetData("nextGear", 0)
			
			-- Обновляем параметры скорости
			hook.Run("RunModifyPlayerSpeed", player, player.cwInfoTable, true)
			
			-- Уведомляем игрока
			Clockwork.player:Notify(player, "You have been respawned and fully healed!")
		else
			Clockwork.player:Notify(player, "No valid spawn point found!")
		end
	end;
COMMAND:Register();