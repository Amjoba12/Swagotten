local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Slicksuit";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_slicksuit.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30;
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "A Scrapper Ragsuit soaked in Oil, and wrapped in even more cloth. While a bit heavier, it seems to withstand the Ashland conditions significantly longer.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.faction = "Scrappers";
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.stabilityScale = 0.80; -- reduces stability damage by 10%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/scrapperarmor1.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Spikeplate";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_spikeplate.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50;
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "A Scrapper Ragsuit with some spiked protrusions atop crude plating.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.faction = "Scrappers";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof"};
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.80; -- reduces stability damage by 20%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "scrap", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/scrapperarmor2.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Glazeplate";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_glazeplate.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 60;
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "A Scrapper Ragsuit armored in the image of the Gatekeeper. Wheter this is a purely utilitarian choice, or to honor the Glaze, one cannot be certain.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Scrappers";
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof"};
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 20%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "scrap", "scrap", "scrap", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/scrapperarmorlight.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Kingplate";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_darkplate.png"
ITEM.uniqueID = "scrapper_kingplate"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "A brutish set of armor crafted by the finest minds the Greasers could muster, and blessed thrice by the Smog Priests. Utilizing techniques befitting ancient war tanks, this surprisingly nimble armor is capable of withstanding plenty of torment. It is almost perpetually covered in blood, a sign of its effectiveness in combat.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredRanks = {"Scrap King"};
ITEM.faction = "Scrappers";
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof", "rage"};
ITEM.requiredFactions = {"Scrappers"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.55; -- reduces slash damage by 40%
ITEM.bulletScale = 0.45; -- reduces bullet damage by 55%
ITEM.stabilityScale = 0.50; -- reduces stability damage by 35%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "scrap", "scrap", "scrap", "gold_ingot"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/gore/we_are_legion/king.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Darkplate";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_darkplate.png"
ITEM.uniqueID = "scrapper_darkplate"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "A Scrapper Ragsuit utilizing discared unholy steel and spiked plate. This armor is proof that even those with the Child God's boon can be felled by Scrapper ingenuity.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredFactions = {"Scrappers", "Wanderer"};
ITEM.faction = "Scrappers";
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 20%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "gold_ingot", "scrap", "scrap", "scrap"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/scrapperarmordark.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-hauberk-1.wav.mp3",
	"armormovement/body-hauberk-2.wav.mp3",
	"armormovement/body-hauberk-3.wav.mp3",
	"armormovement/body-hauberk-4.wav.mp3",
	"armormovement/body-hauberk-5.wav.mp3",
};

ITEM.walkSound = {
	"armormovement/body-hauberk-b4.wav.mp3",
	"armormovement/body-hauberk-b5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrap Punk Armor";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_darkplate.png"
ITEM.uniqueID = "scrap_punk_armor"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Medium Scrap Armor deriving from advanced old world technology and broken down speakers, the Scrapper Punk Armor is the definition of Scrapper Armor with the unified Scrapper Logo painted onto it's chestplate. The armor itself was created by one of the original District 11 Scrap Kings in which he got the idea from a dream controlled by the Machine God... or possibly Dr Cray Zee via one of his dream invading devices.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredFactions = {"Scrappers"};
ITEM.faction = "Scrappers";
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof", "fear"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;
ITEM.requiredRanks = {"Scrap Punk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 20%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "gold_ingot", "scrap", "scrap", "scrap"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/gore/we_are_legion/bow_heavy.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-hauberk-1.wav.mp3",
	"armormovement/body-hauberk-2.wav.mp3",
	"armormovement/body-hauberk-3.wav.mp3",
	"armormovement/body-hauberk-4.wav.mp3",
	"armormovement/body-hauberk-5.wav.mp3",
};

ITEM.walkSound = {
	"armormovement/body-hauberk-b4.wav.mp3",
	"armormovement/body-hauberk-b5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrap Knight Armor";
ITEM.model = "models/begotten/headgroup_props/exileknightarmor.mdl"
ITEM.iconoverride = "icons/armor/misc.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.concealsFace = true;
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "An old set of armor, once belonging to a Knight of Sol. Some parts completely replaced or reinforced with scrap.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.faction = "Scrappers";
ITEM.overlay = "begotten/zomboverlay/new/knighthelmet";
ITEM.attributes = {"weatherproof"};
ITEM.requiredFactions = {"Scrappers"};
ITEM.requiredSubfactions = {"Scrap Knight"}
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.20; -- reduces bullet damage by 80%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "scrap", "scrap", "scrap", "steel_chunks", "steel_chunks", "leather", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begottenprelude/goose/solknight.mdl";
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Bossplate";
ITEM.uniqueID = "scrapper_heavyplate";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/scrapper_bossplate.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "An unmistakeable set of Scrapper Bossplate. Merely the sight of the Bossplate can turn a battle, simply becaise most Scrappers fear their Boss more than their foe.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.faction = "Scrappers";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/gatekeeperhelmet";
ITEM.attributes = {"weatherproof"};
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 25%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/scrapperheavyarmor.mdl";
	--else
		--return "models/begotten/gatekeepers/highgatekeeper02.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Guardsuit";
ITEM.uniqueID = "slaver_guardsuit"
ITEM.model = "models/begottenprelude/items/dcguard.mdl"
ITEM.iconoverride = "icons/armor/slaver_guardmail.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 45;
ITEM.weight = 5;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "Heavy leather vest put over a simple ragsuit reinforced with metal bars. Often utilized by impoverished slaves fighting for their masters.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.faction = "Scrappers";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.attributes = {"weatherproof"};
ITEM.genderless = true;
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.80; -- reduces slash damage by 20%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.stabilityScale = 0.85; -- reduces stability damage by 15%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begottenprelude/scrapper/dcguard.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Foreman Suit";
ITEM.group = "wanderers/iconoclast";
ITEM.model = "models/begotten_prelude/items/iconoclast_armor.mdl"
ITEM.iconoverride = "icons/armor/iconoclast_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "leather";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "An iron-plated leather suit of the scrap foremans, used by the scrap technicians of formidably intelligent warbands for mining, and factory runs.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredSubfactions = {"Greasers"};
ITEM.attributes = {"powerroutine", "weatherproof1"};
ITEM.requiredFactions = {"Wanderer", "Scrappers"};
ITEM.kinisgerOverride = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 15%
ITEM.stabilityScale = 0.80; -- reduces stability damage by 40%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "scrap", "scrap", "scrap"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();