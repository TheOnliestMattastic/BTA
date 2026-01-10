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
	if key == self.keys.ESC then
		love.event.quit()
		return
	elseif key == self.keys.SELECT then
		print("select")
	elseif key == self.keys.MOVE then
		print("move")
	elseif key == self.keys.QUIT then
		print("quit")
	end
end

return ControlSys
