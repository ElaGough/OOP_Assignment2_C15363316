//function to call stars
void callstars(){
  fill(random(50,255)); //randomizes colour of stars to make them flicker
  while (starList.size()>500) { //stops arrayList from getting too big
    starList.remove(0);
  }
  stars = new Stars(); //get a new star
  starList.add(stars); //add stars to arrayList
  
  for(int i =0 ; i < starList.size() ; i++){ //calling functions in class Stars
    starList.get(i).update();
    starList.get(i).render();
  }
}

class Stars
{
  PVector pos;
  PVector velocity;
  
  Stars()
  {
    pos      =  new PVector(width/2,height/2); //stars origionate from the centre of the screen
    velocity =  new PVector(random(-10,10),random(-10,10)); //randomises speed and direction of stars
  }
  
  void render()
  {
    ellipse(pos.x, pos.y, random(2,3), random(2,3)); //star
  }
  
  void update()
  {
    pos.add(velocity); //updating position
  }
  
}