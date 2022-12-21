/*
Slider parameters: 
  x axis position (start of slidebar)
  y axis position
  width of slidebar
  height of slidebar
  number of possible positions (ns = 10 in case of year by year in a decade)  
*/

class Slider {
  float swidth, sheight;                   // width and height of bar
  float xpos, ypos;                       // x and y position of bar
  float spos, newspos;                    // x position of slider
  final float sposMin, sposMax;           // max and min values of slider
  int nsteps;                             // number of steps
  
  float step;                             // which step
  boolean over;                           // is the mouse over the slider
  boolean locked;

// ============================================================================================= 
// Constructor to create a slider
// ============================================================================================= 
  Slider (float xp, float yp, float sw, float sh, int ns) {         
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
    //print(temp);
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
    fill(#0450ff);
    rect(xpos, ypos, swidth, sheight);
    
    // slider 
    if (over || locked) {                                 
      fill(#D120C8);
    } else {
      fill(229, 79, 220);
    }
    
    rect(spos, ypos, swidth/nsteps, sheight);
 }


//============================================================================================= 
//  changes start and stop variables accordingly to slider position
//=============================================================================================

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
    textFont(font);
    for(int i = 0; i < nsteps; i++){
      if(spos == i*(sposMax-sposMin)/(nsteps-1)+xpos){
        fill(#0450ff);
        rect(width/25+us.width*1.5, height/30+us.height*1.5-140, 173,173, 12, 24, 48, 0);
        fill(0);
        textAlign(LEFT);
        textSize(23);
        text("DATA FROM", width/25+us.width*1.5+10, height/30+us.height*1.5-100);
        text("    YEAR", width/25+us.width*1.5+10, height/30+us.height*1.5-50);
        textSize(40);
        text(" 199"+str(i), width/25+us.width*1.5+10, height/30+us.height*1.5);
        //textSize(20);
        return;
      }
    }
  }

//displays years during animation
    void displayYearAnim(){                       
      noStroke();
      fill(#0450ff);
      rect(xpos, ypos, swidth, sheight);
        
      fill(#0450ff);
      rect(width/25+us.width*1.5, height/30+us.height*1.5-140, 173,173, 12, 24, 48, 0);
      fill(0);
      textAlign(LEFT);
      textSize(23);
      text("DATA FROM", width/25+us.width*1.5+10, height/30+us.height*1.5-100);
      text("   YEARS", width/25+us.width*1.5+10, height/30+us.height*1.5-50);
      textSize(30);
      text("'90 - '99", width/25+us.width*1.5+10, height/30+us.height*1.5);
    }
}
