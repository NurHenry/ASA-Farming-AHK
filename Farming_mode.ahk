#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

autoclicking := false
spacebarspamming := false
rightclickspamming := false

Gui +AlwaysOnTop
Gui, Add, Text, x+10 y+10 w200 h40 vStatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off
Gui, Add, Text, x+10 y+50 w200 h40 cBlack, Press F9 to toggle Left Click Farming`nPress F10 to toggle Spacebar Farming`nPress F8 to toggle Right Click Spamming
Gui, Add, Button, x+10 y+90 w100 h30 gExitScript, Exit
Gui, Show, x0 y0

F8::
    rightclickspamming := !rightclickspamming
    if (rightclickspamming) {
        SetTimer, RightClickSpam, 100
        SoundBeep, 300, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: On
    }
    else {
        SetTimer, RightClickSpam, Off
        SoundBeep, 1000, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off
    }
return

F9::
    autoclicking := !autoclicking
    if (autoclicking) {
        SetTimer, AutoClick, 150
        SoundBeep, 700, 300
        GuiControl,, StatusText, Left Click Farming: On`nSpacebar Farming: Off`nRight Click Spamming: Off
    }
    else {
        SetTimer, AutoClick, Off
        SoundBeep, 1200, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off
    }
return

F10::
    spacebarspamming := !spacebarspamming
    if (spacebarspamming) {
        SetTimer, SpacebarSpam, 100
        SoundBeep, 500, 500
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: On`nRight Click Spamming: Off
    }
    else {
        SetTimer, SpacebarSpam, Off
        SoundBeep, 1000, 500
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off
    }
return

RightClickSpam:
    if (rightclickspamming) {
        Random, rand, 10, 100
        Click right
        Sleep, %rand%
    }
return

AutoClick:
    if (autoclicking) {
        Random, rand, 100, 250
        Click
        Sleep, %rand%
    }
return

SpacebarSpam:
    if (spacebarspamming) {
        Random, rand, 10, 100
        SendInput {Space}
        Sleep, %rand%
    }
return

ExitScript:
GuiClose:
    ExitApp
return