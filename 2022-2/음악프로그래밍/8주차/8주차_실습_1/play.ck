Wurley righthand => dac;
Wurley lefthand => dac;

BPM bpm;
bpm.tempo(120);
bpm.n1 => dur n1;
bpm.n2 => dur n2;
bpm.n3 => dur n3;
bpm.n5 => dur n5;

[ // halfmoon harmony
48,52,55, 48,52,55, 48,52,55, 48,52,55,
48,53,57, 47,50,53, 48,52,55, 48,52,55,
48,52,55, 48,52,55, 48,52,55, 48,52,55,
48,53,57, 47,50,53, 48,52,55, 48,52,55,
48,52,55, 48,52,55, 45,48,52, 47,50,53,
48,52,55, 48,52,55, 47,50,53, 47,50,53,
48,52,55, 48,52,55, 48,52,55, 48,53,57, 
48,52,55, 47,50,53, 48,52,55, 48,52,55
] @=> int harmony[];

[ // halfmoon harmony time
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1,
n1,n1,n1, n1,n1,n1, n1,n1,n1, n1,n1,n1
] @=> dur harmony_len[];

[ // halfmoon melody
67,69,67,64,  67,64,60,55,  57,60,62,67,     64,-1,
67,69,67,64,  67,64,60,55,  57,60,55,62,     60,-1,
64,64,64,62,  64,   69,67,  64,62,64,69,     67,-1,
72,   67,67,  64,64,69,69,  67,64,60,55,62,  60,-1
] @=> int melody[];

[ // halfmoon melody time
n2,n1,n2,n1,  n1,n1,n1,n3,  n2,n1,n2,n1,     n5,n1,
n2,n1,n2,n1,  n1,n1,n1,n3,  n2,n1,n2,n1,     n5,n1,
n2,n1,n2,n1,  n2,   n1,n3,  n2,n1,n2,n1,     n5,n1,
n3,   n2,n1,  n2,n1,n2,n1,  n1,n1,n1,n2,n1,  n5,n1
] @=> dur melody_len[];


Tool tool;

spork ~ tool.play(righthand, melody, melody_len);
spork ~ tool.play(lefthand, harmony, harmony_len);

98*n1 => now;