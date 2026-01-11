-- =============================================================================
-- config/menu.lua
-- WHAT: Menu State data
-- -----------------------------------------------------------------------------

return {
	menu = {
		title = {
			text = "Battle Tactis Arena",
			font = "XL",
			align = "CENTER",
			x = 0.5, -- percent of screen
			y = 0.4,
		},

		startButton = {
			text = "Play",
			element = "button_1",
			action = "startGame",
			x = 0.5,
			y = 0.75,
			w = 0.5,
			h = 0.25,
		},
	},
}
