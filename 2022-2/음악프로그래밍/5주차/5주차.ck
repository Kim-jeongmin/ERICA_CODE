/*
SndBuf sample => dac;
me.dir() + "/audio/snare_01.wav" => string filename;
filename => sample.read;
0.5 => sample.gain;
0 => sample.pos;
second => now;
*/

/*
SndBuf sample1 => dac.left;
SndBuf sample2 => dac.right;
me.dir() + "/audio/snare_01.wav" => sample1.read;
me.dir() + "/audio/hihat_01.wav" => sample2.read;
0.5 => sample1.gain => sample2.gain;
0 => sample1.pos => sample2.pos;
second => now;
*/

/*
Noise n => Pan2 p => dac;
0.2 => n.gain;
float position;
while (true) {
    Math.sin(now/second) => position;
    <<< position >>>;
    position => p.pan;
    ms => now;
}
*/

/*
SndBuf sample => Pan2 p => dac;
0.5 => sample.gain;
me.dir() + "/audio/snare_01.wav" => sample.read;
-1.0 => float position;
while (position < 1.0) {
    position => p.pan;
    <<< position >>>;
    0 => sample.pos;
    100::ms => now;
    0.02 +=> position;
}
*/

/*
SndBuf sample => Pan2 p => dac;
0.5 => sample.gain;
me.dir() + "/audio/cowbell_01.wav" => sample.read;
while (true) {
    Math.random2f(0.1,1.0) => sample.gain; // volume
    Math.random2f(-1.0,1.0) => p.pan; // panning
    Math.random2f(0.2,1.8) => sample.rate; // speed
    0 => sample.pos;
    500::ms => now;
}
*/

/*
SndBuf sample => dac;
0.5 => sample.gain;
me.dir() + "/audio/hihat_04.wav" => sample.read;

for (0 => int i; i < 3; i++) {
    <<< sample.rate() >>>;
    0 => sample.pos; // move the play head to the front
    sample.length() => now; // play
}

for (0 => int i; i < 3; i++) {
    -1.0 => sample.rate; // set the play direction backward
    <<< sample.rate() >>>;
    sample.samples() => sample.pos; // move the play head to the end
    sample.length() => now; // play
}
*/

/*
SndBuf sample => dac;
string snare_samples[3];
me.dir() + "/audio/snare_01.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];
me.dir() + "/audio/snare_03.wav" => snare_samples[2];

while (true)
    for (0 => int i; i < snare_samples.size(); i++) {
        snare_samples[i] => sample.read;
        <<< sample.pos() >>>;
        0.5::second => now;
    }

*/

/*
SndBuf sample[3];
sample[0] => dac.left;
sample[1] => dac;
sample[2] => dac.right;
me.dir() + "/audio/snare_01.wav" => sample[0].read;
me.dir() + "/audio/snare_02.wav" => sample[1].read;
me.dir() + "/audio/snare_03.wav" => sample[2].read;

while (true)
    for (0 => int i; i < sample.size(); i++) {
        <<< sample[i].pos() >>>;
        0 => sample[i].pos;
        <<< sample[i].pos() >>>;
        0.5::second => now;
    }
*/

/*
SndBuf sample[3];
sample[0] => dac.left;
sample[1] => dac;
sample[2] => dac.right;
me.dir() + "/audio/snare_01.wav" => sample[0].read;
me.dir() + "/audio/snare_02.wav" => sample[1].read;
me.dir() + "/audio/snare_03.wav" => sample[2].read;

while (true) {
    Math.random2(0, sample.size()-1) => int which;
    0 => sample[which].pos;
    0.5::second => now;
}
*/

/*
SndBuf2 stereo_sample => dac;
me.dir() + "/audio/stereo_fx_01.wav" => stereo_sample.read;
stereo_sample.length() => now;
*/

SndBuf2 stereo_sample;
me.dir() + "/audio/stereo_fx_01.wav" => stereo_sample.read;
Gain bal[2];
stereo_sample.chan(0) => bal[0] => dac.left;
stereo_sample.chan(1) => bal[1] => dac.right;
0 => stereo_sample.pos; // set the playhead position to 0
float balance, volume_right;
-1.0 => balance;
stereo_sample.length() / 21 => dur length;
while (balance <= 1.0 ) {
    (balance + 1) / 2.0 => volume_right;
    volume_right => bal[0].gain;
    1 - volume_right => bal[1].gain;
    length  => now;
    0.1 +=> balance;
}