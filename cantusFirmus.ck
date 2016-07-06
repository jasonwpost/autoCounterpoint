// A class to calculate an infinite cantus firmus line
// Building up to a species counterpoint simulator
// Mocking up in chucK, because its fun!

// Copyright Jason Post
// www.jasonpost.info

public class CantusFirmus {
    
    //*** Global variables ***//
    
    
    // 1 = up, 0 = down
    1 => int direction;
    
    //direction counter
    //resets when direction moves
    0 => int directionCounter;
    
    // leap timer
    // resets once a leap occurs
    // the higher the number, the more likely a leap is to occur
    0 => int leapCounter;
    
    //boolean for if a leap has just happened, if so, we need to change direction
    0 => int hasLeaped;
    
    // Pitches
    0 => int previousPitch;
    int currentPitch, nextPitch;
    
    // Peaks and troughs
    // We need to know the interval outline
    int highPoint;
    int lowPoint;
    
    // Major scale steps - 0 = tonic, 11 = leading tone
    [0, 2, 4, 5, 7, 9, 11] @=> int legalMajSteps[];
    // Minor scale steps (melodic minor)
    [0, 2, 3, 5, 7, 8, 11] @=> int legalMinSteps[];
    
    // key
    
    0 => int key; //initialise as C
    0 => int mode; // 0 = major, 1 = minor
    
    //*** Pitch functions ***//
    
    // minus 12 until we get a number between 0 and 11, which gives us the pitch value
    
    fun int getBasicPitchValue(int pitch){
        while ((pitch-12) >= 0){
            pitch - 12 => pitch;
        }
        return pitch;
    }
    
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
    
    fun void setKey(int setKey){
        if (setKey < 12 && setKey > 0){
            setKey => key;
        }
    }
    
    fun int getKey(){
        return key;
    }
    
    //*** Movement functions  ***//
    
    fun void incrementDirectionCounter(){
        directionCounter++;
    }
    
    fun void incrementLeapCounter(){
        leapCounter++;
    }
    
    //find which degree of current mode to which current pitch belongs
    
    fun int findCurrentDegree(){
        getBasicPitchValue(getCurrentPitch()) => int tempPitch;
        tempPitch-key => tempPitch;
        if (mode == 0){
            for(0 => int i; i < legalMajSteps.size(); i++){
                if (tempPitch == legalMajSteps[i]){
                    return i;
                }
            }
        } else {
            for(0 => int i; i < legalMinSteps.size(); i++){
                if (tempPitch == legalMinSteps[i]){
                    return i;
                }
            }
        }     
    }
        
        fun void changeDirection(){
            if (direction == 1){
                0 => direction;
            } else {
                1 => direction;
            }
        }
        
        // calculate next pitch by a step
        
        fun int step(int pitch){
            
            int newPitch;
            int newDegree;
            
            if (hasLeaped){
                0 => hasLeaped;
                changeDirection();
                findCurrentDegree() => int currentDegree;
                if (direction == 1){
                    currentDegree + 1 % 7 => newDegree;
                } else {
                    if (currentDegree == 0){ 7 => currentDegree;}
                    currentDegree - 1 % 7 => newDegree;
                }
                if (mode == 0){
                    return legalMajSteps[newDegree];
                } else {
                    return legalMinSteps[newDegree];
                }
            } else { //** The tough bit.. **//
                leapCounter++;
                return 0;
            }
            
            setNextPitch(newPitch);
        }
        
        
        //Must refactor these two functions…
        
        fun void calNewHighPoint(){
            
            0 => int found; 
            int newHigh;
            
            while(!found){
                //highPoint +- a few steps
                
                //make sure the result is not a tritone
                if (Math.abs(newHigh-lowPoint) / 6 != 0){
                    1 => found;
                }
            }
            newHigh => highPoint;
        }
        
        fun void calNewLowPoint(){
            
            0 => int found; 
            int newLow;
            
            while(!found){
                //lowPoint +- a few steps
                
                //make sure the result is not a tritone
                if (Math.abs(highPoint-newLow) / 6 != 0){
                    1 => found;
                }
            }
            newLow => lowPoint;
        }
        
        // Move pitches around, calculate next pitch
        
        fun void createNextState(){
            
            //shuffle next pitches along
            setPreviousPitch(getCurrentPitch());
            setCurrentPitch(getNextPitch());
            
            //formulate nextPitch
            step(getCurrentPitch());
            
        }
        
        
    }