local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Darklander sultan armor";
ITEM.model = "models/begotten/armor/darklander_spice_guard_armor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/armor/darklander_sultan_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 6.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Cast in the most pure Hellforged steel and adorned with fine silk from the east, this armor set clearly once belonged to a member of the Spice Guard. These Darklander warriors protect trade routes and escort merchants.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.helmetIconOverride = "materials/begotten/ui/itemicons/helms/darklander_sultan_armor.png"
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 15%
ITEM.stabilityScale = 0.55;
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begottenprelude/darklanders/sultan.mdl";
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
ITEM.name = "Dread Armor";
ITEM.model = "models/begotten/headgroup_props/dreadarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/dread_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "A set of heavy armor forged in the fires of Hell, befitting only the most loyal followers of Satan. Its Hellforged steel composition offers supreme protection against all forms of damage.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/dreadarmor.mdl";
	--else
		--return "models/begotten/satanists/dreadarmor.mdl";
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
ITEM.name = "Elegant Robes";
ITEM.group = "satanists/elegantrobes";
ITEM.model = "models/begotten/headgroup_props/elegantrobes.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elegant_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 45
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Elegant robes that befit only the ornate followers of Satan. It is expertly designed with exotic fabrics that display supremacy and wealth as well as offering unmatched protection with no expense of grace or mobility.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"fine_steel_chunks", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Heavy Hellplate Armor";
ITEM.group = "satanists/hellplateheavy";
ITEM.model = "models/begotten/headgroup_props/hellplateheavyarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/heavy_hellplate_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Once the dignified armor of the White Sentinels and the sigil of House Philimaxio, this armor has since been reforged in hellfire many times, only barely resembling its original form. Its existence is a disgrace to the Gatekeeper Order and an outright mockery of the Light. This particular set has been reinforced with additional plates, making it highly protective at the cost of mobility and grace.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

