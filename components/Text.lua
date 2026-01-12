-- =============================================================================
-- ui/text.lua
-- -----------------------------------------------------------------------------
-- WHAT: Text rendering UI component with font sizes and alignment support
-- WHY: Abstracts Love2D font/print calls; provides consistent text styling
-- HOW: Loads fonts from uiData; Text.add() renders with alignment calculations
-- -----------------------------------------------------------------------------

local Text = {}

function Text.new(text, font, xOffset)
	assert(xOffset >= 0 and xOffset <= 1, "xOffset expects an int!")
	return {
		text = text,
		font = font,
		align = xOffset,
	}
end

return Text
