// tempo
/*
0.25::second => dur beat;
beat => dur qn; // quarter note (4분음, 1박자)
beat * 4 => dur wn; // whole note (온음, 4박자)

fun void ping() {
    Impulse pin => ResonZ rez => dac;
    700 => rez.freq;
    50 => rez.Q;
    while (true) {
        <<< "ping!", "" >>>;
        100 => pin.next;
        wn => now;
    }
}

fun void pong() {
    Impulse pon => ResonZ rez => dac;
    800 => rez.freq;
    50 => rez.Q;
    while (true) {
        <<< "  pong!", "" >>>;
        100 => pon.next;
        qn => now;
    }
}

spork ~ ping();
spork ~ pong();

while(true){
    wn => now;
}
*/

/*
// tempo
0.25::second => dur beat;
beat => dur qn; // quarter note (1/4)
beat * 2 => dur hn; // half note (2/4)
beat * 4 => dur wn; // whole note (4/4)

fun void kick() {
    SndBuf kick => dac;
    me.dir()+"/audio/kick_01.wav" => kick.read;
    while (true) {
        wn => now;
        0 => kick.pos;
    }
}

fun void snare() {
    SndBuf snare => dac;
    me.dir()+"/audio/snare_01.wav" => snare.read;
    while (true) {
        hn => now;
        0 => snare.pos;
    }
}

fun void hihat() {
    SndBuf hihat => dac;
    me.dir()+"/audio/hihat_01.wav" => hihat.read;
    0.2 => hihat.gain;
    while (true) {
        qn => now;
        0 => hihat.pos;
    }
}

spork ~ kick();
wn * 2 => now;
spork ~ hihat();
wn * 2 => now;
qn => now;
spork ~ snare();
wn * 4 => now;
*/

/*
fun void play(StkInstrument instrument, int notes[], dur durs[]) {
    for (0 => int i; i < notes.size(); i++) {
        Std.mtof(notes[i]) => instrument.freq;
        1 => instrument.noteOn;
        durs[i] => now;
        1 => instrument.noteOff;
    }
}

// tempo
0.5::second => dur beat;
beat => dur n1; //  (1/6)
beat * 2 => dur n2; // (2/6)
beat * 3 => dur n3; // (3/6)

[67,69,    67,64,    67,64,60, 55      ] @=> int melody[];
[n2,n1,    n2,n1,    n1,n1,n1, n3      ] @=> dur melody_len[];
[48,52,55, 48,52,55, 48,52,55, 48,52,55] @=> int harmony[];
[n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1] @=> dur harmony_len[];

Rhodey righthand => dac;
Rhodey lefthand => dac;
spork ~ play(righthand, melody, melody_len);
spork ~ play(lefthand, harmony, harmony_len);

12 * beat => now;
*/

/*
ModalBar bar => dac;

[62, 64, 66, 67, 69, 71, 73, 74] @=> int scale[];

for (0 => int i; i <= 8; i++) {
    i => bar.preset;
    for (0 => int j; j < scale.size(); j++) {
        Std.mtof(scale[j]) => bar.freq;
        1 => bar.noteOn;
        0.4 :: second => now;
    }
}
*/

ModalBar modal => NRev reverb => dac;
.1 => reverb.mix;
7 => modal.preset;
.9 => modal.strikePosition;

// spork detune() as a child shred
// note: must do this before entering into infinite loop below!
spork ~ detune();  

// infinite time loop
while (true) {
    1 => modal.strike;
    250::ms => now;
    .7 => modal.strike;
    250::ms => now;
    .9 => modal.strike;
    250::ms => now;
    repeat (4) {
        .5 => modal.strike;
        62.5::ms => now;
    }
}

// function to vary tuning over time
fun void detune() {
    while (true) {
        // update frequency sinusoidally
        84 + Math.sin(now/second*.25*Math.PI) * 2 => Std.mtof => modal.freq;
        // advance time (controls update rate)
        5::ms => now;
    }
}