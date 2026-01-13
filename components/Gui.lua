-- =============================================================================
-- components/Gui.lua
-- WHAT: Utility module for creating GUI component data structures
-- WHY: Encapsulates component creation logic; prevents malformed component data
-- HOW: Provides newText() and newButton() factories that validate and return component tables
-- NOTE: Components are plain data tables; rendering/logic handled by systems
-- =============================================================================

local Gui = {}

function Gui.newText(text, font, xOffset)
	assert(xOffset >= 0 and xOffset <= 1, "xOffset expects an int!")
	return {
		text = text,
		font = font,
		xOffset = xOffset,
	}
end

function Gui.newButton(buttonData)
	return {
		img = buttonData.img,
		frameW = buttonData.frameW,
		frameH = buttonData.frameH,
		frames = buttonData.frames,
		state = 0,
	}
end

return Gui
