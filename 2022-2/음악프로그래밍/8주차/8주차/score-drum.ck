BPM bpm;
bpm.tempo(120.0);

Machine.add(me.dir()+"kick.ck") => int kickID;
8.0 * bpm.quarter => now;
Machine.add(me.dir()+"snare.ck") => int snareID;
8.0 * bpm.quarter => now;
Machine.add(me.dir()+"hihat.ck") => int hatID;
Machine.add(me.dir()+"cowbell.ck") => int cowID;
8.0 * bpm.quarter => now;
Machine.add(me.dir()+"clap.ck") => int clapID;
8.0 * bpm.quarter => now;

<<< "Play with tempo" >>>;
80.0 => float new_tempo;
bpm.tempo(new_tempo);
8.0 * bpm.quarter => now;
2 *=> new_tempo;
bpm.tempo(new_tempo);
8.0 * bpm.quarter => now;

<<< "Gradually decrease tempo" >>>;
while (new_tempo > 60.0) {
    20 -=> new_tempo;
    bpm.tempo(new_tempo);
    <<< "tempo = ", new_tempo >>>;
    4.0 * bpm.quarter => now;
}

// pulls out instruments, one at a time
Machine.remove(kickID);
8.0 * bpm.quarter => now;
Machine.remove(snareID);
Machine.remove(hatID);
8.0 * bpm.quarter => now;
Machine.remove(cowID);
8.0 * bpm.quarter => now;
Machine.remove(clapID);