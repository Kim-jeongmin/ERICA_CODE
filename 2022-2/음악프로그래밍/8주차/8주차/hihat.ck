SndBuf hat => dac;
0.3 => hat.gain;
me.dir() + "audio/hihat_02.wav" => hat.read;

BPM bpm;
while (true) {
    // OxOx|OxOx|OxOx|Oxxx
    for (0 => int beat; beat < 8; beat++) {
        if (beat != 7)
            0 => hat.pos;
        bpm.one_8th => now;
    }
}