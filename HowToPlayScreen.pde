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
    fill(255);
    textSize(10);
    textFont(Font);
    text("Back",backX+75,backY+70);
  }//end render()
  
  void update() {
      if ( overBack(endX + width /2 , endY + height /2, endSize, endSize/3) ) {
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