class ball {
  PImage img = loadImage("ball.png");
  boolean ballRolling = false;
  boolean ballRolled = false;
  
  // The ball's specs
  float x, y, w;  
  
  // The track's specs which is used when rolling the ball
  float baneX, baneY;
  float baneW, baneH;
  float startLineY;
  
  float rotation = 0;
  
  // Draw the ball by placing the image
  void drawBall() {
    if (ballRolling && !ballRolled) {
      // Rolling animation
      pushMatrix();
      translate(x+w/2, y+w/2);
      rotate(rotation);
      image(img, -w/2, -w/2, w, w);
      popMatrix();
      
      // Add to rotation
      rotation += 5;
      // Move ball 6 px each loop
      y+=10;
      
      if (y > 1000) ballRolled = true;
    } else {
      image(img, x, y, w, w); 
    }
    
  }
  

  // Constructor for the ball. Retrieve info and save them for later
  ball(float ballWidth, float baneXPos, float baneYPos, float baneWidth, float baneHeight, float startLineYPos) {
    w = ballWidth;
    baneX = baneXPos;
    baneY = baneYPos;
    baneW = baneWidth;
    baneH = baneHeight;
    startLineY = startLineYPos;
    
    x = baneX+50;
    y = baneY + startLineY/2+2;
    
    drawBall();
  }
  
  
  // If the mouse is inside the track, aim the ball along the start line
  void aimBall(float mouseXPos) {
    if (!ballRolling && (mouseXPos > baneX+w/2 && mouseXPos < baneX+baneW-w/2)) {
      x = mouseXPos - (w/2);
      y = baneY + startLineY/2+2;
      drawBall();
    }       
  }
  
  
  void rollBall(float mouseXPos) {
    if (!ballRolling && (mouseXPos > baneX+w/2 && mouseXPos < baneX+baneW-w/2)) {
      ballRolling = true;
    }
  }
  
}
