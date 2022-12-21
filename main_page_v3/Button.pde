/* 
Button parameters:
  vector position
  width of button
  height of button
  color of button
  text displayed 
*/
class Button {
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color Colour;
  String Text;
  Boolean Pressed = false;          //is the mouse pressed
  Boolean Clicked = false;          //is the button clicked

// ============================================================================================= 
// constructor to create a button
// =============================================================================================  
  Button(int x, int y, int w, int h, String t, int r, int g, int b)
  {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Colour = color(r, g, b);
    Text = t;
  }
  
// updates infromation about the button being clicked
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

  
// renders the button to the screen
  void render()
  {
    fill(Colour);
    stroke(#0450ff);
    strokeWeight(3);
    rect(Pos.x, Pos.y, Width, Height, 3);
    
    textSize(20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    textFont(font);
    text(Text, Pos.x + (Width/2), Pos.y +(Height/2)- 5);
  }

// enables to check if the button has been clicked
// use this in a if statement to check if the button has been clicked
  boolean isClicked()
  {
    return Clicked;
  }
}
