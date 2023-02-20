Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf cowbell => master[0];
SndBuf hihat => master[2];

SndBuf claps => Pan2 p;
p.chan(0) => master[0];
p.chan(1) => master[2];

SqrOsc osc => dac;
0.0 => osc.gain;

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/cowbell_01.wav" => cowbell.read;
me.dir() + "/audio/clap_01.wav" => claps.read;

[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cow_hits[];
cow_hits.size() => int max_beat;
0.2::second => dur tempo;

0 => int beat;
0 => int measure;
while (true) {
    if (beat % 4 == 0)
        0 => kick.pos;
    if (beat % 4 == 2 && measure % 2 == 1)
        0 => snare.pos;
    if (measure > 1) {
        if (cow_hits[beat])
            0 => cowbell.pos;
        else {
            Math.random2f(0.0,1.0) => hihat.gain;
            0 => hihat.pos;
        }
    }
    
    if (beat > 8){
        Std.mtof(Math.random2(60,72)) => osc.freq;

        if(!Math.random2(0, 2)){
            0.2 => osc.gain;
        } else 0.0 => osc.gain;
    } 
    
    
    if (beat > 11 && measure > 3) {
        Math.random2f(-1.0,1.0) => p.pan;
        0 => claps.pos;
    }
    tempo => now;
    (beat + 1) % max_beat => beat;
    if (beat == 0)
        measure++;
}