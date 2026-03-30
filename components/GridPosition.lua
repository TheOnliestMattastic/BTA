-- =============================================================================
-- components/GridPosition.lua
-- -----------------------------------------------------------------------------

local GridPosition = {}

function GridPosition.new(x, y)
	return {
		x = x or 0,
		y = y or 0,
	}
end

return GridPosition
