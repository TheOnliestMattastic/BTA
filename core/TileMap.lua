-- =============================================================================
-- core/TileMap.lua
-- -----------------------------------------------------------------------------

local TileMap = {}
TileMap.__index = Map

-- =============================================================================
-- Create map container
-- -----------------------------------------------------------------------------

function TileMap.new(tileSet, tileWidth, tileHeight)
	local self = setmetatable({}, TileMap)

	self.image = love.graphics.newImage(tileSet)
	self.tileWidth = tileWidth
	self.tileHeight = tileHeight

	self.quads = {}
	self.data = {}

	self.mapWidth = 0
	self.mapHeight = 0

	self.spriteBatch = love.graphics.newSpriteBatch(self.image)

	self:_extractQuads()

	return self
end

-- =============================================================================
-- slice spritesheet into quads
-- -----------------------------------------------------------------------------

function TileMap:_extractQuads()
	local imgW, imgH = self.image:getDimensions()
	local cols = math.floor(imgW / self.tileWidth)
	local rows = math.floor(imgH / self.tileHeight)

	-- slice quads
	for y = 0, rows - 1 do
		for x = 0, cols - 1 do
			table.insert(
				self.quads,
				love.graphics.newQuad(
					x * self.tileWidth,
					y * self.tileHeight,
					self.tileWidth,
					self.tileHeight,
					imgW,
					imgH
				)
			)
		end
	end
end

-- =============================================================================
-- Generate map
-- mapW, mapH: dimensions in tiles (8x8)
-- -----------------------------------------------------------------------------

function TileMap:generate(mapW, mapH)
	self.mapWidth = mapW
	self.mapHeight = mapH
	self.data = {}
	self.spriteBatch:clear()

	for y = 0, mapH - 1 do
		for x = 0, mapW - 1 do
			-- Default to tile ID 1
			-- TODO: replace logic with noise or file I/O
			local tileID = 1

			-- Flattened index formula i = y * width + x + 1
			local index = (y * mapW) + x + 1
			self.data[index] = tileID

			-- Add to batch for rendering
			self.spriteBatch:add(self.quads[tileID], x * self.tileWidth, y * self.tileHeight)
		end
	end
end

-- =============================================================================
-- Render batch
-- -----------------------------------------------------------------------------

function TileMap:draw()
	love.graphics.draw(self.spriteBatch, 0, 0)
end

-- Get tile at x,y
-- -----------------------------------------------------------------------------

function TileMap:getTile(x, y)
	if x < 0 or x >= self.mapWidth or y < 0 or y >= self.mapHeight then
		return nil
	end
	return self.data[(y * self.mapWidth) + x + 1]
end

return TileMap
