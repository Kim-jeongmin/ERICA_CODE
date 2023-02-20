// tempo
0.3::second => dur beat;
beat => dur sn; // sixteenth (1/16)
beat * 2 => dur en; // eighth (1/8)

// For Elise by Beethoven
[
76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
60, 64, 69, 71, -1, 64, 68, 71, 72, -1, 64,
76, 75, 76, 75, 76, 71, 74, 72, 69, -1,
60, 64, 69, 71, -1, 64, 72, 71, 69, -1
] @=> int melody[];
[
sn, sn, sn, sn, sn, sn, sn, sn, en, sn,
sn, sn, sn, en, sn, sn, sn, sn, en, sn, sn,
sn, sn, sn, sn, sn, sn, sn, sn, en, sn,
sn, sn, sn, en, sn, sn, sn, sn, en, en
] @=> dur durs[];


fun void setMIDInote(Osc osc, int note, float vol) {
    if (0 <= note <= 127) {
        Std.mtof(note) => osc.freq;
        vol => osc.gain;
    } else
        0.0 => osc.gain;
}

SinOsc s => dac;
for (0 => int i; i < melody.size(); i++) {
    setMIDInote(s, melody[i], 0.6);
    durs[i] => now;
    //0 => s.gain;
    //rest => now;
}