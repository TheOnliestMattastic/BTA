-- =============================================================================
-- states/menuState.lua
-- -----------------------------------------------------------------------------
-- WHAT: Main menu state with title and start button
-- WHY: Entry point to game; allows player to initiate combat or configure settings
-- HOW: Loads entities from menuConfig via EntityFactory; renders with RenderSys and InputSys
-- NOTE: load() is called once; update/draw/keyreleased delegated from main.lua
-- -----------------------------------------------------------------------------

local menuState = {}
local menuCanvas = {}
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
	local GM = require("core.GameMaster")

	-- initialize systems
	local EM = GM.EntityMaster.new()
	ES = GM.EventSys.new(EM)
	EF = GM.EntityFactory.new(EM)
	IS = GM.InputSys.new(EM, ES)
	RS = GM.RenderSys.new(EM)

	-- create entities from config
	EF:create("bgColor", menuConfig)
	EF:create("title", menuConfig)
	EF:create("startButton", menuConfig)

	-- create canavas
	menuCanvas = love.graphics.newCanvas()
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
	RS:drawState(menuCanvas)
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
