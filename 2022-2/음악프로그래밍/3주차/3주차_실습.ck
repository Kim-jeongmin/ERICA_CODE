SinOsc s => dac;
72 => int note;
0.5 => float volume;
0.3::second => dur beat;

fun int nextNoteRandom(int note, int step){
    Math.random2(-step,step) => int distance;
    
    while(!distance)  Math.random2(-step, step) => distance;
    
    distance +=> note;

    stayWithinRange(note, distance, 60, 84) => note;

    return note;
}

fun int stayWithinRange(int note, int dist, int min, int max){

    if (note < min || note > max) -dist * 2 +=> note;

    return note;
}


while (true) {
    <<< "MIDI =", note >>>;
    Std.mtof(note) => s.freq;
    volume => s.gain;
    Math.random2f(0.5, 2) * beat => now;

    nextNoteRandom(note, 2) => note;
    
}