float angle=0;
float aVelocity=0;
float aAcceleration=0.001;
float diam=16;
float d;

void setup() {
  fullScreen(P2D); 
  smooth();
  noCursor();
  d=width/4;
}


void draw(){
  fill(51,50);
  noStroke();
  rectMode(CORNER);
  rect(0,0,width,height);
  fill(144);
  stroke(196);
  rectMode(CENTER);
  pushMatrix();
  translate(width/2,height/2);
  rotate(angle);
  line(-d,0,d,0);
  ellipse(d,0,diam,diam);
  ellipse(-d,0,diam,diam);
  popMatrix();
  aVelocity+=aAcceleration;
  angle+=aVelocity;
}
