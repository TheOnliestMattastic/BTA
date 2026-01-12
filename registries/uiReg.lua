-- ============================================================================
-- assets/config/uiReg.lua
-- ----------------------------------------------------------------------------

local uiDir = "assets/sprites/ui/"
-- stylua: ignore
return {
  -- Bars: UI bar elements
	bar_1              = { img = uiDir .. "bar_1.png",                        frameW = 96,  frameH = 16 },
	bar_2              = { img = uiDir .. "bar_2.png",                        frameW = 77,  frameH = 13 },
	bar_3              = { img = uiDir .. "bar_3.png",                        frameW = 77,  frameH = 16 },
	filler             = { img = uiDir .. "filler.png",                       frameW = 16,  frameH = 16,  frames = { "1-2", 1 },},
	heart              = { img = uiDir .. "heart_16x16.png",                  frameW = 16,  frameH = 16,  frames = { "1-5", 1 },},
	receptacle         = { img = uiDir .. "receptacle_38x66.png",             frameW = 38,  frameH = 66 },
	actionPointRect    = { img = uiDir .. "actionPointRectangle_22x10.png",   frameW = 22,  frameH = 10 },
	actionPointRound   = { img = uiDir .. "actionPointRound_11x10.png",       frameW = 11,  frameH = 10 },

	-- Patterns: Background patterns
	patternBGbottom    = { img = uiDir .. "BottomPatternBG_128x112.png",      frameW = 128, frameH = 112, frames = { "1-3", 1 },},
	patternBGmid       = { img = uiDir .. "PatternMiddleBottomBG_199x48.png", frameW = 199, frameH = 48 },
	patternBGtop       = { img = uiDir .. "TopPatternBG_116x67.png",          frameW = 112, frameH = 67,  frames = { "1-2", 1 },},
	patternPanelBottom = { img = uiDir .. "BottomPatternPanel_119x17.png",    frameW = 119, frameH = 17 },
	patternPanelMid    = { img = uiDir .. "TopPatternPanel_02_33x15.png",     frameW = 83,  frameH = 8 },
	patternPanelTop    = { img = uiDir .. "TopPatternPanel_01_33x15.png",     frameW = 67,  frameH = 15 },

	-- Buttons: Interactive buttons
	button_1           = { img = uiDir .. "buttonDragon_1.png",               frameW = 100, frameH = 35,  frames = { "1-4", 1 },},
	button_2           = { img = uiDir .. "buttonDragon_2.png",               frameW = 104, frameH = 35,  frames = { "1-4", 1 },},
	buttonClose        = { img = uiDir .. "buttonClose.png",                  frameW = 24,  frameH = 24,  frames = { "1-4", 1 },},
	buttonExit         = { img = uiDir .. "buttonExit.png",                   frameW = 24,  frameH = 24,  frames = { "1-4", 1 },},
	buttonHelp         = { img = uiDir .. "buttonHelp.png",                   frameW = 24,  frameH = 24,  frames = { "1-4", 1 },},
	buttonLess         = { img = uiDir .. "buttonLess.png",                   frameW = 16,  frameH = 16,  frames = { "1-4", 1 },},
	buttonMore         = { img = uiDir .. "buttonMore.png",                   frameW = 16,  frameH = 16,  frames = { "1-4", 1 },},
	buttonOptions      = { img = uiDir .. "buttonOptions.png",                frameW = 24,  frameH = 24,  frames = { "1-4", 1 },},

	-- Cursors: Mouse and selection cursors
	cursorH_1          = { img = uiDir .. "cursorHorizontal_1.png",           frameW = 26,  frameH = 26,  frames = { "1-5", 1 },},
	cursorH_2          = { img = uiDir .. "cursorHorizontal_2.png",           frameW = 26,  frameH = 26,  frames = { "1-5", 1 },},
	cursorV_1          = { img = uiDir .. "cursorVertical_1.png",             frameW = 26,  frameH = 26,  frames = { "1-5", 1 },},
	cursorV_2          = { img = uiDir .. "cursorVertical_2.png",             frameW = 26,  frameH = 26,  frames = { "1-5", 1 },},
	cursorM_1          = { img = uiDir .. "cursorMouse_1.png",                frameW = 18,  frameH = 17,  frames = { "1-4", 1 },},
	cursorM_2          = { img = uiDir .. "cursorMouse_2.png",                frameW = 23,  frameH = 23,  frames = { "1-4", 1 },},
	cursorTile         = { img = uiDir .. "HighlightSlot_26x26.png",          frameW = 26,  frameH = 26 },

	-- Frames: UI frames
	frameEmpty         = { img = uiDir .. "frameEmpty.png",                   frameW = 32,  frameH = 32 },
	frameFilled        = { img = uiDir .. "frameFilled.png",                  frameW = 32,  frameH = 32,  frames = { "1-4", 1 },},

	-- Headers: Header elements
	header_1           = { img = uiDir .. "header_1.png",                     frameW = 96,  frameH = 32 },
	header_2           = { img = uiDir .. "header_2.png",                     frameW = 96,  frameH = 32 },

	-- Panels: Panel backgrounds
	panel_1            = { img = uiDir .. "panel_1.png",                      frameW = 144, frameH = 144 },
	panel_2            = { img = uiDir .. "panel_2.png",                      frameW = 144, frameH = 144 },
	panel_3            = { img = uiDir .. "panel_3.png",                      frameW = 24,  frameH = 24,  frames = { "1-3", "1-3" },},
	panel_4            = { img = uiDir .. "panel_4.png",                      frameW = 48,  frameH = 48 },
	panel_5            = { img = uiDir .. "panel_5.png",                      frameW = 48,  frameH = 48 },
	panel_6            = { img = uiDir .. "panel_6.png",                      frameW = 48,  frameH = 48 },

	-- Arrows: Directional arrows
	arrowDown          = { img = uiDir .. "arrowDown.png",                    frameW = 16,  frameH = 16,  frames = { "1-4", 1 },},
	arrowLeft          = { img = uiDir .. "arrowLeft.png",                    frameW = 16,  frameH = 16,  frames = { "1-4", 1 },},
	arrowRight         = { img = uiDir .. "arrowRight.png",                   frameW = 16,  frameH = 16,  frames = { "1-4", 1 },},
	arrowUp            = { img = uiDir .. "arrowUp.png",                      frameW = 16,  frameH = 16,  frames = { "1-4", 1 } },

	-- Tabs: Tab elements
	tab_1              = { img = uiDir .. "tab_1.png",                        frameW = 39,  frameH = 22,  frames = { "1-4", 1 },},
	tab_2              = { img = uiDir .. "tab_2.png",                        frameW = 34,  frameH = 39,  frames = { "1-4", 1 },},
	tab_3              = { img = uiDir .. "tab_3.png",                        frameW = 42,  frameH = 22,  frames = { "1-4", 1 },},
	tab_4              = { img = uiDir .. "tab_4.png",                        frameW = 42,  frameH = 22,  frames = { "1-4", 1 },},
	tab_5              = { img = uiDir .. "tab_5.png",                        frameW = 42,  frameH = 22,  frames = { "1-4", 1 },},

	-- Fonts: Text rendering
	fontXL             = { img = "assets/fonts/alagard.ttf",                  size = 96 },
	fontL              = { img = "assets/fonts/alagard.ttf",                  size = 48 },
	fontM              = { img = "assets/fonts/alagard.ttf",                  size = 36 },
	fontS              = { img = "assets/fonts/alagard.ttf",                  size = 24 },
	fontXS             = { img = "assets/fonts/alagard.ttf",                  size = 16 },
	fontXXS            = { img = "assets/fonts/alagard.ttf",                  size = 12 },

	fontAltXL          = { img = "assets/fonts/NormalFont.ttf",               size = 96 },
	fontAltL           = { img = "assets/fonts/NormalFont.ttf",               size = 48 },
	fontAltM           = { img = "assets/fonts/NormalFont.ttf",               size = 36 },
	fontAltS           = { img = "assets/fonts/NormalFont.ttf",               size = 24 },
	fontAltXS          = { img = "assets/fonts/NormalFont.ttf",               size = 16 },
	fontAltXXS         = { img = "assets/fonts/NormalFont.ttf",               size = 12 },
}
