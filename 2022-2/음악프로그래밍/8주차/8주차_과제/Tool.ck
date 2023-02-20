public class Tool {

    fun void play(StkInstrument instrument, string notes[], dur durs[]) {
        for (0 => int i; i < notes.size(); i++)
            playnote(instrument, notes[i], durs[i]);
    }

    fun void playnote(StkInstrument instrument, string note, dur duration) {
        Std.mtof(ntom(note)) => instrument.freq;
        if (note != "REST")
            0.5 => instrument.noteOn;
        duration => now;
        0.5 => instrument.noteOff;
    }

    fun int ntom(string name) { // note name to MIDI number
        [21,23,12,14,16,17,19] @=> int notes[]; // A0,B0,C0,D0,E0,F0,G0
        name.charAt(0) - 65 => int base; // A=0,B=1,C=2,D=3,E=4,F=5,G=7
        notes[base] => int note;
        if (0 <= base && base <= 6) {
            if (name.charAt(1) == '#' || name.charAt(1) == 's') // sharp
                notes[base] + 1 => note;
            if (name.charAt(1) == 'b' || name.charAt(1) == 'f') // flat
                notes[base] - 1 => note;
        }
        else
            <<< "Illegal Note Name!" >>>;
        name.charAt(name.length()-1) - 48 => int oct; // 0, 1, 2, ..., 9
        if (0 <= oct && oct <= 9) {
            12 * oct +=> note;
            return note;
        }
        else
            <<< "Illegal Octave!" >>>;
    }

}