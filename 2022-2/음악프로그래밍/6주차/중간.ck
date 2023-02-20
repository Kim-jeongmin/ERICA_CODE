SndBuf2 stereo_sample => dac;
me.dir() + "audio/stereo_fx_01.wav" => stereo_sample.read;
stereo_sample.length() => now;