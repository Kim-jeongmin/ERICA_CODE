Machine.add(me.dir()+"useBPM1.ck");
2.0::second => now;
Machine.add(me.dir()+"useBPM2.ck");
3.0::second => now;
// rest
2.0::second => now;
while (true) {
    Machine.add(me.dir()+"useBPM2.ck");
    1.0 :: second => now;
    Machine.add(me.dir()+"useBPM3.ck");
    2.0 :: second => now;
}