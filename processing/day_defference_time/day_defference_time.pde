Day day;



int earthTime=0;
float dir;

void setup(){
  //fullScreen(P2D);
  size(600,600,P2D);
  background(21);
  smooth();
  noCursor();
  dir=width/4;
  
  day=new Day();
}


void draw(){
  rectMode(CORNER);
  fill(21,10);
  rect(0,0,width,height);
  
  day.display();
  
}
