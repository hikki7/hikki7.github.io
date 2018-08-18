class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float diameter;
 

  Mover() {
    location=new PVector(random(width/4)+width/2,random(height/4)+height/2);
    velocity=new PVector(1, 0);
    acceleration=new PVector(0, 0);
    mass=1;
    diameter=16;
  }

  void addForce(PVector force) {
    PVector f=PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void boundingEdges() {
    if (location.x>width-diameter/2) {
      location.x=width-diameter/2; 
      velocity.x*=-1;
    } else if (location.x<diameter/2) {
      location.x=diameter/2; 
      velocity.x*=-1;
    }

    if (location.y>height-diameter/2) {
      location.y*=height-diameter/2;
      velocity.y*=-1;
    } else if (location.y<diameter/2) {
      location.y=diameter/2;
      velocity.y*=-1;
    }
  }
}
