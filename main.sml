structure Main =
struct

open Athena.Core.TopLevel
open Athena.Core.Task

fun main args = async print "Hello world!"

val _ = Athena.Program.Bootstrapper.exec main

end
