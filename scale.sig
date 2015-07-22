signature SCALE =
sig

  type note
  type scale

  exception Empty
  exception Tonic

  val construct : note list -> scale

  val major : note -> scale

  val minor : note -> scale

  val chromatic : note -> scale

  val key : scale -> Note.notation * Note.accidental

  val tonic : scale -> int

  val transpose : scale * int -> scale

  val toString : scale -> string

end
