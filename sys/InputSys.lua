-- =============================================================================
-- sys/ControlSys.lua
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local ControlSys = setmetatable({}, { __index = SM })
ControlSys.__index = ControlSys
local controls = require("config.controlConfig")

function ControlSys.new(entityMaster, interactionSys)
	local self = setmetatable(SM.new(entityMaster), ControlSys)
	self.keys = controls
	self.interactionSys = interactionSys
	return self
end

function ControlSys:onKeyreleased(key)
	local action = self:mapKeyToAction(key)
	if action then
		self:emitEvent(action, "keyreleased", key)
	end
end

function ControlSys:onKeypressed(key)
	local action = self:mapKeyToAction(key)
	if action then
		self:emitEvent(action, "keypressed", key)
	end
end

function ControlSys:emitEvent(action, input, key)
	self.interactionSys:receiveEvent({
		action = action,
		input = input,
		key = key,
	})
end

function ControlSys:mapKeyToAction(key)
	for actionName, keyValue in pairs(self.keys) do
		if key == keyValue then
			return actionName
		end
	end
	return nil
end

return ControlSys
