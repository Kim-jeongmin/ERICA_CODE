OscIn oin;
1979 => oin.port;
oin.addAddress("/chuckie/osctest");
OscMsg msg;

Rhodey piano => dac;

while (true) {
    oin => now;
    while (oin.recv(msg) != 0) {
        msg.getInt(0) => int note;
        msg.getFloat(1) => float velocity;
        msg.getString(2) => string message;
        Std.mtof(note) => piano.freq;
        velocity => piano.gain;
        velocity => piano.noteOn;
        <<< message, note, velocity >>>;
    }
}