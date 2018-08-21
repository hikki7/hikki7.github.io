class Mover {

  PVector location;
  PVector velocity;
  PVector dir;
  PVector mouse;
  PVector acceleration;
  float diameter=10;
  float topSpeed=30;
  float diam;

  Mover() {
    location=new PVector(random(width), random(height)); 
    velocity=new PVector(0, 0);
  }

  void update() {
    mouse=new PVector(mouseX, mouseY);
    //static化
    dir=PVector.sub(mouse, location);
    diam=dir.mag();
    diam=map(diam, 0, 1000, 0, 1);
    acceleration=dir;
    acceleration.normalize();
    acceleration.mult(diam);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display() {
    fill(12,12,220);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);
  }

  void checkEdge() {
    if (location.x>width||location.x<0) {
      velocity.x*=-1;
    }
    if (location.y>height||location.y<0) {
      velocity.y*=-1;
    }
  }
}
