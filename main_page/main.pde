
/*
Table data;
PFont font;

Points[] pts;
Points point;

Slider slider;

int starts, stops;
int[] values = {1, 59, 137, 201, 279, 398, 526, 658, 931, 1244, 1746, 0};
boolean firstMousePress = false;

void setup(){
  frameRate(30);
  font = createFont("data/INVASION2000.TTF", 40);
  data = loadTable("data/ufo.csv");
  size(1500,800);
  background(100);
  
  pts = new Points[data.getRowCount()];
  for(int i = 1; i < data.getRowCount(); i++) {
    pts[i] = new Points(i);
    pts[i].getData();
  }
 
  slider = new Slider(200, 50, width-400, 40, 10);
}

void draw(){

  slider.getPos();
  
  background(100);
  for(int i = starts; i < stops; i++){
    pts[i].update();
    pts[i].display();
    pts[i].showInfo();
  }
  
  slider.update();
  slider.display();
  slider.displayYear();
    
  if (firstMousePress) {
    firstMousePress = false;
  }
  
}

void mousePressed() {
  if (!firstMousePress) {
    firstMousePress = true;
  }
}
*/
