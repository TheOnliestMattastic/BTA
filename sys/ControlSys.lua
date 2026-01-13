-- =============================================================================
-- sys/ControlSys.lua
-- WHAT: Input system; maps keyboard input to game actions
-- WHY: Decouples input handling from game logic; allows action-based game flow
-- HOW: Inherits from SystemsMaster; reads controlConfig and dispatches keyreleased events
-- NOTE: action() matches key to handler; stub handlers print debug output (TODO: implement)
-- =============================================================================

local MC = require("core.SystemsMaster")
local ControlSys = setmetatable({}, { __index = MC })
ControlSys.__index = ControlSys
local controls = require("config.controlConfig")

function ControlSys.new(entityMaster)
	local self = setmetatable(MC.new(entityMaster), ControlSys)
	self.keys = controls
	return self
end

-- stylua: ignore
function ControlSys:action(key)
	-- match key to action
	local action
	for actionName, keyValue in pairs(self.keys) do
		if key == keyValue then
			action = actionName
			break
		end
	end

  -- action dispatch table
	local handlers = {
		ESC          = function() love.event.quit() end,
		MOVE_LEFT    = function() self:moveLEFT() end,
		MOVE_DOWN    = function() self:moveDOWN() end,
		MOVE_UP      = function() self:moveUP() end,
		MOVE_RIGHT   = function() self:moveRIGHT() end,
		QUIT         = function() self:QUIT() end,
		CONFIRM      = function() self:CONFIRM() end,
		SELECT       = function() self:SELECT() end,
		MOVE         = function() self:MOVE() end,
		ATTACK       = function() self:ATTACK() end,
	}

	if handlers[action] then
		handlers[action]()
	end
end

-- TODO: configure with appropriate action
function ControlSys:moveLEFT()
	print("LEFT")
end

function ControlSys:moveDOWN()
	print("DOWN")
end

function ControlSys:moveUP()
	print("UP")
end

function ControlSys:moveRIGHT()
	print("RIGHT")
end

function ControlSys:QUIT()
	print("QUIT")
end

function ControlSys:CONFIRM()
	print("CONFIRM")
end

function ControlSys:SELECT()
	print("SELECT")
end

function ControlSys:MOVE()
	print("MOVE")
end

function ControlSys:ATTACK()
	print("ATTACK")
end

return ControlSys
