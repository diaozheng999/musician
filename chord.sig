signature CHORD =
sig
    type 'a task
    type 'a seq
    type note
    type scale
    type chord

    datatype quality = MAJ | MIN | AUG | DIM | HALF_DIM | DOM
    type interval = quality option * int
    datatype augment = SHARP | FLAT

    val compose : Note.note  (* e.g. C *)
		  * quality   (* e.g. Cm *)
		  * interval option  (* e.g. CmM7 *)
		  * augment option  (* e.g. CmM7b5 *)
		  * int option  (* e.g. CmM7b5add11 *)
		  * Note.note option (* e.g. CmM7b5add11/G *)
		  -> chord task

    val toNoteSeq : chord -> note seq task

    val transpose : chord -> chord task

    val voice : chord * instrument -> note seq stream task
    
end
