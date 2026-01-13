-- =============================================================================
-- core/SystemsMaster.lua
-- WHAT: Base class for all game systems (input, render, logic, etc.)
-- WHY: Provides consistent interface and lifecycle (update, draw, enabled state)
-- HOW: Abstract base with update(dt) and draw() stubs; systems inherit and override
-- NOTE: All systems must call SystemsMaster.new() in their constructor
-- =============================================================================

local SystemsMaster = {}
SystemsMaster.__index = SystemsMaster

function SystemsMaster.new(entityMaster)
	local self = setmetatable({}, SystemsMaster)
	self.enabled = true
	self.entityMaster = entityMaster
	return self
end

function SystemsMaster:update(dt) end

function SystemsMaster:draw() end

function SystemsMaster:setEnabled(enabled)
	self.enabled = enabled
end

return SystemsMaster
