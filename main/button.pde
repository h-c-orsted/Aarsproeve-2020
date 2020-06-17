class button {
    boolean isPressed;
    float posX, posY;
    float w, h;
    String text;


    button (float x, float y, float btnW, float btnH, String t) {
        posX = x;
        posY = y;
        w = btnW;
        h = btnH;
        text = t;
    }


    void registerClick(float xIn, float yIn) {
        if (xIn > posX && xIn < posX + w && yIn < posY + h && yIn > posY) {
            isPressed = !isPressed;
        }
    }

    void drawButton() {
        fill(0);
        rect(posX, posY, w, h);
        fill(255);
        textAlign(CENTER);
        textSize(18);
        text(text, posX + 50, posY + 30);
        textSize(15);
    }
    
    void releaseClick() {
        isPressed = false;
    }
  
}
