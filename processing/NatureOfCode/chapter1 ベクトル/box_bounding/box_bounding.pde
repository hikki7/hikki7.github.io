PVector location;
PVector velocity;
float diameter=18;
float box_size;

void setup() {
  fullScreen(P3D);
  location=new PVector(random(-width/6,width/6)+width/2, random(-height/6,height/6)+height/2, random(-height/6,height/6));
  velocity=new PVector(random(10)-5, random(10)-5, random(10)-5);
  box_size=500;
  noFill();
  stroke(255);
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2,height/2,0);
  box(box_size);
  popMatrix();
  location.add(velocity);
  if (location.x>=width/2+box_size/2-diameter/2||location.x<=width/2-box_size/2+diameter/2) {
    velocity.x*=-1;
  }
  if (location.y>=height/2+box_size/2-diameter/2||location.y<=height/2-box_size/2+diameter/2) {
    velocity.y*=-1;
  }
  if (location.z>=+box_size/2-diameter/2||location.z<=-box_size/2+diameter/2) {
    velocity.z*=-1;
  }
  pushMatrix();
  translate(location.x,location.y,location.z);
  sphere(diameter);
  popMatrix();
}
