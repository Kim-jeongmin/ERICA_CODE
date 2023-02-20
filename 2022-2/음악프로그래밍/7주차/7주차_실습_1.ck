Wurley righthand => dac;
Wurley lefthand => dac;

0.5::second => dur beat;
beat => dur n1; // 1/6
beat * 2 => dur n2; // 2/6
beat * 3 => dur n3; // 3/6
beat * 5 => dur n5; // 5/6

[ // halfmoon harmony
48,52,55, 48,52,55, 48,52,55, 48,52,55,
48,53,57, 47,50,53, 48,52,55, 48,52,55,
48,52,55, 48,52,55, 48,52,55, 48,52,55,
48,53,57, 47,50,53, 48,52,55, 48,52,55,
48,52,55, 48,52,55, 45,48,52, 47,50,53,
48,52,55, 48,52,55, 47,50,53, 47,50,53,
48,52,55, 48,52,55, 48,52,55, 48,53,57, 
48,52,55, 47,50,53, 48,52,55, 48,52,55
] @=> int harmony[];

[ // halfmoon harmony time
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1
] @=> dur harmony_len[];

[ // halfmoon melody
67,69,67,64,  67,64,60,55,  57,60,62,67,     64,-1,
67,69,67,64,  67,64,60,55,  57,60,55,62,     60,-1,
64,64,64,62,  64,   69,67,  64,62,64,69,     67,-1,
72,   67,67,  64,64,69,69,  67,64,60,55,62,  60,-1
] @=> int melody[];

[ // halfmoon melody time
n2,n1,n2,n1,  n1,n1,n1,n3,  n2,n1,n2,n1,     n5,n1,
n2,n1,n2,n1,  n1,n1,n1,n3,  n2,n1,n2,n1,     n5,n1,
n2,n1,n2,n1,  n2,   n1,n3,  n2,n1,n2,n1,     n5,n1,
n3,   n2,n1,  n2,n1,n2,n1,  n1,n1,n1,n2,n1,  n5,n1
] @=> dur melody_len[];

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

spork ~ play(righthand, melody, melody_len);
spork ~ play(lefthand, harmony, harmony_len);

98*beat => now;