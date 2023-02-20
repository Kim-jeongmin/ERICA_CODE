// TriOsc s => dac;
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// second => now;
// 440 => s.freq;
// 0.5 => s.gain;
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// second => now;
// 220 => s.freq;
// 1.0 => s.gain;
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// second => now;

// TriOsc s => dac;
// // Sound 1: the original pitch
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// second => now;
// while (true) {
//     // Sound 2: double the pitch
//     440.0 => s.freq;
//     0.5 => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     second => now;
//     // Sound 3: return to the original
//     220.0 => s.freq;
//     1.0 => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     second => now;
// }

// TriOsc s => dac;
// 220 => int pitch => s.freq;
// 0.6 => float volume => s.gain;
// 0.5::second => dur beat;
// // Sound 1: the original pitch
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// beat => now;
// while (true) {
//     // Sound 2: double the pitch
//     pitch * 2 => s.freq;
//     volume / 2 => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat => now;
//     // Sound 3: return to the original
//     pitch => s.freq;
//     volume => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat => now;

// }

// 주파수 두 배
// TriOsc s => dac;
// 220 => int pitch => s.freq;
// 0.6 => float volume => s.gain;
// 0.0 => float off;
// 0.5::second => dur beat;
// // Sound 1: the original pitch
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// beat * 4 / 5  => now;
// off => s.gain;
// beat / 5 => now;
// while (true) {
//     // Sound 2: double the pitch
//     pitch * 2 => s.freq;
//     volume / 2 => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat * 4 / 5 => now;
//     off => s.gain;
//     beat / 5 => now;
//     // Sound 3: return to the original
//     pitch => s.freq;
//     volume => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat * 4 / 5 => now;
//     off => s.gain;
//     beat / 5 => now;

//     2 *=> pitch;
// }


// 소리 크기 조금씩 증가
// TriOsc s => dac;
// 220 => int pitch => s.freq;
// 0.0 => float volume => s.gain;
// 0.0 => float off;
// 0.5::second => dur beat;
// // Sound 1: the original pitch
// <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
// beat * 4 / 5  => now;
// off => s.gain;
// beat / 5 => now;
// while (true) {
//     // Increase the volume by 0.1
//     0.1 +=> volume;
//     // Sound 2: double the pitch
//     pitch * 2 => s.freq;
//     volume / 2 => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat * 4 / 5 => now;
//     off => s.gain;
//     beat / 5 => now;
//     // Sound 3: return to the original
//     pitch => s.freq;
//     volume => s.gain;
//     <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
//     beat * 4 / 5 => now;
//     off => s.gain;
//     beat / 5 => now;
// }

/*
// 무작위수
TriOsc s => dac;
220 => int pitch => s.freq;
0.6 => float volume => s.gain;
0.0 => float off;
0.5::second => dur beat;
// Sound 1: the original pitch
<<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
beat * 4 / 5  => now;
off => s.gain;
beat / 5 => now;
while (true) {
    // Sound 2: double the pitch
    pitch * 2 => s.freq;
    volume / 2 => s.gain;
    <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
    beat * 4 / 5 => now;
    off => s.gain;
    beat / 5 => now;
    // Sound 2+: 1.5 times the pitch randomly
    if (Math.random2(0,1)) {
        pitch * 1.5 => s.freq;
        volume / 1.5 => s.gain;
        <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
        beat * 4 / 5 => now;
        off => s.gain;
        beat / 5 => now;
    }
    // Sound 3: return to the original
    pitch => s.freq;
    volume => s.gain;
    <<< "Pitch =", s.freq(), ", Volume =", s.gain() >>>;
    beat * 4 / 5 => now;
    off => s.gain;
    beat / 5 => now;
}
*/

//<<< 12 >= 13, true > false, 0 == false, 11 >= 11 >>>;
// <<< true && false, true || false, ! true >>>;

/*
TriOsc s => dac;
for (20 => int i; i < 440; i++) {
    <<< i >>>;
    i => s.freq;
    10::ms => now;
}
*/

/*
TriOsc s => dac;
20 => int i;
while (i < 440) {
    <<< i >>>;
    i => s.freq;
    10::ms => now;
    i++;
}
*/

/*
TriOsc s => dac;
220 => s.freq;
0.6 => s.gain;
SinOsc s2 => dac;
880 => s2.freq;
0.4 => s2.gain;
2::second => now;
*/

/*
<<< Std.mtof(60) >>>;
<<< 60 => Std.mtof >>>;
*/
/*
TriOsc s => dac;
0.5 => s.gain;
float hz;
for (0 => int m; m < 128; m++) {
    Std.mtof(m) => hz;
    <<< m, hz >>>;
    hz => s.freq;
    300::ms => now;
}TriOsc s => dac;
0.5 => s.gain;
float hz;
for (0 => int m; m < 128; m++) {
    Std.mtof(m) => hz;
    <<< m, hz >>>;
    hz => s.freq;
    300::ms => now;
}
*/


/*
TriOsc s => dac;
//Math.srandom(55);
for (0 => int count; count < 8; count++) {
    Math.random2(48,72) => int note;
    Math.random2f(0.2,0.3) => float volume;
    Std.mtof(note) => s.freq;
    volume => s.gain;
    0.3::second => now;
}
*/




