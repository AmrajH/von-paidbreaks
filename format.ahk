; returns name for everyone with more than 4.5 hours worked
formatted := ""
;raw text example : [hidden] - Subtotal:	11 h 1 m		4 h 53 m	-6 h 8 m
format(raw) ; formats the raw text
{
  MsgBox, %raw%
  workingArr := StrSplit(raw, "(")
  
  name := workingArr[1]
  name := StrSplit(name, ",", A_Space)
  
  MsgBox % name[1] "|" name[2]

  
  return raw
}

Loop, parse, clipboard, `n, `r  ; goes through every line is the clipboard
{

    IfInString, A_LoopField, subtotal
    {

      formatted := format(A_LoopField) "," + formatted
    }
}

MsgBox, %formatted%
