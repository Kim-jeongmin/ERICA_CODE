0.25::second => dur beat;
beat / 4 => dur rest;
beat - rest => dur qn; // quarter note
beat * 2 - rest => dur hn; // half note
beat * 3 - rest => dur dhn; // dotted half note
beat / 2 - rest => dur en;
beat / 2  * 3 - rest => dur dqn;

// lyrics 1
[
"pu","leun","ha","nel", "en","-","ha","su", "ha","hyan","zzonk","bea", "ea","-","",
"gye","su","na","mu","han","-","na","mu","to","kki","han","ma","ri","-","",
"dot","dea","do","a","ni","dal","go","sat","dea","do","up","i","-","",
"ga","gi","do","zal", "do","gan","da", "seo","-","zzonk","na", "ra","ro","-",""
] @=> string lyrics1[];

[ // lyrics 2
"eun","ha","su","leul", "gun","-","nu","seo", "gu","leum","na","ra","ro","-","",
"gu","leum","na","ra","gi","-","na","sun","e","di","ro","ga","na","-","",
"mul","ri","seo","ban","zzack","ban","zzack","bi","chi","i","neun","gun","-","",
"set","beul","i","deung", "dea","lan","da", "gil","-","eul","chaj", "a","ra","-",""
] @=> string lyrics2[];

SinOsc s1 => dac;
SinOsc s2 => dac;
SinOsc s3 => dac;
SinOsc s4 => dac;
[s1,s2,s3,s4] @=> SinOsc quartet[];

[48,51,55,60] @=> int C[];
[48,53,57,60] @=> int F[];
[50,53,55,59] @=> int G7[];
[53,57,59,60] @=> int Am[];

[
C,C,C,C,    C,C,C,C,     F,F,G7,G7,      C,C,C,
C,C,C,C,  C,C,C,C,  F,F,G7,G7,      C,C,C,
C,C,C,C,  Am,Am,G7,  C,C,C,C,  G7,G7,G7,
C,C,C,   C,C,F,F,   C,C,C,G7,G7, C,C,C
] @=> int chords[][];



[
67,69,67,64,    67,64,60,55,      57,60,62,67,   64,64,-1,
67,69,67,64,    67,64,60,55,      57,60,55,62,   60,60,-1,
64,64,64,62,    64,69,67,         64,62,64,69,   67,67,-1,
72,67,67,       64,64,69,69,      67,64,60,55,62,   60,60,-1
//막줄
] @=> int melody[];

[
hn,qn,hn,qn,    qn,qn,qn,dhn,       dhn,qn,hn,qn,  dhn,hn,en,
hn,qn,hn,qn,  qn,qn,qn,dhn, hn,qn,hn,qn,  dhn,hn,en,
hn,qn,hn,qn,  hn,qn,dhn,   hn,qn,hn,qn,    dhn,hn,en,
dhn,hn,qn,   hn,qn,hn,qn,   qn,qn,qn,hn,qn,   dhn,hn,en
] @=> dur durs[];


fun void setMIDInote(Osc osc, int note, float vol) {
    if (0 <= note <= 127) {
        Std.mtof(note) => osc.freq;
        vol => osc.gain;
    } else
        0.0 => osc.gain;
}

fun void setChord(SinOsc osc[], int chord[], float vol) {

    for (0 => int i; i < osc.size(); i++){
        setMIDInote(osc[i], chord[i], vol/4);
    }
}

Rhodey s =>  dac;


for (1 => int n; n <= 2; n++){
    for (0 => int i; i < melody.size(); i++) {
        //setMIDInote(s, melody[i], 0.2);
        if (0 <= melody[i] <= 127) {
            Std.mtof(melody[i]) => s.freq;
            0.2 => s.gain;
        } else
            0.0 => s.gain;

        setChord(quartet, chords[i], 0.6);
        if (n == 1)
            <<< lyrics1[i], "">>>;
        else
            <<< lyrics2[i], "">>>;

        1 => s.noteOn;
        durs[i] => now;
        


        1 => s.noteOff;
        rest => now;
    }
}
