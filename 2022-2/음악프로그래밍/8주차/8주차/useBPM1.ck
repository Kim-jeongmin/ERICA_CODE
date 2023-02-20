SinOsc s => dac;
0.3 => s.gain;
BPM bpm;
bpm.tempo(300);

for (400 => int freq; freq < 900; 50 +=> freq) {
    freq => s.freq;
    bpm.quarter => now;
}