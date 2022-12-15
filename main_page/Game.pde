class Game {
  int i = 0;
  //int Height = 900;
  
  
  Game()
  {
    //Width1 = w;
    //Height = h;
  }
  
  void setup() {
  us = loadImage("data/mapa1.PNG");
  data = loadTable("data/ufo.csv");
  ufo =loadImage("data/ufo.png");
  //more_data = loadTable("data/ufo_more.csv");
  println(data.getRowCount(), data.getColumnCount());
  frameRate(10);
   //String url = "https://d31xsmoz1lk3y3.cloudfront.net/games/images/1446677138_Find_the_US_States";
   //mapa = loadImage(url);
    background(60);
    image(us, 0, 0, us.width*1.5, us.height*1.5);
}

void drawPoints() {
 //for (int i = 0; i < data.getRowCount(); i ++) {
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
     text(data.getString(i,7),150, height-50);
   
  }
  //filter(BLUR, 4);
   i ++;
  if (i == data.getRowCount()) {
    noLoop();
  }
}
//}

void triangle1(int x, int y, int h)
{
  fill(255,50);
  triangle(x,y-(2*(h+10))/3, x + (h+10)/sqrt(3), y+(1/3)*(h+10), x-(h+10)/sqrt(3), y+(1/3)*(h+10));
  fill(random(50,100),random(150,250),random(0));
  triangle(x,y-(2*h)/3, x + h/sqrt(3), y+(1/3)*h, x-h/sqrt(3), y+(1/3)*h);
  
}
    
}
