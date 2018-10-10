class Vehicle {

  ArrayList<PVector>history=new ArrayList<PVector>();

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;//ゾウとか重さによって違うから
  float maxSpeed;//ワープすることを防ぐため

  Vehicle(float x, float y) {
    acceleration=new PVector(0, 0);
    velocity=new PVector(0, -2);
    location=new PVector(x, y);
    r=6;
    maxSpeed=4;
    maxForce=0.1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
    history.add(location.get());
    if (history.size()>100) {
      history.remove(0);
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired=PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);

    PVector steer=PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void display() {
    beginShape();
    colorMode(HSB, 360, 100, 100, 100);
    strokeWeight(1);
    noFill();
    for (int i=0; i<6; i++) {
      stroke(240, 80, 80, 100);
      for (PVector v : history) {
        vertex(v.x, v.y);
      }
      endShape();
    }

    float theta=velocity.heading2D()+PI/2;
    fill(0, 80, 80, 100);
    stroke(0, 80, 80, 100);
    strokeWeight(2);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    vertex(-2*r, 2*r);
    vertex(0, 0);
    vertex(2*r, 2*r);
    endShape(CLOSE);
    popMatrix();
  }
}
