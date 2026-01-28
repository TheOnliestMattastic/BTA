-- =============================================================================
-- states/gameState.lua
-- -----------------------------------------------------------------------------

local gameState = {}
local canvas = {}
local ES = {}
local EF = {}
local IS = {}
local RS = {}

-- =============================================================================
-- gameState.load()
-- -----------------------------------------------------------------------------

function gameState.load()
	local gameConfig = require("config.gameConfig")
	local DM = require("lib.dependenciesMaster")

	-- initialize systems
	local EM = DM.EntityMaster.new()
	ES = DM.EventSys.new(EM)
	EF = DM.EntityFactory.new(EM)
	IS = DM.InputSys.new(EM, ES)
	RS = DM.RenderSys.new(EM)

	-- create entities from config
	EF:create("bgColor", gameConfig)
	EF:create("title", gameConfig)

	canvas = love.graphics.newCanvas()
end

-- =============================================================================
-- gameState.update()
-- -----------------------------------------------------------------------------

function gameState.update(dt)
	RS:update()
	ES:update()
end

-- =============================================================================
-- game.draw()
-- -----------------------------------------------------------------------------

function gameState.draw()
	RS:drawState(canvas)
end

-- =============================================================================
-- game.keyreleased()
-- -----------------------------------------------------------------------------

function gameState.keyreleased(key)
	IS:onKeyreleased(key)
end

-- =============================================================================
-- game.keypressed()
-- -----------------------------------------------------------------------------

function gameState.keypressed(key)
	IS:onKeypressed(key)
end

return gameState
