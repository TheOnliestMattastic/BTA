-- =============================================================================
-- states/menu.lua
-- WHAT: Main menu state (title screen, initial navigation)
-- -----------------------------------------------------------------------------

local EM = require("core.EntityMaster")
local RenderSys = require("sys.renderSys")
local ControlSys = require("sys.controlSys")
local EntityFactory = require("core.EntityFactory")

local menu = {}
local render = {}
local ctrls = {}
local factory = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------
function menu.load()
	-- create systems
	local em = EM.new()
	render = RenderSys.new(em)
	ctrls = ControlSys.new(em)
	factory = EntityFactory.new(em)

	-- create menu ui entities from config
	factory:menuUI("title")
	factory:menuUI("startButton")
end

-- =============================================================================
-- menu.update()
-- -----------------------------------------------------------------------------
function menu.update(dt) end

-- =============================================================================
-- menu.draw()
-- -----------------------------------------------------------------------------
function menu.draw()
	render:drawMenuUI()
end

-- =============================================================================
-- menu.keyreleased()
-- -----------------------------------------------------------------------------
function menu.keyreleased(key)
	ctrls:action(key)
end

return menu
