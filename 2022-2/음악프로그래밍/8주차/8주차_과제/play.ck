BPM bpm;
bpm.tempo(150);

bpm.qn => dur qn;

Melody mel;
Bass ba;

mel.melody @=> string melody[];
mel.melody_high @=> string melody_high[];
mel.durs @=> dur durs[];

ba.bass @=> string bass[];
ba.durs_bass @=> dur durs_bass[];

Rhodey melody1 => dac;
Rhodey melody2 => dac;

Rhodey bass1 => dac;
Tool tool;

spork ~ tool.play(melody1, melody, durs);
spork ~ tool.play(melody2, melody_high, durs);

spork ~ tool.play(bass1, bass, durs_bass);

qn * 16 => now;