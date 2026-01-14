-- =============================================================================
-- components/Gui.lua
-- WHAT: Utility module for creating GUI component data structures
-- WHY: Encapsulates component creation logic; prevents malformed component data
-- HOW: Provides newText() and newButton() factories that validate and return component tables
-- NOTE: Components are plain data tables; rendering/logic handled by systems
-- =============================================================================

local Gui = {}

-- text
function Gui.newText(text, font, xOffset)
	assert(xOffset >= 0 and xOffset <= 1, "xOffset expects an int!")
	return {
		text = text,
		font = font,
		xOffset = xOffset,
	}
end

-- buttons
function Gui.newButton(img, w, h, frames, action)
	return {
		img = img,
		frameW = w,
		frameH = h,
		frames = frames,
		state = 0,
		action = action or nil,
	}
end

-- background
function Gui.newBgColor(r, g, b, a)
	return {
		r = r or 1,
		g = g or 1,
		b = b or 1,
		a = a or 1,
	}
end

return Gui
