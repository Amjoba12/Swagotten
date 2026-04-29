--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local WINDS = cwBeliefs.beliefTrees:New("winds")
	WINDS.name = "Faith of the Winds";
	WINDS.color = Color(200, 200, 200, 255);
	WINDS.order = 7;
	WINDS.size = {w = 771, h = 407};
	WINDS.textures = {"winds", "faithwindsarrows"};
	WINDS.headerFontOverride = "nov_IntroTextSmallaaafaa";
	WINDS.tooltip = {
		{"Faith of the Winds", WINDS.color, "Civ5ToolTip4"},
		{"Each faith has a unique skill set, unlocking character abilities, rituals, and generally improving stats overall. One may also branch into subfaiths, though openly practicing these subfaiths may see your character deemed a heretic by the relevant religious authorities.", Color(225, 200, 200)},
		{"\n\"Look upon the ruins of this once great wall. Thousands of years it may've stood, yes, but now it and it's empire have turned nought to dust. Yet we, the people of the steppe's, live on ever strong. Remember this lesson, boy. Never slow down, for to settle is to die.\"", Color(128, 90, 90, 240)},
		{"", Color(50, 255, 50)}
	};
	WINDS.columnPositions = {
		[1] = (WINDS.size.w - 4) * 0.7,
		[2] = (WINDS.size.w - 4) * 0.75,
		[3] = (WINDS.size.w - 4) * 0.8,
		[4] = (WINDS.size.w - 4) * 0.85,
		[5] = (WINDS.size.w - 4) * 0.9,
		[6] = (WINDS.size.w - 4) * 0.1,
		[7] = (WINDS.size.w - 4) * 0.15,
		[8] = (WINDS.size.w - 4) * 0.2,
		[9] = (WINDS.size.w - 4) * 0.25,
		[10] = (WINDS.size.w - 4) * 0.3,
	};
	WINDS.rowPositions = {
		[1] = (WINDS.size.h - 4) * 0.3,
		[2] = (WINDS.size.h - 4) * 0.5,
		[3] = (WINDS.size.h - 4) * 0.7,
		[4] = (WINDS.size.h - 4) * 0.9,
	};
	
	WINDS.lockedSubfactions = {"Clan Grock"};
	WINDS.requiredFaiths = {"Faith of the Winds"};
	
	-- First index is column.
	WINDS.beliefs = {
		[1] = {
			["sleight_of_hand"] = {
				name = "Sleight of Hand",
				subfaith = "Path of the Eternal Heavens",
				description = "All progress bar actions now complete 25% faster, except for reloading which is 15% faster instead.",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt"},
				row = 2,
			},
			["bolt_thrower_heavens"] = {
				name = "Bolt Thrower",
				subfaith = "Path of the Eternal Heavens",
				description = "Increases throwable and crossbow weapon projectile speed and range by 35%.",
				quote = "\"Fight from afar, as in battle there is no law.\"",
				iconOverride = "begotten/ui/belieficons/bolt_thrower.png",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt", "sleight_of_hand"},
				row = 3,
			},
		},
		[2] = {
			["windcutter"] = {
				name = "Windcutter",
				subfaith = "Path of the Eternal Heavens",
				description = "Thrown slashing weapons will now inflict 10 more points of 'Bloodburst' and will always inflict atleast 55% 'Bloodburst'.",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt", "to_balance_the_scales", "sleight_of_hand", "bolt_thrower_heavens"},
				row = 4,
			},
		},
		[3] = {
			["path_of_the_eternal_heavens"] = {
				name = "Path of the Eternal Heavens",
				subfaith = "Path of the Eternal Heavens",
				description = "Selects 'Path of the Eternal Heavens' as your subfaith. Unlocks the ability to pray. Unlocks the ability to warcry. Gain increasing amounts of faith gain against characters that have lost blood.",
				quote = "The Path of Heaven is a combination of Steppe shamanism and dystheist creed. Formed by the syncretic beliefs of survivors from the blasted wastelands of the old steppe, this Path is followed by Khans, lowly riders, and even the followers of the Deadlander hordes - it espouses a creed in worship of the long forgotten blue skies of dying Gaia. The Gods of this world are cruel, mercurial beings that laugh at the torment of men. This path is walked in defiance of them, led by axel-drum beating shamans and long-blade clutching warriors. To take up this path is to strive to free the skies of their wrath.\n\nInnumerable trickster spirits, daevas, demon-kings, and wrathful ghosts populate the 'pantheon' of Heaven. The most fetid and vile of these beings, worthy of being triumphed over first-and-foremost, is the vile Undergod.",
				row = 1,
			},
			["the_great_hunt"] = {
				name = "The Great Hunt",
				subfaith = "Path of the Eternal Heavens",
				description = "Grants access to 'Bloodburst'. 'Bloodburst' will build up on characters struck with slashing weapons based on the amount of damage done. Once 'bloodburst' is above 25%, performing a pierce attack triggers the built up 'Bloodburst'. Based on how much 'Bloodburst' was built up, this attack gains up to 50% increased damage and a significant bonus to blood damage. Triggering 'Bloodburst' in melee grants 8 points of AP, 16 if you have 100% 'Bloodburst'. Grants access to tier I 'Faith of the Winds' rituals.",
				iconOverride = "begotten/ui/belieficons/bloodburst.png",
				requirements = {"path_of_the_eternal_heavens"},
				row = 2,
			},
			["to_balance_the_scales"] = {
				name = "To balance the Scales",
				subfaith = "Path of the Eternal Heavens",
				description = "Increases your maximum HP by 25 points. Increases maximum stability by 25 points. Grants access to tier II 'Faith of the Winds' rituals.",
				quote = "\"When the Heavens cried out with the Great Pretender's death, balance between the sky and the earth was lost and a great cataclysm was cast upon the world. We must ensure that the balance is restored in the world.\"",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt"},
				row = 3,
			},
		},
		[4] = {
			["carried_by_the_winds"] = {
				name = "Carried by the Winds",
				subfaith = "Path of the Eternal Heavens",
				description = "Reduces the movement and jump height penalty for medium and heavy armor. Lowers the stamina cost of jumping by 33%. Grants access to tier III 'Faith of the Winds' rituals. Also unlocks the ability to equip Celestial sacrificial weapons.",
				quote = "\"Let the winds carry my soul to the next life.\"",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt", "to_balance_the_scales", "wind_warrior", "bleed_them_dry_heavens"},
				row = 4,
			},
		},
		[5] = {
			["wind_warrior"] = {
				name = "Wind Warrior",
				subfaith = "Path of the Eternal Heavens",
				description = "Extends the range of melee weapons by 10%. Two-handed weapons, great weapons, polearms and scythes now build up 33% more 'Bloodburst' and everything else now builds up 15% more 'Bloodburst'.",
				quote = "\"Listen to the song of the wind. Let it guide your blade until it finds your enemy.\"",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt"},
				row = 2,
			},
			["bleed_them_dry_heavens"] = {
				name = "Bleed them dry",
				subfaith = "Path of the Eternal Heavens",
				description = "Deal up to 30% more damage to characters that are suffering from bloodloss.",
				iconOverride = "begotten/ui/belieficons/bleed_them_dry.png",
				requirements = {"path_of_the_eternal_heavens", "the_great_hunt", "wind_warrior"},
				row = 3,
			},
		},
		[6] = {
			["starcursed_swordsman"] = {
				name = "Starcursed Swordsman",
				subfaith = "Path of the Pale Rider",
				description = "Unlocks the ability to dual-wield one-handed weapons.",
				quote = "\"Do not trust those born under the baleful star. Their very bloodline is an ill omen for something evil to come.\"",
				requirements = {"path_of_the_pale_rider", "the_baleful_star"},
				row = 2,
			},
			["bolt_thrower_dark"] = {
				name = "Bolt Thrower",
				subfaith = "Path of the Pale Rider",
				description = "Increases throwable and crossbow weapon projectile speed and range by 35%.",
				quote = "\"Fight from afar, as in battle there is no law.\"",
				iconOverride = "begotten/ui/belieficons/bolt_thrower.png",
				requirements = {"path_of_the_pale_rider", "the_baleful_star", "starcursed_swordsman"},
				row = 3,
			},
		},
		[7] = {
			["pincushion"] = {
				name = "Pincushion",
				subfaith = "Path of the Pale Rider",
				description = "Daggers now trigger maximum 'Bloodburst' when striking an opponent at 50% 'Bloodburst' and this attack will deal double damage and 100% AP damage. This effect includes throwing daggers.",
				iconOverride = "begotten/ui/belieficons/wrestle_subdue.png",
				requirements = {"path_of_the_pale_rider", "the_baleful_star", "to_tip_the_scales", "starcursed_swordsman", "bolt_thrower_dark"},
				row = 4,
			},
		},
		[8] = {
			["path_of_the_pale_rider"] = {
				name = "Path of the Pale Rider",
				subfaith = "Path of the Pale Rider",
				description = "Selects 'Path of the Pale Rider' as your subfaith. Unlocks the ability to pray. Unlocks the ability to warcry. Gain increasing amounts of faith gain against characters that have lost blood. Unlocks the ability to use Faith of the Dark equipment.",
				quote = "The Path of the Pale Rider is one walked commonly by outcasts. They are exiles, foreign mercenaries and conquered tribeswarriors that have become a part of nomadic tribes. Many amongst them have a heritage from the Darklander empire, bringing with them their twisted customs which inevitably mixes with the culture of the people of the Winds. Skilled in unholy swordsmanship, dark arts and blood magicks, ambitious khan's employ them despite their misgivings. Many see their wicked ways as the corrupted taint of Shaitan but when apocalypse comes why not make oneself a Scourge of God?",
				row = 1, 
			},
			["the_baleful_star"] = {
				name = "The Baleful Star",
				subfaith = "Path of the Pale Rider",
				description = "Grants access to 'Bloodburst'. 'Bloodburst' will build up on characters struck with slashing weapons based on the amount of damage done. Once 'bloodburst' is above 25%, performing a pierce attack triggers the built up 'Bloodburst'. Based on how much 'Bloodburst' was built up, this attack gains up to 50% increased damage and a significant bonus to blood damage. Triggering 'Bloodburst' in melee grants 8 points of AP, 16 if you have 100% 'Bloodburst'. Grants access to tier I 'Faith of the Winds' and 'Faith of the Dark' rituals.",
				quote = "The death of Him coincided with the arrival of the Baleful Star. A blinking, malign star that travels across the skies in cycles, carrying with it curses and wickedness. It is said that one day it will finally descend down upon the world and bring ruination to man.",
				iconOverride = "begotten/ui/belieficons/bloodburst.png",
				requirements = {"path_of_the_pale_rider"},
				row = 2,
			},
			["to_tip_the_scales"] = {
				name = "To tip the Scales",
				subfaith = "Path of the Pale Rider",
				description = "Increases your maximum HP by 15 points. Unlocks Tier II 'Faith of the Winds' and 'Faith of the Dark' Rituals.",
				quote = "\"When the Heavens cried out with the Great Pretender's death, balance between the sky and the earth was lost and a great cataclysm was cast upon the world. We must ensure that the balance returns in OUR favor.\"",
				requirements = {"path_of_the_pale_rider", "the_baleful_star"},
				row = 3,
			},
		},
		[9] = {
			["hemomancer"] = {
				name = "Hemomancer",
				subfaith = "Path of the Pale Rider",
				description = "Triggering a 'Bloodburst' at 100% now inflicts characters with a severed artery. Severed arteries cause rapid bloodloss until bandaged. Grants access to tier III 'Faith of the Dark' rituals.",
				quote = "\"Why spill my sacred lifeblood in sacrifice to the demons and pretenders that feast upon this world? They'll share their boons eitherway if I spill yours instead.\"",
				requirements = {"path_of_the_pale_rider", "the_baleful_star", "to_tip_the_scales", "bleeding_edge", "bleed_them_dry_dark"},
				row = 4,
			},
		},
		[10] = {
			["bleeding_edge"] = {
				name = "Bleeding Edge",
				subfaith = "Path of the Pale Rider",
				description = "One-handed weapons now build up 50% more 'Bloodburst' and everything else now builds up 25% more 'Bloodburst'.",
				requirements = {"path_of_the_pale_rider", "the_baleful_star"},
				row = 2,
				},
			["bleed_them_dry_dark"] = {
				name = "Bleed them dry",
				subfaith = "Path of the Pale Rider",
				description = "Deal up to 30% more damage to characters that are suffering from bloodloss.",
				iconOverride = "begotten/ui/belieficons/bleed_them_dry.png",
				requirements = {"path_of_the_pale_rider", "the_baleful_star", "bleeding_edge"},
				row = 3,
			},
		},
	};
cwBeliefs.beliefTrees:Register(WINDS)