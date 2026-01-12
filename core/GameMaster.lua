-- =============================================================================
-- core/GameMaster.lua
-- -----------------------------------------------------------------------------
-- WHAT: An entity-component-system game engine thematically flavored to invoke
--       the feeling of a cyber-punk Game Master engineering a technologic
--       table top game; catered for grid-based navigation and combat, including
--       a dice-set and sprite animation modules.
--
-- WHY: A centralized engine system with a nostalgic, user-friendly front to
--      accommodate unconventional development backgrounds or approaches.
--
-- stylua: ignore start
-- -----------------------------------------------------------------------------

local GameMaster = {}

-- core
GameMaster.SystemsMaster = require("core.SystemsMaster")
GameMaster.EntityFactory = require("core.EntityFactory")
GameMaster.EntityMaster  = require("core.EntityMaster")

-- lib
GameMaster.virtual = require("lib.virtual")
GameMaster.anim8 = require("lib.anim8")

-- sys
GameMaster.controlSys = require("sys.controlSys")
GameMaster.renderSys = require("sys.renderSys")

return GameMaster
