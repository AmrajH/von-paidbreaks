#SingleInstance force
;x := clipboard
;RunWait %A_AhkPath% "format.ahk"
;format := clipboard
;MsgBox % clipboard
;clipboard := x
; read name then if no match click next and read name
;find(first, last){
;
;}
;358, 292
;399, 289 0078D7
SetDefaultMouseSpeed, 0
x::
  while True {
    Send, ^{F8}
    Sleep, 150
    PixelGetColor, col, 745, 422
    if(col == "0xE1E1E1"){
      Sleep, 250
      MouseMove, 220, 163
      Sleep, 250
      Click, Right
      Sleep, 200
      MouseMove, 17, 86
      Sleep, 75
      Click
      Sleep, 150
      Click
      ;Break
    }
  }
  return
z::ExitApp
