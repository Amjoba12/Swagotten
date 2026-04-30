local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Scrapper Foreman Helmet"
	ITEM.model = "models/begotten_prelude/items/iconoclast_helmet.mdl"
	ITEM.iconoverride = "icons/armor/iconoclast_armor_helmet.png"
	ITEM.weight = 2.5
	ITEM.category = "Helms"
	ITEM.headReplacement = "models/begotten/heads/iconoclast_helmet.mdl";
	ITEM.description = "An salvaged helmet of old equipment found in the factories and mines of the wasteland, rigged with scrap-tech to help expeditions see through the dense fog of the Ashlands, or the pitch black abyss of the mines."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/crudeplatehelmet";
	ITEM.faction = "Scrappers";
	ITEM.requiredSubfactions = {"Greasers"};
	ITEM.requiredFactions = {"Wanderer", "Scrappers"};
	ITEM.kinisgerOverride = true;

	ITEM.conditionScale = 0.75 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 62
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.attributes = {"night_vision", "weatherproof"};

	ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.bulletScale = 0.50; -- reduces bullet damage by 15%
	ITEM.stabilityScale = 0.80; -- reduces stability damage by 40%
	ITEM.insulation = 15;
	
	ITEM.components = {breakdownType = "meltdown", items = {"tech", "scrap", "scrap", "steel_chunks", "steel_chunks", "steel_chunks"}};

ITEM:Register();

