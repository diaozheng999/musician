structure Note :> NOTE
                      where type octave = int
                                          =
struct

type note = int
datatype accidental = SHARP | FLAT | NATURAL | DOUBLE_SHARP | DOUBLE_FLAT
datatype notation = A|B|C|D|E|F|G

type octave = int

fun notation n =
    case n mod 12 of
      0 => (C, NATURAL)
    | 1 => (C, SHARP)
    | 2 => (D, NATURAL)
    | 3 => (D, SHARP)
    | 4 => (E, NATURAL)
    | 5 => (F, NATURAL)
    | 6 => (F, SHARP)
    | 7 => (G, NATURAL)
    | 8 => (G, SHARP)
    | 9 => (A, NATURAL)
    | 10 => (A, SHARP)
    | 11 => (B, NATURAL)
    | _ => raise Fail "Invalid note."


fun octave n = (n div 12) + 4

fun fromNotation (note,acc,oct) =
    let val delta = case acc of
                      NATURAL => 0
                    | SHARP => 1
                    | FLAT => ~1
                    | DOUBLE_SHARP => 2
                    | DOUBLE_FLAT => ~2
        val octd = (oct - 4) * 12
    in case note of
         C => 0 + delta + octd
       | D => 2 + delta + octd
       | E => 4 + delta + octd
       | F => 5 + delta + octd
       | G => 7 + delta + octd
       | A => 9 + delta + octd
       | B => 11 + delta + octd
    end

fun transpose (note,semitones) = note+semitones

fun semitones (a,b) = a-b

val midC = 0

fun normalise note = note mod 12

fun fromInt i = i

fun toNotString note =
    let val (n,p) = notation note
        val nstr = case n of
                     A => "A"
                   | B => "B"
                   | C => "C"
                   | D => "D"
                   | E => "E"
                   | F => "F"
                   | G => "G"
        val pstr = case p of
                     NATURAL => ""
                   | SHARP => "#"
                   | FLAT => "b"
                   | DOUBLE_SHARP => "##"
                   | DOUBLE_FLAT => "bb"
    in nstr^pstr end

fun toString note = toNotString note ^(Int.toString (octave note))
end
