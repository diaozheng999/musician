signature NOTE =
sig
  type 'a task
  type note

  datatype accidental = SHARP | FLAT | NATURAL | DOUBLE_SHARP | DOUBLE_FLAT
  datatype notation = A|B|C|D|E|F|G

  type octave

  val notation : note -> (notation * accidental) task

  val octave : note -> octave task

  val transpose : note * int -> note task

  val semitones : note * note -> int task

  val fromNotation : notation * accidental * octave -> note task

  val midC : note

  val normalise : note -> note task

  val fromInt : int -> note task


  val toNotString : note -> string task
  val toString : note -> string task

end
