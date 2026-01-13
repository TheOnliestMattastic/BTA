-- =============================================================================
-- config/controlConfig.lua
-- WHAT: Keyboard input binding configuration
-- WHY: Centralized key-to-action mapping; easy to reconfigure controls
-- HOW: Maps action names (MOVE_LEFT, CONFIRM, etc.) to keyboard keys
-- NOTE: Keys like "h/j/k/l" for vim-style movement; loaded by ControlSys
-- =============================================================================

return {
	-- navigation
	MOVE_LEFT = "h",
	MOVE_DOWN = "j",
	MOVE_UP = "k",
	MOVE_RIGHT = "l",

	-- ui actions
	SELECT = "space",
	CONFIRM = "return",
	QUIT = "q",
	ESC = "escape",

	-- char actions
	ATTACK = "a",
	MOVE = "m",
}
