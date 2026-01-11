-- assets/config/tilesetsReg.lua
-- Define img sprite sheets
local dir = "assets/sprites/tilesets/"
return {
	-- bricksAltDark = { img = dir .. "TS_bricksAltDark-16x16.png", frameW = 16, frameH = 16 },
	-- bricksAltLight = { img = dir .. "TS_bricksAltLight-16x16.png", frameW = 16, frameH = 16 },
	bricksDark = {
		img = dir .. "TS_bricksDark-16x16.png",
		frameW = 16,
		frameH = 16,
		scale = 4,
	},
	bricksLight = {
		img = dir .. "TS_bricksLight-16x16.png",
		frameW = 16,
		frameH = 16,
		scale = 4,
	},
	-- dirt = { img = dir .. "TS_dirt-16x16.png", frameW = 16, frameH = 16 },
	grassBrick = {
		img = dir .. "TS_grassBrick-32x32.png",
		frameW = 32,
		frameH = 32,
		scale = 2,
	},
	-- grassDark = { img = dir .. "TS_grassDark-16x16.png", frameW = 16, frameH = 16 },
	-- grassLight = { img = dir .. "TS_grassLight-16x16.png", frameW = 16, frameH = 16 },
	-- ice = { img = dir .. "TS_ice-16x16.png", frameW = 16, frameH = 16 },
	-- rock = { img = dir .. "TS_rock-16x16.png", frameW = 16, frameH = 16 },
	-- sand = { img = dir .. "TS_sand-16x16.png", frameW = 16, frameH = 16 },
	-- snow = { img = dir .. "TS_snow-16x16.png", frameW = 16, frameH = 16 },
	-- snowAlt = { img = dir .. "TS_snowAlt-16x16.png", frameW = 16, frameH = 16 },
}
