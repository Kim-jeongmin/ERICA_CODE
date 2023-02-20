SinOsc s => dac;
0.3 => s.gain;
BPM bpm;
bpm.tempo(200);

for (900 => int freq; freq > 400; 50 -=> freq) {
    freq => s.freq;
    bpm.quarter => now;
}