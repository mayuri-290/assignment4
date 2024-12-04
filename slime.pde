//Here is the class for slime. Basically, I would like to design a moving slime. 
//I will import a set of images for jumping slime in each frame. 
//Photoshop will be used to make the gif into images in each frame. And then import to processing, and add codes for activate the files.
//slime image reference website: https://www.pixil.art/art/jumpy-slime-sprite-58c997e79cb2e56

class Slime{
  //set the pos, size and speed for slime.
 PVector position; //pos of slime (x and y coordinates)
 PVector velocity; //movement speed in x and y 
 float w=40; //size of slime (w and h)
 float h=40;
 float accelerationGravity=0.5; // control the falling(gravity) of slim while jumping
 
 //I design to let the slime jum by clicking space, the maximum jumping times are limited to 2 times. 
 float jumpHeight=-10;
 int jumpCount=0;
 int maxJumps=2;
 
 //frame countrol for slime images each frame.
 PImage[]slimeFrames; //use array to store all the slime movement frame images.
 int currentFrame=0; //Track the current frame of slime animation.
 int frameDelay=6; //delay to control the animation.
 int frameTracker=0; //track the switching frames.
 
 //set the function to initialise the variables and condition for slime. 
 Slime(float x, float y){
   position=new PVector(x,y);// position of slime
   velocity=new PVector(0,0);//no speed required 
 
 //the frames need to be stored and used in slimeFrame array, there are total of 12 frames I added. 
 slimeFrames=new PImage[12];
 //a loop is needed here to perform the animation, start from slime1.png-slime2.png-slime3.png......ect.
 for(int i=0;i<12;i++){
   slimeFrames[i]=loadImage("slime"+(i+1)+".png");//an arithmetic function is needed here to realize the loop of each frames.
 }
 }
  
void update(){
 //add gravity and position to slime
 //apply gravity
  velocity.y=velocity.y+accelerationGravity;
  position=position.add(velocity);
  
 //set a limitation, so that the slime don't fall below the platform
  if(position.y>=height-60){
    position.y=height-60;
    velocity.y=0;
    jumpCount=0;// reset the jump count
}

 //also need to prevent it moves out screen horizontally.
 //constrain is needed
 position.x=constrain(position.x,0,width-w);
 
 //frameCount also need to be updated for the animation
 frameTracker=frameTracker+1;
 
 //change the frame based on the frame tracker.
 if(frameTracker>=frameDelay){
   frameTracker=0; //reset
   currentFrame=currentFrame+1;//move to the next frame.
 
 //if the current frame reaches the last frame, start over again.
 if(currentFrame>=slimeFrames.length){
   currentFrame=0; //reset frame to activate loop effect.
 }
 }
}

void display(){
  //display the slime animation frame
  image(slimeFrames[currentFrame],position.x,position.y,w,h);
}
  
 //control input is needed to control the slime. I will use char this time. It will be easier to modify changes in main tab.
 //since it is a horizontal game, the slime will basically move left and right using "a" and "d".
  void slimeControl(char key,boolean isPressed){
   if(key=='a'){
     if(isPressed){
       velocity.x=-5; //move left
     }else{
       velocity.x=0;//don't move
     }
  }
  
  if(key=='d'){
    if(isPressed){
      velocity.x=5; //move right
    }else{
      velocity.x=0; //don't move
    }
  }
  
  if(key==' '&&isPressed&&jumpCount<maxJumps){
   velocity.y=jumpHeight; //jump with space
   jumpCount=jumpCount+1;
  }
}

//reset the slime's position when the game is reset.
void reset(float x,float y){
  position=new PVector(x,y);//position of slime
  velocity.x=0;//reset every variables to 0.
  velocity.y=0;
  
  jumpCount=0;
  currentFrame=0;
}
}
