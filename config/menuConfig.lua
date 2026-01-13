-- =============================================================================
-- config/menuConfig.lua
-- WHAT: Menu state configuration (UI elements, positions, colors)
-- WHY: Data-driven UI setup; separates design data from logic
-- HOW: Defines entities (title, buttons) with position, text, and action data
-- NOTE: Position values are screen percentages (0-1); EntityFactory reads this config
-- =============================================================================

return {
	bgColor = {
		r = 0.3,
		g = 0.4,
		b = 0.4,
		a = 1,
	},

	title = {
		text = "Battle Tactis Arena",
		font = "fontXL",
		x = 0.5, -- percent of screen
		y = 0.3,
		xOffset = 0.5, -- percent of width
	},

	startButton = {
		button = "button_1",
		action = "startGame",
		x = 0.5,
		y = 0.75,
		w = 0.5,
		h = 0.25,
	},
}
