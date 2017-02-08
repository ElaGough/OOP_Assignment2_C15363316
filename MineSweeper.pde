//The code for MineSweeper

class MineSweeper
{
  void render()
  {
    if (!gameOverState) 
    {
      //int i=0;
      for (int i = 0; i < cellAssignments.length; i++) //Gets the x co-ordinate of each cell
      {
        //int j=0;
        for (int j = 0; j < cellAssignments[0].length; j++) //Gets the y co-ordinate of each cell
        { 
          if (mouseX > i*CELL_SIZE && mouseX < (i + 1)*CELL_SIZE
            && mouseY > j*CELL_SIZE + MENU_HEIGHT && mouseY < (j + 1)*CELL_SIZE + MENU_HEIGHT) //If the mouse is in a cell
          { 
            if (mouseButton == LEFT && cellAssignments[i][j].flagCell == false) 
            { 
              if (cellAssignments[i][j].openCell) //If the cell is already open
              {
                if (cellAssignments[i][j].adjacentFlags == cellAssignments[i][j].adjacentMines) //If the adjacent flags is equal to the number of mines
                {
                    clearSurroundingCells(i, j); //Clears the surrounding squares (besides the flags)
                }
              }            
              else 
              {
                cellAssignments[i][j].openCell = true; //Opens the cell
              }
            }
            else if (mouseButton == RIGHT) 
            { 
              if (!cellAssignments[i][j].openCell) //If the cell is closed
              { 
                flagsLeft += (cellAssignments[i][j].flagCell) ? 1 : -1; //Modify number of flags left
                cellAssignments[i][j].flagCell = !cellAssignments[i][j].flagCell; //If right clicked, flag the cell
                //Adds one to all adjacent flag counts
                if ((flagsLeft == 0))
                {
                  gameOverState = true;
                }
                if (i > 0) 
                {
                  cellAssignments[i - 1][j].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1;
                }
                if (i < cellAssignments.length - 1) 
                {
                  cellAssignments[i + 1][j].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1;
                }
                if (j > 0) 
                {
                  cellAssignments[i][j - 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1;
                }
                if (j < cellAssignments[0].length - 1) 
                {
                  cellAssignments[i][j + 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1; 
                }
                if (i > 0 && j > 0) 
                {
                  cellAssignments[i - 1][j - 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1;
                }
                if (i < cellAssignments.length - 1 && j > 0) 
                {
                  cellAssignments[i + 1][j - 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1; 
                }
                if (i > 0 && j < cellAssignments[0].length - 1) 
                {
                  cellAssignments[i - 1][j + 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1; 
                }
                if (i < cellAssignments.length - 1 && j < cellAssignments[0].length - 1) 
                {
                  cellAssignments[i + 1][j + 1].adjacentFlags += (cellAssignments[i][j].flagCell) ? 1 : -1;
                }
              }
            }
          }
        }
      }
    }
  }
}