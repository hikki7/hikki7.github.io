
float angle=0;
float avelocity=0.05;


void setup(){
  size(640,360);
}


void draw(){
  background(21);
  
  float amp=100;
  float x=amp*cos(angle);
  angle+=avelocity;
  stroke(121);
  fill(196);
  translate(width/2,height/2);
  line(0,0,x,0);
  ellipse(x,0,20,20);
}
