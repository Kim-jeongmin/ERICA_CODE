Rhodey piano[2];
piano[0] => dac;
piano[1] => dac;

// tempo
0.4::second => dur beat;
beat => dur qn; // quarter note (1/4)
beat / 2 => dur en; // eighth note (1/8)
beat * 2 => dur hn; // half note (1/2)

[ // score
60,         63,         67,         68,
59,         -1,   67,         66,         65,
      64,         63,         62,   61,   60,
59,   55,   62,   65,   63,         62,
60,         63,         67,65,67,72,67,63,62,63,
65,67,69,71,72,63,65,67,68,62,63,65,67,65,63,62,
63,65,67,68,70,68,67,65,67,68,70,72,73,70,68,67,
69,71,72,74,75,72,71,69,71,72,74,75,77,74,67,74,
72,74,75,77,75,74,72,71,72,   67,   63,   60
] @=> int notes[];


[ // time
hn,         hn,         hn,         hn,    
hn,         qn,   hn,         hn,         hn,     
      hn,         hn,         qn,   qn,   qn,
qn,   qn,   qn,   qn,   hn,         hn,   
hn,         hn,         en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,      
en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,en,      
en,en,en,en,en,en,en,en,qn,   qn,   qn,   qn
] @=> dur durs[];


fun void play(StkInstrument instrument, int notes[], dur durs[]) {
    for (0 => int i; i < notes.size(); i++) {
        if (notes[i] != -1) {
            Std.mtof(notes[i]) => instrument.freq;
            1 => instrument.noteOn;
        }
        durs[i] => now;
        1 => instrument.noteOff;
    }
}

fun void retrograde(StkInstrument instrument, int notes[], dur durs[]) {
    for (notes.size()-1 => int i; i >= 0; i--) {
        if (notes[i] != -1) {
            Std.mtof(notes[i]) => instrument.freq;
            1 => instrument.noteOn;
        }
        durs[i] => now;
        1 => instrument.noteOff;
    }
}

// 4 * 18
spork ~ play(piano[1], notes, durs);
spork ~ retrograde(piano[0], notes, durs);
72*beat => now;

