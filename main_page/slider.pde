/*
Slider parameters: 
  x axis position (start of slidebar)
  y axis position
  width of slidebar
  height of slidebar
  number of possible positions (ns = 10 in case of year by year in a decade)  
*/

class Slider {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int nsteps;             // number of steps
  
  float step;               // which step
  int stepwidth;          // width of one step
  boolean over;           // is the mouse over the slider?
  boolean locked;

  Slider (float xp, float yp, int sw, int sh, int ns) {
    xpos = xp;
    ypos = yp-sheight/2;
    swidth = sw;
    sheight = sh;
    nsteps = ns;
    
    step = 0;
    spos = xpos;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
  }

//============================================================================================= 
//                    updates slider position, over event, lock event (is the mouse clicked)
//=============================================================================================
  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (firstMousePress && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = step();
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos);
    }
  }
  
 
//============================================================================================= 
//                    returns step over which the slider should be displayed
//=============================================================================================
  float step(){
    float temp = (sposMax-sposMin)/(nsteps-1);
    step = sposMin;
      
    for (int i = 1; i < nsteps; i++){
      if(mouseX > i*temp+100 - temp/2 && mouseX < i*temp+100 + temp/2){
        step = i*temp+100;
      }
    }
    return step;
  }
  
//============================================================================================= 
//                    returns if mouse is over slidebar 
//=============================================================================================
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }


//============================================================================================= 
//                    displays slider
//=============================================================================================
  void display() {
// slider bar
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    
// step lines    
    fill(0);
    rect(100, ypos, 5, sheight);
    for(int i = 1; i < nsteps; i++){
      fill(0);
      rect(i*(sposMax+sheight-sposMin)/(nsteps-1)+100, ypos, 5, sheight);
    }

// slider    
    if (over || locked) {
      fill(0);
    } else {
      fill(70);
    }
    rect(spos, ypos, sheight, sheight);
  }


//============================================================================================= 
//                    changes start and stop variables accordingly to slider position
//=============================================================================================
  void getPos() {
    int pos = int(spos);
    switch(pos){
    case 100:
      start = 1;
      stop = 59;
      return;
    case 289:
      start = 59;
      stop = 137;
      return;
    case 478:
      start = 137;
      stop = 201;
      return;
    case 668:
      start = 201;
      stop = 279;
      return;
    case 857:
      start = 279;
      stop = 398;
      return;
    case 1046:
      start = 398;
      stop = 526;
      return;
    case 1236:
      start = 526;
      stop = 658;
      return;
    case 1425:
      start = 658;
      stop = 931;
      return;
    case 1614:
      start = 931;
      stop = 1244;
      return;
    case 1804:
      start = 1244;
      stop = 1746;
      return;
    }
  }
  
//============================================================================================= 
//                    displays year of the ufo sightings
//=============================================================================================
  void displayYear(){
  }
}
