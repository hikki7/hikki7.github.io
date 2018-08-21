class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  float angle;
  float aVelocity=0;
  float aAcceleration;

  Mover(float m, float x, float y, float z) {
    mass=m;
    location=new PVector(x, y, z);
    velocity=new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
    acceleration=new PVector(0, 0, 0);
  }

  void addForce(PVector force) {
    PVector f=PVector.div(force, mass); 
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //角運動のやつ
    //一個一個の四角形を回転させる
    aAcceleration=acceleration.x/10;
    aVelocity+=aAcceleration;
    aVelocity=constrain(aVelocity, -0.1, 0.1);
    angle+=aVelocity;

    acceleration.mult(0);
  }

  void display() {
    stroke(121);
    fill(96);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotateX(angle);
    rotateY(angle/2);
    box(mass*16);
    //rect(0, 0, mass*16, mass*16);
    popMatrix();
  }
}
