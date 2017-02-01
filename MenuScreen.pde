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
  }
}