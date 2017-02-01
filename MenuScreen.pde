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
    fill(0);
    textSize(50);
    text("Play",playX+100,playY+65);
    text("End",endX+100,endY+65);
    textSize(40);
    text("How To Play",howToPlayX+25,howToPlayY+60);
    fill(0);
    textSize(67);
    text("MineSweeper",-215,-200);
  }//end render()
}