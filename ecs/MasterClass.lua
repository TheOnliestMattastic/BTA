-- =============================================================================
-- classes/MasterClass.lua
-- WHAT: Base class for systems
-- -----------------------------------------------------------------------------

local MasterClass = {}
MasterClass.__index = MasterClass

function MasterClass:new(entityManager)
	self.enabled = true
	self.roster = entityManager
end

function MasterClass:update(dt) end

function MasterClass:draw() end

function MasterClass:setEnabled(enabled)
	self.enabled = enabled
end

return MasterClass
