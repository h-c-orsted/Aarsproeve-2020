class pin {
  PImage img = loadImage("pin.png");
  
  float w = 25;
  float h = w*3;
  float x, y;
  
  boolean hit = false;
  float rotation = 0;
  
  float approachAngle = PI;
  
  
  pin(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  
  
  void drawPin() {
    if (hit) {
      pushMatrix();
      translate(x+w/2, y+h);
      rotate(PI*approachAngle);
      image(img, -w, -h, w, h);
      popMatrix();      
    } else {
      image(img, x, y, w, h);
    }    
    
  }
  
  
  void checkCollision(ball ball) {
    float ballX = ball.x;
    float ballY = ball.y;
    float ballW = ball.w;
    if (!hit) {
      if (ballX+ballW > x && 
        ballX < x+w && 
        ballY+ballW > y+h/2 && 
        ballY < y+h) {
        hit = true;
        approachAngle = (ballX+(ballW/2)) / (x+(w/2)) + random(-0.3, 0.3);
        
      }
    }
  }
  
  
}
