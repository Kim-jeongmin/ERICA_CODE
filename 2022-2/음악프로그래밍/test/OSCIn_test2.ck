// guitar.ck 
OscIn oin; 
8402 => oin.port; 
oin.addAddress("/three/guitar"); 
OscMsg msg; 
Mandolin guitar => dac; 
int note; 
float volume; 
while (true) { 
    oin => now; 
    while (oin.recv(msg)) { 
        msg.getInt(0) => note; 
        msg.getFloat(1) => volume; 
        if (volume == 0.0) 
            1 => guitar.noteOff; 
        else { 
            Std.mtof(note) => guitar.freq; 
            volume => guitar.gain; 
            1 => guitar.noteOn; 
        } 
        
    }
}