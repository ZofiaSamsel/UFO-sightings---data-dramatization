/*
Ship parameters:
  position vector
  width
  height
*/  

class Ship {

  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  PImage ship;
  Boolean Pressed = false;
  Boolean Clicked = false;
  
// ============================================================================================= 
// Constructor to create a ship
// ============================================================================================= 
  Ship(PImage img, float x, float y, int w, int h)
  {
    ship = img;
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
  }
// updates infromation about the ship being clicked
  void update()
  {
     if(mousePressed == true && mouseButton == LEFT && Pressed == false)
     {
       Pressed = true;
       if(mouseX >= Pos.x && mouseX <= Pos.x+Width && mouseY >= Pos.y && mouseY <= Pos.y+Height)
       {
         Clicked = true;
       }
     } else
   {
     Clicked = false;
     Pressed = false;
   }
  }

// renders the ship to the screen
  void render() 
  {
    image(ship, shipX, shipY);
  }
  
//enables to check if the ship has been clicked
  boolean isClicked() 
  {
    return Clicked;
  }
}
