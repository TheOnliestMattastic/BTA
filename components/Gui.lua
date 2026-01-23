-- =============================================================================
-- components/Gui.lua
-- -----------------------------------------------------------------------------
-- WHAT: Utility module for creating GUI component data structures
-- WHY: Encapsulates component creation logic; prevents malformed component data
-- HOW: Provides newText() and newButton() factories that validate and return component tables
-- NOTE: Components are plain data tables; rendering/logic handled by systems
-- -----------------------------------------------------------------------------

local Gui = {}

-- background
function Gui.newBgColor(r, g, b, a)
	return {
		r = r or 1,
		g = g or 1,
		b = b or 1,
		a = a or 1,
	}
end

-- text
function Gui.newText(text, font, xOffset)
	assert(xOffset >= 0 and xOffset <= 1, "xOffset expects an int between 0-1!")
	return {
		text = text,
		font = font,
		xOffset = xOffset,
	}
end

-- buttons
function Gui.newButton(data, img, quads, width, height, xOffset)
	return {
		btn = img,
		quads = quads,
		width = width,
		height = height,
		frameW = data.frameW,
		frameH = data.frameH,
		xOffset = xOffset,
	}
end

return Gui
