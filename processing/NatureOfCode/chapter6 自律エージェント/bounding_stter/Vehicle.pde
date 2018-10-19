class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;//ゾウとか重さによって違うから
  float maxSpeed;//ワープすることを防ぐため

  Vehicle(float x, float y) {
    acceleration=new PVector(0, 0);
    velocity=new PVector(random(-3,3), random(-3,3));
    location=new PVector(x, y);
    r=6;
    maxSpeed=10;
    maxForce=0.3;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void bounding() {
    PVector desired=null;
    if (location.x<d) {
       desired=new PVector(maxSpeed, velocity.y);
    } else if (location.x>width-d) {
       desired=new PVector(-maxSpeed, velocity.y);
    } 
    if (location.y<d) {
       desired=new PVector(velocity.x, maxSpeed);
    } else if (location.y>height-d) {
       desired=new PVector(velocity.x, -maxSpeed);
    } 
    
    if(desired!=null){
       desired.normalize();
       desired.mult(maxSpeed);
       PVector steer=PVector.sub(desired,velocity);
       steer.limit(maxForce);
       applyForce(steer);
    }
  }

  void display() {
    float theta=velocity.heading2D()+PI/2;
    fill(0, 100, 100, 100);
    stroke(0, 100, 100, 100);
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
