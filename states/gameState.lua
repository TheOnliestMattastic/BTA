-- =============================================================================
-- states/gameState.lua
-- -----------------------------------------------------------------------------

local gameState = {}
local gameCanvas = {}
local ES = {}
local EF = {}
local IS = {}
local RS = {}

-- =============================================================================
-- gameState.load()
-- -----------------------------------------------------------------------------

function gameState.load()
	local gameConfig = require("config.gameConfig")
	local GM = require("core.GameMaster")

	-- initialize systems
	local EM = GM.EntityMaster.new()
	ES = GM.EventSys.new(EM)
	EF = GM.EntityFactory.new(EM)
	IS = GM.InputSys.new(EM, ES)
	RS = GM.RenderSys.new(EM)

	-- create entities from config
	EF:create("bgColor", gameConfig)
	EF:create("title", gameConfig)

	gameCanvas = love.graphics.newCanvas()
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
	RS:drawState(gameCanvas)
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
