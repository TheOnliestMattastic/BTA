-- =============================================================================
-- states/menuState.lua
-- -----------------------------------------------------------------------------
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and ControlSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- -----------------------------------------------------------------------------

local menuState = {}
local canvas = {}
local RS = {}
local CS = {}
local EF = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------

function menuState.load()
	-- load dependencies
	local menuConfig = require("config.menuConfig")
	local EntityMaster = require("core.EntityMaster")
	local RenderSys = require("sys.RenderSys")
	local ControlSys = require("sys.ControlSys")
	local EntityFactory = require("core.EntityFactory")

	-- initialize systems
	local EM = EntityMaster.new()
	RS = RenderSys.new(EM)
	CS = ControlSys.new(EM)
	EF = EntityFactory.new(EM)

	-- create entities from config
	EF:create("bgColor", menuConfig)
	EF:create("title", menuConfig)
	EF:create("startButton", menuConfig)

	-- create canavas
	canvas = love.graphics.newCanvas()
end

-- =============================================================================
-- menu.update()
-- -----------------------------------------------------------------------------

function menuState.update(dt)
	RS:update()
end

-- =============================================================================
-- menu.draw()
-- -----------------------------------------------------------------------------

function menuState.draw()
	RS:drawState(canvas)
end

-- =============================================================================
-- menu.keyreleased()
-- -----------------------------------------------------------------------------

function menuState.keyreleased(key)
	CS:action(key)
end

return menuState
