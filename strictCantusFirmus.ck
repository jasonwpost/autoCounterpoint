public class CantusFirmus {
    
    // 1 = up, 0 = down
    1 => int direction;
    
    //direction counter
    //resets when direction moves
    0 => int directionCounter;
    
    // Pitches
    0 => int previousPitch;
    int currentPitch, nextPitch;
    
    //Peaks and troughs
    //We need to know the interval outline
    int highPoint;
    int LowPoint;
    
    //Major scale steps - 0 = tonic, 11 = leading tone
    [0, 2, 4, 5, 7, 9, 11] @=> int legalMajSteps[];
    //Minor scale steps (melodic minor)
    [0, 2, 3, 5, 7, 8, 11] @=> int legalMinSteps[];
    
    
    
    fun incrementDirectionCounter(){
        diretionCounter++;
    }
    
    
    fun changeDirection(){
        if (direction == 1){
            direction = 0;
        } else {
            direction = 1;
        }
    }
    
    // Pitch getters and setters
    
    fun int getPreviousPitch(){
        return previousPitch;
    }
    
    fun setPreviousPitch(int pitch){
        pitch => previousPitch;
    }
    
    fun int getCurrentPitch(){
        return currentPitch;
    }
    
    fun setCurrentPitch(int pitch){
        pitch => currentPitch;
    }
    
    fun int getNextPitch(){
        return nextPitch;
    }
    
    fun setNextPitch(int pitch){
        pitch => nextPitch;
    }
    
    
    
    
    
    
}


