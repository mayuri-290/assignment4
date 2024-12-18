//Here is the class for obstacles.
//I will import the image for obstacle into the game.
//The obstacle will move in random heights.
//The speed of moving obstacles will be faster throughout the gameplay. 
//obstacle image reference website: https://x.com/Mr_Pixelor/status/1133881892929974272

class Obstacle{
  PVector position;
  PVector size;
  float speed=5;
  PImage obstacleImage;
  
  //array of obstacles image (the obstacle's name is banana.
  String[] images={"banana.png"}; 
  
  //create a function to initialize the position, size.
  Obstacle(float x,float y,float sx, float sy, String imagePath){
    position=new PVector(x,y); //position of banana
    size=new PVector(sx,sy); //the size of banana
    obstacleImage=loadImage(imagePath); //activate the obstacle image"banana.png" that is imported to the project.
  }
  
void update(){
  //increase the obstacle's speed based on the score. When the score is higher, the speed will also increase.
  speed=5+score/100; // speed increases by 0.01 for every 100 scre points.
  position.x=position.x-speed; //move the obstacles to left.
  
  //I need to reset the obstacles position, let it appear at the right side of the screen again.
  if(position.x+size.x<0){
    position.x=width;
    position.y=randomAppear(); //set the random height.
  }
}

//display the obstacle on the screen based on the imported png.
void display(){
  image(obstacleImage,position.x,position.y,size.x,size.y);//activate the obstacle image.
}

//check the collision, the slime's x,y,w,h should touch the x,y,w,h of obstacles to lose the game. 
boolean collision(Slime slime){
  return slime.position.x<position.x+size.x&&slime.position.x+slime.w>position.x&&slime.position.y<position.y+size.y&&slime.position.y+slime.h>position.y;
}

//Set a random appearing for obstacles, it should randomly appear from the right side.
  float randomAppear(){
    return height-60-random(0,100); //make sure the random appearing height should be in the range of jumpable range.
  }

//reset the obstacle's position and speed when the game starts.
void reset(float x,float y){
  position=new PVector(x,y);
  speed=5;//reset the speed to initial set value.
}
}
