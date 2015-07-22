signature NOTE =
sig

  type note
  datatype accidental = SHARP | FLAT | NATURAL | DOUBLE_SHARP | DOUBLE_FLAT
  datatype notation = A|B|C|D|E|F|G

  type octave

  val notation : note -> notation * accidental

  val octave : note -> octave

  val transpose : note * int -> note

  val semitones : note * note -> int

  val fromNotation : notation * accidental * octave -> note

  val midC : note

  val normalise : note -> note

  val fromInt : int -> note


  val toNotString : note -> string
  val toString : note -> string

end
