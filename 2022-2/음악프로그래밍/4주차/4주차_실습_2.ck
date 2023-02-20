// tempo
0.25::second => dur beat; // basic duration
beat => dur qn; // quarter (1/4) note sound
beat * 2 => dur hn; // half (1/2) note sound
beat / 2 => dur en; // eighth (1/8) note sound
beat / 5 => dur rest; // duration of no sound after each note

// Harold Faltermeyer's Theme from the film Beverly Hills Cop (1984)
[
65, -1, 68, -1, 65, 65, 70, 65, 63,
65, -1, 72, -1, 65, 65, 73, 72, 68,
65, 72, 77, 65, 63, 63, 60, 67, 65] @=> int melody[];
[
qn, qn, qn, en, qn, en, qn, qn, qn,
qn, qn, qn, en, qn, en, qn, qn, qn,
qn, qn, qn, en, qn, en, qn, qn, hn] @=> dur durs[];

fun void setMIDInote(Osc osc, int note, float vol) {
    if (0 <= note <= 127) {
        Std.mtof(note) => osc.freq;
        vol => osc.gain;
    } else
        0.0 => osc.gain;
}

TriOsc s => dac;
for (0 => int i; i < melody.size(); i++) {
    setMIDInote(s, melody[i], 0.6);

    if (i != melody.size() - 1 && melody[i] == melody[i+1]){
        durs[i] - rest => now;
        0.0 => s.gain;
        rest => now;
    }
    else {
        durs[i] => now;
    }

    //durs[i] => now;
    //0 => s.gain;
    //rest => now;
}
