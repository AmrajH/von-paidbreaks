#SingleInstance force


/*
queue.Insert(42)  Enqueue
MsgBox % queue.Remove(1)   Dequeue
The plan:

  function to check if breaks are left:
    While colour is NOT 0xE1E1E1:
    check colour
      if yes:
        return
      if no:
        MsgBox
    return

  process the formated text:
    Make array seperated by commas ","
    for every element in that array make a new array seperated by "|" (try using a queue)

  Finish checkName function:
    check if name is equal to the first name on the list
    if it isn't:
      return
    if it is:
      add amount of breaks
      queue.Remove(1)   (Dequeue)

*/

originalClip := clipboard
RunWait %A_AhkPath% "format.ahk"
format := clipboard
MsgBox % clipboard

checkName() ;Checks name to see if it matches the next one on the list
{
  ClipWait, 5

}

SetDefaultMouseSpeed, 0
x::
  while True
  {
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
      checkName()
    }
    Send, ^{F8}
    Sleep, 150
  }
  clipboard := originalClip
  return

z::ExitApp
