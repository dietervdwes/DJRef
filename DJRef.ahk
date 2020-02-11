;Saving References from TXT list to my Google Library.
;Written by Dieter van der Westhuizen 11-02-2020
;dietervdwes@gmail.com
;dieter.vdwesthuizen@nhls.ac.za

#SingleInstance, force
;#NoTrayIcon
#NoEnv
#Persistent
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 150
SendMode, Input
SetTitleMatchMode, 2
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
SetWinDelay, 500



;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Add Buttons ;;;;;;;;;;;;;;;;;;
Gui, Add, button, x2 y2 w75 h40 ,Go
Gui, add, button,x2 y42 w75 h40  ,BibTex
;Gui, Add, button, x2 y42 w28 h20  ,EPR
;Gui, Add, button, x2 y64 w33 h20  ,FPSA
;Gui, Add, button, x2 y86 w45 h20  ,Verified
;Gui, Add, button, x2 y108 w57 h20  ,KeepOpen
;Gui, Add, button, w57 , VolVeri
;Gui, Add, button, x2 y130 w45 h20  ,More
Gui, Add, button, x2 y152 w32 h20 ,Close
Gui, Add, button, x45 y152 w20 h20 ,_i
;Gui, Add, Button, x6 y17 w100 h30 , Ok
;Gui, Add, Button, x116 y17 w100 h30 , Cancel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Set Window Options   ;;;;;;;;;;;;;;
;Gui, +AlwaysOnTop
Gui, -sysmenu +AlwaysOnTop
Gui, Show, , Ref. DJ
WinGetPos,,,,TrayHeight,ahk_class Shell_TrayWnd,,,
height := A_ScreenHeight-270
width := A_ScreenWidth-85
Gui, Margin, 0, 0
;Gui, Add, Picture, x0 y0 w411 h485, picture.png
;Gui -Caption -Border
Gui, Show, x%width% y%height% w80

return

;;;;;;;;   This is to read the CSV called aa.csv, parse the data and send to TrakCare window, Results Entry.    

ButtonGo:
sleep, 500
IfWinNotExist, ahk_exe chrome.exe
        {
            MsgBox, Please open the Result Entry Window
            Return
        }
WinActivate, ahk_exe chrome.exe
;^!U::
FileName := Iohexol-ref-1.csv
Loop, read, Iohexol-ref-1.csv
{
    LineNumber := A_Index
    Loop, parse, LineNumber, CSV
    {
        FileReadLine, ReferenceVar, Iohexol-ref-1.csv, LineNumber
        
        WinActivate, ahk_exe chrome.exe
        IfWinNotActive, ahk_exe chrome.exe
        {
            MsgBox, Please open Google Scholar in Chrome
            Return
        }
        
        send, %ReferenceVar%
        sleep, 300
        send, {Enter}
        sleep, 1000
        ; Loop, 20
        ;{
        ;    send, {Tab}
        ;    sleep, 300
        ;}
        ;send, {Enter}
        MouseClick, Left, 260, 425
        sleep, 100
        MouseClick, Left, 260, 402
        sleep, 100
        MouseClick, Left, 260, 375
        sleep, 1000
        MouseClick, Left, 342, 144
        sleep, 500
        send, {CtrlDown}a{CtrlUp}
        sleep, 200
    }
}
return

ButtonBibTex:
sleep, 500
IfWinNotExist, ahk_exe chrome.exe
        {
            MsgBox, Please open your library in Google Scholar in Chrome
            Return
        }
WinActivate, ahk_exe chrome.exe
        IfWinNotActive, ahk_exe chrome.exe
        {
            MsgBox, Please open your library in Google Scholar in Chrome
            Return
        }

Loop, 17
{
        MouseClick, Left, 260, 197
        sleep, 500
        MouseClick, Left, 397, 195
        sleep, 200
        send, {Down}
        send, {Enter}
        sleep, 2500      
        send, {CtrlDown}a{CtrlUp}
        sleep, 200
        send, {CtrlDown}c{CtrlUp}
        sleep, 1000
        Bibtex_Info := Clipboard
        FileAppend, %Bibtex_Info%, Citations.txt
        FileAppend, `n`n, Citations.txt
        MouseClick, Left, 30, 60
        sleep, 1000
        send, {PgDn}{PgDn}{PgDn}{PgDn}
        sleep, 300
        MouseClick, Left, 726, 729
        sleep, 2000
}
return

Escape::Reload
;ExitApp
Return

^!r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.

ButtonClose:
ExitApp

Button_i:
Run, http://github.com/dietervdwes/
