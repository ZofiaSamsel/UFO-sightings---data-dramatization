// ============================================================================================= 
//  setup
// =============================================================================================  
void setup() {
// screen setup
  //size(1600,900);
  fullScreen();


// loads
  data = loadTable("data/ufo.csv");
  
  bg = loadImage("data/background.jpg");
  //bg.resize(width,height);
  frame = loadImage("data/frame.png");
  frame.resize(width, height);
  
  ship = loadImage("data/ship.png");
  ship.resize(400,240);
  
 
  ufo =loadImage("data/ufo.png");
  
  us = loadImage("data/mapa1.png");
  
  font = createFont("data/INVASION2000.TTF", 20);
  textFont(font);


// initialisation of objects 
  ufo1 = new SoundFile(this, "data/landing1.wav");
  ufo2 = new SoundFile(this, "data/ufo_landing.wav");
  //ufo1.play();
  //ufo1.loop();
  game1 = new Button(width/8, height*5/6, 100, 70, "Home", 229, 79, 220);
  launch = new Button(width/8+120, height*5/6 , 100, 70, "Years", 229, 79, 220);
  animation = new Button(width/8+240, height*5/6 , 100, 70, "Play", 229, 79, 220);
  game2 = new Button(width/8+360, height*5/6 , 100, 70, "Exit", 229, 79, 220);
  ship1 = new Ship(ship, shipX, shipY, 400, 240);
  slider = new Slider(width/25, height/30+us.height*1.5+3, us.width*1.5+3, 30, 10);
  
  pts = new Points[data.getRowCount()];


// other
  for(int i = 1; i < data.getRowCount(); i++) {
    pts[i] = new Points(i);
    pts[i].getData();
  }
}


// ============================================================================================= 
//  draw() loop
// ============================================================================================= 
void draw() {
  screenMode();
  
  if(start == 1) { 
    startScreen();
  }
  if (start == 2 ) {
    mapScreen();
  }
  if(start == 3){
    animationScreen();
  }
  
   buttons();
    
   if (firstMousePress) {
    firstMousePress = false;
  }
}

// ============================================================================================= 
//  mouseClicked()
// ============================================================================================= 
void mouseClicked() {
  if(mouseX >= shipX && mouseX <= shipX+400 && mouseY >= shipY && mouseY <= shipY+240 && click == false)
  {
    click = true;
    ufo2.play();
  } else {click = false;}
  if (shipX == mouseX && shipY == mouseY && click == true)
  {
    click = false;
  }  
}

// ============================================================================================= 
//  mousePressed()
// ============================================================================================= 
void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
  
  ufo2.stop();
}


// ============================================================================================= 
//  choosing screen
// ============================================================================================= 
void screenMode(){
  if(launch.isClicked()){
    start = 2;  
  }
  if(game1.isClicked()){
    start = 1;
  }
  if(animation.isClicked()){
    start = 3;
  }
   if(game2.isClicked()){
    exit(); 
  }
}


// ============================================================================================= 
//  creating buttons
// ============================================================================================= 
void buttons(){
    game1.update();
    game1.render();
    launch.update();
    launch.render();
    game2.update();
    game2.render();
    animation.update();
    animation.render();
}


// ============================================================================================= 
//  displaying screen with map, slider, description
// ============================================================================================= 
void mapScreen(){
    slider.getPos();
    
    image(bg,0,0,width,height);
    fill(#0450ff);
    rect(width/25-3, height/30-3, us.width*1.5+6, us.height*1.5+6);
    image(us, width/25, height/30, us.width*1.5, us.height*1.5);
    for(int i = starts; i < stops; i++){
      pts[i].update();
      pts[i].display();
      pts[i].showInfo();
    }
    
    slider.update();
    slider.display();
    slider.displayYear();
    image(frame, 0, 0, width, height);
}


// ============================================================================================= 
//  displaying home page with buttons and spaceship
// ============================================================================================= 
void startScreen(){
  image(bg,0,0,width,height);
  image(frame, 0, 0);
  if(click == true){
    shipX = mouseX;
    shipY = mouseY;
   }
  
  image(ship, shipX, shipY);
  ship1.update();
  ship1.render();
}


// ============================================================================================= 
//  displaying screen with animation of sightings chronologically with sound in the background
// ============================================================================================= 
void animationScreen(){
  if(counter==1){
    image(bg,0,0,width,height);
    fill(#0450ff);
    rect(width/25-3, height/30-3, us.width*1.5+6, us.height*1.5+6);
    image(us, width/25, height/30, us.width*1.5, us.height*1.5);
    slider.displayYearAnim();
    image(frame, 0, 0, width, height);
    ufo1.play();
  }
  pts[counter].update();
  pts[counter].displayUfo();
  counter++;
  if(counter==data.getRowCount()){
    counter=1;
    start=1;
  }
}
