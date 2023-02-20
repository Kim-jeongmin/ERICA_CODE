// tempo
0.4::second => dur beat;
beat => dur n1;
beat * 2 => dur n2;

[ // score
67,72,67,69,67,65,
64,   76,77,76,74,
72,67,72,71,72,74,
76,   64,62,64,65
] @=> int melody[];

[ // time
n1,n1,n1,n1,n1,n1,
n2,   n1,n1,n1,n1,
n1,n1,n1,n1,n1,n1,
n2,   n1,n1,n1,n1
] @=> dur durs[];

// play
Rhodey hand[2];
hand[0] => dac;
hand[1] => dac;



spork ~ play(hand[0], melody, durs);
6*n1 => now;
spork ~ play(hand[1], melody, durs);
3*6*n1 => now;
spork ~ play(hand[0], melody, durs);
6*n1 => now;
spork ~ play(hand[1], melody, durs);
3*6*n1 => now;
spork ~ play(hand[0], melody, durs, 11);
6*n1 => now;
spork ~ play(hand[1], melody, durs, 6);
6*n1 => now;
spork ~ play(hand[0], [72], [n1*6]);
spork ~ play(hand[1], [64], [n1*6]);

6*n1 => now;


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

fun void play(StkInstrument instrument, int notes[], dur durs[], int n) {
    for (0 => int i; i < n; i++) {
        if (notes[i] != -1) {
            Std.mtof(notes[i]) => instrument.freq;
            1 => instrument.noteOn;
        }
        durs[i] => now;
        1 => instrument.noteOff;
    }
}