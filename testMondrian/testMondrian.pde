// simple Mondrian effect
// improve: move existing rectangles
// the problem is if red(0) and red(7), removing red(0) will also remove red(7)
// would have to build edge detectin and draw with edges
// and you have to know to remove only your own edges --> draw down, stop if find horizontal edge
// and even this could remove overlapping vertical edges for example

import java.util.LinkedList;

int maxWidth = 10;
int maxIter = 25;
int iter = 0;
rectData shapeData[];
rectData newRect, oldestRect;
DS rectangles;

color white = color(255,255,255);
color black = color(0,0,0);
 
public enum RECTYPE
  { 
    WIDE, 
    TALL; 
  }

void setup(){
  size(400, 400);
  background(255,255,255,0);
  blendMode(ADD);
  shapeData = new rectData[maxIter];
  newRect = null;
  oldestRect = null;
  //stroke(0);
  for(int i = 0; i < shapeData.length; i++)
    shapeData[i] = null;
  
  rectangles = new DS(maxIter);
}

void draw(){
   if(random(100) > 50){ // tall
     newRect = new rectData(maxWidth); 
     newRect.type = RECTYPE.TALL;
  }else{ // wide, maxWidth is a height in this case
    newRect = new rectData(maxWidth, 0);
    newRect.type = RECTYPE.WIDE;
  }
 
  rectangles.addNewest(newRect);
  newRect.drawRect();
  
  if(rectangles.reachMaxSize())
    oldestRect = rectangles.removeOldest(); 
  
  if(oldestRect != null){
    oldestRect.removeRect(); // use 1 for rough remove
  }
}