class scoreboard {
  ArrayList<pin> pins = new ArrayList<pin>();
  float x, y;
  float dotSize;
  
  scoreboard (float xpos, float ypos, float d, ArrayList<pin> pinsArray) {
    x = xpos;
    y = ypos;
    dotSize = d;
    pins = pinsArray;
  }
  
  
  
  void drawScoreboard() {
    // Generate 10 dots and align them correctly
    float rowHeight = dotSize * 1.3;    // Each row has 25 px between them
    float pinTotalWidth = dotSize + 10;    // Each pin is 25 px wide and creates a 10 px space to the right
    int currentPinIndex = 0;

    for (int i=0; i<4; i++) {    // Crete four rows of pins 
      int countPins = i+1;      // The count of pins in each row increses by 1 for each row/iteration
      float rowSpacing = ((pinTotalWidth * 4) - (countPins * pinTotalWidth)) / 2;    // Calculate the space to right and left for this row
      for (int j=0; j<countPins; j++) {    // This nested for loop creates each pin
        pin currentPin = pins.get(currentPinIndex);
        if (currentPin.hit) {
          fill(255,0,0);
        } else {
          fill(255);
        }
        
        circle(x + rowSpacing + j*pinTotalWidth, y + i*rowHeight, dotSize);
        currentPinIndex+=1;
      }
    }
  }
  
  
  
}
