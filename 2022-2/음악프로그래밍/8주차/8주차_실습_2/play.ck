// tempo
BPM bpm;
bpm.tempo(300);

bpm.n1 => dur n1;
bpm.n2 => dur n2;
bpm.n3 => dur n3;
bpm.n6 => dur n6;

[ // melody
60,60,             60,62,64,          64,62,64,65, 67,
72,72,72,67,67,67, 64,64,64,60,60,60, 67,65,64,62, 60
] @=> int melody[];

[ // time
n3,n3,             n2,n1,n3,          n2,n1,n2,n1, n6,
n1,n1,n1,n1,n1,n1, n1,n1,n1,n1,n1,n1, n2,n1,n2,n1, n6
] @=> dur length[];

Rhodey piano[4];
piano[0] => dac;
piano[1] => dac;
piano[2] => dac;
piano[3] => dac;

Tool tool;

spork ~ tool.play(piano[0], melody, length);
n6 * 2 => now;
spork ~ tool.play(piano[1], melody, length);
n6 * 2 => now;
spork ~ tool.play(piano[2], melody, length);
n6 * 2 => now;
spork ~ tool.play(piano[3], melody, length);
n6 * 8 => now;
