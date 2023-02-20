TriOsc scale => dac;
SqrOsc scale2 => dac;

// note length
0.5::second => dur beat;

beat * (5.0/6) => dur qn; // quarter note sound (1/4)*(5/6)
beat / 6 => dur qn_rest; // quarter note no sound (1/4)*(1/6)
qn / 2 => dur hqn; 
qn_rest / 2=> dur hqn_rest;


// volume
0.5 => float on;
0.0 => float off;

off => scale2.gain;

int randInt;

// play

while(true){
    Math.random2(-12, 12) => randInt;

    Std.mtof(57 + randInt) => scale.freq;
    on => scale.gain;
    hqn => now;
    off => scale.gain;
    hqn_rest => now;

    Std.mtof(60 + randInt) => scale.freq;
    on => scale.gain;
    qn => now;
    off => scale.gain;
    qn_rest => now;

    Std.mtof(57 + randInt) => scale.freq;
    on => scale.gain;
    hqn => now;
    off => scale.gain;
    hqn_rest => now;


    Std.mtof(62 + randInt) => scale.freq;
    on => scale.gain;
    hqn => now;
    off => scale.gain;
    hqn_rest => now;

    

    if (Math.random2(1, 4) == 1){
        Std.mtof(61 + randInt) => scale2.freq;
        on / 4 => scale2.gain;
        hqn => now;
        off => scale2.gain;
        hqn_rest => now;

        Std.mtof(60 + randInt) => scale2.freq;
        on / 4 => scale2.gain;
        hqn => now;
        off => scale2.gain;
        hqn_rest => now;

        Std.mtof(59 + randInt) => scale2.freq;
        on / 4 => scale2.gain;
        hqn => now;
        off => scale2.gain;
        hqn_rest => now;
    }
    else {
        beat * 1.5 => now;
    }
    
}
