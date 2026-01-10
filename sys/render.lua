-- =============================================================================
-- sys/render.lua
-- WHAT: System to draw onto the screen
-- -----------------------------------------------------------------------------

local MC = require("ecs.masterClass")
local G = require("lib.globals")
local Text = require("components.text")
local Button = require("components.buttons")
local Render = setmetatable({}, { __index = MC })
Render.__index = Render
local menuCanvas
local menuBtn

function Render.new(roster)
	local self = setmetatable(MC.new(roster), Render)
	menuCanvas = love.graphics.newCanvas(G.virtual.WIDTH, G.virtual.HEIGHT)
	G.virtual.scaleScreen()
	menuBtn = Button.add(G.ui.button_1)
	return self
end

function Render:drawMenuUI()
	love.graphics.setCanvas(menuCanvas)
	love.graphics.clear(0.3, 0.4, 0.4)
	Text.add("Battle Tactics Arena", G.virtual.WIDTH / 2, G.virtual.HEIGHT / 3, Text.FONT.XL, Text.ALIGN.CENTER)
	Button.draw(menuBtn, G.virtual.WIDTH / 2, (G.virtual.HEIGHT / 4) * 3, G.virtual.WIDTH / 3, G.virtual.HEIGHT / 4)
	love.graphics.setCanvas()
	if G.virtual.scale and G.virtual.scale > 0 then
		love.graphics.draw(menuCanvas, G.virtual.translateX, G.virtual.translateY, 0, G.virtual.scale, G.virtual.scale)
	end
end

function Render:update(dt)
	G.virtual.scaleScreen()
end

return Render
