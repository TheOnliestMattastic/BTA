-- =============================================================================
-- sys/InputSys.lua
-- -----------------------------------------------------------------------------
-- WHAT: Keyboard input mapper that converts key presses to game actions
-- WHY: Centralizes control scheme; allows remappable keybinds via controlConfig
-- HOW: Maps keyboard input to actions via controlConfig, emits events to EventSys for processing
-- NOTE: controlConfig defines key-to-action mappings; InputSys calls EventSys:receiveEvent() for each input
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local ControlSys = setmetatable({}, { __index = SM })
ControlSys.__index = ControlSys
local controls = require("config.controlConfig")

-- -----------------------------------------------------------------------------
-- Initialize InputSys with reference to EventSys for event emission
-- -----------------------------------------------------------------------------
function ControlSys.new(entityMaster, interactionSys)
	local self = setmetatable(SM.new(entityMaster), ControlSys)
	self.keys = controls
	self.interactionSys = interactionSys
	return self
end

-- -----------------------------------------------------------------------------
-- Handle keyreleased event from love.keyreleased callback
-- -----------------------------------------------------------------------------
function ControlSys:onKeyreleased(key)
	local action = self:mapKeyToAction(key)
	if action then
		self:emitEvent(action, "keyreleased", key)
	end
end

-- -----------------------------------------------------------------------------
-- Handle keypressed event from love.keypressed callback
-- -----------------------------------------------------------------------------
function ControlSys:onKeypressed(key)
	local action = self:mapKeyToAction(key)
	if action then
		self:emitEvent(action, "keypressed", key)
	end
end

-- -----------------------------------------------------------------------------
-- Create event object and send to EventSys for processing
-- -----------------------------------------------------------------------------
function ControlSys:emitEvent(action, input, key)
	self.interactionSys:receiveEvent({
		action = action,
		input = input,
		key = key,
	})
end

-- -----------------------------------------------------------------------------
-- Look up key in controlConfig and return corresponding action name
-- -----------------------------------------------------------------------------
function ControlSys:mapKeyToAction(key)
	for actionName, keyValue in pairs(self.keys) do
		if key == keyValue then
			return actionName
		end
	end
	return nil
end

return ControlSys
