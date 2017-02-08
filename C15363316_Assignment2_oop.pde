//OOP Assignment 2 Game C15363316

int screenID = 1;

MenuScreen menu_screen; //declares menu screen
MineSweeper mine_sweeper; //declares mine sweeper
HowToPlayScreen htp_screen; //declares how to play screen
Stars stars; //declares stars

//array list for stars created so they are infinetly generated
ArrayList<Stars> starList = new ArrayList<Stars>(); 

PFont Font;

//Global variables for Game
final int SCREEN_SIZE = 700; //Dimensions of the screen
final int MENU_HEIGHT = SCREEN_SIZE/15; //Height of the menu
boolean gameOverState = false;
float gameTimer = 0; //The game time so far (exact)
int clockMax = 720000; //The maximum time on the clock

//Variables pertaining to the cells
PFont cellFont; //Creates a variable to hold the cell font
Cell[][] cellAssignments; //Array holding the co-ordinates of the cells
final int CELL_SIZE = SCREEN_SIZE/35; //Size of the cell
final int TOTAL_MINES = 100; //Total number of mines on the grid
int flagsLeft = TOTAL_MINES; //The total number of flags


void setup()
{
  //fullScreen();
  size(700,700); //size of screen
  background(0, 0, 0); //black background
  
  Font = createFont("PressStart2P-Regular.ttf",50); //font loaded in
  
  //initilases classes
  menu_screen = new MenuScreen();
  mine_sweeper = new MineSweeper();
  htp_screen = new HowToPlayScreen();
  stars = new Stars(); //initilases stars
  
  //Rendering the game
    spawnNewLevel(); //Spawns a new level and renders game
  /*if (screenID == 2) {
    //play game :)
    //Rendering the game
    spawnNewLevel(); //Spawns a new level
  }*/
}

void draw()
{  
  /****************************************************/
  //menu screen
  if (screenID == 1 ) { 
    //background
    noStroke();
    fill(0);
    rect(0,0,700,700);
    //stars background
    callstars();
    //buttons and layount for starting screen
    menu_screen.render();
    //println("menu_screen working");
  } 
  
  /****************************************************/
  //game_screen
  if (screenID == 2) { //Allows the game to continually run provided player has pressed play
    //play game :)
    background(0);
    stroke(0);
    
    //always running this
    for (int i = 0; i < cellAssignments.length; i++) //Gets the x co-ordinate of each cell
    {
      for (int j = 0; j < cellAssignments[0].length; j++)  //Gets the y co-ordinate of each cell
      { 
        if (!cellAssignments[i][j].perimeterCleared && cellAssignments[i][j].openCell && !cellAssignments[i][j].mineCell && cellAssignments[i][j].adjacentMines == 0) 
        {
          clearSurroundingCells(i, j); //Clears unflagged surrounding cells
          cellAssignments[i][j].perimeterCleared = true; //The perimeter has been cleared
        }
        if (cellAssignments[i][j].mineCell && cellAssignments[i][j].openCell)
        {
          gameOverState = true; //If a mine is ever open, the game is done
        }
        cellAssignments[i][j].updateCell(); //Renders the cell
      }
    }
  
    if (gameOverState) //If the user has lost (Game Over)
    { 
      textFont(Font);
      fill(255, 255, 255, 150);
      rect(0, SCREEN_SIZE*2/5, SCREEN_SIZE, SCREEN_SIZE/3);
      textSize(SCREEN_SIZE/30);
      fill(0);
      textAlign(CENTER);
      text("GAME OVER" + "\n----------" + "\n Press 'N' to Start a New Game" + "\n\n Press 'M' to go back to Menu", SCREEN_SIZE/2, SCREEN_SIZE/2);
    }
    
    textFont(Font);
    fill(0); //Fills with a darker color
    rect(0, 0, SCREEN_SIZE, MENU_HEIGHT); //Draws the top bar
    fill(255); //Fills white
    textAlign(CENTER); //Aligns text to the center
    textSize(SCREEN_SIZE/25); //Sets the text size
    text("Minesweeper", SCREEN_SIZE/2, MENU_HEIGHT*3.5/4); //Writes the title
    textSize(SCREEN_SIZE*4/250);
    if(!gameOverState && gameTimer < clockMax) //timer continues until it reaches max
    {
      gameTimer++;
    }
    if(gameTimer >= clockMax) //Game Over when timer reaches max
    {
      gameOverState = true;
    }
    textAlign(LEFT);
    text("Time: " + (int)(gameTimer/60), SCREEN_SIZE/40, MENU_HEIGHT*9/13);
    text("Flags Left: " + flagsLeft, SCREEN_SIZE*38/51, MENU_HEIGHT*9/13);
    textAlign(CENTER);
  }
  
  /****************************************************/
  //HOW TO PLAY SCREEN
  if (screenID == 3)
  {
    noStroke();
    fill(0);
    rect(0,0,700,700);
    htp_screen.render();
  }
}

void mousePressed() {
  /****************************************************/
  //MENU SCREEN
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
      System.exit(0); //exit screen
    }
  }
  
  /****************************************************/
  //CHOOSING CELLS
  else if (screenID == 2) {
    mine_sweeper.render(); //
  }
  
  /****************************************************/
  //HOW TO PLAY SCREEN
  else if (screenID == 3)
  {
    if(htp_screen.backOver == true) {
      screenID = 1;
    }
  }
}

