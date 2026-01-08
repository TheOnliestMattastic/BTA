-- =============================================================================
-- states/menu.lua
-- WHAT: Main menu state (title screen, initial navigation)
-- WHY: Handles menu rendering, input, and transitions to game state
-- HOW: Uses virtual canvas for scaling; renders text UI; responds to ESC key
-- NOTE: Currently shows placeholder "Title"
-- TODO: add buttons and navigation
-- =============================================================================

local G = require("lib.globals")
local Text = require("ui.text")
local menu = {}
local menuCanvas

function menu.load()
	menuCanvas = love.graphics.newCanvas(G.virtual.WIDTH, G.virtual.HEIGHT)
	G.virtual.scaleScreen()
end

function menu.update(dt)
	G.virtual.scaleScreen()
end

function menu.draw()
	love.graphics.setCanvas(menuCanvas)
	love.graphics.clear(0.3, 0.4, 0.4)
	Text.add("Title", G.virtual.WIDTH / 2, G.virtual.HEIGHT / 3, Text.FONT.XL, Text.ALIGN.CENTER)
	love.graphics.setCanvas()
	if G.virtual.scale and G.virtual.scale > 0 then
		love.graphics.draw(menuCanvas, G.virtual.translateX, G.virtual.translateY, 0, G.virtual.scale, G.virtual.scale)
	end
end

function menu.resize()
	G.virtual.scaleScreen()
end

function menu.keyreleased(key)
	if key == G.controls.ESC then
		love.event.quit()
		return
	end
end

return menu
