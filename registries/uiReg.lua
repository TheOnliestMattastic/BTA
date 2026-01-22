-- =============================================================================
-- registries/uiReg.lua
-- -----------------------------------------------------------------------------
-- WHAT: Registry of all UI sprites, buttons, patterns, and fonts
-- WHY: Centralized definition of UI assets for easy reference and modification
-- HOW: Returns a table mapping keys to sprite sheet metadata (image path, dimensions)
-- NOTE: stylua: ignore applied to preserve formatting; frame dimensions in pixels
-- -----------------------------------------------------------------------------

local uiDir = "assets/sprites/ui/"
-- stylua: ignore
return {
	-- Bars: UI bar elements
	bar1               = { img = uiDir .. "bar1.png", frameW                        = 96, frameH  = 16 },
	bar2               = { img = uiDir .. "bar2.png", frameW                        = 77, frameH  = 13 },
	bar3               = { img = uiDir .. "bar3.png", frameW                        = 77, frameH  = 16 },
	filler             = { img = uiDir .. "filler.png", frameW                      = 16, frameH  = 16, frames  = { "1-2", 1 },},
	heart              = { img = uiDir .. "heart16x16.png", frameW                  = 16, frameH  = 16, frames  = { "1-5", 1 },},
	receptacle         = { img = uiDir .. "receptacle38x66.png", frameW             = 38, frameH  = 66 },
	actionPointRect    = { img = uiDir .. "actionpointrectangle22x10.png", frameW   = 22, frameH  = 10 },
	actionPointRound   = { img = uiDir .. "actionpointround11x10.png", frameW       = 11, frameH  = 10 },

	-- Patterns: Background patterns
	patternBGbottom    = { img = uiDir .. "bottompatternbg128x112.png", frameW      = 128, frameH = 112, frames = { "1-3", 1 },},
	patternBGmid       = { img = uiDir .. "patternmiddlebottombg199x48.png", frameW = 199, frameH = 48 },
	patternBGtop       = { img = uiDir .. "toppatternbg116x67.png", frameW          = 112, frameH = 67, frames  = { "1-2", 1 },},
	patternPanelBottom = { img = uiDir .. "bottompattermpanel119x17.png", frameW    = 119, frameH = 17 },
	patternPanelMid    = { img = uiDir .. "toppattermpanel0233x15.png", frameW      = 83, frameH  = 8 },
	patternPanelTop    = { img = uiDir .. "toppattermpanel0133x15.png", frameW      = 67, frameH  = 15 },

	-- Buttons: Interactive buttons
	button1            = { img = uiDir .. "buttondragon1.png", frameW               = 100, frameH = 35, frames  = { "1-4", 1 },},
	button2            = { img = uiDir .. "buttondragon2.png", frameW               = 104, frameH = 35, frames  = { "1-4", 1 },},
	buttonClose        = { img = uiDir .. "buttonclose.png", frameW                 = 24, frameH  = 24, frames  = { "1-4", 1 },},
	buttonExit         = { img = uiDir .. "buttonexit.png", frameW                  = 24, frameH  = 24, frames  = { "1-4", 1 },},
	buttonHelp         = { img = uiDir .. "buttonhelp.png", frameW                  = 24, frameH  = 24, frames  = { "1-4", 1 },},
	buttonLess         = { img = uiDir .. "buttonless.png", frameW                  = 16, frameH  = 16, frames  = { "1-4", 1 },},
	buttonMore         = { img = uiDir .. "buttonmore.png", frameW                  = 16, frameH  = 16, frames  = { "1-4", 1 },},
	buttonOptions      = { img = uiDir .. "buttonoptions.png", frameW               = 24, frameH  = 24, frames  = { "1-4", 1 },},

	-- Cursors: Mouse and selection cursors
	cursorH1           = { img = uiDir .. "cursorhorizontal1.png", frameW           = 26, frameH  = 26, frames  = { "1-5", 1 },},
	cursorH2           = { img = uiDir .. "cursorhorizontal2.png", frameW           = 26, frameH  = 26, frames  = { "1-5", 1 },},
	cursorV1           = { img = uiDir .. "cursorvertical1.png", frameW             = 26, frameH  = 26, frames  = { "1-5", 1 },},
	cursorV2           = { img = uiDir .. "cursorvertical2.png", frameW             = 26, frameH  = 26, frames  = { "1-5", 1 },},
	cursorM1           = { img = uiDir .. "cursormouse1.png", frameW                = 18, frameH  = 17, frames  = { "1-4", 1 },},
	cursorM2           = { img = uiDir .. "cursormouse2.png", frameW                = 23, frameH  = 23, frames  = { "1-4", 1 },},
	cursorTile         = { img = uiDir .. "highlightslot26x26.png", frameW          = 26, frameH  = 26 },

	-- Frames: UI frames
	frameEmpty         = { img = uiDir .. "frameempty.png", frameW                  = 32, frameH  = 32 },
	frameFilled        = { img = uiDir .. "framefilled.png", frameW                 = 32, frameH  = 32, frames  = { "1-4", 1 },},

	-- Headers: Header elements
	header1            = { img = uiDir .. "header1.png", frameW                     = 96, frameH  = 32 },
	header2            = { img = uiDir .. "header2.png", frameW                     = 96, frameH  = 32 },

	-- Panels: Panel backgrounds
	panel1             = { img = uiDir .. "panel1.png", frameW                      = 144, frameH = 144 },
	panel2             = { img = uiDir .. "panel2.png", frameW                      = 144, frameH = 144 },
	panel3             = { img = uiDir .. "panel3.png", frameW                      = 24, frameH  = 24, frames  = { "1-3", "1-3" },},
	panel4             = { img = uiDir .. "panel4.png", frameW                      = 48, frameH  = 48 },
	panel5             = { img = uiDir .. "panel5.png", frameW                      = 48, frameH  = 48 },
	panel6             = { img = uiDir .. "panel6.png", frameW                      = 48, frameH  = 48 },

	-- Arrows: Directional arrows
	arrowDown          = { img = uiDir .. "arrowdown.png", frameW                   = 16, frameH  = 16, frames  = { "1-4", 1 },},
	arrowLeft          = { img = uiDir .. "arrowleft.png", frameW                   = 16, frameH  = 16, frames  = { "1-4", 1 },},
	arrowRight         = { img = uiDir .. "arrowright.png", frameW                  = 16, frameH  = 16, frames  = { "1-4", 1 },},
	arrowUp            = { img = uiDir .. "arrowup.png", frameW                     = 16, frameH  = 16, frames  = { "1-4", 1 } },

	-- Tabs: Tab elements
	tab1               = { img = uiDir .. "tab1.png", frameW                        = 39, frameH  = 22, frames  = { "1-4", 1 },},
	tab2               = { img = uiDir .. "tab2.png", frameW                        = 34, frameH  = 39, frames  = { "1-4", 1 },},
	tab3               = { img = uiDir .. "tab3.png", frameW                        = 42, frameH  = 22, frames  = { "1-4", 1 },},
	tab4               = { img = uiDir .. "tab4.png", frameW                        = 42, frameH  = 22, frames  = { "1-4", 1 },},
	tab5               = { img = uiDir .. "tab5.png", frameW                        = 42, frameH  = 22, frames  = { "1-4", 1 },},

	-- Fonts: Text rendering
	fontXL             = { img = "assets/fonts/alagard.ttf", size                   = 96 },
	fontL              = { img = "assets/fonts/alagard.ttf", size                   = 48 },
	fontM              = { img = "assets/fonts/alagard.ttf", size                   = 36 },
	fontS              = { img = "assets/fonts/alagard.ttf", size                   = 24 },
	fontXS             = { img = "assets/fonts/alagard.ttf", size                   = 16 },
	fontXXS            = { img = "assets/fonts/alagard.ttf", size                   = 12 },

	fontAltXL          = { img = "assets/fonts/NormalFont.ttf", size                = 96 },
	fontAltL           = { img = "assets/fonts/NormalFont.ttf", size                = 48 },
	fontAltM           = { img = "assets/fonts/NormalFont.ttf", size                = 36 },
	fontAltS           = { img = "assets/fonts/NormalFont.ttf", size                = 24 },
	fontAltXS          = { img = "assets/fonts/NormalFont.ttf", size                = 16 },
	fontAltXXS         = { img = "assets/fonts/NormalFont.ttf", size                = 12 },
}
