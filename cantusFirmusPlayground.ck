SinOsc s => JCRev r => dac;

// set up audio

0.6 => s.gain;
0.9 => r.gain;
0.1 => r.mix;

//cantus firmus
60 => int pitch; // JUST C FOR NOW



[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12] @=> int steps[];
[0, 2, 4, 5, 7, 9, 11] @=> int legalMajSteps[];

while(true){
    choosePitch() => int midiNote;
    Std.mtof(midiNote) => s.freq;
    200::ms => now;
}

fun int choosePitch(){
    while(true){
        //Math.random2(-7, 7) => int step;
        Math.floor(Std.fabs(Math.randomf() - Math.randomf()) * (1 + 7)) $ int => int step;
        if (direction() == 1) {
            step * -1 => step;
        }
        step + pitch => int choice;
        for(0 => int i; i < legalMajSteps.size(); i++){
            if (choice % 12 == legalMajSteps[i] && choice > 36 && choice < 100){
                choice => pitch;
                return pitch;
            }
        }
    }
}

fun int direction(){
    pitch => int location;
    if (location < 46){
        return 0;
    } else if (location > 62) {
        return 1;
    } else {
        return Math.random2(0, 1);
    }
}