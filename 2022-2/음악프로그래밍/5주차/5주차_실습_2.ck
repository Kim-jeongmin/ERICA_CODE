Gain master[3];

master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[1];
SndBuf snare => master[0];
SndBuf hihat => master[2];
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;

[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0] @=> int kick_hits[];
[0,0,0,1, 0,0,0,0, 0,1,0,0, 1,1,0,0] @=> int snare_hits[];
[0,1,0,0, 0,1,1,0, 0,0,0,0, 0,0,0,0] @=> int hihat_hits[];

0.2::second => dur TEMPO;
while (true) {
    for (0 => int beat; beat < 16; beat++) {
        <<< beat >>>;
        if (kick_hits[beat]) 0 => kick.pos;
        if (snare_hits[beat]) 0 => snare.pos;
        if (hihat_hits[beat]) 0 => hihat.pos;
        TEMPO => now;
    }
}