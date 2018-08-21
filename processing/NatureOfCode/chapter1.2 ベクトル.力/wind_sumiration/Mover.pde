class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float diameter;

  Mover() {
    location=new PVector(width/2, height); 
    velocity=new PVector(0, 0);
    acceleration=new PVector(0, 0);
    mass=1.0;
    diameter=18;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(30);
    location.add(velocity);
    acceleration.mult(0);//毎回加速度は0にしないとだめ
  }

  void checkEdge() {
    if (location.y<0) {
      velocity.y*=-1;
    }
  }

  void display() {
    fill(255);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void addForce(PVector force) {
    //PVector f=force.getで値を持ってきてもいい
    PVector f=PVector.div(force, mass); 
    acceleration.add(f);
  }
}
