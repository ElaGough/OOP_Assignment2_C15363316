//OOP Assignment 2 Game C15363316

int screenID = 1;

MenuScreen menu_screen;

void setup()
{
  //fullScreen();
  size(700,700);
  
  background(0, 0, 0);
  
  menu_screen = new MenuScreen();
}

void draw()
{
  if (screenID == 1 ) { 
    menu_screen.render();
    //println("menu_screen working");
  } 
}

void mousePressed() {
  //menu_screen
  if (screenID == 1) {
    //play button => go to game
    if(menu_screen.playOver == true) {
      screenID = 2;
    }
    //how to play button => go to how_to_play_screen
    if(menu_screen.howToPlayOver == true) {
      screenID = 3;
    }
    //end button => end game
    if(menu_screen.endOver == true) {
      System.exit(0);
    }
  }
  
  //game_screen
  if (screenID == 2) {
    //play game :)
  }
}