ITEM.requiredbeliefs = {"hauberk"};
ITEM.requiredSubfactions = {"Philimaxio"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 35%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

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

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Hellplate Armor";
ITEM.group = "satanists/hellplatemedium";
ITEM.model = "models/begotten/headgroup_props/hellplatemediumarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/hellplate_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Once the dignified armor of the White Sentinels and the sigil of House Philimaxio, this armor has since been reforged in hellfire many times, only barely resembling its original form. Its existence is a disgrace to the Gatekeeper Order and an outright mockery of the Light.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

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

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Hellspike Armor";
ITEM.model = "models/begotten/headgroup_props/hellspikearmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/hellspike_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "A set of metal plate armor adorned with spikes, its design originally hailing from the Darklands. These eastern types of armor were once prized possessions in the collections of Glazic nobles, but they are now synonymous with the followers of the Dark Lord.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/hellspike";
ITEM.faction = "Children of Satan";

ITEM.attributes = {"spiked"}

ITEM.requiredbeliefs = {"hauberk"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/hellspike_armor.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
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
ITEM.name = "Wraith Armor";
ITEM.model = "models/begotten/headgroup_props/wraitharmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/wraith_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Hellforged Steel armor said to contain the bones of many sacrifices within. It is shaped in the manner of a skeleton and is sure to terrify foes.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/wraithplate";
ITEM.faction = "Children of Satan";

ITEM.attributes = {"fear"};
ITEM.requiredbeliefs = {"hauberk", "primevalism"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "human_bone", "human_bone", "human_bone", "human_bone", "human_bone"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/wraitharmor.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
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
ITEM.name = "Darklander Immortal Armor";
ITEM.uniqueID = "darklander_immortal_armor"
ITEM.model = "models/begotten/headgroups_props/darklanderimmortal.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/darklander_immortal_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0
ITEM.permanent = true;
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Heavy plate armor of Eastern Nigerii design. It is meant for the infamous Immortals, an elite band of warriors devoted to the Emperor. A dark magic prevents this armor from being worn by anyone not of the bloodline of the King of Kings.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Children of Satan"};
ITEM.attributes = {"conditionless", "not_unequippable"};
ITEM.overlay = "begotten/zomboverlay/new/immortal";
ITEM.faction = "Children of Satan";

ITEM.requiredbeliefs = {"hauberk"};
ITEM.requiredSubfactions = {"Varazdat"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "human_bone", "human_bone", "human_bone", "human_bone", "human_bone"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/darklanderimmortal.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
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
ITEM.name = "Helldancer Robes";
ITEM.group = "satanists/elegantrobesupgrade";
ITEM.model = "models/begotten/items/elegantrobesupgrade.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elegantrobesupgrade.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 55
ITEM.type = "leather";
ITEM.weight = 4;
ITEM.weightclass = "Light";
ITEM.description = "Elegant robes that share the designs of Glazic Ministry and Nigerii Golden Order Princes fitted perfectly underneath blackplate of similar contrasting cultural design. This armor pays homage to the Darklander Blood Dancers; a troop of gladiators who would sadistically cut down crowds of naked slaves with their twin swords, dancing and laughing all the while.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.90; -- reduces pierce damage by 10%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"fine_steel_chunks", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Blackplate Armor";
ITEM.group = "satanists/halfhellplate";
ITEM.model = "models/begotten/items/halfhellplate.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/halfhellplate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65;
ITEM.weight = 5.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Cursed black armor that has been reforged in Hell countless times. Was it once the armor of an esteemed Gateekeeper, or perhaps these plates were once used by a Janissary? It no longer matters, for this is now used by the Children of Satan.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

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

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Hell Baron Gothic Plate";
ITEM.model = "models/begotten/headgroups_props/ornatehellplatebaron.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/ornatehellplatebaron.png"
ITEM.helmetIconOverride = "materials/begotten/ui/itemicons/hellplate_helmet.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Blackplate of the finest hellforged steel fitted to only the most brutal, gentle, loathsome, charming, terrible, benevolent, beautiful and ogrish Baron of Hell that there ever could be!";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/hellplate";
ITEM.faction = "Children of Satan";
ITEM.requiredRanks = {"Hell Baron"};

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
ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
ITEM.slashScale = 0.55; -- reduces slash damage by 45%
ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
ITEM.stabilityScale = 0.50; -- reduces stability damage by 50%
ITEM.insulation = 65;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "gold_ingot", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/satanists/ornatehellplatebaron.mdl";
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
ITEM.name = "Deadlander Rider Lamellar";
ITEM.group = "prelude_deadlanders/khuzaitsoldier";
ITEM.model = "models/begotten_prelude/items/khuzaitsoldier.mdl"
ITEM.iconoverride = "materials/begottenprelude/ui/itemicons/khuzaitsoldier.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 40
ITEM.type = "leather";
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.description = "The white fur-lined coat and leather lamellar of the Deadlander steppe warriors. Light for speed and mobility as they pursue targets.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 60;
ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth"}, xp = 15};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Deadlander Officer Lamellar";
ITEM.group = "prelude_deadlanders/khuzaitlord";
ITEM.model = "models/begotten_prelude/items/khuzaitlord.mdl"
ITEM.iconoverride = "materials/begottenprelude/ui/itemicons/khuzaitlord.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.70
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Armor befitting a veteran of the Horde. This lamellar is used by Deadlandic horde officers, feared for their tactics just as they are feared for their riding excellence.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
--ITEM.requiredRanks = {"Dread Khan"};

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
    [DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 35;
ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Deadlander Harness";
ITEM.group = "prelude_deadlanders/deadlanderlight2";
ITEM.model = "models/begotten_prelude/items/bandit.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/bandit.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.5
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 35
ITEM.type = "leather";
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.description = "The brown leather clothes of a Deadlander warrior, designed for mobility and freedom of movement. Though it may not protect against most blows, a wise warrior knows when not to take a fight.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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

ITEM.bluntScale = 0.95; -- reduces blunt damage by 5%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 60;
ITEM.components = {breakdownType = "breakdown", items = {"leather", "cloth", "cloth"}, xp = 15};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Golden Horde Plate";
ITEM.group = "prelude_deadlanders/deadlanderlight";
ITEM.model = "models/begotten_prelude/items/suede.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/suede.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.8
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "plate";
ITEM.weight = 3.5;
ITEM.weightclass = "Light";
ITEM.description = "The yellow dyed robes of the Golden Horde, an ancestral army of the Deadlanders. It is decorated with a colored belt and reinforced with thin plates of steel. Sigils have been engraved into this armor's chestplate and coated with catalystic dust, blessing it with power.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.attributes = {"bloodletter"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredFaiths = {"Faith of the Winds"};
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.90; -- reduces pierce damage by 10%
ITEM.slashScale = 0.80; -- reduces slash damage by 20%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 10%
ITEM.insulation = 60;
ITEM.components = {breakdownType = "breakdown", items = {"fine_steel_chunks", "leather", "cloth", "cloth"}, xp = 30};

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

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Steppe Warrior Armor";
ITEM.group = "prelude_deadlanders/deadlandarcher";
ITEM.model = "models/begotten_prelude/items/khuzaitarcher.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/archer.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "A padded gambeson and chainmail shirt used by Deadlander raiders in combat. It is often favored by arbalests in the horde.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};

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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth"}};

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
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Wind Walker Lamellar";
ITEM.group = "prelude_deadlanders/windarmor";
ITEM.model = "models/begotten/armor/darklander_spice_guard_armor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/armor/wind_walker_lamellar.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.65
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 60
ITEM.type = "chainmail";
ITEM.weight = 5.5;
ITEM.weightclass = "Medium";
ITEM.description = "An enchanted rider's lamellar imbued with catalystic energy that grants its user an uncanny ability to dodge blows. Only the followers of the Eternal Heavens are worthy of this armor.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.requiredbeliefs = {"carried_by_the_winds"};
ITEM.kinisgerOverride = true;

ITEM.attributes = {"windwalker"}

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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "cloth", "cloth", "cloth"}};

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
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Kheshig Lamellar";
ITEM.group = "prelude_deadlanders/deadlanderheavy";
ITEM.model = "models/begotten_prelude/items/khuzaitheavy.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/heavydeadlander.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 78;
ITEM.weight = 7;
ITEM.weightclass = "Heavy";
ITEM.type = "chainmail";
ITEM.description = "The armor of a Deadlander Khesig: a combination of reinforced leather and celestial steel lamellar. Affectionately called the 'Big-rig' by its users.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};

ITEM.requiredbeliefs = {"hauberk"};

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
	[DMG_FALL] = -0.25, -- increases fall damage by 25%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "leather", "leather", "leather", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Armor of the Dread Khan";
ITEM.group = "prelude_deadlanders/khanarmor";
ITEM.model = "models/begotten_prelude/items/khan.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/khanarmor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70
ITEM.type = "chainmail";
ITEM.weight = 7;
ITEM.weightclass = "Medium";
ITEM.description = "An ornamental brass armor reinforced with celestial steel, engraved carefully with iconography of the Khan and his importance. The ultimate symbol of authority.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.attributes = {"windwalker", "bloodletter"}
ITEM.requiredRanks = {"Dread Khan"};
ITEM.excludedFactions = {"Goreic Warrior"};

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

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.75; -- reduces pierce damage by 25%
ITEM.slashScale = 0.65; -- reduces slash damage by 35%
ITEM.bulletScale = 0.55; -- reduces bullet damage by 45%
ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Blood Pact Lamellar";
ITEM.model = "models/begotten/prelude_deadlanders/bloodhoundprop.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/bloodhound.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.9
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 8;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "An exquisitely smithed set of Blood Pact Lamellar, a darkened hellforged steel armor made by the Pale Riders. It combines the traditional knowledge of the Deadlanders with the corrupted teachings of Satan, he who shan't be named within their culture. It is protective as it is cruel, bringing death and destruction in its wake.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/wraithplate";

ITEM.attributes = {"fear", "bloodletter"}

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "leather", "cloth", "iron_chunks"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/prelude_deadlanders/bloodhound.mdl";
	--else
		--return "models/begotten/prelude_deadlanders/bloodhound.mdl";
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
ITEM.name = "Cultist robe";
ITEM.uniqueID = "cultist_robe"
ITEM.model = "models/begotten/headgroup_props/elegantrobes.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elegant_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "A cultist robe commonly worn by a lower satan followers.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Children of Satan"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/cultist.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
end;

ITEM:Register();