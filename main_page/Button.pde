class Button {
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color Colour;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;
  //Constructor to create a button
  Button(int x, int y, int w, int h, String t, int r, int g, int b)
  {
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Colour = color(r, g, b);
    Text = t;
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
    fill(Colour);
    rect(Pos.x, Pos.y, Width, Height, 28);
    
    textSize(10);
    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x + (Width/2), Pos.y + (Height/2));
  }
  boolean isClicked() //Use this in a if statement to check if the button has been clicked
  {
    return Clicked;
  }
}
