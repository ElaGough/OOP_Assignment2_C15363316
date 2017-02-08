# OOP_Assignment2_C15363316
OOP_Assignment2_C15363316

## MINESWEEPER

Game that plays the classic Minesweeper. Includes a menu navigation screen

## ** Running the Game **

- Navigate the game using your cursor. 
- Left click selects buttons and cells. 
- Right click places flags. Flags stops cell from being revealed.

** MineSweeper **
- draw screenID 2 => clearing cells and printing visual
- spawnNewLevel() => Sets/Resets variables. Rendering the game
- class Cells => class for the cells updating cells
- class Minesweeper.render => selecting cells
- clearSurroundingCells() => Clears all surrounding cells that aren't flagged

** Translate: **

- Sars Function is translated to appear at centre of screen. 
- Theory from translate function implimented.

** Stars Function: **

- Stars generated using an ArrayList in which stars have a life span by removing stars from the ArrayList after a certain point.
- Stars flicker using a randomised white to black fill() colour.
- Stars have a slightly randomised shape so they're not all the same and look more realistic.
- Randomised directions and speeds using PVectors origionating from centre of screen.

** ScreenID: **

- Navigating screens using a ScreenID to avoid draws over other draws.
- Use of Back button to make navigating screens much easier.
- ScreenID 1 => Menu Screen
- ScreenID 2 => MineSweeper
- ScreenID 3 => How To Play Screen

** Key Pressed **
- N => New Game
- M => Back to Menu

** Inheretance: **

- Using extends to avoid writing same variables over and over. Also so that you can change data in the variables much easier. Leads into interfaces and polymorphism.

** Font: **

- Loading in font from file.

** Things used: **

- variables, loops, methods, arrays, objects, inheritance, polymorphism, interfaces, trigonometry, translate ...

### YouTube video of assignment:

click picture to access youtube video...

[![Video](https://upload.wikimedia.org/wikipedia/en/5/5c/Minesweeper_Icon.png)](https://youtu.be/6mZU6JvmETU)
