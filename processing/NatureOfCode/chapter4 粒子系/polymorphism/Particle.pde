class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  //=============角運動
  float theta=0;
  float aAcceleration=0;
  float aVelocity=0;

  float lifeSpan=255;
  float hue;
  float mass;

  Particle(PVector l, float _hue,float _mass) {
    mass=_mass;
    location=l.get();
    velocity=new PVector(random(-1, 1), random(-1, 1));
    acceleration=new PVector(0, 0);
    hue=_hue;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);

    aAcceleration=(velocity.x+velocity.y)/20;
    aVelocity+=aAcceleration;
    aVelocity=constrain(aVelocity, -1, 1);
    theta+=aVelocity;
    lifeSpan-=2;
  }

  void display() {
    fill(hue, 80, 80, lifeSpan);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    ellipse(0, 0, mass*10, mass*10);
    popMatrix();
  }
  
  void applyForce(PVector _force){
    PVector force=_force.get();
    force.div(mass);
    acceleration.add(force);
  }

  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
