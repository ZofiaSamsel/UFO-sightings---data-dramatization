class Ship {

  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  PImage ship;
  Boolean Pressed = false;
  Boolean Clicked = false;
  //Constructor to create a button
  Ship(PImage img, float x, float y, int w, int h)
  {
    ship = img;
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    
  }
  void update()//must be placed in void draw() to work
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
  
  void render() //must be placed in void draw() function to render the button to the screen
  {
    image(ship, shipX, shipY);
  }
  boolean isClicked() //Use this in a if statement to check if the button has been clicked
  {
    return Clicked;
  }
}
