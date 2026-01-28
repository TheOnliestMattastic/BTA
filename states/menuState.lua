-- =============================================================================
-- states/menuState.lua
-- -----------------------------------------------------------------------------
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and InputSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- -----------------------------------------------------------------------------

local menuState = {}
local canvas = {}
local ES = {}
local EF = {}
local IS = {}
local RS = {}

-- =============================================================================
-- menu.load()
-- -----------------------------------------------------------------------------

function menuState.load()
	-- load dependencies
	local menuConfig = require("config.menuConfig")
	local DM = require("lib.dependenciesMaster")

	-- initialize systems
	local EM = DM.EntityMaster.new()
	ES = DM.EventSys.new(EM)
	EF = DM.EntityFactory.new(EM)
	IS = DM.InputSys.new(EM, ES)
	RS = DM.RenderSys.new(EM)

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
	ES:update()
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
	IS:onKeyreleased(key)
end

-- =============================================================================
-- menu.keypressed()
-- -----------------------------------------------------------------------------

function menuState.keypressed(key)
	IS:onKeypressed(key)
end

return menuState
