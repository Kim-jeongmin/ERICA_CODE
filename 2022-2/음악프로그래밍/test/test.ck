Event e1, e2, e3, e4; 
[60,64,67] @=> int majorC3[]; 
Rhodey piano; 
Mandolin guitar; 
spork ~ play(piano, e1, majorC3, 0.9::second, 0.2); 
spork ~ play(guitar, e2, majorC3, 0.3::second, 0.2); 
spork ~ play(guitar, e3, majorC3, 0.3::second, 0.2); 
spork ~ play(guitar, e4, majorC3, 0.3::second, 0.2);

2 => int turn;
while (true) { // 이 부분을 채워서 프로그램을 완성하자. 
    me.yield();
    
    /*
    if (turn == 2){
        e1.signal();
        e2.signal();
        3=>turn;
    }
    if (turn == 3){
        e3.signal();
        4=>turn;
    }
    if (turn == 4){
        e4.signal();
        2=>turn;
    }
    */

    
    e1.signal();
    e2.signal();
    e3.signal();
    e4.signal();
    
    0.9::second => now; 
}

fun void play(StkInstrument stk, Event e, int notes[], dur length, float volume) { 
    stk => dac; 
    while (true) { 
        e => now; 
        for (0 => int i; i < notes.size(); i++) { 
            Std.mtof(notes[i]) => stk.freq; 
            volume => stk.noteOn; 
            length => now; 
            1 => stk.noteOff; 
        } 
    } 
}