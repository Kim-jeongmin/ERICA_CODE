// note length
0.5::second => dur beat;
beat / 4 => dur rest;
beat - rest => dur qn; // quarter note
beat * 2 - rest => dur hn; // half note
beat * 3 - rest => dur dhn; // dotted half note

[ // melody
67,67,69,69, 67,67,64,
67,67,64,64, 62,-1,
67,67,69,69, 67,67,64,
67,64,62,64, 60,-1
] @=> int melody[];

[ // bassline
48,48,41,41, 48,48,48,
48,48,45,45, 43,-1,
48,48,41,41, 48,48,48,  
48,48,43,47, 48,-1
] @=> int bassline[];

[ // tempo
qn,qn,qn,qn, qn,qn,hn,
qn,qn,qn,qn, dhn,qn,
qn,qn,qn,qn, qn,qn,hn,
qn,qn,qn,qn, dhn,qn
] @=> dur durs[];

// play
SawOsc song => dac;
SawOsc bass => dac;
for (0 => int n; n < 2; n++)
    for (0 => int i; i < melody.size(); i++) {
        if (melody[i] == -1)
            0.0 => song.gain => bass.gain;
        else
            0.5 => song.gain => bass.gain;
        Std.mtof(melody[i]) => song.freq;
        Std.mtof(bassline[i]) => bass.freq;
        durs[i] => now;
        0 => song.gain => bass.gain;
        rest => now;
    }
    