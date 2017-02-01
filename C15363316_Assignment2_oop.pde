//OOP Assignment 2 Game C15363316

int screenID = 1;

MenuScreen menu_screen;

void setup()
{
  //fullScreen();
  size(700,700);
  
  background(0, 200, 200);
  
  menu_screen = new MenuScreen();
}

void draw()
{
  if (screenID == 1 ) { 
    menu_screen.render();
    //println("menu_screen working");
  } 
}