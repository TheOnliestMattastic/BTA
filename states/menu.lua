-- =============================================================================
-- states/menu.lua
-- WHAT: Main menu state (title screen, initial navigation)
-- -----------------------------------------------------------------------------

local RenderSys = require("sys.renderSys")
local ControlSys = require("sys.controlSys")

local menu = {}
local Render = {}
local Ctrls = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------
function menu.load()
	Render = RenderSys.new()
	Ctrls = ControlSys.new()
end

-- =============================================================================
-- menu.update()
-- -----------------------------------------------------------------------------
function menu.update(dt) end

-- =============================================================================
-- menu.draw()
-- -----------------------------------------------------------------------------
function menu.draw()
	Render:drawMenuUI()
end

-- =============================================================================
-- menu.keyreleased()
-- -----------------------------------------------------------------------------
function menu.keyreleased(key)
	for i in pairs(Ctrls.keys) do
		if key == Ctrls.keys[i] then
			Ctrls:action(key)
		end
	end
end

return menu
