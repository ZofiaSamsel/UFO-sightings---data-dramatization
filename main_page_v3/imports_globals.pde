// ============================================================================================= 
//  imports globals, sets values for variables
// =============================================================================================

import processing.sound.*;

SoundFile ufo1;
SoundFile ufo2;

PImage bg, frame;
PImage ship;
PImage mapa;
PImage ufo;
PImage us;
PImage sky;

PFont font;

Table data;

int starts, stops;
int start = 1;
int screenWidth = 700;
int screenHeight = 700;
int counter = 1;

float shipX = screenWidth/2 - 100;
float shipY = screenHeight/2- 120;
float x, y;

boolean click = false;
boolean firstMousePress = false;

int[] values = {1, 59, 137, 201, 279, 398, 526, 658, 931, 1244, 1746, 0};

Button launch;
Button game1;
Button game2;
Button animation;
Slider slider;
Ship ship1;

Points[] pts;
