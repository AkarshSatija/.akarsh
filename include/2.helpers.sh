############## Project open tabs ##########
newTab () {
	osascript \
    -e 'tell application "iTerm" to activate' \
    -e 'tell application "System Events" to tell process "iTerm" to keystroke "d" using {shift down, command down}' \
    -e "tell application \"System Events\" to tell process \"iTerm\" to keystroke \"$@\"" \
    -e 'tell application "System Events" to tell process "iTerm" to key code 52'
}