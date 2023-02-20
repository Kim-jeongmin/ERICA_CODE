SndBuf kick => dac;
1 => kick.gain;
me.dir() + "audio/kick_01.wav" => kick.read;  

BPM bpm;
while (true) {
    // Oxxx|Oxxx|Oxxx|Oxxx
    for (0 => int beat; beat < 4; beat++) {
        0 => kick.pos;
        bpm.quarter => now;
    }
}