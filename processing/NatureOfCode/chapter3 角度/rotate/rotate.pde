PVector location1;
PVector location2;
float diam;
float angle=radians(30);

void setup() {
  fullScreen(P2D);
  smooth();
  background(255);
  location1=new PVector(0,-height/4);
  location2=new PVector(0,height/4);
  diam=30;
}

void draw(){
    fill(51);
    translate(width/2,height/2);
    rotate(angle);
    ellipse(location1.x,location1.y,diam,diam);
    ellipse(location2.x,location2.y,diam,diam);
    strokeWeight(3);
    line(location1.x,location1.y+diam/2,location2.x,location2.y-diam/2);
}
