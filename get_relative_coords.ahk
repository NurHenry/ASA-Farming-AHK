#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

F1::
    CoordMode, Mouse, Screen
    MouseGetPos, xPos, yPos
    relativeX := xPos / A_ScreenWidth
    relativeY := yPos / A_ScreenHeight
    clipboard := "relative Position (" . relativeX . ", " . relativeY . ")."
return
