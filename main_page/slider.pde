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
  final float sposMin, sposMax; // max and min values of slider
  int nsteps;             // number of steps
  
  float step;               // which step
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

// ============================================================================================= 
//  updates slider position, over event, lock event (is the mouse clicked)
// =============================================================================================
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
  
 
// ============================================================================================= 
//  returns step over which the slider should be displayed
// =============================================================================================
  float step(){
    float temp = (sposMax-sposMin)/(nsteps-1);
    print(temp);
    step = sposMin;
      
    for (int i = 1; i < nsteps; i++){
      if(mouseX > i*temp+xpos - temp/2 && mouseX < i*temp+xpos + temp/2){
        step = i*temp+xpos;
      }
    }
    return step;
  }
  
// ============================================================================================= 
//  returns if mouse is over slidebar 
// =============================================================================================
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }


// ============================================================================================= 
//  displays slider
// =============================================================================================
  void display() {
// slider bar
    noStroke();
    fill(#00F712);
    rect(xpos-swidth/nsteps, ypos, swidth+swidth/nsteps, sheight);
    
// step lines    
    //fill(0);
    //rect(xpos, ypos+sheight, 2, sheight);
    //for(int i = 1; i < nsteps; i++){
    //  fill(0);
    //  rect(i*(sposMax-sposMin)/nsteps+xpos, ypos+sheight, 2, sheight);
    //}

// slider    
    if (over || locked) {
      fill(0);
    } else {
      fill(70);
    }
    
    rect(spos, ypos, swidth/nsteps, sheight);
 }


//============================================================================================= 
//  changes start and stop variables accordingly to slider position
//=============================================================================================
// 1, 59, 137, 201, 279, 398, 526, 658, 931, 1244, 1746
  void getPos() {
    for(int i = 0; i < nsteps; i++){
      if(spos == i*(sposMax-sposMin)/(nsteps-1)+xpos){
        starts = values[i];
        stops = values[i+1];
        return;
      }
    }
  }
  
//============================================================================================= 
//  displays year of the ufo sightings
//=============================================================================================
  void displayYear(){
    fill(0);
    textFont(font);
    textSize(40);
    for(int i = 0; i < nsteps; i++){
      if(spos == i*(sposMax-sposMin)/(nsteps-1)+xpos){
        text("199"+str(i), xpos-103, ypos+sheight/1.5);
        return;
      }
    }
  }
}
