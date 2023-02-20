public class Bass{
    
    BPM bpm;
    bpm.tempo(150);
    
    bpm.qn => dur qn;
    bpm.hn => dur hn;
    bpm.en => dur en;

    [
    "F3","C4","F3", "F3","C4","F3", "F3","C4","F3", "F3","C4","F3",
    "F3","C4","F3", "F3","C4","F3", "F3","C4","F3", "F3","C4","F3"
    ] @=> string bass[];

    [
    qn,  qn,  hn,   qn,  qn,  hn,   qn,  qn,  hn,   qn,  qn,  hn,
    qn,  qn,  hn,   qn,  qn,  hn,   qn,  qn,  hn,   qn,  qn,  hn
    ] @=> dur durs_bass[];
}