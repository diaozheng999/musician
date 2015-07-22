structure Scale :> SCALE
                   where type note = Note.note
  =
  struct

  open Athena.Core.TopLevel

  type note = Note.note
  type scale = Note.note * note vector

  exception Empty
  exception Tonic

  val key = car

  fun tonic (_,v) = Vector.length v

  fun construct [] = raise Empty
    | construct v =
      let val vec = Vector.fromList v
          val semitones = Note.semitones (Vector.sub(vec,0),Note.midC)
      in (Note.normalise (Vector.sub(vec,0)),
          Vector.map (fn n => Note.transpose (n, ~semitones)) v)
      end

  fun key (x,_) = Note.notation x

  fun transpose ((k,l),semitones) =
      (Note.normalise(Note.transpose(k, semitones)), l)

  fun toScale intl = Vector.map Note.fromInt (Vector.fromList intl)

  fun major note = (Note.normalise note,toScale [0,2,4,5,7,9,11])
  fun minor note = (Note.normalise note,toScale [0,2,3,5,7,8,10])

  fun chromatic note = (Note.normalise note,
                        toScale [0,1,2,3,4,5,6,7,8,9,10,11])

  fun toString (k,s) =
      Vector.foldl (fn (a,"") => a
                     | (a,b) => a^"-"^b)
                   ""
                   (Vector.map (fn n =>
                                   Note.toNotString (
                                   Note.transpose
                                            (n, Note.semitones(k, Note.midC))))
                               s)

  end
