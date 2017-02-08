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
    textSize(60);
    text("How To Play",-320,-200);
    textSize(20);
    text("The goal is to uncover all cells\nthat are not containing mines.",-320,-150);
    text("Left Click to select cells",-200,-50);
    text("Right Click to put down\nflags",-200,-0);
    text("Beware of mines!",-200,70);
    text("Use the numbers to detect the mines nearby",-320,150);
    textSize(50);
    text("Back",backX+50,backY+75);
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