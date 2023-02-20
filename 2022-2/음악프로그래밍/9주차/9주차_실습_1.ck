class TheEvent extends Event {
    int note;
    float velocity;
}

TheEvent e1, e2;

NRev globalReverb => dac;
.1 => globalReverb.mix;

// instrument function to spork
fun void poly(StkInstrument instrument, TheEvent event, string name) {
    instrument => globalReverb; // 스피커 연결
    while (true) {
        // 대기
        event => now;
        // 연주
        <<< "Play", name >>>;
        event.note => Std.mtof => instrument.freq;
        event.velocity => instrument.noteOn;
    }
}

// "e1" 이벤트 대기 쉬레드
spork ~ poly(new StifKarp, e1, "StifKarp");                           
spork ~ poly(new Mandolin, e1, "Mandolin");
spork ~ poly(new Wurley, e1, "Wurley");

// "e2" 이벤트 대기 쉬레드
spork ~ poly(new Rhodey, e2, "Rhodey");

[60,62,64,67,69,72,74,76,79] @=> int notes[];

while (true) {
    Math.random2(1,6) => int dice;
    if (dice != 1) { // 5/6 확률로 선택
        notes[Math.random2(0,notes.size()-1)] => e1.note;
        Math.random2f(.2, .9) => e1.velocity;
        e1.signal();
        0.25::second => now;
    }
    else { // 1/6 확률로 선택
        notes[Math.random2(0,notes.size()-1)] - 24 => e2.note;
        notes[0] - 12 => e1.note;
        1.0 => e2.velocity;
        e1.broadcast();
        e2.signal();
        second => now;
    }
}