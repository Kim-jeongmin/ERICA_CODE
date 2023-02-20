// A Love Supreme

SinOsc love => dac;
TriOsc supreme => dac;

// note length
0.5::second => dur beat;
beat * (5.0/6.0) => dur qn; // quarter note sound (1/4)*(5/6)
qn / 2 => dur hqn; // half quarter note sound (1/8)*(5/6)

// volume
0.5 => float on;
0.0 => float off;
off => supreme.gain;

// note
57 => int start_note;
int note;

fun void makeSound(Osc osc, float pit, float vol, dur len, float rest) {
    pit => osc.freq;
    vol => osc.gain;
    <<< "Pitch =", osc.freq(), ", Volume =", osc.gain() >>>;
    len * (1 - rest) => now;
    0 => osc.gain;
    len * rest => now;
}

// play a love supreme
while (true) {
    Math.random2(start_note-12,start_note+12) => note;
    // A3 57

    makeSound(love, Std.mtof(note), on, hqn, 0.2);

    // C4 60

    makeSound(love, Std.mtof(note + 3), on, qn, 0.2);
    
    // A3 57

    makeSound(love, Std.mtof(note), on, hqn, 0.2);

    // D4 62

    makeSound(love, Std.mtof(note + 5), on, hqn, 0.2);

    // rest
    if (Math.random2(1,4) == 1) {

        makeSound(supreme, Std.mtof(note+4), on/4, hqn, 0.2);

        makeSound(supreme, Std.mtof(note+3), on/4, hqn, 0.2);

        makeSound(supreme, Std.mtof(note+2), on/4, hqn, 0.2);
    }
    else
        beat * 1.5 => now;
}