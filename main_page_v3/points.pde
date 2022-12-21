/*
Points parameters:
  index in data table
*/

class Points {
  int i;      // datapoint row in data table
  boolean over;
  float x, y;
  String shape, date, time, duration, comment, date_time;
  Table data;
 
// ============================================================================================= 
//  constructor to create points
// =============================================================================================    

  Points (int id) {
    i = id;
  }
  
// ============================================================================================= 
//  retrieves all the necessary data
// =============================================================================================  
  void getData(){
    data = loadTable("data/ufo.csv");
    shape = data.getString(i, 2);
    date = data.getString(i, 7);
    time = data.getString(i, 8);
    duration = data.getString(i, 3);
    comment = data.getString(i, 4);
    date_time = data.getString(i, 1);
 
 //maps raw coordinates onto the map size
    y = map(data.getFloat(i, 5), 27.994402, 47.751076, us.height*1.15+height/30, height/30);            
    x = map(data.getFloat(i, 6), -120.500000, -68.972168, width/25, us.width*1.3+width/25);             
  }
  
// ============================================================================================= 
//  displays point accordigly to its shape
// =============================================================================================  
  void display(){
    noStroke();
    
      switch(shape){
        case "triangle":
          fill(255, 0, 0);
          triangle(x+us.width/8, y+us.height/12, x-5+us.width/8, y+10+us.height/12, x+5+us.width/8, y+10+us.height/12);
          return;
        case "disk":
          fill(0, 255, 0);
          ellipse(x+us.width/8, y+us.height/12, 15, 5);
          return;
        case "circle":
          fill(0, 0, 255);
          ellipse(x+us.width/8, y+us.height/12, 10, 10);
          return;
      }
  }

//displays points as ufo image
   void displayUfo() {                                                                                                    
    noStroke();
    image(ufo, x+us.width/8, y+us.height/12, 50,50);
    return;
  }

  void update(){
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
  }

//checks whether the mouse is over point
  boolean overEvet() {                                                                                                   
    if (mouseX > x+us.width/8-5 && mouseX < x+us.width/8+5 && mouseY > y+us.height/12-5 && mouseY < y+us.height/12+5){
      return true;
    } else {
      return false;
    }
  }

// ============================================================================================= 
//  if mouse over point and pressed displays a box with info about sighting
// =============================================================================================  
  void showInfo(){
    textAlign(LEFT);
    if(overEvent() && mousePressed){
      
      // box
      fill(229, 79, 220);
      stroke(#0450ff);
      strokeWeight(3);
      strokeCap(ROUND);
      rect(width/25+us.width*1.5+3, height/30+height/10.3, width/5.75, height/4.5);
      //4*width/5-10, 2*height/3-10 ,width/5, height/3
      
      // text
      noStroke();
      fill(0);
      textSize(15);
      text("UFO SIGHTING DETAILS", width/25+us.width*1.5+3+10, height/30+height/10.3+10, width/5.75-5, height/4.5);
      text("date and time: " + date_time, width/25+us.width*1.5+3+10, height/30+height/10.3+10+40, width/5.75-5, height/4.5);
      text("duration (in seconds): " + duration, width/25+us.width*1.5+3+10, height/30+height/10.3+10+60, width/5.75-5, height/4.5);
      text("comment: " + comment, width/25+us.width*1.5+3+10, height/30+height/10.3+10+80, width/5.75-5, height/4.5);
    }
  }  
}
