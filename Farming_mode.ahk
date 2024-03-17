#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

autoclicking := false
spacebarspamming := false
rightclickspamming := false
autofeeding := false

Gui +LastFound +AlwaysOnTop +ToolWindow 
Gui, Color, 808080 
Gui, Add, Text, x+10 y+10 w200 h60 vStatusText cWhite, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
Gui, Add, Text, x+10 y+70 w200 h60 cWhite, Press F9 to toggle Left Click Farming`nPress F10 to toggle Spacebar Farming`nPress F8 to toggle Right Click Spamming`nPress F7 to toggle Auto Feeding
Gui, Add, Button, x+10 y+130 w100 h30 gExitScript, Exit
Gui, Show, x0 y0
WinSet, Transparent, 150, A 

F7::
    autofeeding := !autofeeding
    if (autofeeding) {
        BlockInput, MouseMove
        SetTimer, AutoFeed, 100
        SoundBeep, 400, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: On
    }
    else {
        BlockInput, MouseMoveOff
        SetTimer, AutoFeed, Off
        SoundBeep, 800, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
    }
return

F8::
    rightclickspamming := !rightclickspamming
    if (rightclickspamming) {
        SetTimer, RightClickSpam, 100
        SoundBeep, 300, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: On`nAuto Feeding: Off
    }
    else {
        SetTimer, RightClickSpam, Off
        SoundBeep, 1000, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
    }
return

F9::
    autoclicking := !autoclicking
    if (autoclicking) {
        SetTimer, AutoClick, 150
        SoundBeep, 700, 300
        GuiControl,, StatusText, Left Click Farming: On`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
    }
    else {
        SetTimer, AutoClick, Off
        SoundBeep, 1200, 300
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
    }
return

F10::
    spacebarspamming := !spacebarspamming
    if (spacebarspamming) {
        SetTimer, SpacebarSpam, 100
        SoundBeep, 500, 500
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: On`nRight Click Spamming: Off`nAuto Feeding: Off
    }
    else {
        SetTimer, SpacebarSpam, Off
        SoundBeep, 1000, 500
        GuiControl,, StatusText, Left Click Farming: Off`nSpacebar Farming: Off`nRight Click Spamming: Off`nAuto Feeding: Off
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

AutoFeed:
    if (autofeeding) {
        Random, rand, 10, 100
        SendInput {T}
        Sleep, %rand%
    }
return

ExitScript:
GuiClose:
    ExitApp
return
