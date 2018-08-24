class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  float topSpeed;
  float xoff, yoff;
  float r=16;

  Mover() {
    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    topSpeed=4;
    xoff=1000;
    yoff=0;
  }

  void update() {
    PVector mouse=new PVector(mouseX, mouseY);
    PVector dir=PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration=dir;

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display() {
    //float theta=atan2(velocity.x,velocity.y);の書き換え
    float theta=velocity.heading2D(); 

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, 60, 20);
    popMatrix();
  }

  void checkEdge() {

    if (location.x>width) {
      location.x=0;
    } else if (location.x<0) {
      location.x=width;
    }
    if (location.y>height) {
      location.y=0;
    } else if (location.y<0) {
      location.y=height;
    }
  }
}
