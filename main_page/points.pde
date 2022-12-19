/*
Points parameters:
  index in data table
*/

class Points {
  int i;      // datapoint row in data table
  boolean over;
  float x, y;
  String shape, date, time, duration, comment;
  Table data;
  PImage us; 
  

  Points (int id) {
    i = id;
  }
  
  void getData(){
   // println("check");
    data = loadTable("data/ufo.csv");
    shape = data.getString(i, 2);
    us = loadImage("data/mapa1.PNG");
    y = map(data.getFloat(i, 5), 27.994402, 47.751076, us.height*1.15, 0);
    x = map(data.getFloat(i, 6), -120.500000, -68.972168, 0, us.width*1.30);
     //y = map(data.getFloat(i, 5), 27.994402, 47.751076, height, 0);
     //x = map(data.getFloat(i, 6), -120.500000, -68.972168, 0, width);
     date = data.getString(i, 7);
     time = data.getString(i, 8);
     duration = data.getString(i, 3);
     comment = data.getString(i, 4);
  }
  
// ============================================================================================= 
//  displays point accordigly to its shape
// =============================================================================================  
  void display(int i){
    noStroke();
    //println(i);
    if (i == 0) {
         background(60);
         image(us, 0, 0, us.width*1.5, us.height*1.5);
         i ++;
    }
    else {
      switch(shape){
        case "triangle":
          fill(255, 0, 0);
          triangle(x, y,x-5, y+10, x+5, y+10);
          return;
        case "disk":
          fill(0, 255, 0);
          ellipse(x, y, 15, 5);
          return;
        case "circle":
          fill(0, 0, 255);
          ellipse(x, y, 10, 10);
          return;
      }
      i++;
    }
  }
  
  void update(){
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
  }
  
  boolean overEvent() {
    if (mouseX > x-5 && mouseX < x+5 && mouseY > y-5 && mouseY < y+5){
      return true;
    } else {
      return false;
    }
  }

// ============================================================================================= 
//  if mouse over point and pressed displays a box with info about sighting
// =============================================================================================  
  void showInfo(){
    if(overEvent() && mousePressed){
      fill(100);
      stroke(0);
      strokeWeight(5);
      strokeCap(ROUND);
      rect(4*width/5-10, 2*height/3-10 ,width/5, height/3);
      noStroke();
      fill(0);
      textSize(15);
      text("date: " + date, 4*width/5, 2*height/3 ,width/5-5, height/3);
      text("time: " + time, 4*width/5, 2*height/3+20 ,width/5-5, height/3);
      text("duration (in seconds): " + duration, 4*width/5, 2*height/3+40 ,width/5-5, height/3);
      text("comment: " + comment, 4*width/5, 2*height/3+60 ,width/5-5, height/3);
    }
  }  
}
