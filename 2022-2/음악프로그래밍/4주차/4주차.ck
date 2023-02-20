/*
// <<< [67, 67, 69, 69, 67, 67, 64] >>>;

[67, 67, 69, 69, 67, 67, 64] @=> int notes[];


notes.size(12);

notes.popBack();
notes << 88;
notes << 99;
//67 => notes[4];

notes.clear();
for (0 => int i; i < notes.size(); i++)
    <<< "notes[", i , "] =", notes[i] >>>;

<<< "The length of notes =", notes.size() >>>;
*/

// lyrics 1
[
"Hak","Gyo","Jong","I", "Ddaeng","Ddaeng","Ddaeng", "Eo","Seo","Mo","I", "Ja","",
"Seon","Saeng","Nim","I", "U","Ri","Reul", "Gi","Da","Ri","Sin", "Da",""
] @=> string lyrics1[];

[ // lyrics 2
"Hak","Gyo","Jong","I", "Ddaeng","Ddaeng","Ddaeng", "Eo","Seo","Mo","I", "Ja","",
"Sa","I","Jot","Ge", "O","Neul","Do", "Gong","Bu","Jal","Ha", "Ja",""
] @=> string lyrics2[];

0.5::second => dur beat;
beat / 4 => dur rest;
beat - rest => dur qn; // quarter note
beat * 2 - rest => dur hn; // half note
beat * 3 - rest => dur dhn; // dotted half note

[48,51,55,60] @=> int C[];
[48,53,57,60] @=> int F[];
[50,53,55,59] @=> int G7[];

[ // time
qn,qn,qn,qn, qn,qn,hn, qn,qn,qn,qn, dhn,qn,
qn,qn,qn,qn, qn,qn,hn, qn,qn,qn,qn, dhn,qn
] @=> dur durs[];

[ // chords
C,C,F,F, C,C,C, C,C,C,C,   G7,G7,
C,C,F,F, C,C,C, C,C,G7,G7, C,C
] @=> int chords[][];

[ // melody
67,67,69,69, 67,67,64, 67,67,64,64, 62,-1,
67,67,69,69, 67,67,64, 67,64,62,64, 60,-1
] @=> int melody[];

SinOsc s1 => dac;
SinOsc s2 => dac;
SinOsc s3 => dac;
SinOsc s4 => dac;
[s1,s2,s3,s4] @=> SinOsc quartet[];

fun void setMIDInote(SinOsc osc, int note, float vol) {
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



SinOsc s => dac;


for (1 => int n; n <= 2; n++)
    for (0 => int i; i < melody.size(); i++) {
        setMIDInote(s, melody[i], 0.2);
        setChord(quartet, chords[i], 0.2);
        if (n == 1) 
            <<< lyrics1[i] , " ">>>;
        else
            <<< lyrics2[i] , " ">>>;
        durs[i] => now;
        0 => s.gain;
        rest => now;
    }

