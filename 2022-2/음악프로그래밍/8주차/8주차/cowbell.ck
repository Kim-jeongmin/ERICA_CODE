SndBuf cow => dac;
0.3 => cow.gain;
me.dir() + "audio/cowbell_01.wav" => cow.read;

BPM bpm;
while (true) {
    // xxxx|xxxx|xxxx|xxOx
    for (0 => int beat; beat < 8; beat++) {
        if (beat == 7)
            0 => cow.pos;
        bpm.one_8th => now;
    }
}