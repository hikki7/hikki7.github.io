class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float diameter;
  float mass;


  Mover(float m, float vx, float vy) {
    mass=m;
    diameter=18*mass;
    location=new PVector(random(width)+diameter/2, random(height)+diameter/2);
    velocity=new PVector(vx, vy);
    acceleration=new PVector(0, 0);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void draw() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void addForce(PVector force) {
    PVector f=PVector.div(force, mass);
    acceleration.add(f);
  }

  void bounding() {
    if (location.x<diameter/2) {
      velocity.x*=-1;
      location.x=diameter/2;
    } else if (location.x>width-diameter/2) {
      velocity.x*=-1;
      location.x=width-diameter/2;
    }
    if (location.y>height-diameter/2) {
      velocity.y*=-1;
      location.y=height-diameter/2;
    } else if (location.y<diameter/2) {
      velocity.y*=-1;
      location.y=diameter/2;
    }
  }
}
