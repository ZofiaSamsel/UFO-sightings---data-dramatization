void setup() {
// ============================================================================================= 
//  screen setup
// =============================================================================================  
  //size(1500,900);
  fullScreen();
  //frameRate(1);

// ============================================================================================= 
//  loads
// =============================================================================================  
  data = loadTable("data/ufo.csv");
  
  bg = loadImage("data/background.jpg");
  //bg.resize(width,height);
  frame = loadImage("data/frame.png");
  frame.resize(width, height);
  
  ship = loadImage("data/ship.png");
  ship.resize(400,240);
  
 
  ufo =loadImage("data/ufo.png");
  
  us = loadImage("data/mapa1.PNG");
  
  font = createFont("data/INVASION2000.TTF", 40);

// ============================================================================================= 
//  initialisation of objects
// =============================================================================================  
  ufo1 = new SoundFile(this, "data/landing1.wav");
  ufo1.play();
  ufo1.loop();
  launch = new Button(250, height/2+ 400, 100, 70, "Launch", 229, 79, 220);
  game1 = new Button(370, height/2 + 400 , 100, 70, "Game 1", 51, 203, 240);
  game2 = new Button(490, height/2 + 400 , 100, 70, "Game 2", 189, 51, 240);
  //game = new Game();
  //map = new Points(0);
  ship1 = new Ship(ship, shipX, shipY, 400, 240);
  slider = new Slider(200, 50, width-400, 40, 10);
  
  pts = new Points[data.getRowCount()];

// ============================================================================================= 
//  other
// =============================================================================================  
  //map.getData();
  for(int i = 1; i < data.getRowCount(); i++) {
    pts[i] = new Points(i);
    pts[i].getData();
  }
}

void mouseClicked() {
  if(mouseX >= shipX && mouseX <= shipX+400 && mouseY >= shipY && mouseY <= shipY+240 && click == false)
  {
    click = true;
  } else {click = false;}
  if (shipX == mouseX && shipY == mouseY && click == true)
  {
    click = false;
  }
}

void draw() {
  //println(start);

  screenMode();
  
  if(start == 1) {
    startScreen();
  }
  
  if (start == 2 ) {
    mapScreen();
  }
  
   buttons();
    
   if (firstMousePress) {
    firstMousePress = false;
  }
}

void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}

void screenMode(){
  if(launch.isClicked()) {
    start = 2;  
  }
  
  if(game1.isClicked()){
    start = 1;
  }
  
   if(game2.isClicked())
  {
    exit(); 
  }
}

void buttons(){
    /*------------------------------------------------------------------
  creating buttons
  ------------------------------------------------------------*/
    game1.update();
    game1.render();
    launch.update();
    launch.render();
    game2.update();
    game2.render();
}

void mapScreen(){
    slider.getPos();
    
    background(60);
    image(us, 0, 0, us.width*1.5, us.height*1.5);
    for(int i = starts; i < stops; i++){
      pts[i].update();
      pts[i].display();
      pts[i].showInfo();
    }
    
    slider.update();
    slider.display();
    slider.displayYear();
}

void startScreen(){
  image(bg,0,0,width,height);
  image(frame, 0, 0);
  if(click == true)
    {shipX = mouseX;
    shipY = mouseY;
    }
  
  //if(ship1.isClicked()){
    shipX = mouseX;
    shipY = mouseY;
  }
  image(ship, shipX, shipY);
  ship1.update();
  ship1.render();
}

void animationScreen(){
}
