-- =============================================================================
-- sys/EventSys.lua
-- -----------------------------------------------------------------------------
-- WHAT: Event dispatcher that processes queued input events
-- WHY: Decouples input handling from event execution; allows action handlers to be added without modifying InputSys
-- HOW: Maintains event queue, routes events through dispatch table to handler methods (ESC, CONFIRM, etc.)
-- NOTE: Add new handlers to the interactions table; EventSys:update() must be called each frame to process events
-- -----------------------------------------------------------------------------

local SM = require("core.SystemsMaster")
local EventSys = setmetatable({}, { __index = SM })
EventSys.__index = EventSys

-- -----------------------------------------------------------------------------
-- Initialize EventSys with empty event queue
-- -----------------------------------------------------------------------------
function EventSys.new(entityMaster)
	local self = setmetatable(SM.new(entityMaster), EventSys)
	self.eventQueue = {}
	return self
end

-- stylua: ignore
-- -----------------------------------------------------------------------------
-- Dispatch table mapping actions to handler methods; add new actions here
-- -----------------------------------------------------------------------------
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

-- -----------------------------------------------------------------------------
-- Queue an event for processing in the next update() call
-- -----------------------------------------------------------------------------
function EventSys:receiveEvent(event)
	table.insert(self.eventQueue, event)
end

-- -----------------------------------------------------------------------------
-- Process all queued events through dispatch table and clear queue
-- -----------------------------------------------------------------------------
function EventSys:update()
	for _, event in ipairs(self.eventQueue) do
		local handler = interactions[event.action]
		if handler then
			handler(self, event)
		end
	end
	self.eventQueue = {}
end

-- -----------------------------------------------------------------------------
-- Quit game on ESC keyreleased
-- -----------------------------------------------------------------------------
function EventSys:ESC(event)
	if event.input == "keyreleased" then
		love.event.quit()
	end
end

return EventSys
