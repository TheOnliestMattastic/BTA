#!/bin/bash

# Define rename pairs (old_name -> new_name)
declare -a renames=(
  "bar_1.png:bar1.png"
  "bar_2.png:bar2.png"
  "bar_3.png:bar3.png"
  "heart_16x16.png:heart16x16.png"
  "receptacle_38x66.png:receptacle38x66.png"
  "actionPointRectangle_22x10.png:actionpointrectangle22x10.png"
  "actionPointRound_11x10.png:actionpointround11x10.png"
  "BottomPatternBG_128x112.png:bottompatternbg128x112.png"
  "PatternMiddleBottomBG_199x48.png:patternmiddlebottombg199x48.png"
  "TopPatternBG_116x67.png:toppatternbg116x67.png"
  "BottomPatternPanel_119x17.png:bottompattermpanel119x17.png"
  "TopPatternPanel_02_33x15.png:toppattermpanel0233x15.png"
  "TopPatternPanel_01_33x15.png:toppattermpanel0133x15.png"
  "buttonDragon_1.png:buttondragon1.png"
  "buttonDragon_2.png:buttondragon2.png"
  "buttonClose.png:buttonclose.png"
  "buttonExit.png:buttonexit.png"
  "buttonHelp.png:buttonhelp.png"
  "buttonLess.png:buttonless.png"
  "buttonMore.png:buttonmore.png"
  "buttonOptions.png:buttonoptions.png"
  "cursorHorizontal_1.png:cursorhorizontal1.png"
  "cursorHorizontal_2.png:cursorhorizontal2.png"
  "cursorVertical_1.png:cursorvertical1.png"
  "cursorVertical_2.png:cursorvertical2.png"
  "cursorMouse_1.png:cursormouse1.png"
  "cursorMouse_2.png:cursormouse2.png"
  "HighlightSlot_26x26.png:highlightslot26x26.png"
  "frameEmpty.png:frameempty.png"
  "frameFilled.png:framefilled.png"
  "header_1.png:header1.png"
  "header_2.png:header2.png"
  "panel_1.png:panel1.png"
  "panel_2.png:panel2.png"
  "panel_3.png:panel3.png"
  "panel_4.png:panel4.png"
  "panel_5.png:panel5.png"
  "panel_6.png:panel6.png"
  "arrowDown.png:arrowdown.png"
  "arrowLeft.png:arrowleft.png"
  "arrowRight.png:arrowright.png"
  "arrowUp.png:arrowup.png"
  "tab_1.png:tab1.png"
  "tab_2.png:tab2.png"
  "tab_3.png:tab3.png"
  "tab_4.png:tab4.png"
  "tab_5.png:tab5.png"
)

for pair in "${renames[@]}"; do
  IFS=':' read -r old new <<< "$pair"
  if [ -f "$old" ]; then
    mv "$old" "$new"
    echo "Renamed: $old -> $new"
  else
    echo "Not found: $old"
  fi
done

echo "Done!"
