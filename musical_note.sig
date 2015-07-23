signature BAR =
sig
    type 'a seq

    datatype staff = BREVE
		   | SEMIBREVE
		   | MINIM
		   | CROCHET
		   | QUAVER
		   | SEMIQUAVER
		   | DEMISEMIQUAVER
		   | HEMIDEMISEMIQUAVER
	           | SEMIHEMIDEMISEMIQUAVER
    datatype dot = DOT | DOUBLE_DOT
    
    type bar = (staff * dot * note seq) seq seq * int * int

    val step : bar -> bar * MIDI.message seq

end
