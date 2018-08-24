class Mover {

  PVector location;
  PVector nav;
  PVector acceleration;
  PVector velocity;
  float topSpeed;
  float r=16;


  Mover(PVector _navPosition) {
    nav=_navPosition;
    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    topSpeed=4;
  }

  void update() {
    PVector dir=PVector.sub(nav, location);
    dir.normalize();
    dir.mult(100);
    acceleration=dir;
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    println(location);
  }

  void display() {
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
