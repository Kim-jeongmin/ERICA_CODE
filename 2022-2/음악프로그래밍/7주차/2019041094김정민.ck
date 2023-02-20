Rhodey r[4][2];
r[0][0] => dac;
r[0][1] => dac;
r[1][0] => dac;
r[1][1] => dac;
r[2][0] => dac;
r[2][1] => dac;
r[3][0] => dac;
r[3][1] => dac;

Rhodey h[4][2];
h[0][0] => dac;
h[0][1] => dac;
h[1][0] => dac;
h[1][1] => dac;
h[2][0] => dac;
h[2][1] => dac;
h[3][0] => dac;
h[3][1] => dac;
// tempo
0.5::second => dur beat;
beat * 1.5 => dur n3; // 3/8
beat * 0.5 => dur n1; // 1/8
[ // halfmoon harmony
60,64,67, 62,65,69, 60,64,67, 62,65,69,
60,64,67, 62,65,69, 60,64,67, 62,65,69
] @=> int harmony[];

[ // halfmoon harmony time
n1,n1,n1, n1/3,n1/3,n1/3, n1,n1,n1, n1/3,n1/3,n1/3,
n1,n1,n1, n1/3,n1/3,n1/3, n1,n1,n1, n1/3,n1/3,n1/3
] @=> dur harmony_len[];

// the theme for choir 1
[60,62,64,65, 67,65,64,62] @=> int theme1[];
[n3,n1,n3,n1, n3,n1,n3,n1] @=> dur durs1[];
// the inverted theme for choir 2
[67,65,64,62, 60,62,64,65] @=> int theme2[];
[n3,n1,n3,n1, n3,n1,n3,n1] @=> dur durs2[];

fun void play(StkInstrument instrument, int notes[], dur durs[]) {
    for (0 => int i; i < notes.size(); i++) {
        if (notes[i] != -1) {
            Std.mtof(notes[i]) => instrument.freq;
            0.2 => instrument.noteOn;
        }
        durs[i] => now;
        0.2 => instrument.noteOff;
    }
}

fun void play(StkInstrument instrument, int notes[], dur durs[], int n) {
    for (0 => int i; i < n; i++) {
        if (notes[i] != -1) {
            Std.mtof(notes[i]) => instrument.freq;
            0.2 => instrument.noteOn;
        }
        durs[i] => now;
        0.2 => instrument.noteOff;
    }
}



for(0 => int i; i < 2; i++){
    spork ~ play(r[0][0], theme2, durs2);
    spork ~ play(h[0][0], harmony, harmony_len);
    n1 => now;
    spork ~ play(r[0][1], theme1, durs1);
    spork ~ play(h[0][1], harmony, harmony_len);
    n3 => now;

    spork ~ play(r[1][0], theme2, durs2);
    spork ~ play(h[1][0], harmony, harmony_len);
    n1 => now;
    spork ~ play(r[1][1], theme1, durs1);
    spork ~ play(h[1][1], harmony, harmony_len);
    n3 => now;
    spork ~ play(r[2][0], theme2, durs2);
    spork ~ play(h[2][0], harmony, harmony_len);
    n1 => now;
    spork ~ play(r[2][1], theme1, durs1);
    spork ~ play(h[2][1], harmony, harmony_len);
    n3 => now;
    spork ~ play(r[3][0], theme2, durs2);
    spork ~ play(h[3][0], harmony, harmony_len);
    n1 => now;
    spork ~ play(r[3][1], theme1, durs1);
    spork ~ play(h[3][1], harmony, harmony_len);
    n3 => now;
}

spork ~ play(r[0][0], theme2, durs2, 8);
spork ~ play(h[0][0], harmony, harmony_len, 8 * 3);
n1 => now;

spork ~ play(r[0][1], theme1, durs1, 7);
spork ~ play(h[0][1], harmony, harmony_len, 7 * 3);
n3 => now;

spork ~ play(r[1][0], theme2, durs2, 6);
spork ~ play(h[1][0], harmony, harmony_len, 6 * 3);

n1 => now;

spork ~ play(r[1][1], theme1, durs1, 5);
spork ~ play(h[1][1], harmony, harmony_len, 5 * 3);
n3 => now;
spork ~ play(r[2][0], theme2, durs2, 4);
spork ~ play(h[2][0], harmony, harmony_len, 4 * 3);
n1 => now;
spork ~ play(r[2][1], theme1, durs1, 3);
spork ~ play(h[2][1], harmony, harmony_len, 3 * 3);
n3 => now;
spork ~ play(r[3][0], theme2, durs2, 2);
spork ~ play(h[3][0], harmony, harmony_len, 2 * 3);
n1 => now;
spork ~ play(r[3][1], theme1, durs1, 1);
spork ~ play(h[3][1], harmony, harmony_len, 1 * 3);
n3 => now;

spork ~ play(r[0][0], [60], [n1*16]);
spork ~ play(r[0][1], [64], [n1*16]);
spork ~ play(r[1][0], [64], [n1*16]);
spork ~ play(r[1][1], [60], [n1*16]);
spork ~ play(r[2][0], [67], [n1*16]);
spork ~ play(r[2][1], [64], [n1*16]);
spork ~ play(r[3][0], [64], [n1*16]);
spork ~ play(r[3][1], [67], [n1*16]);

n1 * 16 => now;
