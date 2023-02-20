// note length
0.5::second => dur beat;
beat / 4 => dur rest;
beat - rest => dur qn; // quarter note
beat * 2 - rest => dur hn; // half note
beat * 3 - rest => dur dhn; // dotted half note

beat/8 => dur attack;
beat/8 => dur decay;
0.005 => float sustain;
beat/8 => dur release;

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
FMVoices song => dac;
FMVoices bass => dac;

for (0 => int n; n < 2; n++)
    for (0 => int i; i < melody.size(); i++) {
        if (melody[i] != -1){
            0.5 => song.gain => bass.gain;
        }
        else{
            0.0 => song.gain => bass.gain;
        }

        Std.mtof(melody[i]) => song.freq;
        Std.mtof(bassline[i]) => bass.freq;
        1 => song.noteOn;
        1 => bass.noteOn;
        
        durs[i] => now;    

        //0.0 => song.gain => bass.gain;

        1 => song.noteOff;
        1 => bass.noteOff;
        
        rest => now;
    }