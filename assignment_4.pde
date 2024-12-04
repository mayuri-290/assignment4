//declare variables from classes
Slime slime;
Obstacle obstacle;

//set boolean to activate and switch the conditions of start, game over, and the start page for later use in if statement.
boolean gameStart=false;
boolean gameOver=false;
boolean startPage=true;

//set a score system for this game. The aim is to track players progress.
//Also for late use: I will set a winning condition. So score is needed.
int score=0; 

void setup() {
  size(800,400); //Set the canvas size to 800X400
  //the initial position of slime need to be added in setup. Set to specific position.
  //check the function in slime class.
  slime=new Slime(width/4,height-60);//starting position of slime.
  obstacle=new Obstacle(width,randomAppear(),40,40,"banana.png");//position of obstacles.
}

void draw(){
 background(#7CD4FF); //set the background color to light blue using color selector to choose colors.
 rect(0,height-20,width,20); //draw the platform at the botton of the screen to simulate ground.
 

  if(gameOver==false){
    background(#7CD4FF);//set backgournd color again, if the game is not over.
    fill(100);
    rect(0,height-20,width,20);
}

//display the score
 fill(0);
 textSize(35);
 text("Score:"+score,111,50);//position of text

//update and display of slime when the game start.
  if(gameStart){
    slime.update();
    slime.display();
    obstacle.update();
    obstacle.display();
    //the score should increase as the game progresses.
    score=score+1;
  }
  
//check collision between slime and obstacles.
if(obstacle.collision(slime)){
  gameOver=true; //when the slime touches the obstacles, activate game over!
}
  

  //set the booleans 
  //show the start page if the game hasn't started
  if(startPage==true){
    startScreen();
  }
  //set winning condition here!
  //if the player exceeds 1500 points, display win screen.
  if(score>=1500){
    displayWin();
  }

//set the losing condition.
//if the game is over, show the game over screen.
  if(gameOver==true){
    displayGameOver();
  }
  
}

//------------------------------------------------------------------------------------------------------------------------------//
//I will design the start screen first by putting it in a function to make the later process easier. 
//basically shows the welcome message and start button.

void startScreen(){
  //welcome screen
  fill(#7CD4FF); //set the background color to light blue.
  rect(0,0,width,height); //draw a rectangle to cover the screen when meet certain conditions
  
  fill(0); //text color is black.
  textAlign(CENTER,CENTER); //The text should be in the center.
  textSize(40);
  text("Welcome to Slime's Adventure!", width/2,height/2-40); //Detailed information about text and it's position.
  
  //start button
  fill(200); //set the button color to light grey.
  noStroke();
  rect(width/2-100,height/2+20,200,50,10); //this is the rectangle for the button layout.
  
  fill(0); //text color should be black.
  textSize(20);
  text("START",width/2,height/2+45); //Detailed information about text and it's position.
}

//Now design the game over and wining screen for this project. 

void displayGameOver(){
  fill(#74C4FF); //set the game over screen into dark blue
  rect(0, 0, width, height); //design a rectangle to cover the whole screen.
  fill(0); // black text
  textAlign(CENTER,CENTER);
  textSize(32);
  text("Game Over! Press R to restart!", width/2,height/2); //Detailed information about text and it's position.
}

void displayWin(){
  fill(#FAFF74);
  rect(0, 0, width, height);
  fill(0); // black text
  textAlign(CENTER, CENTER);
  textSize(32);
  text("You Win! Press R to replay the game!", width / 2, height / 2);
}

//design the reset function:
void resetGame(){
  slime.reset(width/4,height-60);// reset slime to start position.
  gameOver=false;
  score=0;// set the score to 0.
  gameStart=true;//make game start to true to activate game play.
  obstacle.reset(0,height);// reset obstacles to start position.
}

//------------------------------------------------------------------------------------------------------------------------------//
//the key and mouse inputs set for this game.

//according to the control input in slime class, this is to handle slime movement and jumping.
void keyPressed(){
  slime.slimeControl(key,true);
}

//Mouse click to start the game when start button is clicked.
//If the game hasn't started, check if the mouse clocked the start button.
void mousePressed(){
  if(gameStart==false){
    if(mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2+20&&mouseY<height/2+70){
      gameStart=true;
      startPage=false;
    }
  }
}

//key released function need to be set to handle slime movement and jumping. 
//when releasing the key, the slime should stop moving.
void keyReleased(){
  slime.slimeControl(key,false);
  if(gameOver&&key=='r'){
    resetGame();
  }
}
//------------------------------------------------------------------------------------------------------------------------------//  

//After adding the random generator of obstacles, I need a function here in the main tab to generate and activate the obstacles within a specific range.
float randomAppear(){
  return height-60-random(0,100);
}
  
  
