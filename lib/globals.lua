-- =============================================================================
-- lib/globals.lua
-- WHAT: Centralized global dependency management (virtual screen, controls)
-- =============================================================================

local G = {}

-- testing; remove later
G.ui = require("assets.config.uiData")

-- core
G.virtual = require("lib.virtual")
G.controls = require("config.controls")

return G
