// Create global ball object and an arraylist containing the pins
ball ball;
ArrayList<pin> pins = new ArrayList<pin>();

scoreboard scoreboard;

button restartButton;

// The track's specifications
float baneX = 350, baneY = 100;
float baneW = 200, baneH = 800;
float startLineY = 50;

int turns = 0;

PImage bane;
PImage man;
PImage background;


// Function to init the ball object
void initBall() {
  // Generate ball object
  ball = new ball(40, baneX, baneY, baneW, baneH, startLineY);  // Create ball object by specifying a diameter and passing the track's variables
}


// Function to place pins on the track
void setPins() {
  // Clear array in case the game is reset
  pins.clear();
  
  // Generate 10 pins and align them correctly
  int rowHeight = 25;    // Each row has 25 px between them 
  int pinTotalWidth = 25+10;    // Each pin is 25 px wide and creates a 10 px space to the right
  
  int frontRowY = 650;    // Offset pins to 650 px down the track
  for (int i=0; i<4; i++) {    // Crete four rows of pins 
    int countPins = i+1;      // The count of pins in each row increses by 1 for each row/iteration
    int rowPinsWidth = countPins * pinTotalWidth;    // Calculate pins width in the current row
    float rowSpacing = (baneW - rowPinsWidth) / 2;    // Calculate the space to right and left for this row
    for (int j=0; j<countPins; j++) {    // This nested for loop creates each pin
      pins.add(new pin(baneX + rowSpacing + j*pinTotalWidth, frontRowY + i*rowHeight));  // Createt the pin by knowing the index of the pin in the current row and multiply by a single pin's width
    }
  }
}




void setup() {
  size(900, 900);
  
  scoreboard = new scoreboard(750, 50, 20, pins);
  
  restartButton = new button(10, 10, 100, 40, "Restart");
  
  bane = loadImage("bowlingbane.png");  // Load image of the track
  man = loadImage("man.png");  //Load image of the man who absolutely didn't volunteer to go bowling
  background = loadImage("background.jpg");  // Load background
  
  initBall();
  setPins();
  
}




void draw() {
  clear(); 
  background(180);
  
  // Draw background
  image(background, 0, 0, 900, 900);
  
  
  
  // Draw scoreboard
  scoreboard.drawScoreboard();
  
  // Draw button
  restartButton.drawButton();
  
  // Draw the track
  image(bane, baneX, baneY, baneW, baneH);
  // Draw unfortunate man
  image(man, baneX+50, baneY+startLineY-100, 100, 100);
  
  
  // Draw start line
  rect(baneX, baneY+startLineY, baneW, 4);
    
  // Draw ball
  ball.aimBall(mouseX);
  ball.drawBall();
    
  // You get the chance to do a spare ;)
  if (turns == 0 && ball.ballRolled) {
    turns += 1;
    initBall();
  }
    
  // Draw each pin in arraylist
  for (int i=0; i<pins.size(); i++) {
    pin pin = pins.get(i);
    pin.drawPin();
  }
    
  // If ball is rolling, then check for collision with each pin
  if (ball.ballRolling) {
    for (int i=0; i<pins.size(); i++) {
      pin pin = pins.get(i);
      pin.checkCollision(ball);
    }
  }
    
  // Restart game on click
  if (restartButton.isPressed) {
    initBall();
    setPins();
    turns = 0;
  }
}



void mousePressed() {
  ball.rollBall(mouseX);
  restartButton.registerClick(mouseX, mouseY);
}

void mouseReleased() { 
  restartButton.releaseClick(); 
}
