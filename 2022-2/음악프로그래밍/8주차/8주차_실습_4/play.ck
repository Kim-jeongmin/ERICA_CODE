BPM bpm;
bpm.n6 => dur n6;
Canon1075 canon;
canon.melody @=> int melody[];
canon.length @=> dur length[];


// set up instruments
Rhodey hand1 => dac;
Rhodey hand2 => dac;

// play duo
spork ~ play1();
spork ~ play2();
n6 * 11 => now;

Tool tool;

fun void play1() { // total = n6 * 11
    tool.play(hand1, melody, length); // n6 * 4
    tool.play(hand1, melody, length); // n6 * 4
    tool.play(hand1, melody, length, 11); // n6 * 2
    tool.playnote(hand1, 72, n6); // n6 * 1
}

fun void play2() { // total = n6 * 11
    n6 => now; // n6 * 1
    tool.play(hand2, melody, length); // n6 * 4
    tool.play(hand2, melody, length); // n6 * 4
    tool.play(hand2, melody, length, 6); // n6 * 1
    tool.playnote(hand2, 64, n6); // n6 * 1
}

