-- =============================================================================
-- components/Coords.lua
-- WHAT: Transform component intended for screen positioning
-- -----------------------------------------------------------------------------

local Coords = {}

function Coords.new(x, y)
	return {
		x = x or 0,
		y = y or 0,
	}
end

return Coords
