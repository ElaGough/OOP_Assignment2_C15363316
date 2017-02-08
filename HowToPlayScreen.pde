class HowToPlayScreen extends Buttons
{
  
  boolean backOver = false;
  
  void render()
  {
    
    update();
    stroke(255);
    fill(100);
    
    //highlighting button
    if (backOver) {
      fill(Highlight);
    } else {
      fill(Color);
    }
    rect(backX,backY,backSize,100);  //rect(x1,y1,width,height,corners_ratio);
    
    //text
    textFont(Font);
    textAlign(LEFT);
    fill(255);
    textSize(60);
    text("How To Play",25,100);
    textSize(20);
    text("The goal is to uncover all cells\nthat are not containing mines.",30,150);
    text("Left Click to select cells",150,250);
    text("Right Click to put down\nflags",150,315);
    text("Beware of mines!",150,400);
    text("Use the numbers to detect the\nmines nearby .... Good Luck :)",30,480);
    textSize(50);
    text("Back",backX+50,backY+75);
    
    //symbols
    /* mine */
    stroke(255); fill(0);
    ellipse(80, 390, CELL_SIZE, CELL_SIZE); //Draws the mine
    /* flag */
    stroke(255); fill(#FF0000);
    ellipse(80, 315, CELL_SIZE, CELL_SIZE); //Draws the mine
    /* cursor */
    stroke(255); fill(255);
    triangle(70,225, 95,240, 91, 245);
    triangle(70,225, 90,230, 80,245);
  }//end render()
  
  void update() {
      if ( overBack(backX , backY , backSize, backSize/3) ) {
        backOver = true;
      } 
      else {
        backOver = false;
      }
  }//end update()
  
  //checking to see if mouse is at buttons
  boolean overBack(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }//end of overPlay()
}