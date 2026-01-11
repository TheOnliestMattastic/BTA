-- =============================================================================
-- classes/MasterClass.lua
-- WHAT: Base class for systems
-- -----------------------------------------------------------------------------

local MasterClass = {}
MasterClass.__index = MasterClass

function MasterClass.new(entityMaster, ui)
	local self = setmetatable({}, MasterClass)
	self.enabled = true
	self.entityMaster = entityMaster
	self.ui = ui
	return self
end

function MasterClass:update(dt) end

function MasterClass:draw() end

function MasterClass:setEnabled(enabled)
	self.enabled = enabled
end

return MasterClass
