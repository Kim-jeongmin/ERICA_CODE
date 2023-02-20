Gain master[3];

master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[2];
SndBuf snare => master[1];
SndBuf hihat => master[2];
SndBuf clap => master[0];


me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/clap_01.wav" => clap.read;

SndBuf claps => Pan2 p;
p.chan(0) => master[0];
p.chan(1) => master[2];


kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
clap.samples() => clap.pos;
0.3 => hihat.gain;

0.2::second => dur TEMPO;
[
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0
] @=> int kick_hits[];
[
    0,0,1,0, 0,0,1,0, 0,0,0,0, 1,1,1,1,
    0,0,0,0, 1,1,1,1, 0,0,0,0, 1,1,1,1
] @=> int snare_hits[];
[
    0,1,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1,
    0,0,1,0, 0,0,1,0, 0,1,0,0, 1,0,0,0
] @=> int hihat_hits[];
[
    0,1,0,1, 0,1,0,1, 0,1,0,1, 0,1,0,1,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0
] @=> int clap_hits[];


for (0 => int i; i< 2; i++) {
    for (0 => int beat; beat < kick_hits.size(); beat++) {
        <<< beat >>>;
        if (kick_hits[beat])
            0 => kick.pos;
        if (snare_hits[beat])
            0 => snare.pos;
        if (hihat_hits[beat])
            0 => hihat.pos;

        if (clap_hits[beat])
            0 => clap.pos;
        
        TEMPO => now;
    }
}
