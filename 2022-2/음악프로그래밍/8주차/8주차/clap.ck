SndBuf clap => dac;
0.3 => clap.gain;
me.dir() + "audio/clap_01.wav" => clap.read;

BPM bpm;
while (true) {
    // ????|????|????|???? (3/8 probability random)
    for (0 => int beat; beat < 16; beat++) {
        if (Math.random2(0,7) < 3) {
            0 => clap.pos;
        }
        bpm.one_16th => now;
    }
    break;
}