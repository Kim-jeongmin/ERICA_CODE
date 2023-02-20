// snare 드럼을 각각 'A', 'S', 'D' 키에 할당
// hihat을 각각 'Q', 'W', 'E', 'R' 키에 할당
// kick을 각각 'Z', 'X', 'C', 'V', 'B' 키에 할당
Hid hi;
HidMsg msg;
0 => int device;
if (! hi.openKeyboard(device)) me.exit();
<<< "keyboard '" + hi.name() + "' ready", "" >>>;

SndBuf snare_01 => dac;
me.dir() + "/audio/snare_01.wav" => snare_01.read;
SndBuf snare_02 => dac;
me.dir() + "/audio/snare_02.wav" => snare_02.read;
SndBuf snare_03 => dac;
me.dir() + "/audio/snare_03.wav" => snare_03.read;

SndBuf hihat_01 => dac;
me.dir() + "/audio/hihat_01.wav" => hihat_01.read;
SndBuf hihat_02 => dac;
me.dir() + "/audio/hihat_02.wav" => hihat_02.read;
SndBuf hihat_03 => dac;
me.dir() + "/audio/hihat_03.wav" => hihat_03.read;
SndBuf hihat_04 => dac;
me.dir() + "/audio/hihat_04.wav" => hihat_04.read;

SndBuf kick_01 => dac;
me.dir() + "/audio/kick_01.wav" => kick_01.read;
SndBuf kick_02 => dac;
me.dir() + "/audio/kick_02.wav" => kick_02.read;
SndBuf kick_03 => dac;
me.dir() + "/audio/kick_03.wav" => kick_03.read;
SndBuf kick_04 => dac;
me.dir() + "/audio/kick_04.wav" => kick_04.read;
SndBuf kick_05 => dac;
me.dir() + "/audio/kick_05.wav" => kick_05.read;


snare_01.samples() => snare_01.pos;
snare_02.samples() => snare_02.pos;
snare_03.samples() => snare_03.pos;

hihat_01.samples() => hihat_01.pos;
hihat_02.samples() => hihat_02.pos;
hihat_03.samples() => hihat_03.pos;
hihat_04.samples() => hihat_04.pos;

kick_01.samples() => kick_01.pos;
kick_02.samples() => kick_02.pos;
kick_03.samples() => kick_03.pos;
kick_04.samples() => kick_04.pos;
kick_05.samples() => kick_05.pos;


while (true) {
    hi => now;
    while (hi.recv(msg)) {
        if (msg.isButtonDown()) {
            <<< "Button down" >>>;

            // snare 드럼을 각각 'A', 'S', 'D' 키에 할당
            if (msg.ascii == 'A') 0 => snare_01.pos;
            if (msg.ascii == 'S') 0 => snare_02.pos;
            if (msg.ascii == 'D') 0 => snare_03.pos;

            // hihat을 각각 'Q', 'W', 'E', 'R' 키에 할당
            if (msg.ascii == 'Q') 0 => hihat_01.pos;
            if (msg.ascii == 'W') 0 => hihat_02.pos;
            if (msg.ascii == 'E') 0 => hihat_03.pos;
            if (msg.ascii == 'R') 0 => hihat_04.pos;

            // kick을 각각 'Z', 'X', 'C', 'V', 'B' 키에 할당
            if (msg.ascii == 'Z') 0 => kick_01.pos;
            if (msg.ascii == 'X') 0 => kick_02.pos;
            if (msg.ascii == 'C') 0 => kick_03.pos;
            if (msg.ascii == 'V') 0 => kick_04.pos;
            if (msg.ascii == 'B') 0 => kick_05.pos;
        }
        else {
            <<< "Button Up:" >>>;
            
        }
    }
}