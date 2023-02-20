// directormidi.ck 
MidiOut piano, guitar; 
MidiMsg msg_p, msg_g; 
if (! piano.open(0)) me.exit(); 
if (! guitar.open(0)) me.exit(); 
[60,64,67] @=> int majorC3[]; 
spork ~ playOnce(); 
spork ~ playThrice(); 
while (true) second => now; 
fun void playOnce() { 
    while (true){
        play(piano, msg_p, majorC3, 0.9::second, 1.0); 
    } 
}
fun void playThrice() { 
    while (true) { 
        play(guitar, msg_g, majorC3, 0.3::second, 0.5); 
    } 
}
fun void play(MidiOut mout, MidiMsg msg, int notes[], dur length, float volume) { 
    for (0 => int i; i < notes.size(); i++) { 
        144 => msg.data1; // noteOn 
        notes[i] => msg.data2; 
        Std.ftoi(volume * 127.0) => msg.data3; 
        mout.send(msg); 
        length => now; 
    } 
}