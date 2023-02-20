/*
adc => Gain g => dac;
10::second => now;

*/

/*
adc => Gain g => blackhole;
while (true) {
    if (g.last() > 0.9)
        <<< "Loud!!", g.last() >>>;
    samp => now;
}
*/

/*
PulseOsc p => dac;
0.5 => p.width;
while (true) {
    if (Math.random2(0,1))
        84.0 => p.freq; // E2
    else
        100.0 => p.freq; // G2
    1 => p.gain;
    0.09::second => now;
    0 => p.gain;
    0.06::second => now;
}
*/

/*
PulseOsc p => dac;
while (true) {
    Math.random2f(0.01,0.5) => p.width;
    if (Math.random2(0,1))
        84.0 => p.freq; // E2
    else
        100.0 => p.freq; // G2
    1 => p.gain;
    0.09::second => now;
    0 => p.gain;
    0.06::second => now;
}
*/
/*
SqrOsc clarinet => dac;
[48,50,52,53,55,57,59,60] @=> int scale[];
for (0 => int i; i < scale.size(); i++) {
    Std.mtof(scale[i]) => clarinet.freq;
    0.5::second => now;
}
*/

/*
SqrOsc clarinet => Envelope env => dac;
[48,50,52,53,55,57,59,60] @=> int scale[];
for (0 => int i; i < scale.size(); i++) {
    Std.mtof(scale[i]) => clarinet.freq;
    0.5 => env.target;
    0.2::second => env.duration;
    1 => env.keyOn;  
    0.3::second => now;
    1 => env.keyOff;
    0.2 :: second => now;
}
*/


/*
SawOsc violin => ADSR env => dac;
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);

[62,64,66,67,69,71,73,74] @=> int scale[];  // D major Scale
for (0 => int i; i < scale.size(); i++) {
    Std.mtof(scale[i]) => violin.freq;
    1 => env.keyOn;
    0.3::second => now;
    1 => env.keyOff;
    0.1::second => now;
}
*/

/*
SinOsc vibrato => SawOsc violin => ADSR env => dac;
2 => violin.sync;   
6.0 => vibrato.freq;
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);

[48,50,52,53,55,57,59,60] @=> int scale[]; // D major Scale
for (0 => int i; i < scale.size(); i++) {
    Std.mtof(scale[i]) => violin.freq;
    1 => env.keyOn;
    0.4::second => now;
    1 => env.keyOff;
    0.1::second => now;
}
1 => env.keyOn;
10.0 => vibrato.gain;
1.0::second => now;
1 => env.keyOff;
0.2::second => now;
*/

/*
SinOsc modulator => SinOsc carrier => ADSR env => dac;
2 => carrier.sync;   
500 => modulator.gain;
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);

[62,64,66,67,69,71,73,74] @=> int scale[];  // D major Scale
for (0 => int i; i < scale.size(); i++) {
    Std.mtof(scale[i]) => carrier.freq => modulator.freq;
    1 => env.keyOn;
    0.4::second => now;
    1 => env.keyOff;
    0.1::second => now;
}
*/

/*
SinOsc modulator => SinOsc carrier => ADSR env => dac;
2 => carrier.sync;   
1000 => modulator.gain;
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);

while (true) {
    Math.random2f(200.0,800.0) => carrier.freq;
    Math.random2f(200.0,1000.0) => modulator.freq;
    1 => env.keyOn;
    0.3::second => now;
    1 => env.keyOff;
    0.1::second => now;
}
*/

/*
Wurley epiano => dac;
while (true) {
    Math.random2f(100.0,300.0) => epiano.freq;    
    1 => epiano.noteOn;
    Math.random2f(0.2,0.5)::second => now;
    1 => epiano.noteOff;
    Math.random2f(0.05,0.1)::second => now;
}
*/

/*
Impulse imp => Delay str => dac;
str => str;
441.0::samp => str.delay;
0.98 => str.gain;
1.0 => imp.next;
2::second => now;
*/

/*
Noise noise => Delay str => dac;
str => str;
441.0::samp => str.delay;
0.98 => str.gain;

1.0 => noise.gain;
441.0::samp => now;
0.0 => noise.gain;

3.0 :: second => now;
*/

/*
Noise noise => Delay str => dac;
str => OneZero filter => str;
441.0::samp => str.delay;
0.98 => str.gain;

1.0 => noise.gain;
441.0::samp => now;
0.0 => noise.gain;

3.0 :: second => now;
*/

/*
Noise noise => ADSR pluck => Delay str => dac;
str => OneZero filter => str;
441.0::samp => str.delay;
0.98 => str.gain;
pluck.set(0.002::second, 0.002::second, 0, 0.01::second);

1 => pluck.keyOn;
3.0 :: second => now;
*/


/*
Impulse imp => dac;

while (true) {
    10.0 => imp.next;
    0.1 :: second => now;
}
*/

/*
Noise noise => ADSR pluck => DelayA str => dac;
str => OneZero lowPass => str;
pluck.set(0.002::second, 0.002::second, 0.0, 0.01::second);

while (true) {
    Math.random2f(110.0, 440.0)::samp => str.delay;
    1 => pluck.keyOn;
    0.3 :: second => now;
}
*/

/*
Impulse imp => ResonZ filter => dac;
100.0 => filter.Q; // Quality, amount of resonance

while (true) {
    Math.random2f(500.0,2500.0) => filter.freq;
    100.0 => imp.next;
    0.1 :: second => now;
}
*/

/*
// connect mic to speaker
adc => Gain input => dac;
1.0 => input.gain;
// walls and ceiling
input => Delay d1 => dac;
input => Delay d2 => dac;
input => Delay d3 => dac;
// delay loop
d1 => d1;
d2 => d2;
d3 => d3;
// set feedback/loss on all delay lines
0.6 => d1.gain => d2.gain => d3.gain;
// allocate memory and set delay lengths
0.06::second => d1.max => d1.delay;
0.08::second => d2.max => d2.delay;
0.10::second => d3.max => d3.delay;
// sit back and enjoy the room
while (true)
    1.0 :: second => now;
*/

/*
// Beware Feedback!
// Turn down the volume.
adc => PRCRev rev => dac;
// set reverb/dry mixture
0.05 => rev.mix;
// kick back and enjoy the space
while (true)
    1.0 :: second => now;
*/