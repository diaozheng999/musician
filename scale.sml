structure Scale :> SCALE
                   where type note = Note.note
                   where type 'a task = 'a Athena.Core.Task.task
                   where type 'a seq = 'a Athena.Data.Seq.seq
  =
  struct


  type 'a task = 'a Athena.Core.Task.task
  type 'a seq = 'a Athena.Data.Seq.seq

  open Athena
  open Athena.Core.Task
  open Athena.Data
  infix <| <|| await
  infixr |> ||>

  type note = Note.note
  type scale = Note.note * note seq

  exception Empty
  exception Tonic

  val key = car

  fun tonic (_,v) = Seq.length v

  fun construct nseq =
      select {cond = Seq.null nseq,
	      true = raise Empty,
	      false = 
	      (Seq.nth 0 
		       |> fst (Note.semitones, Note.midC)
		       |> 
		       (fn st =>
			   join ((Seq.nth 0 |> Note.normalise) nseq,
				 Seq.map (fst (Note.transpose, ~st))
					 nseq))) nseq}
				 	      

  fun key (x,_) = Note.notation x

  fun transpose ((k,l),semitones) =
      join ((fst (Note.transpose, semitones) 
		  |> Note.normalise) k,
	    yield l)

  val toScale = Seq.map Note.fromInt <| Seq.fromList

  fun major note = join (Note.normalise note, toScale [0,2,4,5,7,9,11])

  fun minor note = join (Note.normalise note, toScale [0,2,3,5,7,8,10])

  fun chromatic note =
      join (Note.normalise note,
	    toScale [0,1,2,3,4,5,6,7,8,9,10,11])
  

  

  fun toString (k,s) =
      Note.semitones 
	  (k, Note.midC) await
	  (fn sem =>
	      Seq.mapreduce1
		  (fst (Note.transpose, sem) |> Note.toNotString)
		  (fn (a,"") => yield a
		  | (a,b) => yield (a^"-"^b))
		  s)
		      


  end
