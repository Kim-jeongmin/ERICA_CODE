SndBuf snare => dac;
0.5 => snare.gain;
me.dir() + "audio/snare_01.wav" => snare.read;
snare.samples() => snare.pos;

BPM bpm;
while (true) {
    // xxxxOxxxxxxxOOxx
    bpm.quarter => now;
    0 => snare.pos;
    2.0 * bpm.quarter => now;
    0 => snare.pos;
    bpm.quarter / 4.0 => now;
    0 => snare.pos;
    3.0 * bpm.quarter / 4.0 => now;
}