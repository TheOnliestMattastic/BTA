-- =============================================================================
-- sys/controlSys.lua
-- -----------------------------------------------------------------------------

-- inherit from MasterClass
local MC = require("ecs.masterClass")
local ControlSys = setmetatable({}, { __index = MC })
ControlSys.__index = ControlSys

function ControlSys.new(entityMaster, ctrlConfig)
	local self = setmetatable(MC.new(entityMaster), ControlSys)
	self.keys = ctrlConfig
	return self
end

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
    -- stylua: ignore start
		ESC     = function() love.event.quit() end,
		LEFT    = function() self:moveLEFT() end,
		DOWN    = function() self:moveDOWN() end,
		UP      = function() self:moveUP() end,
		RIGHT   = function() self:moveRIGHT() end,
		QUIT    = function() self:QUIT() end,
		CONFIRM = function() self:CONFIRM() end,
		SELECT  = function() self:SELECT() end,
		MOVE    = function() self:MOVE() end,
		ATTACK  = function() self:ATTACK() end,
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
