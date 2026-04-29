local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Ballroom Mask"
	ITEM.model = "models/begotten/headgroup_props/ballroommask.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ballroom_mask_plebian.png"
	ITEM.concealsFace = true;
	ITEM.weight = 0.2
	ITEM.uniqueID = "ballroom_mask"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 1
	ITEM.headSuffix = "_satanist";
	ITEM.skin = 1
	ITEM.description = "A ballroom mask for the most important social event that the Children of Satan partake in: the masquerade. This mask is plain and cracked, denoting a lack of social status."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.faction = "Children of Satan";
	
	ITEM.insulation = 35;
	
	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Ornate Ballroom Mask"
	ITEM.model = "models/begotten/headgroup_props/ballroommask.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ballroom_mask.png"
	ITEM.concealsFace = true;
	ITEM.weight = 0.2
	ITEM.uniqueID = "ballroom_mask_ornate"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 2
	ITEM.headSuffix = "_satanist";
	ITEM.skin = 2
	ITEM.description = "A ballroom mask for the most important social event that the Children of Satan partake in: the masquerade. This mask is decorated with golden engravings, a sign of wealth and prestige."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.faction = "Children of Satan";
	
	ITEM.insulation = 35;
	
	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Skullshield"
	ITEM.model = "models/begotten/headgroup_props/skullshield.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/skullshield.png"
	ITEM.concealsFace = true;
	ITEM.weight = 1.5
	ITEM.uniqueID = "skullshield"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 3
	ITEM.headSuffix = "_satanist";
	ITEM.description = "A cushioned metal plate mask to be worn over the face. It is vaguely stylized to resemble a human skull. An imposing armor item found within the ranks of many dark cults. A haunting aura prevents you from wearing this if you are not worthy."
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/skullshield";
	ITEM.faction = "Children of Satan";

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 47
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 40;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "scrap", "scrap"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Hellplate Helmet"
	ITEM.model = "models/begotten/headgroup_props/hellplatehelm.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/hellplate_helmet.png"
	ITEM.weight = 1.5
	ITEM.uniqueID = "hellplate_helmet"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 4
	ITEM.headSuffix = "_satanist";
	ITEM.description = "Once the dignified helmet of the White Sentinels and the sigil of House Philimaxio, this helmet has since been reforged in hellfire many times, only barely resembling its original form. Its existence is a disgrace to the Gatekeeper Order and an outright mockery of the Light."
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/hellplatehelmet";
	ITEM.faction = "Children of Satan";
	ITEM.requiredbeliefs = {"hauberk"};

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 72
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Blackplate Helmet"
	ITEM.model = "models/begotten/items/cc_ebony_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/cc_ebony_helm.png"
	ITEM.weight = 1.8
	ITEM.uniqueID = "blackplate_helmet"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 5
	ITEM.headSuffix = "_satanist";
	ITEM.description = "A helmet that only barely resembles its original design. It has been reforged countless times in the fires of Hell and has been scarred in battle. Was it once the helm of an honored Philimaxio, or a gladiator from the pits of the Darklands?"
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/hellplatehelmet";
	ITEM.faction = "Children of Satan";

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 67
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Deadlander Rider Helmet"
    ITEM.model = "models/begotten_prelude/items/khuzait_helmet_k.mdl"
    ITEM.iconoverride = "materials/begottenprelude/ui/itemicons/khuzait_helmet_k.png"
    ITEM.weight = 1.3
    ITEM.uniqueID = "khuzait_helmet_k"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 4
    ITEM.headSuffix = "_darklander";
    ITEM.description = "The men of the Deadlands train since birth on motorcycle, horse, and chariot. This helmet is a feared sight to any foot army."
    ITEM.excludedFactions = {"Goreic Warrior"};
    ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";

    ITEM.conditionScale = 0.75 -- item degrades 1.5x faster with damage related condition loss

    ITEM.effectiveLimbs = {
        [HITGROUP_HEAD] = true,
    }

    ITEM.protection = 53
    ITEM.hitParticle = "MetalSpark";
    ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
    ITEM.insulation = 30; -- Adds 6% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.

    
    ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}, xp = 30};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Deadlander Officer Helmet"
    ITEM.model = "models/begotten_prelude/items/khuzait_lord_helmet_c.mdl"
    ITEM.iconoverride = "materials/begottenprelude/ui/itemicons/khuzait_lord_helmet_c.png"
    ITEM.weight = 1.2
    ITEM.uniqueID = "khuzait_lord_helmet_c"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 5
    ITEM.headSuffix = "_darklander";
    ITEM.description = "A helmet fit for an officer of the Khan's horde. It is said that their motorized archers have ended all, from Gatekeeper legions to Darklandic mercenary brigades."
    ITEM.excludedFactions = {"Goreic Warrior"};
    ITEM.useSound = "armor/plate_damage_02.wav";
    ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";
	--ITEM.requiredRanks = {"Dread Khan"};

    ITEM.conditionScale = 0.75 -- item degrades 1.5x faster with damage related condition loss


    ITEM.effectiveLimbs = {
        [HITGROUP_HEAD] = true,
    }

    ITEM.protection = 62
    ITEM.hitParticle = "MetalSpark";
    ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
    ITEM.insulation = 30; -- Adds 6% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.

    
    ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}, xp = 30};
    
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Helmet of the Khan"
    ITEM.model = "models/begotten_prelude/items/deadkhanhelm.mdl"
    ITEM.iconoverride = "begotten/ui/itemicons/deadkhanhelm.png"
    ITEM.weight = 1.5
    ITEM.uniqueID = "khanhelm"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 3
    ITEM.headSuffix = "_deadlander";
    ITEM.description = "A helmet covered with jewels and masking its wearer behind a thick plate of bronze. The Dread Khans, trusted generals of the Great Khan, strike fear and fury into the enemy in their leader's name."
    ITEM.excludedFactions = {"Goreic Warrior"};
    ITEM.useSound = "armor/plate_damage_02.wav";
    ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";
	ITEM.requiredRanks = {"Dread Khan"};
	ITEM.requiredbeliefs = {"hauberk"};

    ITEM.conditionScale = 0.75 -- item degrades 1.5x faster with damage related condition loss


    ITEM.effectiveLimbs = {
        [HITGROUP_HEAD] = true,
    }

    ITEM.protection = 75
    ITEM.hitParticle = "MetalSpark";
    ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.75; -- reduces pierce damage by 25%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.65; -- reduces bullet damage by 45%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
    ITEM.insulation = 30; -- Adds 6% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.

    
    ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}, xp = 30};
    
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Deadlander Shemagh"
    ITEM.model = "models/begotten_prelude/items/deadlanderturban.mdl"
    ITEM.iconoverride = "begotten/ui/itemicons/deadlanderturban.png"
    ITEM.weight = 0.2
    ITEM.uniqueID = "openshemagh"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 1
    ITEM.headSuffix = "_deadlander";
    ITEM.description = "Whether dust storms or acid rain, the shemagh has always proved useful for Wanderers and Deadlanders alike to fight off the elements."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.itemSpawnerInfo = {category = "Helms", rarity = 800, bNoSupercrate = true};	
	ITEM.conditionScale = 2 -- item degrades 2x faster with damage related condition loss
	ITEM.repairCostModifier = 0.3;
	
	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 25
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.75; -- reduces stability damage by 25%
	ITEM.insulation = 40;

    
    ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth"}, xp = 1};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Masked Deadlander Shemagh"
    ITEM.model = "models/begotten_prelude/items/deadlanderturban2.mdl"
    ITEM.iconoverride = "begotten/ui/itemicons/deadlanderturban2.png"
    ITEM.weight = 0.5
    ITEM.uniqueID = "maskshemagh"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 2
    ITEM.headSuffix = "_deadlander";
    ITEM.description = "Whether dust storms or acid rain, the shemagh has always proved useful for Wanderers and Deadlanders alike to fight off the elements. This one has been given extra wrapping to cover the face."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.itemSpawnerInfo = {category = "Helms", rarity = 800, bNoSupercrate = true};	
	ITEM.conditionScale = 2 -- item degrades 2x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
	
	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 30
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.75; -- reduces stability damage by 25%
	ITEM.insulation = 40;

    
    ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth"}, xp = 2};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
    ITEM.name = "Kheshig Heavy Helmet"
    ITEM.model = "models/begotten_prelude/items/khuzaitheavyhelm.mdl"
    ITEM.iconoverride = "begotten/ui/itemicons/heavydeadlanderhelm.png"
    ITEM.weight = 2
    ITEM.uniqueID = "kheshig_helmet"
    ITEM.category = "Helms"
    ITEM.bodyGroup = 1
    ITEM.bodyGroupVal = 6
    ITEM.headSuffix = "_deadlander";
    ITEM.description = "The curved helmet of a Deadlander Kheshig, the frontmen of the Horde's assaults. A cloth covering has been used to obscure the wearer's features."
    ITEM.excludedFactions = {"Goreic Warrior"};
    ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";
	ITEM.requiredbeliefs = {"hauberk"};

    ITEM.conditionScale = 0.75 -- item degrades 1.5x faster with damage related condition loss

    ITEM.effectiveLimbs = {
        [HITGROUP_HEAD] = true,
    }

    ITEM.protection = 72
    ITEM.hitParticle = "MetalSpark";
    ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
    ITEM.insulation = 30; -- Adds 6% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.

    
    ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks"}, xp = 30};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Trapper's Hat"
	ITEM.model = "models/begotten_prelude/items/khuzaittrapperhat.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/deadtrapperhelm.png"
	ITEM.weight = 0.4
	ITEM.uniqueID = "trapper_hat"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 5
	ITEM.headSuffix = "_deadlander";
	ITEM.description = "A thick woolen hat made from mare's hair to insulate against the harshest of ash storms. Though it was introduced by the Deadlanders, this hat is seen commonly through the lands."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	
	ITEM.conditionScale = 1.1 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
	
	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 35
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.75; -- reduces stability damage by 25%
	ITEM.insulation = 35;
	
	ITEM.components = {breakdownType = "breakdown", items = {"leather", "cloth"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Deadlander Raider Helm"
	ITEM.model = "models/begotten_prelude/items/khuzaitlighthelm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/deadlighthelm.png"
	ITEM.weight = 1.2
	ITEM.uniqueID = "deadraiderhelm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 4
	ITEM.headSuffix = "_deadlander";
	ITEM.description = "A simple iron helmet cushioned with leather designed and worn by the Deadlanders."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 44
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 40;
	ITEM:Register();
