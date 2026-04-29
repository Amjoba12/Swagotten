local ITEM = Clockwork.item:New();
	ITEM.name = "Gatekeeper Standard Issue";
	ITEM.model = "models/vj_props/duffle_bag.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "gatekeeper_standard_issue";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing equipment standard to that of the Gatekeeper Order.";
	ITEM.weight = 5;
	ITEM.randomWeapons = {"begotten_1h_brokensword", "begotten_1h_pipemace", "begotten_1h_spikedbat", "begotten_1h_spikedboard", "begotten_spear_pitchfork"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	Clockwork.player:GiveCash(player, 200, "Gatekeeper Allowance");
	player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_ration"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_ration"), true);
	player:GiveItem(Clockwork.item:CreateInstance("purified_water"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("purified_water"), true);
	
	if subfaction == "Auxiliary" then
		--player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_pipemace"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		player:GiveItem(Clockwork.item:CreateInstance("auxiliary_gambeson"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	elseif subfaction == "Praeventor" then
		player:GiveItem(Clockwork.item:CreateInstance("backpack_small"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_spear_scrapspear"), true);
		player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wanderer_cap"), true);
		player:GiveItem(Clockwork.item:CreateInstance("praeventor_gambeson"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("lockpick"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_gambeson"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("bindings"), true);
	end
	
	--player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_glazicus"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("mail_coif"), true);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Renegade Gatekeeper Standard Issue";
	ITEM.model = "models/vj_props/duffle_bag.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "renegade_gatekeeper_standard_issue";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing equipment standard to that of Pope Adyssa's Gatekeeper Order.";
	ITEM.weight = 5;
	ITEM.randomWeapons = {"begotten_1h_pipemace", "begotten_1h_scrapblade", "begotten_spear_scrapspear", "begotten_1h_bladedbat", "begotten_2h_great_sledge"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:HandleXP(5000);
	player:GiveItem(Clockwork.item:CreateInstance("moldy_bread"), true);
	player:GiveItem(Clockwork.item:CreateInstance("moldy_bread"), true);
	player:GiveItem(Clockwork.item:CreateInstance("dirtywater"), true);
	player:GiveItem(Clockwork.item:CreateInstance("dirtywater"), true);
	player:GiveItem(Clockwork.item:CreateInstance("renegade_disciple_robes"), true);
	player:GiveItem(Clockwork.item:CreateInstance("begotten_peppershot"), true);
	player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
	player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
	player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
	player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
	player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_sledge"), true);
	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Hillkeeper Standard Issue";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "hillkeeper_standard_issue";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A thinly sewn pouch containing equipment standard to that of the Hillkeepers.";
	ITEM.weight = 5;
	ITEM.randomWeapons = {"begotten_1h_brokensword", "begotten_1h_pipemace", "begotten_1h_spikedbat", "begotten_1h_spikedboard", "begotten_spear_pitchfork"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	Clockwork.player:GiveCash(player, 200, "Hillkeeper Allowance");
	--player:GiveItem(Clockwork.item:CreateInstance("cooked_goat_meat"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("moldy_bread"), true);
	player:GiveItem(Clockwork.item:CreateInstance("purified_water"), true);
	
	if subfaction == "Servus" then
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_pipemace"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_aketon"), true);
	elseif subfaction == "Outrider" then
		player:GiveItem(Clockwork.item:CreateInstance("backpack_small"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_spear_scrapspear"), true);
		player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wanderer_cap"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_aketon"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("lockpick"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_aketon"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("bindings"), true);
		if math.random(1, 3) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_axehill"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_axehill"), true);
		end
	end
end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Tier 1";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "standard_issue_1";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 1 equipment.";
	ITEM.weight = 5;
	ITEM.randomWeapons = {"begotten_1h_bladedbat", "begotten_1h_bladedboard", "begotten_1h_brokensword", "begotten_1h_bonemace", "begotten_2h_great_club", "begotten_spear_scrapspear", "begotten_spear_harpoon", "begotten_1h_pipemace", "begotten_spear_pitchfork", "begotten_1h_spikedbat", "begotten_1h_spikedboard", "begotten_2h_great_sledge"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();
	
	if subfaction == "Clan Grock" or subfaction == "Low Ministry" or subfaction == "Knights of Sol" or subfaction == "Inquisition" then
		if player:Alive() then
			local itemsList = Clockwork.inventory:GetAsItemsList(player:GetInventory())
		
			for k, v in pairs(itemsList) do
				for i = 1, Clockwork.inventory:GetItemCountByID(player:GetInventory(), v.uniqueID) do
					player:TakeItemByID(v.uniqueID)
				end
			end
		
			player:Kill()
			
			if player:GetRagdollEntity() then
				cwGore:SplatCorpse(player:GetRagdollEntity(), 60)
				
				player:EmitSound("ambient/explosions/explode_"..math.random(1, 4)..".wav", 100, 100)
				
				local effectData = EffectData()
				effectData:SetOrigin(player:GetPos())
				effectData:SetMagnitude(50)
				effectData:SetScale(50)
				util.Effect("Explosion", effectData)
				
				Clockwork.chatBox:AddInTargetRadius(player, "me", 
					"оказался пидорасом!", 
					player:GetPos(), 
					config.Get("talk_radius"):Get() * 100
				)
			end
		end
		return
	end
    if player:GetFaction() == "Goreic Warrior" then
		player:GiveItem(Clockwork.item:CreateInstance("gore_pouch"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance("backpack_survivalist"), true);
	end

	if subfaction == "Rekh-khet-sa" then
		player:HandleXP(1);
	else
		player:HandleXP(1000);
	end
	for i = 1, 3 do
		player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
	end
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
	end
	
	if subfaction == "Clan Crast" then
		player:GiveItem(Clockwork.item:CreateInstance("gore_warfighter_armor"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);

		--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	elseif subfaction == "Servus" then
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_aketon"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
	elseif subfaction == "Outrider" or subfaction == "Watchman" then
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_aketon"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
	elseif subfaction == "Auxiliary" then
		player:GiveItem(Clockwork.item:CreateInstance("light_brigandine_armor"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
	elseif subfaction == "Praeventor" or subfaction == "Legionary" then
		player:GiveItem(Clockwork.item:CreateInstance("light_brigandine_armor"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
	elseif subfaction == "Rekh-khet-sa" then
		player:GiveItem(Clockwork.item:CreateInstance("cultist_robe"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("death_whistle"), true);
	elseif subfaction == "Philimaxio" or subfaction == "Kinisger" or subfaction == "Varazdat" then
		player:GiveItem(Clockwork.item:CreateInstance("cultist_robe"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance("gore_warfighter_armor"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield1"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeapons[math.random(1, #self.randomWeapons)]), true);

	end
	
	--player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_glazicus"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	--player:GiveItem(Clockwork.item:CreateInstance("mail_coif"), true);
end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Tier 2";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "standard_issue_2";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 2 equipment.";
	ITEM.weight = 5;
	ITEM.randomWeaponsG = {"begotten_1h_goreshortsword", "begotten_1h_gorebattleaxe", "begotten_prelude_1h_scrapfragaxe"}; 
	ITEM.randomWeaponsP = {"begotten_1h_ironarmingsword", "begotten_1h_gorebattleaxe", "begotten_spear_ironspear", "begotten_1h_battleaxe", "begotten_prelude_1h_scrapfragaxe"};
	ITEM.randomWeaponsGK = {"begotten_1h_ironarmingsword", "begotten_1h_gorebattleaxe", "begotten_spear_ironspear", "begotten_1h_battleaxe", "begotten_1h_glazicus", "begotten_prelude_1h_scrapfragaxe"};
	ITEM.randomWeaponsReaverFOTD = {"begotten_1h_goreshortsword", "begotten_1h_reaverbattleaxe", "begotten_spear_ironspear", "begotten_prelude_1h_scrapfragaxe"};
	ITEM.randomWeaponsReaverFOTF = {"begotten_1h_reaverbattleaxe", "begotten_1h_goreshortsword", "begotten_spear_ironspear", "begotten_prelude_1h_scrapfragaxe"};
	ITEM.randomWeaponsGheavy = {"begotten_2h_great_goreclub", "begotten_2h_great_gorewaraxe", "begotten_2h_longsword", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_great_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_2h_great_kanabo", "begotten_prelude_2h_scrapchopper", "begotten_prelude_polearm_goedandag", "begotten_prelude_polearm_mancatcher"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_longsword", "begotten_2h_great_heavybattleaxe", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_2h_great_kanabo", "begotten_prelude_2h_scrapchopper", "begotten_prelude_polearm_goedandag", "begotten_prelude_polearm_mancatcher"};
	ITEM.randomWeaponsReaverFOTDheavy = {"begotten_2h_great_reaverwaraxe", "begotten_2h_great_goreclub", "begotten_2h_longsword", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_2h_great_kanabo", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomWeaponsReaverFOTDheavyPRIME = {"begotten_2h_longsword", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc"};
	ITEM.randomWeaponsReaverFOTDPRIME = {"begotten_1h_goreshortsword", "begotten_1h_reaverbattleaxe", "begotten_spear_ironspear"};
	ITEM.randomWeaponsReaverFOTFheavy = {"begotten_2h_great_reaverwaraxe", "begotten_2h_great_goreclub", "begotten_2h_longsword", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_2h_great_kanabo", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomcharms = {"ring_vitality_lesser", "embalmed_heart", "ring_courier", "ring_protection_bronze", "ring_pummeler", "boot_contortionist"};
	ITEM.randomcharmsSERVUS = {"ring_vitality_lesser", "embalmed_heart", "ring_courier", "ring_protection_bronze", "ring_pummeler", "boot_contortionist", "bandolier"};
	ITEM.randomWeaponsSATAN = {"begotten_1h_twistedmachete", "begotten_1h_twistedclub", "begotten_1h_warpedsword", "begotten_1h_scimitar", "begotten_prelude_1h_scrapfragaxe"};
	ITEM.randomWeaponsSATANheavy = {"begotten_2h_longsword", "begotten_2h_great_heavybattleaxe", "begotten_scythe_warscythe", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_2h_great_kanabo", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomWeaponsSATANrekh = {"begotten_1h_twistedmachete", "begotten_1h_twistedclub", "begotten_1h_warpedsword", "begotten_spear_ironspear", "begotten_1h_scimitar", "begotten_prelude_2h_bludgeoner", "begotten_prelude_2h_estoc", "begotten_prelude_polearm_goedandag", "begotten_prelude_polearm_mancatcher"};

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();
	local faith = player:GetFaith();
    local subfaith = player:GetSubfaith();

	if subfaction == "Low Ministry" or subfaction == "Knights of Sol" or subfaction == "Inquisition" then
		if player:Alive() then
			local itemsList = Clockwork.inventory:GetAsItemsList(player:GetInventory())
		
			for k, v in pairs(itemsList) do
				for i = 1, Clockwork.inventory:GetItemCountByID(player:GetInventory(), v.uniqueID) do
					player:TakeItemByID(v.uniqueID)
				end
			end
		
			player:Kill()
			
			if player:GetRagdollEntity() then
				cwGore:SplatCorpse(player:GetRagdollEntity(), 60)
				
				player:EmitSound("ambient/explosions/explode_"..math.random(1, 4)..".wav", 100, 100)
				
				local effectData = EffectData()
				effectData:SetOrigin(player:GetPos())
				effectData:SetMagnitude(50)
				effectData:SetScale(50)
				util.Effect("Explosion", effectData)
				
				Clockwork.chatBox:AddInTargetRadius(player, "me", 
					"оказался пидорасом!", 
					player:GetPos(), 
					config.Get("talk_radius"):Get() * 100
				)
			end
		end
		return
	end
    if math.random (1, 80) == 1 then
        player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_lungemine"), true);
        Clockwork.chatBox:SetMultiplier(1.35)
        Clockwork.chatBox:Add(player, nil, "demontalk", "Иди и отдай свою жизнь аллаху.")
        timer.Simple(0.5, function()
            Clockwork.chatBox:SetMultiplier(1.0)
        end)
    end 
    player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
    player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	if player:GetFaction() == "Goreic Warrior" then
		player:GiveItem(Clockwork.item:CreateInstance("gore_pouch"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance("backpack_survivalist"), true);
	end
	player:HandleXP(3500);
	for i = 1, 4 do
		player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
	end
	for i = 1, 3 do
		player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
    for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end
	if subfaction == "Clan Gore" then
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("gore_beserker_armor"), true); 
			player:GiveItem(Clockwork.item:CreateInstance("begotten_claws_savageclaws"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("gore_chainmail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("gore_horned_helm"), true);
		end
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
	elseif subfaction == "Clan Harald" then
		player:GiveItem(Clockwork.item:CreateInstance("haralder_chainmail"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_ridge_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield14"), true);
		for i = 1, 5 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);		
	elseif subfaction == "Clan Shagalax" then 
		player:GiveItem(Clockwork.item:CreateInstance("quebecois_gore_chainmail"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_horned_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_goremace"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield14"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
		for i = 1, 4 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[math.random(1, #self.randomcharmsSERVUS)]), true);	
	elseif subfaction == "Clan Reaver" then
		if faith == "Faith of the Dark" then
            if subfaith == "Primevalism" then
                player:GiveItem(Clockwork.item:CreateInstance("reaver_chainmail"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_slaver_helmet"), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDPRIME[math.random(1, #self.randomWeaponsReaverFOTDPRIME)]), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavyPRIME[math.random(1, #self.randomWeaponsReaverFOTDheavyPRIME)]), true);
                for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
                player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
                player:GiveItem(Clockwork.item:CreateInstance("shield6"), true);
            else
				player:GiveItem(Clockwork.item:CreateInstance("reaver_chainmail"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_slaver_helmet"), true);
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_gorehuntingdagger"), true);
				end
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTD[math.random(1, #self.randomWeaponsReaverFOTD)]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTD[math.random(1, #self.randomWeaponsReaverFOTD)]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavy[math.random(1, #self.randomWeaponsReaverFOTDheavy)]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
            end
		else
			player:GiveItem(Clockwork.item:CreateInstance("reaver_chainmail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("reaver_slaver_helmet"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_gorehuntingdagger"), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield14"), true);
			for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTF[math.random(1, #self.randomWeaponsReaverFOTF)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTF[math.random(1, #self.randomWeaponsReaverFOTF)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavy[math.random(1, #self.randomWeaponsReaverFOTDheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
		end
	elseif subfaction == "Clan Crast" then
		player:GiveItem(Clockwork.item:CreateInstance("blade_druid_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_skull_helm2"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_druidsword"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield14"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
        player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
        player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);	
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
	elseif subfaction == "Clan Grock" then
		player:GiveItem(Clockwork.item:CreateInstance("grockling_godless_garb"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_grocklingsacredstonemaul"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_grocklingsword"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_gorehuntingdagger"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("stone"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        player:GiveItem(Clockwork.item:CreateInstance("effigy_human"), true);
	elseif subfaction == "Servus" then
		--player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
        player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
        player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_low_brigandine"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[math.random(1, #self.randomcharmsSERVUS)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 

		--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	elseif subfaction == "Outrider" then
		player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		player:GiveItem(Clockwork.item:CreateInstance("footpad_wrappings"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hood_mask"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_pepperbox"), true);
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
        player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	elseif subfaction == "Auxiliary" then
		if subfaith == "Sol Orthodoxy" then
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_ironflail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_monk_robes"), true);
			if math.random (1,2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
			for i = 1, 8 do
				player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
			end
			for i = 1, 6 do
				player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true); 
			end
            player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
            player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 3 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_medici_halfplate"), true);
			player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_helmet"), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[math.random(1, #self.randomcharmsSERVUS)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
      	 	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		end
	elseif subfaction == "Praeventor" then
		player:GiveItem(Clockwork.item:CreateInstance("shield2"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_brigandine_armor"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hood_mask"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_pepperbox"), true);
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
        player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	elseif subfaction == "Legionary" then
		if subfaith == "Sol Orthodoxy" then
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_ironflail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_monk_robes"), true);
			if math.random (1,2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_billhook"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_halfplate"), true);
			player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_helmet"), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
			for i = 1, 1 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		end
	elseif subfaction == "Varazdat" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("elegant_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("ballroom_mask_ornate"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
	elseif subfaction == "Philimaxio" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wanderer_mail"), true);
		player:GiveItem(Clockwork.item:CreateInstance("blackplate_helmet"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
	elseif subfaction == "Kinisger" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("elegant_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("ballroom_mask_ornate"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
	elseif subfaction == "Rekh-khet-sa" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("helldancer_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("blackplate_helmet"), true);
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_short"), true);
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("death_whistle"), true);
    elseif subfaction == "Raiders" or subfaction == "Tuners" then
        if subfaith == "Path of the Pale Rider" then
			player:GiveItem(Clockwork.item:CreateInstance("pale_rider_tier2"), true);
        else
			player:GiveItem(Clockwork.item:CreateInstance("eternal_heavens_tier2"), true);
        end
	else
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_billhook"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		end
		if math.random(1, 2) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_hauberk"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_mailed_brigandine"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("hill_acolyte_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_axehill"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
	end


end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Tier 3";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "standard_issue_3";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 3 equipment.";
	ITEM.weight = 5;
	ITEM.randomWeaponsG = {"begotten_1h_steelgorebattleaxe", "begotten_1h_familialsword"};
	ITEM.randomWeaponsP = {"begotten_1h_hillcrackaxe", "begotten_1h_hillarmingsword", "begotten_1h_steelarmingsword", "begotten_spear_wingedspear", "begotten_1h_warhammer"};
	ITEM.randomWeaponsGK = {"begotten_1h_steelarmingsword", "begotten_spear_wingedspear", "begotten_1h_warhammer", "begotten_1h_spatha"};
	ITEM.randomWeaponsPheavy = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_great_hilllongaxe", "begotten_2h_hilllongsword", "begotten_polearm_polehammer", "begotten_polearm_pike", "begotten_2h_great_eveningstar", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_polearm_hewingspear", "begotten_prelude_2h_great_scraphacker", "begotten_prelude_2h_great_scraphalberd", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsGKheavy = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_exileknightsword", "begotten_polearm_polehammer", "begotten_polearm_pike", "begotten_2h_great_eveningstar", "begotten_prelude_2h_great_daneaxe", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_polearm_hewingspear", "begotten_prelude_2h_great_scraphacker", "begotten_prelude_2h_great_scraphalberd", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsGKheavySOL = {"begotten_2h_exileknightsword", "begotten_scythe_glaive", "begotten_2h_great_eveningstar", "begotten_prelude_2h_great_daneaxe", "begotten_prelude_2h_exesword"};
	ITEM.randomWeaponsReaverFOTD = {"begotten_1h_satanicsword", "begotten_1h_satanicmace"};
	ITEM.randomWeaponsReaverFOTDS = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_spear_satanicspear", "begotten_1h_satanicshortsword"};
	ITEM.randomWeaponsReaverFOTF = {"begotten_claws_steelclaws", "begotten_1h_blackclaw"};
	ITEM.randomWeaponsHarald = {"begotten_2h_great_falx", "begotten_polearm_warspear", "begotten_polearm_halberd", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_polearm_hewingspear", "begotten_prelude_2h_great_scraphacker", "begotten_prelude_2h_great_scraphalberd", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsGheavy = {"begotten_2h_great_haralderwaraxe", "begotten_2h_great_falx", "begotten_2h_great_gorewaraxe", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_2h_great_scraphacker", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsReaverFOTDheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_sataniclongsword"};
	ITEM.randomWeaponsReaverFOTDheavyP = {"begotten_2h_sataniclongsword", "begotten_polearm_warspear", "begotten_polearm_pike", "begotten_polearm_polehammer", "begotten_polearm_halberd", "begotten_prelude_polearm_hewingspear", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsReaverFOTFheavy = {"begotten_2h_great_falx", "begotten_2h_great_haralderwaraxe", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword"};
	ITEM.randomcharmsOutrider = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver"};
	ITEM.randomcharmsP = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver",};
	ITEM.randomcharmsG = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver", "effigy_human"}; 
	ITEM.randomcharmsS = {"boot_contortionist", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver", "bandolier", "effigy_human"};
	ITEM.randomcharmsR = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver"};
	ITEM.randomcharmsSERVUS = {"boot_contortionist", "ring_pummeler", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver", "bandolier"};
	ITEM.randomWeaponsSATAN = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_1h_satanicshortsword"};
	ITEM.randomWeaponsSATANheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_sataniclongsword", "begotten_2h_great_darklanderbardiche", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_2h_great_scraphacker"};
	ITEM.randomWeaponsSATANrekh = {"begotten_1h_satanicsword", "begotten_spear_satanicspear", "begotten_1h_satanicshortsword"};
	ITEM.randomWeaponsSATANrekhheavy = {"begotten_2h_sataniclongsword", "begotten_polearm_warspear", "begotten_polearm_pike", "begotten_polearm_polehammer", "begotten_polearm_halberd", "begotten_prelude_polearm_hewingspear", "begotten_prelude_polearm_goedandag"};
	ITEM.randomWeaponsSATANvarazdatheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_great_darklanderbardiche", "begotten_2h_sataniclongsword", "begotten_polearm_warspear", "begotten_polearm_polehammer", "begotten_polearm_halberd", "begotten_prelude_2h_great_heavycleaver", "begotten_prelude_2h_exesword", "begotten_prelude_2h_great_scraphacker", "begotten_prelude_2h_great_scraphalberd"};


-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();
	local faith = player:GetFaith();
    local subfaith = player:GetSubfaith();
    
    if player:GetFaction() == "Gatekeeper" then
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
    end

	if subfaction == "Low Ministry" or subfaction == "Knights of Sol" or subfaction == "Inquisition" then
		if player:Alive() then
			local itemsList = Clockwork.inventory:GetAsItemsList(player:GetInventory())
		
			for k, v in pairs(itemsList) do
				for i = 1, Clockwork.inventory:GetItemCountByID(player:GetInventory(), v.uniqueID) do
					player:TakeItemByID(v.uniqueID)
				end
			end
		
			player:Kill()
			
			if player:GetRagdollEntity() then
				cwGore:SplatCorpse(player:GetRagdollEntity(), 60)
				
				player:EmitSound("ambient/explosions/explode_"..math.random(1, 4)..".wav", 100, 100)
				
				local effectData = EffectData()
				effectData:SetOrigin(player:GetPos())
				effectData:SetMagnitude(50)
				effectData:SetScale(50)
				util.Effect("Explosion", effectData)
				
				Clockwork.chatBox:AddInTargetRadius(player, "me", 
					"оказался пидорасом!", 
					player:GetPos(), 
					config.Get("talk_radius"):Get() * 100
				)
			end
		end
		return
	end
    if math.random (1, 80) == 1 then
        player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_lungemine"), true);
        Clockwork.chatBox:SetMultiplier(1.35)
        Clockwork.chatBox:Add(player, nil, "demontalk", "Иди и отдай свою жизнь аллаху.")
        timer.Simple(0.5, function()
            Clockwork.chatBox:SetMultiplier(1.0)
        end)
    end

	if player:GetFaction() == "Goreic Warrior" then
		player:GiveItem(Clockwork.item:CreateInstance("gore_pouch"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance("backpack_survivalist"), true);
	end
	player:HandleXP(999999);
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
    player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
    player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end
    player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);

	if subfaction == "Clan Gore" then
		player:GiveItem(Clockwork.item:CreateInstance("frenzied_chainmail"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_wolf_headdress"), true);
		for i = 1, 4 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_claws_steelclaws"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
        player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
	elseif subfaction == "Clan Harald" then
		player:GiveItem(Clockwork.item:CreateInstance("haralder_sealord_lamellar"), true);
		player:GiveItem(Clockwork.item:CreateInstance("haralder_sealord_ridge_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shieldhathood4"), true);
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsHarald[math.random(1, #self.randomWeaponsHarald)]), true);
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);		
	elseif subfaction == "Clan Shagalax" then 
		player:GiveItem(Clockwork.item:CreateInstance("shagalaxian_scalemail"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_black_steel_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_steelgorebattleaxe"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsS)
		local charm2 = math.random(1, #self.randomcharmsS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsS[charm2]), true);
	elseif subfaction == "Clan Reaver" then
		if faith == "Faith of the Dark" then
            if subfaith == "Primevalism" then
                player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_lamellar"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_helm"), true);
				player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
                for i = 1, 4 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
                player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDS[math.random(1, #self.randomWeaponsReaverFOTDS)]), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavyP[math.random(1, #self.randomWeaponsReaverFOTDheavyP)]), true);
                local charm1 = math.random(1, #self.randomcharmsR)
				local charm2 = math.random(1, #self.randomcharmsR)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsR)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm2]), true);
            else
				player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_lamellar"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_helm"), true);
				player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_clanreaverdagger"), true);
				end
				for i = 1, 4 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
				local j = math.random(1, #self.randomWeaponsReaverFOTD)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTD[j]), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavy[math.random(1, #self.randomWeaponsReaverFOTDheavy)]), true);
				local charm1 = math.random(1, #self.randomcharmsR)
				local charm2 = math.random(1, #self.randomcharmsR)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsR)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm2]), true);
            end
		else
			player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_lamellar"), true);
			player:GiveItem(Clockwork.item:CreateInstance("reaver_marauder_helm"), true);
			player:GiveItem(Clockwork.item:CreateInstance("shieldhathood2"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTF[math.random(1, #self.randomWeaponsReaverFOTF)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTF[math.random(1, #self.randomWeaponsReaverFOTF)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTFheavy[math.random(1, #self.randomWeaponsReaverFOTFheavy)]), true);
			local charm1 = math.random(1, #self.randomcharmsG)
			local charm2 = math.random(1, #self.randomcharmsG)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsG)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
			end
	elseif subfaction == "Clan Crast" then
		player:GiveItem(Clockwork.item:CreateInstance("armored_blade_druid_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crast_feather_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shieldhathood3"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 7 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		end
		for i = 1, 10 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsG[math.random(1, #self.randomWeaponsG)]), true);
        player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
	elseif subfaction == "Clan Grock" then
		player:GiveItem(Clockwork.item:CreateInstance("grockling_iconoclast_garb"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_grocklingsacredstonemaul"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_gorehuntingdagger"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("stone"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
        player:GiveItem(Clockwork.item:CreateInstance("effigy_human"), true);
	elseif subfaction == "Servus" then
		--player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shieldhill"), true);
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		end
		for i = 1, 10 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
		for i = 1, 5 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_fine_brigandine"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hill_acolyte_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
		local charm1 = math.random(1, #self.randomcharmsSERVUS)
		local charm2 = math.random(1, #self.randomcharmsSERVUS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsSERVUS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		
		--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	elseif subfaction == "Outrider" then
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_cuirass"), true);
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		local charm1 = math.random(1, #self.randomcharmsOutrider)
		local charm2 = math.random(1, #self.randomcharmsOutrider)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsOutrider)
		end
        if math.random(1, 5) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("begotten_blunderbuss"), true); 
            for i = 1, 2 do
              player:GiveItem(Clockwork.item:CreateInstance("grapeshot"), true);
            end
        else
            player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm2]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
	elseif subfaction == "Auxiliary" then
		if subfaith == "Sol Orthodoxy" then
			if math.random(1, 2) == 1 then
				local j = math.random(1, #self.randomWeaponsGK)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[j]), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavySOL[math.random(1, #self.randomWeaponsGKheavySOL)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_solflail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_battle_monk_robes"), true);
			if math.random (1,2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
			for i = 1, 3 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
			end
			for i = 1, 10 do 
			player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
            if math.random(1, 15) == 1 then 
                player:GiveItem(Clockwork.item:CreateInstance("vexillifer_gatekeeper_plate"), true); 
                player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_glazicbanner"), true);
            else
				player:GiveItem(Clockwork.item:CreateInstance("gatekeeper_medici_halfplate"), true);
				player:GiveItem(Clockwork.item:CreateInstance("fine_gatekeeper_helmet"), true);
            end
			player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
			local charm1 = math.random(1, #self.randomcharmsSERVUS)
			local charm2 = math.random(1, #self.randomcharmsSERVUS)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsSERVUS)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		end
	elseif subfaction == "Praeventor" then
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_cuirass"), true);
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
		local charm1 = math.random(1, #self.randomcharmsOutrider)
		local charm2 = math.random(1, #self.randomcharmsOutrider)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsOutrider)
		end
        if math.random(1, 5) == 1 then
           	player:GiveItem(Clockwork.item:CreateInstance("begotten_blunderbuss"), true); 
           	for i = 1, 2 do
             	player:GiveItem(Clockwork.item:CreateInstance("grapeshot"), true);
           	end
        else
           	player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm2]), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	elseif subfaction == "Legionary" then
		if subfaith == "Sol Orthodoxy" then
			if math.random(1, 2) == 1 then
				local j = math.random(1, #self.randomWeaponsGK)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[j]), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavySOL[math.random(1, #self.randomWeaponsGKheavySOL)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_solflail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_battle_monk_robes"), true);
			if math.random (1,2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
			for i = 1, 3 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavy[math.random(1, #self.randomWeaponsGKheavy)]), true);
            if math.random(1, 15) == 1 then 
                player:GiveItem(Clockwork.item:CreateInstance("vexillifer_gatekeeper_plate"), true); 
                player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_glazicbanner"), true);
            else
        		if math.random(1, 4) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("high_gatekeeper_heavy_plate"), true);
        		else
        	    	player:GiveItem(Clockwork.item:CreateInstance("fine_gatekeeper_plate"), true);
					player:GiveItem(Clockwork.item:CreateInstance("fine_gatekeeper_helmet"), true);
        		end
            end
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
				for i = 1, 5 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
				end
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			else
				for i = 1, 3 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
				end
				local charm1 = math.random(1, #self.randomcharms)
				local charm2 = math.random(1, #self.randomcharms)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharms)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
            	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
			end
		end
	elseif subfaction == "Varazdat" then
        if subfaith == "Primevalism" then
            player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekhheavy[math.random(1, #self.randomWeaponsSATANrekhheavy)]), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
            if math.random(1, 2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_long"), true);
				for i = 1, 5 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
				end
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
				for i = 1, 5 do
					player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
				end
				local charm1 = math.random(1, #self.randomcharms)
				local charm2 = math.random(1, #self.randomcharms)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharms)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			end
            player:GiveItem(Clockwork.item:CreateInstance("darklander_sultan_armor"), true);
            if math.random(1, 2) == 1 then
                player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housevarazdatancestraldagger"), true);
            else
                player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
            end
        else    
			local j = math.random(1, #self.randomWeaponsSATAN)
			for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[j]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANvarazdatheavy[math.random(1, #self.randomWeaponsSATANvarazdatheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("darklander_sultan_armor"), true);
        	if math.random(1, 2) == 1 then
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housevarazdatancestraldagger"), true);
				end
        	else
            	for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
				end
        	end
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_long"), true);
				for i = 1, 5 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
				end
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			else
                if math.random(1,3) == 1 then
    				for i = 1, 6 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    				end
				elseif math.random(1,3) == 2 then
    				for i = 1, 3 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    				end
				else
    				for i = 1, 2 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    				end
				end
				local charm1 = math.random(1, #self.randomcharms)
				local charm2 = math.random(1, #self.randomcharms)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharms)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
        end    
	elseif subfaction == "Philimaxio" then
        if subfaith == "Primevalism" then
            player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekhheavy[math.random(1, #self.randomWeaponsSATANrekhheavy)]), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
            if math.random (1, 3) == 1 then
            	player:GiveItem(Clockwork.item:CreateInstance("hellspike_armor"), true);
            else
                player:GiveItem(Clockwork.item:CreateInstance("hellplate_armor"), true);
                player:GiveItem(Clockwork.item:CreateInstance("hellplate_helmet"), true);
            end
            player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
            local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
            player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housephilimaxioancestraldagger"), true);
        else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
			if math.random (1, 3) == 1 then
            	player:GiveItem(Clockwork.item:CreateInstance("hellspike_armor"), true);
            else
                player:GiveItem(Clockwork.item:CreateInstance("hellplate_armor"), true);
                player:GiveItem(Clockwork.item:CreateInstance("hellplate_helmet"), true);
            end
	        if math.random (1,2) == 1 then
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housephilimaxioancestraldagger"), true);
				end
	        else
    	        for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
				end
            end
			if math.random(1,3) == 1 then
    			for i = 1, 5 do
        			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    			end
			elseif math.random(1,3) == 2 then
    			for i = 1, 3 do
        			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    			end
			else
    			for i = 1, 2 do
        			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    			end
			end
			local charm1 = math.random(1, #self.randomcharmsP)
			local charm2 = math.random(1, #self.randomcharmsP)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsP)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsP[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsP[charm2]), true);
			player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
        end
	elseif subfaction == "Kinisger" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("helldancer_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("blackplate_helmet"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housekinisgerancestraldagger"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true);
		end
		if math.random(1, 10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("ice_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("ice_catalyst"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsP)
		local charm2 = math.random(1, #self.randomcharmsP)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsP)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsP[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsP[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
	elseif subfaction == "Rekh-khet-sa" then
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_houserekhkhetsaancestraldagger"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekhheavy[math.random(1, #self.randomWeaponsSATANrekhheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wraith_armor"), true);
		for i = 1, 8 do
			player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
		end
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
		end
		if math.random(1, 2) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_long"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
			local charm1 = math.random(1, #self.randomcharmsSERVUS)
			local charm2 = math.random(1, #self.randomcharmsSERVUS)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsSERVUS)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			player:GiveItem(Clockwork.item:CreateInstance("death_whistle"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		end
	elseif subfaction == "Raiders" or subfaction == "Tuners" then
        player:SetCharacterData("rank", 3)
    	player:SetNetVar("rank", 3)
    
    	local ang = player:EyeAngles()
    	local pos = player:GetPos()
    	Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    	player:SetPos(pos)
    	player:SetEyeAngles(ang)
    	hook.Run("PlayerChangedRanks", player)
    
    	player:SetHealth(player:GetMaxHealth())
    	player:SetNWInt("Stamina", player:GetMaxStamina())
		if subfaith == "Path of the Pale Rider" then 
            player:GiveItem(Clockwork.item:CreateInstance("ring_penetration"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pale_rider_tier3"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("ring_penetration"), true);
			player:GiveItem(Clockwork.item:CreateInstance("eternal_heavens_tier3"), true);
        end
	else
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
        if math.random(1, 4) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_heavy_coat_of_plates"), true);
			player:GiveItem(Clockwork.item:CreateInstance("hill_heavy_helm"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_fine_brigandine"), true);
			player:GiveItem(Clockwork.item:CreateInstance("hill_acolyte_helm"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance("shieldhill"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
			local charm1 = math.random(1, #self.randomcharmsSERVUS)
			local charm2 = math.random(1, #self.randomcharmsSERVUS)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsSERVUS)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
		else
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_axehill"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
            player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		end

	end


end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Tier 4";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "standard_issue_4";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 4 equipment.";
	ITEM.weight = 5;
	ITEM.randomWeaponsG = {"begotten_1h_steelgorebattleaxe", "begotten_1h_familialsword"};
	ITEM.randomWeaponsGshagal = {"begotten_1h_steelgorebattleaxe", "begotten_1h_warhammer"};
	ITEM.randomWeaponsP = {"begotten_1h_hillcrackaxe", "begotten_1h_hillarmingsword", "begotten_1h_steelarmingsword", "begotten_spear_wingedspear", "begotten_1h_warhammer"};
	ITEM.randomWeaponsGK = {"begotten_1h_steelarmingsword", "begotten_spear_wingedspear", "begotten_1h_warhammer", "begotten_1h_ornateglazicus"};
	ITEM.randomWeaponsGKheavy = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_exileknightsword", "begotten_polearm_polehammer", "begotten_polearm_pike", "begotten_2h_great_eveningstar", "begotten_prelude_2h_great_daneaxe"};
	ITEM.randomWeaponsGKheavySIR = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_exileknightsword", "begotten_polearm_polehammer", "begotten_prelude_2h_great_daneaxe"};
	ITEM.randomWeaponsGKheavyINQUISITOR = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_exileknightsword", "begotten_polearm_polehammer", "begotten_polearm_pike", "begotten_2h_inquisitorsword"};
	ITEM.randomWeaponsGKheavySOL = {"begotten_2h_exileknightsword", "begotten_scythe_glaive", "begotten_2h_great_eveningstar", "begotten_prelude_2h_great_daneaxe"};
	ITEM.randomWeaponsPheavy = {"begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_great_hilllongaxe", "begotten_2h_hilllongsword", "begotten_polearm_polehammer", "begotten_polearm_pike"};
	ITEM.randomWeaponsReaverFOTD = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_1h_shard"};
	ITEM.randomWeaponsReaverFOTDS = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_spear_satanicspear", "begotten_1h_shard"};
	ITEM.randomWeaponsReaverFOTF = {"begotten_claws_steelclaws", "begotten_1h_blackclaw"};
	ITEM.randomWeaponsHarald = {"begotten_2h_great_falx", "begotten_polearm_warspear", "begotten_polearm_halberd", "begotten_polearm_pike", "begotten_2h_great_darklanderbardiche"};
	ITEM.randomWeaponsGheavy = {"begotten_2h_great_haralderwaraxe", "begotten_2h_great_falx", "begotten_2h_claymore", "begotten_2h_great_darklanderbardiche"};
	ITEM.randomWeaponsReaverFOTDheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_sataniclongsword", "begotten_2h_unholysigilsword", "begotten_2h_great_darklanderbardiche"};
	ITEM.randomWeaponsReaverFOTDheavyP = {"begotten_2h_sataniclongsword", "begotten_2h_unholysigilsword", "begotten_polearm_warspear", "begotten_polearm_pike", "begotten_polearm_polehammer", "begotten_polearm_halberd" };
	ITEM.randomWeaponsReaverFOTFheavy = {"begotten_2h_great_falx", "begotten_2h_great_haralderwaraxe", "begotten_prelude_2h_great_heavycleaver", "begotten_2h_great_darklanderbardiche"};
	ITEM.randomWeaponsSATAN = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_1h_shard"};
	ITEM.randomWeaponsSATANheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_sataniclongsword", "begotten_2h_great_darklanderbardiche", "begotten_2h_unholysigilsword"};
	ITEM.randomWeaponsSATANrekhheavy = {"begotten_2h_great_satanicmaul", "begotten_2h_sataniclongsword", "begotten_2h_great_darklanderbardiche", "begotten_polearm_warspear", "begotten_polearm_pike", "begotten_polearm_polehammer", "begotten_polearm_halberd"};
	ITEM.randomWeaponsSATANrekh = {"begotten_1h_satanicsword", "begotten_1h_satanicmace", "begotten_spear_satanicspear", "begotten_1h_shard" };
	ITEM.randomcharmsOutrider = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "ring_distorted"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "ring_distorted"};
	ITEM.randomcharmsG = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "ring_distorted", "effigy_human"};
	ITEM.randomcharmsS = {"boot_contortionist", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "bandolier", "ring_distorted", "effigy_human"};
	ITEM.randomcharmsR = {"boot_contortionist", "hurlers_talisman", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "ring_distorted"};
	ITEM.randomcharmsSIR = {"boot_contortionist", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "ring_distorted"};
	ITEM.randomsigilG = {"begotten_sacrificial_unholysigilsword_fire", "begotten_sacrificial_unholysigilsword_ice", "begotten_2h_great_dreadaxe", "begotten_sacrificial_hellfiresword", "begotten_2h_demonknightsword"};
	ITEM.randomsigilGH = {"begotten_2h_great_demonslayerhammer", "begotten_sacrificial_frozenfatherlandaxe"};
	ITEM.randomsigilGK = {"begotten_sacrificial_glazicsword_glazicshield", "begotten_sacrificial_enchantedlongsword_ice"};
	ITEM.randomcharmsSERVUS = {"boot_contortionist", "ring_pummeler", "ring_penetration", "ring_vitality", "ring_protection_gold", "bandolier", "ring_distorted"};
	ITEM.randomInquisitorArmor = {"black_inquisitor_armor", "high_inquisitor_armor", "inquisitor_armor"};
	ITEM.randomInquisitorHat = {"inquisitor_hat_2_black", "inquisitor_hat_2_white", "ornate_gatekeeper_helmet", "knight_helmet"};
	

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();
	local faith = player:GetFaith();
    local subfaith = player:GetSubfaith();
    
    if subfaction == "Legionary" or subfaction == "Auxiliary" or subfaction == "Praeventor" or subfaction == "Knights of Sol" or subfaction == "Inquisition" then 
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
    end
    if math.random (1, 80) == 1 then
        player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_lungemine"), true);
        Clockwork.chatBox:SetMultiplier(1.35)
        Clockwork.chatBox:Add(player, nil, "demontalk", "Иди и отдай свою жизнь аллаху.")
        timer.Simple(0.5, function()
            Clockwork.chatBox:SetMultiplier(1.0)
        end)
    end
	if player:GetFaction() == "Goreic Warrior" then
		player:GiveItem(Clockwork.item:CreateInstance("gore_pouch"), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance("backpack_survivalist"), true);
	end
	player:HandleXP(999999);
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
    player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
    player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	end
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end
    player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);

	if subfaction == "Clan Gore" then
        if math.random(1, 30) == 1 then
            player:SetCharacterData("rank", 13)
    		player:SetNetVar("rank", 13)
    
    		local ang = player:EyeAngles()
    		local pos = player:GetPos()
    		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    		player:SetPos(pos)
    		player:SetEyeAngles(ang)
    		hook.Run("PlayerChangedRanks", player)
    
    		player:SetHealth(player:GetMaxHealth())
    		player:SetNWInt("Stamina", player:GetMaxStamina())
    
    		Schema:EasyText(player, "olivedrab", "You've been promoted to king.") 
            player:GiveItem(Clockwork.item:CreateInstance("goreic_kingplate"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("gore_king_helm"), true);
            player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilGH[math.random(1, #self.randomsigilGH)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        end
        if math.random(1, 20) == 1 then 
            player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_armor"), true);
            player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_helmet"), true);
        else
			player:GiveItem(Clockwork.item:CreateInstance("gore_housecarl_armor"), true);
			player:GiveItem(Clockwork.item:CreateInstance("gore_housecarl_helm"), true);
        end
		for i = 1, 6 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_claws_steelclaws"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_steelgorebattleaxe"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_steelgorebattleaxe"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield12"), true); 
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
		if math.random (1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_demonslayerhammer"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		end
		for i = 1, 4 do
			player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
			player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		end
	elseif subfaction == "Clan Harald" then
        if math.random(1, 30) == 1 then
            player:SetCharacterData("rank", 13)
    		player:SetNetVar("rank", 13)
    
    		local ang = player:EyeAngles()
    		local pos = player:GetPos()
    		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    		player:SetPos(pos)
    		player:SetEyeAngles(ang)
    		hook.Run("PlayerChangedRanks", player)
    
    		player:SetHealth(player:GetMaxHealth())
    		player:SetNWInt("Stamina", player:GetMaxStamina())
    
    		Schema:EasyText(player, "olivedrab", "You've been promoted to king.") 
            player:GiveItem(Clockwork.item:CreateInstance("goreic_kingplate"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("gore_king_helm"), true);
            player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilGH[math.random(1, #self.randomsigilGH)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        end
        if math.random(1, 20) == 1 then 
            player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_armor"), true);
            player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_helmet"), true);
        else
			player:GiveItem(Clockwork.item:CreateInstance("haralder_sealord_lamellar"), true);
			player:GiveItem(Clockwork.item:CreateInstance("haralder_sealord_ridge_helm"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_steelgorebattleaxe"), true);
		if math.random (1, 5) == 1 then
			for i = 1, 10 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true); 
			end
		else
			for i = 1, 6 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsHarald[math.random(1, #self.randomWeaponsHarald)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("hurlers_talisman"), true);
		player:GiveItem(Clockwork.item:CreateInstance("ring_penetration"), true);
		for i = 1, 4 do
			player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);	
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
			player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		end
	elseif subfaction == "Clan Shagalax" then 
		player:GiveItem(Clockwork.item:CreateInstance("dragonscale_shagalaxian_armor"), true);
		player:GiveItem(Clockwork.item:CreateInstance("gore_shagalaxian_chief_helm"), true);
        if math.random (1, 10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_scrapperchainsword"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGshagal[math.random(1, #self.randomWeaponsGshagal)]), true);
        end
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shieldhathood1"), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsS)
		local charm2 = math.random(1, #self.randomcharmsS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsS[charm2]), true);
		for i = 1, 4 do
			player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
			player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		end
        if math.random(1, 10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_stormdrummer"), true);
			for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance("shagalax_bullet_box_magazine"), true);
			end
        end
	elseif subfaction == "Clan Reaver" then
        if math.random(1, 30) == 1 then
            player:SetCharacterData("rank", 13)
    		player:SetNetVar("rank", 13)
    
    		local ang = player:EyeAngles()
    		local pos = player:GetPos()
    		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    		player:SetPos(pos)
    		player:SetEyeAngles(ang)
    		hook.Run("PlayerChangedRanks", player)
    
    		player:SetHealth(player:GetMaxHealth())
    		player:SetNWInt("Stamina", player:GetMaxStamina())
    
    		Schema:EasyText(player, "olivedrab", "You've been promoted to king.") 
            player:GiveItem(Clockwork.item:CreateInstance("goreic_kingplate"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("gore_king_helm"), true);
            if faith == "Faith of the Dark" then
            	player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilG[math.random(1, #self.randomsigilG)]), true);
				player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
            else
                player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilG[math.random(1, #self.randomsigilGH)]), true);
				player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
            end
        end
		if faith == "Faith of the Dark" then
            if subfaith == "Primevalism" then
                if math.random(1, 20) == 1 then 
            		player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_armor"), true);
            		player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_helmet"), true);
        		else
					player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_lamellar"), true);
					player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_helm"), true);
            	end
                for i = 1, 6 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
                if math.random(1, 2) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
				else
					player:GiveItem(Clockwork.item:CreateInstance("shield13"), true);
				end
                local charm1 = math.random(1, #self.randomcharmsR)
				local charm2 = math.random(1, #self.randomcharmsR)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsR)
				end
                player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm2]), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDS[math.random(1, #self.randomWeaponsReaverFOTDS)]), true);
                player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavyP[math.random(1, #self.randomWeaponsReaverFOTDheavyP)]), true);
            else
            	if math.random(1, 20) == 1 then 
            		player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_armor"), true);
            		player:GiveItem(Clockwork.item:CreateInstance("gore_kings_chosen_helmet"), true);
        		else
					player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_lamellar"), true);
					player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_helm"), true);
            	end
				player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_clanreaverdagger"), true);
				end
				for i = 1, 6 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
				end
				local j = math.random(1, #self.randomWeaponsReaverFOTD)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTD[j]), true);
				end
				if math.random(1, 2) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
				else
					player:GiveItem(Clockwork.item:CreateInstance("shield13"), true);
				end
				if math.random(1, 15) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilG[math.random(1, #self.randomsigilG)]), true);
					player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTDheavy[math.random(1, #self.randomWeaponsReaverFOTDheavy)]), true);
				local charm1 = math.random(1, #self.randomcharmsR)
				local charm2 = math.random(1, #self.randomcharmsR)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsR)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm2]), true);
				player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
				if math.random(1, 4) == 1 then
					for i = 1, 2 do
						player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
					end
					player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
            end
		else
            if math.random (1, 3) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("red_wolf_plate"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_despoiler_helm"), true);
                if math.random(1, 3) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("shieldunique1"), true); 
				else
					player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
				end
            else
                player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_lamellar"), true);
				player:GiveItem(Clockwork.item:CreateInstance("reaver_drottinn_helm"), true);
                player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
            end
			for i = 1, 7 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_blackclaw"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
			end
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
				player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsReaverFOTFheavy[math.random(1, #self.randomWeaponsReaverFOTFheavy)]), true);
			local charm1 = math.random(1, #self.randomcharmsG)
			local charm2 = math.random(1, #self.randomcharmsG)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsG)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
		end
	elseif subfaction == "Clan Crast" then
		player:GiveItem(Clockwork.item:CreateInstance("armored_blade_druid_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("crast_feather_helm"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_sacrificial_blesseddruidsword"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_steelgorebattleaxe"), true);
		end
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield10"), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		end
		for i = 1, 10 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		end
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		end
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
		end
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_sacrificial_frozenfatherlandaxe"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
		player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pantheistic_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("familial_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
	elseif subfaction == "Clan Grock" then
        if math.random(1,10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("old_ways_armor"), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield12"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("grockling_iconoclast_garb"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_grocklingsacredstonemaul"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGheavy[math.random(1, #self.randomWeaponsGheavy)]), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("stone"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsG)
		local charm2 = math.random(1, #self.randomcharmsG)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsG)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsG[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_gorehuntingdagger"), true);
	elseif subfaction == "Auxiliary" then
		if subfaith == "Sol Orthodoxy" then
			if math.random(1, 2) == 1 then
				local j = math.random(1, #self.randomWeaponsGK)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[j]), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavySOL[math.random(1, #self.randomWeaponsGKheavySOL)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_solflail"), true);
			player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_battle_monk_robes"), true);
			if math.random (1,2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			if math.random (1,5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
			end
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("shield9"), true);
            	player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
			end
			if math.random(1, 15) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_sacrificial_enchantedlongsword_ice"), true);
				player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
			end
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
			end
			for i = 1, 10 do 
			player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
			end
			if math.random(1, 10) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
				for i = 1, 24 do
					player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
				for i = 1, 15 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
				end
			end	
			player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
            if math.random(1, 10) == 1 then 
                player:GiveItem(Clockwork.item:CreateInstance("vexillifer_gatekeeper_plate"), true); 
                player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_glazicbanner"), true);
            else
				player:GiveItem(Clockwork.item:CreateInstance("fine_gatekeeper_plate"), true);
				player:GiveItem(Clockwork.item:CreateInstance("fine_gatekeeper_helmet"), true);
            end
			player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
			local charm1 = math.random(1, #self.randomcharmsSERVUS)
			local charm2 = math.random(1, #self.randomcharmsSERVUS)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsSERVUS)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
			player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
				player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		end
	elseif subfaction == "Praeventor" then
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_cuirass"), true);
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield4"), true);
		local charm1 = math.random(1, #self.randomcharmsOutrider)
		local charm2 = math.random(1, #self.randomcharmsOutrider)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsOutrider)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
	elseif subfaction == "Inquisition" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomInquisitorArmor[math.random(1, #self.randomInquisitorArmor)]), true);  
		player:GiveItem(Clockwork.item:CreateInstance(self.randomInquisitorHat[math.random(1, #self.randomInquisitorHat)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield7"), true);
        if math.random(1, 20) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilGK[math.random(1, #self.randomsigilGK)]), true);
            player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        end
		local charm1 = math.random(1, #self.randomcharmsSERVUS)
		local charm2 = math.random(1, #self.randomcharmsSERVUS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsSERVUS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_sigils"), true);
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_corpsecrank"), true);
			for i = 1, 18 do
				player:GiveItem(Clockwork.item:CreateInstance("grapeshot"), true);	
			end
        elseif math.random(1, 3) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
			for i = 1, 32 do
				player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
			end
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
		end
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true); 
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavyINQUISITOR[math.random(1, #self.randomWeaponsGKheavyINQUISITOR)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	elseif subfaction == "Legionary" then
		if subfaith == "Sol Orthodoxy" then
			if math.random(1, 2) == 1 then
				local j = math.random(1, #self.randomWeaponsGK)
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[j]), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			end
			if math.random(1, 8) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("shield9"), true);
            	player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_solflail"), true);
			if math.random (1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("orthodox_hierarch"), true); 
				player:GiveItem(Clockwork.item:CreateInstance("cw_lantern"), true);
				player:GiveItem(Clockwork.item:CreateInstance("large_oil"), true);
				if math.random(1, 15) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_bellhammer"), true);
				else
					player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavy[math.random(1, #self.randomWeaponsGKheavy)]), true);
				end
			else
				player:GiveItem(Clockwork.item:CreateInstance("orthodoxist_battle_monk_robes"), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavySOL[math.random(1, #self.randomWeaponsGKheavySOL)]), true);
				if math.random (1,2) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("helm_of_repentance"), true);
				else
					player:GiveItem(Clockwork.item:CreateInstance("helm_of_atonement"), true);
				end
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        	player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			if math.random (1,5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
			end
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true);
			if math.random(1, 15) == 1 then 
				player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_ordainedgorefeller"), true);
				player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavy[math.random(1, #self.randomWeaponsGKheavy)]), true);
			end
            if math.random(1, 10) == 1 then 
                player:GiveItem(Clockwork.item:CreateInstance("vexillifer_gatekeeper_plate"), true); 
                player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_glazicbanner"), true);
            else
				player:GiveItem(Clockwork.item:CreateInstance("high_gatekeeper_reinforced_plate"), true);
            end
			if math.random(1, 8) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("shield9"), true);
            	player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
			end
			if math.random(1, 5) == 1 then
				if math.random(1, 2) == 1 then
					player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
					for i = 1, 24 do
						player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
					end
					player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
					player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
					player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
					local charm1 = math.random(1, #self.randomcharmsSERVUS)
					local charm2 = math.random(1, #self.randomcharmsSERVUS)
					while charm2 == charm1 do
						charm2 = math.random(1, #self.randomcharmsSERVUS)
					end
					player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
					player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
				else
					player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
					for i = 1, 10 do
						player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);	
					end
					player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
					player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
					player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
					local charm1 = math.random(1, #self.randomcharmsSERVUS)
					local charm2 = math.random(1, #self.randomcharmsSERVUS)
					while charm2 == charm1 do
						charm2 = math.random(1, #self.randomcharmsSERVUS)
					end
					player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
					player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
				end
			else
				for i = 1, 4 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
				local charm1 = math.random(1, #self.randomcharms)
				local charm2 = math.random(1, #self.randomcharms)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharms)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
	            player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	        end
		end
	elseif subfaction == "Servus" then
		--player:GiveItem(Clockwork.item:CreateInstance("antibiotic_paste"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		if math.random(1, 8) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield9"), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield11"), true);
		end
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_sacrificial_enchantedlongsword_ice"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		end
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		end
		for i = 1, 10 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		end
		if math.random(1, 10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
			for i = 1, 32 do
				player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
			end
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
		end
		player:GiveItem(Clockwork.item:CreateInstance("ampoule"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_fine_brigandine"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hill_fine_coat_helmet"), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
		local charm1 = math.random(1, #self.randomcharmsSERVUS)
		local charm2 = math.random(1, #self.randomcharmsSERVUS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsSERVUS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
			player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		--player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
		--player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	elseif subfaction == "Outrider" then
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_cuirass"), true);
		player:GiveItem(Clockwork.item:CreateInstance("old_soldier_helm"), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield4"), true);
		local charm1 = math.random(1, #self.randomcharmsOutrider)
		local charm2 = math.random(1, #self.randomcharmsOutrider)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsOutrider)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsOutrider[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
	elseif subfaction == "Low Ministry" then
		player:GiveItem(Clockwork.item:CreateInstance("low_ministry_cuirass"), true);
		player:GiveItem(Clockwork.item:CreateInstance("ministryhelmet"), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
		local charm1 = math.random(1, #self.randomcharmsSERVUS)
		local charm2 = math.random(1, #self.randomcharmsSERVUS)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsSERVUS)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance("codex_solis"), true);
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_corpsecrank"), true);
			for i = 1, 18 do
				player:GiveItem(Clockwork.item:CreateInstance("grapeshot"), true);	
			end
        elseif math.random(1, 10) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
			for i = 1, 32 do
				player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
			end
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
		end
		player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("xolotl_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("purifying_stone"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("warhorn"), true);
        player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true);
	elseif subfaction == "Varazdat" then
        if math.random(1, 30) == 1 then
            player:SetCharacterData("rank", 8)
        	player:SetNetVar("rank", 8)

        	local targetAngles = player:EyeAngles()
        	local targetPos = player:GetPos()
        	Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
        	player:SetPos(targetPos)
        	player:SetEyeAngles(targetAngles)
        	hook.Run("PlayerChangedRanks", player)

        	local maxHealth = player:GetMaxHealth()
        	local maxStamina = player:GetMaxStamina()
        	player:SetHealth(maxHealth)
        	player:SetNWInt("Stamina", maxStamina)
        	player:SetCharacterData("Stamina", maxStamina)

    
        	Schema:EasyText(player, "olivedrab", "You've been promoted to the Hell Baron!")
            player:GiveItem(Clockwork.item:CreateInstance("hell_baron_gothic_plate"), true);
            player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_whip"), true);
        end
        if subfaith == "Primevalism" then
            player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekhheavy[math.random(1, #self.randomWeaponsSATANrekhheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
            player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
            player:GiveItem(Clockwork.item:CreateInstance("darklander_sultan_armor"), true);
            player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 10 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true); 
			end
			for i = 1, 5 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt_incendiary"), true);
            end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		else
			local j = math.random(1, #self.randomWeaponsSATAN)
			for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[j]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("darklander_immortal_armor"), true);
            if math.random (1, 15) == 1 then 
                player:GiveItem(Clockwork.item:CreateInstance("shieldpork"), true);
            else
	        	player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
            end
            if math.random(1,2) == 1 then
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housevarazdatancestraldagger"), true); 
				end
            else
                for i = 1, 2 do
                    player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
                end
            end
			if math.random(1, 5) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_long"), true);
				for i = 1, 10 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
				end
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			else
				if math.random(1,3) == 1 then
    				for i = 1, 6 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    				end
				elseif math.random(1,3) == 2 then
    				for i = 1, 3 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    				end
				else
    				for i = 1, 2 do
        				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    				end
				end
				local charm1 = math.random(1, #self.randomcharms)
				local charm2 = math.random(1, #self.randomcharms)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharms)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
			player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
			if math.random(1, 4) == 1 then
				for i = 1, 2 do
					player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
        end
	elseif subfaction == "Philimaxio" then
        if math.random(1, 30) == 1 then
            player:SetCharacterData("rank", 8)
        	player:SetNetVar("rank", 8)

        	local targetAngles = player:EyeAngles()
        	local targetPos = player:GetPos()
        	Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
        	player:SetPos(targetPos)
        	player:SetEyeAngles(targetAngles)
        	hook.Run("PlayerChangedRanks", player)

        	local maxHealth = player:GetMaxHealth()
        	local maxStamina = player:GetMaxStamina()
        	player:SetHealth(maxHealth)
        	player:SetNWInt("Stamina", maxStamina)
        	player:SetCharacterData("Stamina", maxStamina)

    
        	Schema:EasyText(player, "olivedrab", "You've been promoted to the Hell Baron!")
            player:GiveItem(Clockwork.item:CreateInstance("hell_baron_gothic_plate"), true);
            player:GiveItem(Clockwork.item:CreateInstance("begotten_1h_whip"), true);
            player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANheavy[math.random(1, #self.randomWeaponsSATANheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield13"), true);
		player:GiveItem(Clockwork.item:CreateInstance("heavy_hellplate_armor"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hellplate_helmet"), true);
        if math.random (1,2) == 1 then
			for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housephilimaxioancestraldagger"), true);
			end
        else
            for i = 1, 2 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
			end
        end
		if math.random(1,3) == 1 then
    		for i = 1, 6 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    		end
		elseif math.random(1,3) == 2 then
    		for i = 1, 3 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    		end
		else
    		for i = 1, 2 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    		end
		end
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilG[math.random(1, #self.randomsigilG)]), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		end
		local charm1 = math.random(1, #self.randomcharms)
		local charm2 = math.random(1, #self.randomcharms)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharms)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
		player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
	elseif subfaction == "Kinisger" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[math.random(1, #self.randomWeaponsSATAN)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("helldancer_robes"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hellplate_helmet"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_housekinisgerancestraldagger"), true);
		end
		for i = 1, 3 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("ice_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("ice_catalyst"), true);
		if math.random(1, 10) == 1 then
			for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		end
		local charm1 = math.random(1, #self.randomcharmsR)
		local charm2 = math.random(1, #self.randomcharmsR)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsR)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsR[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("antibiotics"), true);
	elseif subfaction == "Rekh-khet-sa" then
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_houserekhkhetsaancestraldagger"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekh[math.random(1, #self.randomWeaponsSATANrekh)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATANrekhheavy[math.random(1, #self.randomWeaponsSATANrekhheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield13"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wraith_armor"), true);
		for i = 1, 15 do
			player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
		end
		for i = 1, 10 do 
			player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
		end
		if math.random(1, 2) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_jezail_long"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);
			end
			local charm1 = math.random(1, #self.randomcharmsSERVUS)
			local charm2 = math.random(1, #self.randomcharmsSERVUS)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharmsSERVUS)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			player:GiveItem(Clockwork.item:CreateInstance("death_whistle"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 15 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		if math.random(1, 4) == 1 then
			for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("tortured_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("down_catalyst"), true);
    elseif subfaction == "Raiders" or subfaction == "Tuners" then
        player:SetCharacterData("rank", 5)
    	player:SetNetVar("rank", 5)
    
    	local ang = player:EyeAngles()
    	local pos = player:GetPos()
    	Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    	player:SetPos(pos)
    	player:SetEyeAngles(ang)
    	hook.Run("PlayerChangedRanks", player)
    
    	player:SetHealth(player:GetMaxHealth())
    	player:SetNWInt("Stamina", player:GetMaxStamina())
        if math.random (1, 30) == 1 then
            player:SetCharacterData("rank", 6)
    		player:SetNetVar("rank", 6)
    
    		local ang = player:EyeAngles()
    		local pos = player:GetPos()
    		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player))
    		player:SetPos(pos)
    		player:SetEyeAngles(ang)
    		hook.Run("PlayerChangedRanks", player)
    
    		player:SetHealth(player:GetMaxHealth())
    		player:SetNWInt("Stamina", player:GetMaxStamina())
    
    		Schema:EasyText(player, "olivedrab", "You've been promoted to Dread Khan.")
            player:GiveItem(Clockwork.item:CreateInstance("armor_of_the_dread_khan"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("khuzait_lord_helmet_c"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_celestialsoulslayer"), true);
            player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        end
        if subfaith == "Path of the Pale Rider" then
            player:GiveItem(Clockwork.item:CreateInstance("ring_penetration"), true);
			player:GiveItem(Clockwork.item:CreateInstance("pale_rider_tier4"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("ring_penetration"), true);
			player:GiveItem(Clockwork.item:CreateInstance("eternal_heavens_tier4"), true);
        end
    elseif subfaction == "Knights of Sol" then
        if math.random(1,10) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("knight_justicar_helmet"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("knight_justicar_plate"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("knight_plate"), true); 
            player:GiveItem(Clockwork.item:CreateInstance("knight_helmet"), true);
        end
    player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGK[math.random(1, #self.randomWeaponsGK)]), true); 
        if math.random(1, 20) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance(self.randomsigilGK[math.random(1, #self.randomsigilGK)]), true);	
            player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
        else
    		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsGKheavySIR[math.random(1, #self.randomWeaponsGKheavySIR)]), true);
        end
        player:GiveItem(Clockwork.item:CreateInstance("shield7"), true);
        player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
		player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
		local charm1 = math.random(1, #self.randomcharmsSIR)
		local charm2 = math.random(1, #self.randomcharmsSIR)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharmsSIR)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSIR[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSIR[charm2]), true);
	else
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_ordainedgorefeller"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("hillkeeper_defender_plate"), true);
		player:GiveItem(Clockwork.item:CreateInstance("hill_coat_helmet"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("shield9"), true);
            player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance("shield16"), true);
		end
		if math.random(1, 5) == 1 then
			if math.random(1, 2) == 1 then
				player:GiveItem(Clockwork.item:CreateInstance("begotten_inquisitor_revolver"), true);
				for i = 1, 32 do
					player:GiveItem(Clockwork.item:CreateInstance("pop-a-shot"), true);
				end
				player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharmsSERVUS[charm2]), true);
			else
				player:GiveItem(Clockwork.item:CreateInstance("begotten_musket"), true);
				for i = 1, 10 do
					player:GiveItem(Clockwork.item:CreateInstance("longshot"), true);	
				end
				player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
				player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
				player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
				local charm1 = math.random(1, #self.randomcharmsSERVUS)
				local charm2 = math.random(1, #self.randomcharmsSERVUS)
				while charm2 == charm1 do
					charm2 = math.random(1, #self.randomcharmsSERVUS)
				end
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
				player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
			end
		else
			for i = 1, 6 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_axehill"), true);
			end
			player:GiveItem(Clockwork.item:CreateInstance("holy_spirit"), true);
			player:GiveItem(Clockwork.item:CreateInstance("light_catalyst"), true);
			player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
			local charm1 = math.random(1, #self.randomcharms)
			local charm2 = math.random(1, #self.randomcharms)
			while charm2 == charm1 do
				charm2 = math.random(1, #self.randomcharms)
			end
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
			player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
            player:GiveItem(Clockwork.item:CreateInstance("handheld_radio"), true); 
		end
		

	end


end;

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Eternal Heavens tier 2";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "eternal_heavens_tier2";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 2 equipment for raiders who belive in eternal heavens.";
	ITEM.weight = 5;
	ITEM.randomWeaponsP = {"begotten_1h_ironarmingsword", "begotten_1h_scimitar", "begotten_1h_ironjian"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_longsword", "begotten_prelude_2h_estoc", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomcharms = {"ring_vitality_lesser", "embalmed_heart", "ring_courier", "ring_protection_bronze", "ring_pummeler", "boot_contortionist"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 4 do
		player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
	end
	for i = 1, 3 do
		player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);

	if subfaction == "Raiders" or subfaction == "Tuners" then
        if math.random(1, 5) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("steppe_warrior_armor"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trapper_hat"), true);
		if math.random(1, 5) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_polearm_billhook"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
	end
    
end

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Pale Rider tier 2";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "pale_rider_tier2";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 2 equipment for raiders who belive in pale rider.";
	ITEM.weight = 5;
	ITEM.randomWeaponsSATAN = {"begotten_1h_twistedmachete", "begotten_1h_ironarmingsword", "begotten_1h_warpedsword", "begotten_1h_ironjian", "begotten_1h_scimitar"};
	ITEM.randomcharms = {"ring_vitality_lesser", "embalmed_heart", "ring_courier", "ring_protection_bronze", "boot_contortionist"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 4 do
		player:GiveItem(Clockwork.item:CreateInstance("skintape"), true);
	end
	for i = 1, 3 do
		player:GiveItem(Clockwork.item:CreateInstance("skingauze"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);

	if subfaction == "Raiders" or subfaction == "Tuners" then
        if math.random(1, 5) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
			for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
			end
        end
        local j = math.random(1, #self.randomWeaponsSATAN)
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsSATAN[j]), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("shield5"), true);
		player:GiveItem(Clockwork.item:CreateInstance("steppe_warrior_armor"), true);
		player:GiveItem(Clockwork.item:CreateInstance("trapper_hat"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[math.random(1, #self.randomcharms)]), true);
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
		end
	end
end

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Pale Rider tier 3";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "pale_rider_tier3";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 3 equipment for raiders who belive in eternal heavens.";
	ITEM.weight = 5;
	ITEM.randomWeaponsP = {"begotten_1h_steelarmingsword", "begotten_1h_scimitar", "begotten_1h_ironjian", "begotten_1h_satanicsword", "begotten_1h_satanicshortsword", "begotten_1h_butterflysword"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_steel_longjian", "begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_sataniclongsword", "begotten_2h_swordstaff", "begotten_polearm_polehammer", "begotten_polearm_halberd", "begotten_prelude_2h_estoc", "begotten_prelude_polearm_hewingspear",
"begotten_prelude_2h_great_scraphalberd", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver", "bandolier"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end

	if subfaction == "Raiders" or subfaction == "Tuners" then
		local j = math.random(1, #self.randomWeaponsP)
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[j]), true);
		end
        if math.random (1, 2) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("deadlandershield"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance("golden_horde_plate"), true);
		player:GiveItem(Clockwork.item:CreateInstance("maskshemagh"), true);
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_parryingdagger"), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		local charm1 = math.random(1, #self.randomcharms)
		local charm2 = math.random(1, #self.randomcharms)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharms)
		end
        if math.random(1,10) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        	player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
        	player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
        if math.random(1,4) == 1 then
    		for i = 1, 5 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    		end
		elseif math.random(1,3) == 2 then
    		for i = 1, 2 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    		end
		elseif math.random(1,4) == 3 then
    		for i = 1, 2 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    		end
		else
        	for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
        end
	end
end

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Eternal Heavens tier 3";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "eternal_heavens_tier3";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 3 equipment for raiders who belive in eternal heavens.";
	ITEM.weight = 5;
	ITEM.randomWeaponsP = {"begotten_1h_steelarmingsword", "begotten_1h_scimitar", "begotten_1h_ironjian", "begotten_1h_hillarmingsword", "begotten_1h_butterflysword"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_steel_longjian", "begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_claymore", "begotten_2h_swordstaff", "begotten_prelude_polearm_hewingspear", "begotten_prelude_2h_great_scraphalberd", "begotten_prelude_2h_scrapchopper"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_penetration", "ring_vitality_lesser", "ring_protection_silver", "bandolier"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end

	if subfaction == "Raiders" or subfaction == "Tuners" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("deadlandershield"), true);
		player:GiveItem(Clockwork.item:CreateInstance("deadlander_officer_lamellar"), true);
		player:GiveItem(Clockwork.item:CreateInstance("kheshig_helmet"), true); 
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		local charm1 = math.random(1, #self.randomcharms)
		local charm2 = math.random(1, #self.randomcharms)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharms)
		end
        if math.random(1,10) == 1 then
            player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        	player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
        	player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 10 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
        if math.random(1,4) == 1 then
    		for i = 1, 5 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    		end
		elseif math.random(1,3) == 2 then
    		for i = 1, 2 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    		end
		elseif math.random(1,4) == 3 then
    		for i = 1, 2 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    		end
		else
        	for i = 1, 4 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
        end
	end
end

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Pale Rider tier 4";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "pale_rider_tier4";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 4 equipment for raiders who belive in eternal heavens.";
	ITEM.weight = 5;
	ITEM.randomWeaponsP = {"begotten_1h_steelarmingsword", "begotten_1h_satanicsword", "begotten_1h_butterflysword", "begotten_1h_shard"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_steel_longjian", "begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_claymore", "begotten_2h_unholysigilsword", "begotten_2h_sataniclongsword", "begotten_2h_swordstaff", "begotten_prelude_polearm_hewingspear", "begotten_prelude_2h_great_scraphalberd"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_penetration", "ring_vitality", "ring_protection_gold", "bandolier", "ring_distorted"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("splint"), true);
	end
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end

	if subfaction == "Raiders" or subfaction == "Tuners" then
		local j = math.random(1, #self.randomWeaponsP)
		for i = 1, 2 do
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[j]), true);
		end
		if math.random (1, 2) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("deadlandershield"), true);
        else
            player:GiveItem(Clockwork.item:CreateInstance("shield8"), true);
        end
		player:GiveItem(Clockwork.item:CreateInstance("blood_pact_lamellar"), true);
		player:GiveItem(Clockwork.item:CreateInstance("golden_horde_plate"), true);
		player:GiveItem(Clockwork.item:CreateInstance("khuzait_lord_helmet_c"), true);
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
        player:GiveItem(Clockwork.item:CreateInstance("begotten_dagger_elegantdagger"), true);
		local charm1 = math.random(1, #self.randomcharms)
		local charm2 = math.random(1, #self.randomcharms)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharms)
		end
        player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 12 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
        player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		for i = 1, 5 do
			player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
		end
		player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
		player:GiveItem(Clockwork.item:CreateInstance("pentagram_catalyst"), true);
        for i = 1, 2 do
            player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        end
        if math.random(1,4) == 1 then
    		for i = 1, 6 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    		end
		elseif math.random(1,3) == 2 then
    		for i = 1, 3 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    		end
		elseif math.random(1,4) == 3 then
    		for i = 1, 3 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    		end
		else
        	for i = 1, 7 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
        end
        player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
	end
end

ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Path of the Eternal Heavens tier 4";
	ITEM.model = "models/mosi/fallout4/props/junk/hidebundle.mdl";
	ITEM.useText = "Open";
	ITEM.uniqueID = "eternal_heavens_tier4";
	ITEM.useSound = "npc/combine_soldier/zipline_hitground1.wav";
	ITEM.category = "Other";
	ITEM.description = "A duffel bag containing tier 4 equipment for raiders who belive in eternal heavens.";
	ITEM.weight = 5;
	ITEM.randomWeaponsP = {"begotten_1h_steelarmingsword", "begotten_1h_butterflysword"};
	ITEM.randomWeaponsPheavy = {"begotten_2h_steel_longjian", "begotten_polearm_halberd", "begotten_polearm_gatekeeperpoleaxe", "begotten_2h_swordstaff", "begotten_polearm_halberd"};
	ITEM.randomcharms = {"boot_contortionist", "hurlers_talisman", "ring_penetration", "ring_vitality", "ring_protection_gold", "bandolier", "ring_distorted"};
	
-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	local subfaction = player:GetSubfaction();

	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("gauze"), true);
	end
	for i = 1, 5 do 
		player:GiveItem(Clockwork.item:CreateInstance("crafted_bandage"), true);
	end
	player:GiveItem(Clockwork.item:CreateInstance("laudanum"), true);
	for i = 1, 2 do
		player:GiveItem(Clockwork.item:CreateInstance("goodjuice"), true);
	end

	if subfaction == "Raiders" or subfaction == "Tuners" then
		player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsP[math.random(1, #self.randomWeaponsP)]), true);
		player:GiveItem(Clockwork.item:CreateInstance("deadlandershield"), true);
		player:GiveItem(Clockwork.item:CreateInstance("wind_walker_lamellar"), true);
		player:GiveItem(Clockwork.item:CreateInstance("kheshig_helmet"), true);
        player:GiveItem(Clockwork.item:CreateInstance("kheshig_lamellar"), true);
		if math.random(1, 15) == 1 then
			player:GiveItem(Clockwork.item:CreateInstance("begotten_2h_great_celestialsoulslayer"), true);
			player:GiveItem(Clockwork.item:CreateInstance("warding_talisman"), true);
		else
			player:GiveItem(Clockwork.item:CreateInstance(self.randomWeaponsPheavy[math.random(1, #self.randomWeaponsPheavy)]), true);
		end
		local charm1 = math.random(1, #self.randomcharms)
		local charm2 = math.random(1, #self.randomcharms)
		while charm2 == charm1 do
			charm2 = math.random(1, #self.randomcharms)
		end
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm1]), true);
		player:GiveItem(Clockwork.item:CreateInstance(self.randomcharms[charm2]), true);
		player:GiveItem(Clockwork.item:CreateInstance("begotten_crossbow"), true);
		for i = 1, 12 do
			player:GiveItem(Clockwork.item:CreateInstance("iron_bolt"), true);
		end
        for i = 1, 2 do
            player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        end
        player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("up_catalyst"), true);
        if math.random(1,4) == 1 then
    		for i = 1, 6 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_dagger"), true); 
    		end
		elseif math.random(1,3) == 2 then
    		for i = 1, 3 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_iron_javelin"), true);
    		end
		elseif math.random(1,4) == 3 then
    		for i = 1, 3 do
        		player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_pilum"), true);
    		end
		else
        	for i = 1, 7 do
				player:GiveItem(Clockwork.item:CreateInstance("begotten_javelin_throwing_axe"), true);
			end
        end
        player:GiveItem(Clockwork.item:CreateInstance("elysian_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("trinity_catalyst"), true);
        player:GiveItem(Clockwork.item:CreateInstance("belphegor_catalyst"), true);
	end
end

ITEM:Register();