-- =============================================================================
-- components/Selection.lua
-- -----------------------------------------------------------------------------

local Selection = {}

function Selection.new(isSelected, isFocused)
	return {
		isSelected = isSelected or false,
		isFocused = isFocused or false,
		selectionIndex = 1,
	}
end

return Selection
