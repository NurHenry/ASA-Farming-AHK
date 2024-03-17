#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

F1::
    MouseGetPos, xPos, yPos
    relativeX := xPos / A_ScreenWidth
    relativeY := yPos / A_ScreenHeight
    clipboard := "Die relative Position des Mauszeigers ist (" . relativeX . ", " . relativeY . ")."
return


; Suchleiste(0.656250, 0.182407).
; drop all (0.742188, 0.186111).
; confirm drop (0.438021, 0.675926).