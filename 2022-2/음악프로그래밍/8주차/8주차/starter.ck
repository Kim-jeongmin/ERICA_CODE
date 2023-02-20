BPM bpm;
bpm.tempo(300);

//Machine.add(me.dir()+"BPM.ck");
Machine.add(me.dir()+"useBPM1.ck");
bpm.quarter * 10 => now;
Machine.add(me.dir()+"useBPM2.ck");