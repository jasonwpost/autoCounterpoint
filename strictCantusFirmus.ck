SinOsc s => JCRev r => dac;

// set up audio

0.6 => s.gain;
0.9 => r.gain;
0.1 => r.mix;


// direction
// 1 = up, 0 = down
1 => int direction;

//Major scale steps - 0 = tonic, 11 = leading tone
[0, 2, 4, 5, 7, 9, 11] @=> int legalMajSteps[];

