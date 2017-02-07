class MenuScreen extends Buttons
{
  
  void render()
  {
    translate(width/2, height/2);
    
    update();
    stroke(0);
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
    fill(255);
    textSize(50);
    textFont(Silom);
    text("Play",playX+100,playY+65);
    text("End",endX+100,endY+65);
    textSize(40);
    text("How To Play",howToPlayX+25,howToPlayY+60);
    fill(255);
    textSize(67);
    text("MineSweeper",-215,-200);
  }//end render()
  
  void update() {
      if ( overEnd(endX + width /2 , endY + height /2, endSize, endSize/3) ) {
        endOver = true;
        playOver = false;
        howToPlayOver = false;
      } 
      else if ( overPlay(playX + width / 2, playY + height /2 , playSize, playSize/3) ) {
        playOver = true;
        endOver = false;
        howToPlayOver = false;
      } 
      else if ( overHowToPlay(howToPlayX + width / 2, howToPlayY + height /2 , howToPlaySize, howToPlaySize/3) ) {
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