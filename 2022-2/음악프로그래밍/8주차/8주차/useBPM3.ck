SinOsc s => dac;
0.3 => s.gain;
BPM bpm;
Math.random2f(300.0,1000.0) => bpm.tempo;

for (900 => int freq; freq > 400; 50 -=> freq) {
    freq => s.freq;
    bpm.quarter => now;
}