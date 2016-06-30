// A class to calculate an infinite cantus firmus line
// Building up to a species counterpoint simulator
// Mocking up in chucK, because its fun!

// Copyright Jason Post
// www.jasonpost.info

public class CantusFirmus {
    
    // 1 = up, 0 = down
    1 => int direction;
    
    //direction counter
    //resets when direction moves
    0 => int directionCounter;
    
    // leap timer
    // resets once a leap occurs
    // the higher the number, the more likely a leap is to occur
    0 => int leapCounter;
    
    // Pitches
    0 => int previousPitch;
    int currentPitch, nextPitch;
    
    // Peaks and troughs
    // We need to know the interval outline
    int highPoint;
    int LowPoint;
    
    // Major scale steps - 0 = tonic, 11 = leading tone
    [0, 2, 4, 5, 7, 9, 11] @=> int legalMajSteps[];
    // Minor scale steps (melodic minor)
    [0, 2, 3, 5, 7, 8, 11] @=> int legalMinSteps[];
    
  
    fun int getBasicPitchValue(int pitch){
        while ((pitch-12) > 0){
            pitch - 12 => pitch;
        }
        return pitch;
    }
    
    fun void incrementDirectionCounter(){
        directionCounter++;
    }
    
    fun void incrementLeapCounter(){
        leapCounter++;
    }
    
    
    fun void changeDirection(){
        if (direction == 1){
            0 => direction;
        } else {
            1 => direction;
        }
    }
    
    // Pitch getters and setters
    
    fun int getPreviousPitch(){
        return previousPitch;
    }
    
    fun void setPreviousPitch(int pitch){
        pitch => previousPitch;
    }
    
    fun int getCurrentPitch(){
        return currentPitch;
    }
    
    fun void setCurrentPitch(int pitch){
        pitch => currentPitch;
    }
    
    fun int getNextPitch(){
        return nextPitch;
    }
    
    fun void setNextPitch(int pitch){
        pitch => nextPitch;
    }
    
    
    // Move pitches around, calculate next pitch
    
    fun void createNextState(){
        
        //shuffle next pitches along
        setPreviousPitch(getCurrentPitch());
        setCurrentPitch(getNextPitch());
        
        //formulate nextPitch
        if (direction == 1){
            step(getCurrentPitch(), 1);
        } else {
            step(getCurrentPitch(), 0);
        }
   
    }
    
    // calculate next step
    
    fun void step(int pitch, int direction){
        
        int newPitch;
        
        
        setNextPitch(newPitch);
    }
    
    
}