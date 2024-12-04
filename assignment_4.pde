void setup() {
  
  size(800,400); //Set the canvas size to 800X400
  
}

void draw(){
  
 background(#7CD4FF); //set the background color to light blue using color selector to choose colors.
 rect(0,height-20,width,20); //draw the platform at the botton of the screen to simulate ground.
  
  
}

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
  
