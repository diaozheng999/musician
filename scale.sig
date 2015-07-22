signature SCALE =
sig

  type 'a task
  type 'a seq

  type note
  type scale

  exception Empty
  exception Tonic

  val construct : note seq -> scale task

  val major : note -> scale task

  val minor : note -> scale task

  val chromatic : note -> scale task

  val key : scale -> (Note.notation * Note.accidental) task

  val tonic : scale -> int task

  val transpose : scale * int -> scale task

  val toString : scale -> string task

end
