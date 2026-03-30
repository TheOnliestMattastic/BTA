-- =============================================================================
-- components/Selection.lua
-- -----------------------------------------------------------------------------
-- WHAT: Tracks selection and focus state for an entity
-- WHY: Enables interactive elements to respond to user input and selection logic
-- -----------------------------------------------------------------------------

local Selection = {}

function Selection.new()
	return {
		selected = true,
	}
end

return Selection
