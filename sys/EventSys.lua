-- =============================================================================
-- sys/EventSys.lua
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local EventSys = setmetatable({}, { __index = SM })
EventSys.__index = EventSys

function EventSys.new(entityMaster)
	local self = setmetatable(SM.new(entityMaster), EventSys)
	self.eventQueue = {}
	return self
end

-- stylua: ignore
local interactions = {
  -- commands
  ESC        = function(self, event) self:ESC(event) end,
  CONFIRM    = function(self, event) self:CONFIRM(event) end,
  SELECT     = function(self, event) self:SELECT(event) end,

  -- navigation
  MOVE_UP    = function(self, event) self:MOVE_UP(event) end,
  MOVE_DOWN  = function(self, event) self:MOVE_DOWN(event) end,
  MOVE_LEFT  = function(self, event) self:MOVE_LEFT(event) end,
  MOVE_RIGHT = function(self, event) self:MOVE_RIGHT(event) end,

  -- actions
  ATTACK     = function(self, event) self:ATTACK(event) end,
  NAVIGATE   = function(self, event) self:NAVIGATE(event) end,
}

function EventSys:receiveEvent(event)
	table.insert(self.eventQueue, event)
end

function EventSys:update()
	for _, event in ipairs(self.eventQueue) do
		local handler = interactions[event.action]
		if handler then
			handler(self, event)
		end
	end
	self.eventQueue = {}
end

function EventSys:ESC(event)
	if event.input == "keyreleased" then
		love.event.quit()
	end
end

return EventSys
