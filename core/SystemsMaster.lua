-- =============================================================================
-- classes/SystemsMaster.lua
-- WHAT: Base class for systems
-- -----------------------------------------------------------------------------

local SystemsMaster = {}
SystemsMaster.__index = SystemsMaster

function SystemsMaster.new(entityMaster, ui)
	local self = setmetatable({}, SystemsMaster)
	self.enabled = true
	self.entityMaster = entityMaster
	self.ui = ui
	return self
end

function SystemsMaster:update(dt) end

function SystemsMaster:draw() end

function SystemsMaster:setEnabled(enabled)
	self.enabled = enabled
end

return SystemsMaster
