//declare variables from classes
Slime slime;

//set boolean to activate and switch the conditions of start, game over, and the start page for later use in if statement.
boolean gameStart=false;
boolean gameOver=false;
boolean startPage=true;

void setup() {
  
  size(800,400); //Set the canvas size to 800X400
  
  //the initial position of slime need to be added in setup. Set to specific position.
  //check the function in slime class.
  slime=new Slime(width/4,height-60);//starting position of slime.
}

void draw(){
  
 background(#7CD4FF); //set the background color to light blue using color selector to choose colors.
 rect(0,height-20,width,20); //draw the platform at the botton of the screen to simulate ground.
 fill(100);
  
  //update and display of slime when the game start.
  if(gameStart){
    slime.update();
    slime.display();
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
//------------------------------------------------------------------------------------------------------------------------------//
//the key and mouse inputs set for this game.
void keyPressed(){
  slime.slimeControl(key,true);
}
  
  
