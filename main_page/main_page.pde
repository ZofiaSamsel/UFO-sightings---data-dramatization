import processing.sound.*;
SoundFile ufo1;
PImage bg;
PImage ship;
int screenWidth = 700;
int screenHeight = 700;
Button launch;
Button game1;
Button game2;
float shipX = screenWidth/2 - 100;
float shipY = screenHeight/2- 120;
Table data, more_data;
float x, y;
PImage mapa;

PImage ufo;

boolean start = true;
//Game game;
Points map;


void setup() {
  size(1500,900);
  
  //fullScreen();
  bg = loadImage("data/background.jpg");
  //bg.resize(width,height);
  image(bg,0,0,width,height);
  //ufo1 = new SoundFile(this, "data/landing.mp3");
  //ufo1.play();
  //frameRate(1);
  ship = loadImage("data/ship.png");
  ship.resize(200, 120);
  
  launch = new Button(screenWidth/2 - 40, screenHeight/2 + 200 , 80, 50, "Launch", 235, 142, 242);
  game1 = new Button(screenWidth/2 - 200, screenHeight/2 + 200 , 80, 50, "Game 1", 235, 142, 242);
  game2 = new Button(screenWidth/2 + 120, screenHeight/2 + 200 , 80, 50, "Exit", 235, 142, 242);
  //game = new Game();
  map = new Points(0);
  //us = loadImage("data/mapa1.PNG");
  //data = loadTable("data/ufo.csv");
  ufo =loadImage("data/ufo.png");
  //more_data = loadTable("data/ufo_more.csv");
  //println(data.getRowCount(), data.getColumnCount());
  frameRate(10);
   //String url = "https://d31xsmoz1lk3y3.cloudfront.net/games/images/1446677138_Find_the_US_States";
   //mapa = loadImage(url);

  map.getData();

    

}

boolean klikniety = false;
void draw() {

  if(start) {
    image(ship, shipX, shipY);
    game1.update();
    game1.render();
    launch.update();
    launch.render();
    game2.update();
    game2.render();
  }


  
  
  if(launch.isClicked())
  {
        
  }
  

  
  if(game1.isClicked())
  {


    start = false;
    map.display();
    //game.setup();
    //game.drawPoints();

  }


    
  
  
  if(game2.isClicked())
  {
    exit();
    
  }
  

  
  
}
