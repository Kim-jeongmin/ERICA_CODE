public class Melody{

    BPM bpm;
    bpm.tempo(150);

    bpm.qn => dur qn;
    bpm.hn => dur hn;
    bpm.en => dur en;

    [
    "F4","G4","A4","F4",            "F4","G4","A4","F4",
    "A4","Bb4","C5",                "A4","Bb4","C5",
    "C5","D5","C5","Bb4","A4","F4", "C5","D5","C5","Bb4","A4","F4",
    "F4","C4","F4",                 "F4","C4","F4"
    ] @=> string melody[];

    [
    "F4","G4","A4","F4",            "F4","G4","A4","F4",
    "A4","Bb4","C5",                "A4","Bb4","C5",
    "C5","D5","C5","Bb4","A4","F4", "C5","D5","C5","Bb4","A4","F4",
    "A4","E4","A4",                 "A4","E4","A4"
    ] @=> string melody_high[];

    [
    qn,  qn,  qn,  qn,              qn,  qn,  qn,  qn,
    qn,  qn,  hn,                   qn,  qn,  hn,
    en,  en,  en,  en,   qn,  qn,   en,  en,  en,  en,   qn,  qn,
    qn,  qn,  hn,                   qn,  qn,  hn
    ] @=> dur durs[];
}
