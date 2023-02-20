Gain master => dac;
SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => master;
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
0.3 => hihat.gain;

SawOsc violin => dac;

0.2::second => dur TEMPO;
[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0] @=> int kick_hits[];
[0,0,1,0, 0,0,1,0, 0,0,0,0, 1,1,1,1] @=> int snare_hits[];

while (true) {
    for (0 => int beat; beat < kick_hits.size(); beat++) {
        <<< beat >>>;
        if (kick_hits[beat])
            0 => kick.pos;
        if (snare_hits[beat])
            0 => snare.pos;

        if(!Math.random2(0, 2)) {
            0.1 => violin.gain;
            Std.mtof(Math.random2(60, 72)) => violin.freq;
        } else 0.0 => violin.gain;
        
        
        if(Math.random2(0, 1)) 0 => hihat.pos;
        TEMPO => now;
    }
}