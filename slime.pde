//Here is the class for slime. Basically, I would like to design a moving slime. 
//I will import a set of images for jumping slime in each frame. 
//Photoshop will be used to make the gif into images in each frame. And then import to processing, and add codes for activate the files.

class Slime{
  //set the pos, size and speed for slime.
 PVector position;
 PVector velocity;
 float w=40;
 float h=40;
 float gravity=0.5;
 
 //I design to let the slime jum by clicking space, the maximum jumping times are limited to 2 times. 
 float jumHeight=-10;
 int jumpCount=0;
 int maxJumps=2;
 
 //set the function to initialise the variables and condition for slime. 
 Slime(float x, float y){
   position=new PVector(x,y);// position of slime
   velocity=new PVector(0,0);//no speed required 
 
 }
  
void update(){
  //add gravity and position to slime
  //apply gravity
  velocity.y=velocity.y+gravity;
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
 
}

void display(){
  
  
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
  
  if(key==' '&&isPresedded&&jumpCount<maxJumps){
   velocity.y=jumpHeight; //jump with space
   jumpCount=jumpCount+1;
  }
}
