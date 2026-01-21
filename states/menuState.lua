-- =============================================================================
-- states/menuState.lua
-- -----------------------------------------------------------------------------
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and ControlSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- -----------------------------------------------------------------------------

local menuState = {}
local menuConfig = require("config.menuConfig")
local VIR = require("lib.virtual")
local RS = {}
local CS = {}
local EF = {}
local canvas = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------

function menuState.load()
	-- load dependencies
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

	canvas = love.graphics.newCanvas()
end

-- =============================================================================
-- menu.update()
-- -----------------------------------------------------------------------------

function menuState.update(dt)
	RS:update()
end

function menuState.resize(w, h)
	VIR.scaleScreen()
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
