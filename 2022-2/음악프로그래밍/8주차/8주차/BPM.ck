public class BPM { // Beats Per Minute
    static dur quarter; // 1
    static dur one_8th; // 1/2
    static dur one_16th; // 1/4
    static dur one_32nd; // 1/8

    fun void tempo(float beat) { // beat in BPM
        60.0 / beat => float spb; // seconds per beat  
        spb::second => quarter;
        quarter / 2.0 => one_8th;
        quarter / 4.0 => one_16th;
        quarter / 8.0 => one_32nd;
    }
}