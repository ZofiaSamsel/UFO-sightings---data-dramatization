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
PImage us; 
PImage ufo;
int i = 0;
boolean start = true;


void setup() {
  size(1500,900);
  fullScreen();
  bg = loadImage("data/background.jpg");
  bg.resize(width,height);
  background(bg);
  ufo1 = new SoundFile(this, "data/landing.mp3");
  //ufo1.play();
  //frameRate(1);
  ship = loadImage("data/ship.png");
  ship.resize(200, 120);
  
  launch = new Button(screenWidth/2 - 40, screenHeight/2 + 200 , 80, 50, "Launch", 235, 142, 242);
  game1 = new Button(screenWidth/2 - 200, screenHeight/2 + 200 , 80, 50, "Game 1", 235, 142, 242);
  game2 = new Button(screenWidth/2 + 120, screenHeight/2 + 200 , 80, 50, "Game 2", 235, 142, 242);

  us = loadImage("data/mapa1.PNG");
  data = loadTable("data/ufo.csv");
  ufo =loadImage("data/ufo.png");
  //more_data = loadTable("data/ufo_more.csv");
  println(data.getRowCount(), data.getColumnCount());
  frameRate(30);
   //String url = "https://d31xsmoz1lk3y3.cloudfront.net/games/images/1446677138_Find_the_US_States";
   //mapa = loadImage(url);
   
}


void draw() {
 
  if(start) {
    image(ship, shipX, shipY);
  }
  
  if(launch.isClicked())
  {
    
    fill(50, 120, 45);
    rect(mouseX, mouseY, 50, 50);
    
  }
  
  
  launch.update();
  launch.render();
  
  if(game1.isClicked())
  {
    start = false;
    background(60);
    image(us, 0, 0, us.width*1.5, us.height*1.5);
    drawPoints();
  }
  game1.update();
  game1.render();
  
  
  if(game2.isClicked())
  {
    fill(250, 60, 80);
    ellipse(mouseX, mouseY, 50, 50);
    
  }
  
  game2.update();
  game2.render();
  
  
}


void drawPoints() {
 for (int i = 0; i < data.getRowCount(); i ++) {
   //wait(5);
  y = map(data.getFloat(i, 5), 27.994402, 47.751076, us.height*1.15, 0);
  x = map(data.getFloat(i, 6), -120.500000, -68.972168, 0, us.width*1.30);
  noStroke();

  if (i%2==0) {
    //image(ufo, x+130, y + 60, 50,50);
    triangle1(int(x+130), int(y + 60), 15);

  } else {
    //image(ufo, x+130, y + 60, 50,50);
    
   fill(random(50,100),random(150,250),random(0));
   ellipse(x+130, y+60, 10, 10);
  }
  if (i>0) {
    fill(50);
    rect(100,height-100,100, 200);
     textSize(50);
     fill(0);
     text(data.getString(i,7),100, height-20);
   
  }
  //filter(BLUR, 4);
  //i ++;
  //if (i == data.getRowCount()) {
  //  noLoop();
  //}
}}

void triangle1(int x, int y, int h)
{
  fill(255,50);
  triangle(x,y-(2*(h+10))/3, x + (h+10)/sqrt(3), y+(1/3)*(h+10), x-(h+10)/sqrt(3), y+(1/3)*(h+10));
  fill(random(50,100),random(150,250),random(0));
  triangle(x,y-(2*h)/3, x + h/sqrt(3), y+(1/3)*h, x-h/sqrt(3), y+(1/3)*h);
  
}
