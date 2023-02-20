/*
60 => int mynote;
<<< mynote >>>;

12 +=> mynote;
<<< mynote >>>;

36 -=> mynote;
<<< mynote >>>;

24 +=> mynote;
*/

/*
fun int changeOctave(int note, int step) {
    return note + (step * 12);
}

60 => int mynote;
<<< mynote >>>;
changeOctave(mynote,1) => mynote;
<<< mynote >>>;
changeOctave(mynote,-3) => mynote;
<<< mynote >>>;
changeOctave(mynote,2) => mynote;
<<< mynote >>>;
*/

/*
SinOsc s => dac;
220 => int pitch;
0.6 => float volume;
0.0 => float off;
0.5::second => dur beat;

fun void makeSound(Osc osc, float pit, float vol, dur len) {
    pit => osc.freq;
    vol => osc.gain;
    <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
    len * 4 / 5 => now;
    0.0 => s.gain;
    len / 5 => now;
}

fun int changeOctave(int note) {
    return note + 12;
}

makeSound(s, pitch, volume, beat);
while (true) {
    //0.1 +=> volume;
    makeSound(s, pitch * 2, volume / 2, beat);
    Math.random2(0,1) => int choice;
    if (choice == 1)  makeSound(s, pitch * 1.5, volume / 1.5, beat);
    
    else  makeSound(s, pitch, volume, beat);
    
    makeSound(s, pitch, volume, beat);
    //2 *=> pitch;
    //2 /=> volume;
}
*/

// fun void setOsc(Osc osc, float pit, float vol) {
//     pit => osc.freq;
//     vol => osc.gain;
//     <<< osc.freq(), osc.gain() >>>;
// }

// SinOsc s => dac;
// SinOsc s2 => dac;
// s.freq() => float pitch;
// s.gain() => float volume;
// 0.5 *=> volume;
// setOsc(s, pitch, volume);
// setOsc(s2, pitch * 3, volume);
// second => now;


fun void makeSound(Osc osc, float pit, float vol, dur len, float rest) {
    pit => osc.freq;
    vol => osc.gain;
    <<< "Pitch =", osc.freq(), ", Volume =", osc.gain() >>>;
    len * (1 - rest) => now;
    0 => osc.gain;
    len * rest => now;
}

