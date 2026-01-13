-- =============================================================================
-- registries/creatureReg.lua
-- -----------------------------------------------------------------------------
-- WHAT: Registry of all playable creatures with stats, animations, and sprite data
-- WHY: Centralized creature definitions for roster building and combat mechanics
-- HOW: Maps creature names to sprite sheets, stats (hp/pwr/def/dex/spd/rng), and anim data
-- NOTE: Frame rows = animations, cols = direction (1=down,2=up,3=left,4=right); stats use dice notation
-- -----------------------------------------------------------------------------

local dir = "assets/sprites/chars/"
return {
	-- ===========================================================================
	-- Rogues
	-- ---------------------------------------------------------------------------

	-- ninjas
	ninjaBlack = {
		name = "Black Ninja",
		image = dir .. "ninjaBlack/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaBlack/Faceset.png",
		stats = { hp = 16, pwr = 7, def = 2, dex = 5, spd = 4, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaBlue = {
		name = "Blue Ninja",
		image = dir .. "ninjaBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaBlue/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 2, dex = 5, spd = 4, rng = 2 },
		tags = { slash = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaRed = {
		name = "Red Ninja",
		image = dir .. "ninjaRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaRed/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 2, dex = 5, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaGreen = {
		name = "Green Ninja",
		image = dir .. "ninjaGreen/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaGreen/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 2, dex = 5, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaGray = {
		name = "Gray Ninja",
		image = dir .. "ninjaGray/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaGray/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 2, dex = 5, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaYellow = {
		name = "Yellow Ninja",
		image = dir .. "ninjaYellow/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaYellow/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 2, dex = 5, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	ninjaIce = {
		name = "Ice Ninja",
		image = dir .. "ninjaIce/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaIce/Faceset.png",
		stats = { hp = 16, pwr = 5, def = 3, dex = 5, spd = 3, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- scouts
	scoutGreen = {
		name = "Green Scout",
		image = dir .. "scoutGreen/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "scoutGreen/Faceset.png",
		stats = { hp = 16, pwr = 4, def = 1, dex = 6, spd = 5, rng = 3 },
		tags = { projectile = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	scoutBlue = {
		name = "Blue Scout",
		image = dir .. "scoutBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "scoutBlue/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 3, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	scoutMasked = {
		name = "Masked Scout",
		image = dir .. "scoutMasked/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaMasked/Faceset.png",
		stats = { hp = 20, pwr = 6, def = 2, dex = 4, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	scoutBomb = {
		name = "Bomb Scout",
		image = dir .. "scoutBomb/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "ninjaBomb/Faceset.png",
		stats = { hp = 12, pwr = 7, def = 1, dex = 5, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- ===========================================================================
	-- Warriors
	-- ---------------------------------------------------------------------------

	-- samurais
	samuraiBlue = {
		name = "Blue Samurai",
		image = dir .. "samuraiBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "samuraiBlue/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 4, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	samuraiRed = {
		name = "Red Samurai",
		image = dir .. "samuraiRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "samuraiRed/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 4, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	samuraiArmoredBlue = {
		name = "Blue Armored Samurai",
		image = dir .. "samuraiArmoredBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "samuraiArmoredBlue/Faceset.png",
		stats = { hp = 28, pwr = 6, def = 6, dex = 3, spd = 2, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	samuraiArmoredRed = {
		name = "Red Armored Samurai",
		image = dir .. "samuraiArmoredRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "samuraiArmoredRed/Faceset.png",
		stats = { hp = 28, pwr = 6, def = 6, dex = 3, spd = 2, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	samuraiRedAlt = {
		name = "Red Samurai Alt",
		image = dir .. "samuraiRedAlt/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "samuraiRedAlt/Faceset.png",
		stats = { hp = 24, pwr = 5, def = 3, dex = 5, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- fighters
	brawlerBlue = {
		name = "Blue Brawler",
		image = dir .. "brawlerBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "brawlerBlue/Faceset.png",
		stats = { hp = 28, pwr = 8, def = 4, dex = 2, spd = 2, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	brawlerRed = {
		name = "Red Brawler",
		image = dir .. "brawlerRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "brawlerRed/Faceset.png",
		stats = { hp = 28, pwr = 8, def = 4, dex = 2, spd = 2, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	fighterBlue = {
		name = "Blue Fighter",
		image = dir .. "fighterBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "fighterBlue/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 3, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	fighterRed = {
		name = "Red Fighter",
		image = dir .. "fighterRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "fighterRed/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 3, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- knights/gladiators
	knightSilver = {
		name = "Silver Knight",
		image = dir .. "knightSilver/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "knightSilver/Faceset.png",
		stats = { hp = 32, pwr = 7, def = 8, dex = 2, spd = 2, rng = 1 },
		tags = { slash = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	knightGold = {
		name = "Gold Knight",
		image = dir .. "knightGold/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "knightGold/Faceset.png",
		stats = { hp = 32, pwr = 8, def = 7, dex = 2, spd = 2, rng = 1 },
		tags = { slash = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	gladiatorBlue = {
		name = "Blue Gladiator",
		image = dir .. "gladiatorBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "gladiatorBlue/Faceset.png",
		stats = { hp = 24, pwr = 7, def = 5, dex = 2, spd = 2, rng = 1 },
		tags = { bash = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	gladiatorRed = {
		name = "Red Gladiator",
		image = dir .. "gladiatorRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "gladiatorRed/Faceset.png",
		stats = { hp = 24, pwr = 7, def = 5, dex = 2, spd = 2, rng = 1 },
		tags = { bash = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- lions
	lionOrange = {
		name = "Orange Lion",
		image = dir .. "lionOrange/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "lionOrange/Faceset.png",
		stats = { hp = 20, pwr = 7, def = 4, dex = 3, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	lionYellow = {
		name = "Yellow Lion",
		image = dir .. "lionYellow/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "lionYellow/Faceset.png",
		stats = { hp = 20, pwr = 7, def = 4, dex = 3, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	lionDude = {
		name = "Dude Lion",
		image = dir .. "lionDude/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "lionDude/Faceset.png",
		stats = { hp = 20, pwr = 6, def = 5, dex = 3, spd = 3, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	lionBro = {
		name = "Bro Lion",
		image = dir .. "lionBro/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "lionBro/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 4, dex = 3, spd = 3, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- ===========================================================================
	-- Mages
	-- ---------------------------------------------------------------------------

	mageBlack = {
		name = "Black Mage",
		image = dir .. "mageBlack/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "mageBlack/Faceset.png",
		stats = { hp = 12, pwr = 6, def = 1, dex = 3, spd = 3, rng = 4 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	mageOrange = {
		name = "Orange Mage",
		image = dir .. "mageOrange/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "mageOrange/Faceset.png",
		stats = { hp = 12, pwr = 6, def = 1, dex = 3, spd = 3, rng = 4 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	sorcererBlack = {
		name = "Black Sorcerer",
		image = dir .. "sorcererBlack/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "sorcererBlack/Faceset.png",
		stats = { hp = 16, pwr = 7, def = 1, dex = 4, spd = 3, rng = 3 },
		tags = { fire = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	sultanBlack = {
		name = "Black Sultan",
		image = dir .. "sultanBlack/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "sultanBlack/Faceset.png",
		stats = { hp = 20, pwr = 7, def = 2, dex = 3, spd = 3, rng = 3 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- ===========================================================================
	-- Sages
	-- ---------------------------------------------------------------------------

	shaman = {
		name = "Shaman",
		image = dir .. "shaman/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "shaman/Faceset.png",
		stats = { hp = 16, pwr = 8, def = 2, dex = 3, spd = 3, rng = 4 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	shaLion = {
		name = "Sha-Lion",
		image = dir .. "shaLion/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "shaLion/Faceset.png",
		stats = { hp = 20, pwr = 6, def = 3, dex = 4, spd = 4, rng = 3 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	sultanWhite = {
		name = "Sultan White",
		image = dir .. "sultanWhite/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "sultanWhite/Faceset.png",
		stats = { hp = 20, pwr = 8, def = 2, dex = 3, spd = 3, rng = 3 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	sorcererOrange = {
		name = "Sorcerer Orange",
		image = dir .. "sorcererOrange/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "sorcererOrange/Faceset.png",
		stats = { hp = 16, pwr = 7, def = 1, dex = 4, spd = 3, rng = 3 },
		tags = { fire = true },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},

	-- ===========================================================================
	-- Daemons
	-- ---------------------------------------------------------------------------

	tenguBlue = {
		name = "Blue Tengu",
		image = dir .. "tenguBlue/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "tenguBlue/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 4, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	tenguRed = {
		name = "Red Tengu",
		image = dir .. "tenguRed/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "tenguRed/Faceset.png",
		stats = { hp = 24, pwr = 6, def = 3, dex = 4, spd = 4, rng = 2 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
	vampire = {
		name = "Vampire",
		image = dir .. "vampire/SpriteSheet.png",
		frameW = 16,
		frameH = 16,
		faceset = dir .. "vampire/Faceset.png",
		stats = { hp = 32, pwr = 7, def = 2, dex = 5, spd = 4, rng = 1 },
		animations = {
			idle = { rows = 1, cols = "1-4", duration = 1, animated = false },
			walk = { rows = "1-4", cols = "1-4", duration = 0.15 },
			attack = { rows = 5, cols = "1-4", duration = 0.005 },
			jump = { rows = 6, cols = "1-4", duration = 0.005 },
		},
	},
}
