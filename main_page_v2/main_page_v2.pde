void setup() {
// ============================================================================================= 
//  screen setup
// =============================================================================================  
  size(1500,900);
  //fullScreen();
  //frameRate(1);


// ============================================================================================= 
//  loads
// =============================================================================================  
  data = loadTable("data/ufo.csv");
  bg = loadImage("data/background.jpg");
  //bg.resize(width,height);
  ship = loadImage("data/ship.png");
  ship.resize(200, 120);
  ufo =loadImage("data/ufo.png");
  us = loadImage("data/mapa1.PNG");
  font = createFont("data/INVASION2000.TTF", 40);
  textFont(font);

// ============================================================================================= 
//  initialisation of objects
// =============================================================================================  
  //ufo1 = new SoundFile(this, "data/landing.mp3");
  //ufo1.play();
  launch = new Button(screenWidth/2 - 40, screenHeight/2 + 200 , 80, 50, "Launch", 235, 142, 242);
  game1 = new Button(screenWidth/2 - 200, screenHeight/2 + 200 , 80, 50, "Game 1", 235, 142, 242);
  game2 = new Button(screenWidth/2 + 120, screenHeight/2 + 200 , 80, 50, "Exit", 235, 142, 242);
  animation = new Button(screenWidth/2 + 200, screenHeight/2 + 200, 80, 50, "Animation", 235, 142, 242);
  //game = new Game();
  //map = new Points(0);
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

void draw() {
  //println(start);

  screenMode();
  
  if(start == 1) {        // screen mode 1 -> starting screen
    startScreen();
  }
  if (start == 2 ) {      // screen mode 2 -> map with slider to change year of ufo sightings
    mapScreen();
  }
  if(start == 3){         // screen mode 3 -> animation with progression of sightings (chronological)
    animationScreen();
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
  
  if(animation.isClicked()){
    start = 3;
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
    animation.update();
    animation.render();
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
  image(ship, shipX, shipY);
}


int counter = 1;
void animationScreen(){
  if(counter==1){
    background(60);
    image(us, 0, 0, us.width*1.5, us.height*1.5);
  }
  pts[counter].update();
  pts[counter].display();
  counter++;
  if(counter==data.getRowCount()){
    counter=1;
    start=1;
  }
}
