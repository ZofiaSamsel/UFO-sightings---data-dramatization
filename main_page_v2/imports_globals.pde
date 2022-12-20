import processing.sound.*;

SoundFile ufo1;

PImage bg;
PImage ship;
PImage mapa;
PImage ufo;
PImage us; 

PFont font;

Table data;

int starts, stops;
int start = 1;
int screenWidth = 700;
int screenHeight = 700;

float shipX = screenWidth/2 - 100;
float shipY = screenHeight/2- 120;
float x, y;

//boolean klikniety = false;
boolean firstMousePress = false;

int[] values = {1, 59, 137, 201, 279, 398, 526, 658, 931, 1244, 1746, 0};

Button launch;
Button game1;
Button game2;
Button animation;
//Game game;
//Points map;
Slider slider;

Points[] pts;
