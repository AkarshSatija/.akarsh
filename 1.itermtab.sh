############## Project open tabs ##########
function newTab(){
    if [ -z "$NEWTABCOUNT" ]; then
        NEWTABCOUNT=0
    else
        # NEWTABCOUNT=$((NEWTABCOUNT+1))
    fi

    if [ $((NEWTABCOUNT%2)) -eq 0 ]; then
        verticalSplit $@
    else
        horizontalSplit $@
    fi
}

function verticalSplit(){
    echo $NEWTABCOUNT

    osascript \
    -e 'tell application "iTerm" to activate' \
    -e 'tell application "System Events" to tell process "iTerm" to keystroke "d" using {shift down, command down}' \
    -e "tell application \"System Events\" to tell process \"iTerm\" to keystroke \"$@\"" \
    -e 'tell application "System Events" to tell process "iTerm" to key code 52'
}

function horizontalSplit(){
    echo $NEWTABCOUNT

    osascript \
    -e 'tell application "iTerm" to activate' \
    -e 'tell application "System Events" to tell process "iTerm" to keystroke "d" using { command down}' \
    -e "tell application \"System Events\" to tell process \"iTerm\" to keystroke \"$@\"" \
    -e 'tell application "System Events" to tell process "iTerm" to key code 52'
}