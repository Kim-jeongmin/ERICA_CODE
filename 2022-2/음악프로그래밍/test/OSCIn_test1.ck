// piano.ck 
OscIn oin; 
8401 => oin.port; 
oin.addAddress("/three/piano"); 
OscMsg msg; 
Mandolin piano => dac; 
int note; 
float volume; 
while (true) { 
    oin => now; 
    while (oin.recv(msg)) { 
        msg.getInt(0) => note; 
        msg.getFloat(1) => volume; 
        if (volume == 0.0) 
            1 => piano.noteOff;  
        else { 
            Std.mtof(note) => piano.freq; 
            volume => piano.gain; 
            1 => piano.noteOn; 
        } 
    } 
}