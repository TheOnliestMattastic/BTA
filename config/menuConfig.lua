-- =============================================================================
-- config/menu.lua
-- WHAT: Menu State data
-- -----------------------------------------------------------------------------

return {
	title = {
		text = "Battle Tactis Arena",
		font = "fontXL",
		x = 0.5, -- percent of screen
		y = 0.4,
		xOffset = 0.5, -- percent of width
	},

	startButton = {
		text = "Play",
		button = "button_1",
		action = "startGame",
		x = 0.5,
		y = 0.75,
		w = 0.5,
		h = 0.25,
	},
}
