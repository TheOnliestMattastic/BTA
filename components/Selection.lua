-- =============================================================================
-- components/Selection.lua
-- -----------------------------------------------------------------------------
-- WHAT: Tracks selection and focus state for an entity
-- WHY: Enables interactive elements to respond to user input and selection logic
-- -----------------------------------------------------------------------------

local Selection = {}

function Selection.new(isSelected, isFocused)
	return {
		isSelected = isSelected or false, -- Whether the entity is currently selected
		isFocused = isFocused or false, -- Whether the entity is currently focused (hovered/active)
		selectionIndex = 1, -- Order or index within a selection group
	}
end

return Selection
