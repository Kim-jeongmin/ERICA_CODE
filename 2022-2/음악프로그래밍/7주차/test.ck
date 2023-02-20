ModalBar bar => dac;

[62, 64, 66, 67, 69, 71, 73, 74] @=> int scale[];

for (0 => int i; i <= 8; i++) {
    i => bar.preset;
    for (0 => int j; j < scale.size(); j++) {
        Std.mtof(scale[j]) => bar.freq;
        1 => bar.noteOn;
        0.4 :: second => now;
    }
}