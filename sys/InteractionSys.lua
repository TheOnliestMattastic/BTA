-- =============================================================================
-- sys/InteractionSys.lua
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local InteractionSys = setmetatable({}, { __index = SM })
InteractionSys.__index = InteractionSys

function InteractionSys.new(entityMaster)
	local self = setmetatable(SM.new(entityMaster), InteractionSys)
	return self
end

return InteractionSys
