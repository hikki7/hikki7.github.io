class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  float diameter=16;
  float mass=1.0;
  PVector gravity=new PVector(0,0.001);
  float hue;
  
  //=============角速度系
  float angle;
  float aVelocity=0;
  float aAcceleration;

  Particle(PVector l,float _hue) {
    acceleration=new PVector();
    //初速度
    velocity=new PVector(random(-5, 5), random(-5, 5));
    location=l.get();
    lifeSpan=225;
    hue=_hue;
  }

  void run() {
    addForce(gravity);
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifeSpan-=2;
    
    //角速度系
    aAcceleration=(acceleration.x+acceleration.y)/10;
    aVelocity+=aAcceleration;
    aVelocity=constrain(aVelocity,-1,1);
    angle+=aVelocity;
    
  }

  void display() {
    stroke(hue,80,80, lifeSpan);
    fill(hue,80,80, lifeSpan);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0, 0, diameter, diameter);
    popMatrix();
  }
  
  void addForce(PVector force){
    PVector f=PVector.div(force,mass);
    acceleration.add(f);
  }

  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
