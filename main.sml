structure Main =
struct

open Athena.Core.TopLevel
open Athena.Core.Task
infix <| <|| await
infixr |> ||> 

open Note

fun printScale (f,g) = (async print 
			     <| Scale.toString
			     <| f <| fromNotation) g

fun main args =
    async print " C major scale: "
	  ||> printScale(Scale.major, (C, NATURAL, 5))
	  ||> async print "\n G major scale: "
	  ||> printScale(Scale.major, (G, NATURAL, 6))
	  ||> async print "\n A minor scale: "
	  ||> printScale(Scale.minor, (A, NATURAL, 4))
	  ||> async print "\n Bb minor scale: "
	  ||> printScale(Scale.minor, (B, FLAT, 3))
	  ||> async print "\n"

val _ = Athena.Program.Bootstrapper.exec main

end
