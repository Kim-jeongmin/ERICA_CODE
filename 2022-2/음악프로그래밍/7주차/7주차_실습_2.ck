Rhodey r1 => dac;
Rhodey r2 => dac;
Rhodey r3 => dac;
Rhodey r4 => dac;

// tempo
0.2::second => dur beat;
beat => dur n1; // 1/6
beat * 2 => dur n2; // 2/6
beat * 3 => dur n3; // 3/6
beat * 6 => dur n6; // 6/6

[ // melody
60,60,             60,62,64,          64,62,64,65, 67,
72,72,72,67,67,67, 64,64,64,60,60,60, 67,65,64,62, 60
] @=> int melody[];

[ // time
n3,n3,             n2,n1,n3,          n2,n1,n2,n1, n6,
n1,n1,n1,n1,n1,n1, n1,n1,n1,n1,n1,n1, n2,n1,n2,n1, n6
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


spork ~ play(r1, melody, durs);
2*n6 => now;
spork ~ play(r2, melody, durs);
2*n6 => now;
spork ~ play(r3, melody, durs);
2*n6 => now;
spork ~ play(r4, melody, durs);
2*n6 => now;
