#!/usr/bin/env osascript
tell application "System Preferences"
	reveal pane "Network"
	activate
	tell application "System Events"
		tell process "System Preferences"
			tell window "Network"
				select row 4 of table 1 of scroll area 1
				click checkbox 1 of group 1
				delay 0.5
				click checkbox 1 of group 1
			end tell
		end tell
	end tell
	quit
end tell