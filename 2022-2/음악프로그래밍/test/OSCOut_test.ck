// directorosc.ck 
OscOut piano, guitar; 
OscMsg msg_p, msg_g; 
piano.dest("localhost", 8401); 
guitar.dest("localhost", 8402); 
[60,64,67] @=> int majorC3[]; 
spork ~ playOnce(); 
spork ~ playThrice(); 
while (true) second => now; 
fun void playOnce() { 
    while (true)
        play(piano, "/three/piano", majorC3, 0.9::second, 1.0);
} 
fun void playThrice() { 
    while (true) { 
        play(guitar, "/three/guitar", majorC3, 0.9::second, 1.0);
 } 
}
fun void play(OscOut oout, string address,
    int notes[], dur length, float volume) { 
    for (0 => int i; i < notes.size(); i++) { 
        oout.start(address);
        oout.add(notes[i]);
        oout.add(volume);
        oout.add("");
        oout.send();



        length => now; 
    } 
}
