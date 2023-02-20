// 반음계 올리고 내리기

SinOsc scale => dac;

// note length
0.3::second => dur beat;
beat * (5.0/6) => dur qn; // quarter note sound (1/4)*(5/6)
qn * 2 => dur hn; // half note sound

// volume
0.5 => float on;
0.0 => float off;

fun void makeSound(Osc osc, float pit, float vol, dur len, float rest) {
    pit => osc.freq;
    vol => osc.gain;
    <<< "Pitch =", osc.freq(), ", Volume =", osc.gain() >>>;
    len * (1 - rest) => now;
    0 => osc.gain;
    len * rest => now;
}

// play
for (48 => int i; i <= 60; i++) {
    Std.mtof(i) => scale.freq;
    if (i == 60) makeSound(scale, Std.mtof(i), on, hn, 0.2);
    else makeSound(scale, Std.mtof(i), on, qn, 0.2);
}
for (60 => int i; i >= 48; i--) {
    Std.mtof(i) => scale.freq;image.png
    if (i == 48) makeSound(scale, Std.mtof(i), on, hn, 0.2);
    else makeSound(scale, Std.mtof(i), on, qn, 0.2);
}

