class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float diameter;

  Mover(float m,float x,float y) {
    location=new PVector(x,y); 
    velocity=new PVector(0, 0);
    acceleration=new PVector(0, 0);
    mass=m;
    diameter=18*mass;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(30);
    location.add(velocity);
    acceleration.mult(0);//毎回加速度は0にしないとだめ
  }

  void checkEdge() {
    if (location.x>width-diameter/2) {
      location.x=diameter/2;
    }
    if (location.x<diameter/2) {
      location.x=width-diameter/2;
    }
    if (location.y>height-diameter/2) {
      velocity.y*=-1;
      location.y=height-diameter/2;
    }
    if (location.y<diameter/2) {
      velocity.y*=-1;
      location.y=diameter/2;
    }
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void addForce(PVector force) {
    //PVector f=force.getで値を持ってきてもいい
    PVector f=PVector.div(force, mass); 
    acceleration.add(f);
  }
}
