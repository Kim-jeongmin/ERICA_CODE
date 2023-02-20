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
SinOsc modulator => SinOsc carrier  => ADSR env1 => dac;
2 => carrier.sync;
120 => modulator.freq;
100 => modulator.gain;
SawOsc bass => ADSR env2 => dac;



for (0 => int n; n < 2; n++)
    for (0 => int i; i < melody.size(); i++) {
        if (melody[i] != -1){
            env1.set(attack, decay, sustain, release);
            env2.set(attack, decay, sustain, release);
        }
        else{
            env1.set(0::second, 0::second, 0, 0::second);
            env2.set(0::second, 0::second, 0, 0::second);
        }

        Std.mtof(melody[i]) => carrier.freq;
        Std.mtof(bassline[i]) => bass.freq;
        1 => env1.keyOn => env2.keyOn;
        
        
        durs[i] => now;
        1 => env1.keyOff => env2.keyOff;
        env1.set(0::second, 0::second, 0, 0::second);
        env2.set(0::second, 0::second, 0, 0::second);
 
        
        rest => now;
    }