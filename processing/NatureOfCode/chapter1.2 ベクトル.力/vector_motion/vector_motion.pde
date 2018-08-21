Mover mover;

void setup() {
  size(600, 600);
  mover=new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.display();
  mover.check();
  mover.limit();
}

void keyPressed() {
  if (keyCode==UP) {
    mover.velocity.mult(1.25);
  } else if (keyCode==DOWN) {
    mover.velocity.mult(0.75);
  }
}



class Mover {

  PVector location;
  PVector velocity;
  float diameter=50;
  PVector acceleration;

  Mover() {
    location=new PVector(width/2, height/2);
    velocity=new PVector(random(10)-5, random(10)-5);
    velocity.normalize();
    velocity.mult(5);
    acceleration=new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    //println(velocity.mag());
    location.add(velocity);
  }

  void display() {
    fill(51);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);
  }

  void check() {
    if (width<location.x) {
      location.x=0;
    } else if (0>location.x) {
      location.x=width;
    }

    if (height<location.y) {
      location.y=0;
    } else if (location.y<0) {
      location.y=height;
    }
  }

  void limit() {
    float speed=velocity.mag();
    if (speed>20) {
      velocity.normalize();
      velocity.mult(20);
    }
  }
}
