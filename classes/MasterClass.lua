-- =============================================================================
-- classes/MasterClass.lua
-- WHAT: Base class for creatures/units (lifecycle: update, draw, state)
-- WHY: Provides common interface for all game entities; enables enable/disable
-- HOW: Inheritable class with metatable; calls update/draw if enabled
-- NOTE: Currently minimal; game entities should extend this class
-- TODO: Add position, stats, health; implement inheritance pattern
-- =============================================================================

local MasterClass = {}
MasterClass.__index = MasterClass

function MasterClass.new(entityManager)
	local self = setmetatable({}, MasterClass)
	self.enabled = true
	self.roster = entityManager
end

function MasterClass:update(dt) end

function MasterClass:draw() end

function MasterClass:setEnabled(enabled)
	self.enabled = enabled
end

return MasterClass

