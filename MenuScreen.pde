class MenuScreen extends Buttons
{
  
  void render()
  {
    
    update();
    stroke(60);
    fill(100);
    
    //highlighting button
    if (playOver) {
      fill(Highlight);
    } else {
      fill(Color);
    }
    rect(playX,playY,playSize,100);  //rect(x1,y1,width,height,corners_ratio);
    
    if (endOver) {
      fill(Highlight);
    } else {
      fill(Color);
    }
    rect(endX,endY,endSize,100);
    
    if (howToPlayOver) {
      fill(Highlight);
    } else {
      fill(Color);
    }
    rect(howToPlayX,howToPlayY,howToPlaySize,100);
  
  //text
    textAlign(LEFT);
    fill(255);
    textSize(10);
    textFont(Font);
    text("Play",playX+55,playY+75);
    text("End",endX+75,endY+75);
    textSize(25);
    text("How To Play",howToPlayX+15,howToPlayY+65);
    fill(255);
    textSize(60);
    text("MineSweeper",30,140);
    textSize(10); fill(60);
    text("© Ela Gough C15363316 OOP Assignment 2",150, 680);
  }//end render()
  
  void update() {
      if ( overEnd(endX , endY , endSize, endSize/3) ) {
        endOver = true;
        playOver = false;
        howToPlayOver = false;
      } 
      else if ( overPlay(playX , playY , playSize, playSize/3) ) {
        playOver = true;
        endOver = false;
        howToPlayOver = false;
      } 
      else if ( overHowToPlay(howToPlayX , howToPlayY , howToPlaySize, howToPlaySize/3) ) {
        playOver = false;
        endOver = false;
        howToPlayOver = true;
      } 
      else {
        endOver = playOver = howToPlayOver = false;
      }
    }//end update()
    
    //checking to see if mouse is at buttons
  boolean overPlay(float x, float y, float w, float h) {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }//end of overPlay()
  
  boolean overEnd(float x, float y, float w, float h)  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }//end of overEnd()
  
  boolean overHowToPlay(float x, float y, float w, float h)  {
    if (mouseX >= x && mouseX <= x+w && 
        mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }//end of overHowToPlay()
  
}//end of class MenuScreen