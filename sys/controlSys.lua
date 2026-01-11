-- =============================================================================
-- sys/controlSys.lua
-- -----------------------------------------------------------------------------

-- inherit from MasterClass
local MC = require("core.MasterClass")
local controlSys = setmetatable({}, { __index = MC })
controlSys.__index = controlSys
local controls = require("config.controlConfig")

function controlSys.new(entityMaster)
	local self = setmetatable(MC.new(entityMaster), controlSys)
	self.keys = controls
	return self
end

function controlSys:action(key)
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
function controlSys:moveLEFT()
	print("LEFT")
end

function controlSys:moveDOWN()
	print("DOWN")
end

function controlSys:moveUP()
	print("UP")
end

function controlSys:moveRIGHT()
	print("RIGHT")
end

function controlSys:QUIT()
	print("QUIT")
end

function controlSys:CONFIRM()
	print("CONFIRM")
end

function controlSys:SELECT()
	print("SELECT")
end

function controlSys:MOVE()
	print("MOVE")
end

function controlSys:ATTACK()
	print("ATTACK")
end

return controlSys
