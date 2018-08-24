
class Ship {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float dump=0.995;
  float maxSpeed=6;
  float r=32;
  float mass=1;
  boolean trigger=false;
  float heading=random(2*PI);

  Ship() {
    location=new PVector(random(width), random(height));
    velocity=new PVector();
    acceleration=new PVector();
  }

  void update() {
    velocity.add(acceleration);
    velocity.mult(dump);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void warpEdge() {
    float buffer=r*2;
    if (location.x>width+buffer) location.x=-buffer;
    else if (location.x<-buffer) location.x=width+buffer;
    if (location.y>height+buffer) location.y=-buffer;
    else if (location.y<-buffer) location.y=height+buffer;
  }

  void addForce(PVector force) {
    PVector Force=force.get();
    Force.div(mass);
    acceleration.add(Force);
  }

  void turn(float a) {
    heading+=a;
    println(a);
  }

  void thrust() {
    float angle=heading-PI/2;
    PVector force=new PVector(cos(angle), sin(angle));
    force.mult(0.1);
    addForce(force);
    trigger=true;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);
    stroke(0);
    strokeWeight(2);
    fill(64);
    if (trigger) fill(255, 0, 0);
    rectMode(CENTER);
    rect(-r/2, r, r/3, r/3);
    rect(r/2, r, r/3, r/3);
    fill(64);
    beginShape();
    vertex(-r, r);
    vertex(0, -r);
    vertex(r, r);
    endShape(CLOSE);
    popMatrix();
    trigger=false;
  }
}
