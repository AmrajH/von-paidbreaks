#SingleInstance force
originalClip := clipboard
RunWait %A_AhkPath% "format.ahk"
format := clipboard
daLIST := []
log := ""
Loop, parse, format, `, ; Turns formatted text into an array
{
  toBeSafe := A_LoopField
  curEmp := A_Index

  Loop, parse, toBeSafe, |
  {
    daLIST[curEmp, A_Index] := A_LoopField
  }
}

checkBreaks() ; function to check if breaks are left
{
  colour := 0x000000
  While colour != "0xE1E1E1"
  {
    PixelGetColor, colour, 739, 335
    Sleep, 100
    if(colour == "0xE1E1E1")
    {
      return
    }
    MsgBox, Please add more breaks
  }
  return
}


checkName(fname, lname) ;Checks name to see if it matches the next one on the list
{
  ClipWait, 5
  ;*********** formats name from clipboard
  name := StrSplit(clipboard, ",", A_Space)
  name[1] := StrSplit(name[1], A_Space, A_Space)
  name[1] := name[1, 1]
  name[2] := StrSplit(name[2], A_Space, A_Space)
  name[2] := name[2, 1]
  ;***********
  global log := log name[1] name[2]" checkName `n"
  if((name[1] == fname) && (name[2] == lname))
  {
    checkBreaks()
    MouseMove, 739, 335
    Sleep, 100
    Click
    if(daLIST[1,3] > 1){
      MouseMove, 729, 335
      Sleep, 100
      checkBreaks()
      MouseMove, 739, 335
      Sleep, 100
      Click
    }
    Sleep, 100
    return 1
  }
  return 0
}
/*




queue.Insert(42)  Enqueue
queue.Remove(1)   Dequeue
The plan:

*/

SetDefaultMouseSpeed, 0
x::
  while daLIST[1,1] != daLIST[1,2]
  {
    clipboard := ""
    PixelGetColor, col, 745, 422
    if(col == "0xE1E1E1"){
      log := log daLIST[1,1] daLIST[1,2] daLIST[1,3]" cur list before `n"
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
      if(checkName(daLIST[1,1], daLIST[1,2]))
      {
        daLIST.Remove(1)
        log := log " Dequeued `n"
      }
      log := log daLIST[1,1] daLIST[1,2] daLIST[1,3]" cur list after `n"
    }
    Send, ^{F8}
    Sleep, 150
  }
  clipboard := originalClip
  MsgBox % log
  return

z::
  MsgBox % log
  ExitApp
