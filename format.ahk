; returns name for everyone with more than 4.5 hours worked
;raw text example : lName, fName (0000000) - Subtotal:	11 h 1 m		7 h 27 m	-6 h 8 m
formatted := ""
final := ""
format(raw) ; formats the raw text
{
  workingArr := StrSplit(raw, "(")

  name := workingArr[1]
  name := StrSplit(name, ",", A_Space)
  name[1] := StrSplit(name[1], A_Space, A_Space)
  name[1] := name[1, 1]
  name[2] := StrSplit(name[2], A_Space, A_Space)
  name[2] := name[2, 1]

  actual := StrSplit(workingArr[2], A_Tab, A_Space)
  actual := StrSplit(actual[4], A_Space)
  actual[3] := actual[3]/60
  actual := actual[1] + actual[3]

  if(actual<4.45){
    actual = 0
  } else if(actual<7.45) {
    actual = 1
  } else {
    actual = 2
  }

  return name[1] "|" name[2] "|" actual
}

Loop, parse, clipboard, `n, `r  ; goes through every line in the clipboard
{

    IfInString, A_LoopField, subtotal
    {
      formatted := format(A_LoopField) "," + formatted
    }
}

Loop, parse, formatted, `, ; goes through every comma in the formatted text to filter everyone with at least 1 paid break
{

  IfInString, A_LoopField, 1
 {
    final := A_LoopField "," + final
  } else IfInString, A_LoopField, 2
 {
    final := A_LoopField "," + final
  }
}
final := SubStr(final, 1, StrLen(final)-1)
MsgBox % final
clipboard := final