void keyPressed() {
  if ((key == 'N' || key == 'n')) //If the user presses 'N' after a game over
  { 
    gameOverState = false; //Turn off the game over mode
    gameTimer = 0; //Resets game timer
    flagsLeft = TOTAL_MINES; //Resets number of flags left
    spawnNewLevel(); //Spawn a new level
  }
  if ((key == 'M' || key == 'm')) //If the user presses 'N' after a game over
  { 
    gameOverState = false; //Turn off the game over mode
    gameTimer = 0; //Resets game timer
    flagsLeft = TOTAL_MINES; //Resets number of flags left
    spawnNewLevel(); //Spawn a new level
    screenID = 1;
  }
}

void spawnNewLevel() //Spawns a new level
{ 
  
  //Creates the cells
  cellAssignments = new Cell[SCREEN_SIZE/CELL_SIZE][(SCREEN_SIZE - MENU_HEIGHT)/CELL_SIZE]; //Creates a new array of coordinates
  for (int i = 0; i < cellAssignments.length; i++) //Gets the x co-ordinate of each cell
  {
    for (int j = 0; j < cellAssignments[0].length; j++) //Gets the y co-ordinate of each cell
    { 
      cellAssignments[i][j] = new Cell(i*CELL_SIZE, j*CELL_SIZE + MENU_HEIGHT); //Creates a new cell in the grid
    }
  }

  //Creates the mines
  for (int i = 0; i < TOTAL_MINES; i++) 
  {
    PVector randomCellAssignment = new PVector(random(cellAssignments.length), random(cellAssignments[0].length)); //Chooses a random cell
    if (cellAssignments[int(randomCellAssignment.x)][int(randomCellAssignment.y)].mineCell == false) //If the cell is not a mine
    {
        cellAssignments[int(randomCellAssignment.x)][int(randomCellAssignment.y)].mineCell = true; //Make the cell a mine cell
    }
    else 
    {
      i--; //Else re-do the loop an extra time
    }
  }

  //Updates adjacent mine cells of each cell
  for (int i = 0; i < cellAssignments.length; i++) //Gets the x co-ordinate of each cell
  {
    for (int j = 0; j < cellAssignments[0].length; j++) //Gets the y co-ordinate of each cell
    {
      if (cellAssignments[i][j].mineCell == false) //If the cell is not a mine cell
      { 
        if (i > 0 && cellAssignments[i - 1][j].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the left, add one to adjacent mine cells
        }
        if (i < cellAssignments.length - 1 && cellAssignments[i + 1][j].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the right, add one to adjacent mine cells
        }
        if (j > 0 && cellAssignments[i][j - 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on top, add one to adjacent mine cells
        }
        if (j < cellAssignments[0].length - 1 && cellAssignments[i][j + 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell underneath, add one to adjacent mine cells 
        }
        if (i > 0 && j > 0 && cellAssignments[i - 1][j - 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the top left, add one to adjacent mine cells
        }
        if (i < cellAssignments.length - 1 && j > 0 && cellAssignments[i + 1][j - 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the top right, add one to adjacent mine cells
        }
        if (i > 0 && j < cellAssignments[0].length - 1 && cellAssignments[i - 1][j + 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the bottom left, add one to adjacent mine cells
        }
        if (i < cellAssignments.length - 1 && j < cellAssignments[0].length - 1 && cellAssignments[i + 1][j + 1].mineCell == true) 
        {
          cellAssignments[i][j].adjacentMines++; //If there is a cell on the bottom right, add one to adjacent mine cells
        }
      }
    }
  }
}

void clearSurroundingCells(int i, int j) //Clears all surrounding cells that aren't flagged
{ 
  if (i > 0 && !cellAssignments[i - 1][j].flagCell) 
  {
    cellAssignments[i - 1][j].openCell = true; //Opens the left cell
  }
  if (i < cellAssignments.length - 1 && !cellAssignments[i + 1][j].flagCell) 
  {
    cellAssignments[i + 1][j].openCell = true; //Opens the right cell
  }
  if (j > 0 && !cellAssignments[i][j - 1].flagCell) 
  {
    cellAssignments[i][j - 1].openCell = true; //Opens the top cell
  }
  if (j < cellAssignments[0].length - 1 && !cellAssignments[i][j + 1].flagCell) 
  {
    cellAssignments[i][j + 1].openCell = true; //Opens the bottom cell   
  }
  if (i > 0 && j > 0 && !cellAssignments[i - 1][j - 1].flagCell) 
  {
    cellAssignments[i - 1][j - 1].openCell = true; //Opens the top left cell
  }
  if (i < cellAssignments.length - 1 && j > 0 && !cellAssignments[i + 1][j - 1].flagCell) 
  {
    cellAssignments[i + 1][j - 1].openCell = true; //Opens the top right cell
  }
  if (i > 0 && j < cellAssignments[0].length - 1 && !cellAssignments[i - 1][j + 1].flagCell) 
  {
    cellAssignments[i - 1][j + 1].openCell = true; //Opens the bottom left cell
  }
  if (i < cellAssignments.length - 1 && j < cellAssignments[0].length - 1 && !cellAssignments[i + 1][j + 1].flagCell) 
  {
    cellAssignments[i + 1][j + 1].openCell = true; //Opens the bottom right cell
  }
}