Particle ps;

void setup() {
  fullScreen();
  ps=new Particle(new PVector(width/2, 10));
}


void draw() {
  background(21);
  ps.run();
  if(ps.isDead()){
     //println("dead"); 
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifeSpan;
  float diameter=16;

  Particle(PVector l) {
    acceleration=new PVector(0, 0.1);
    velocity=new PVector(random(-1, 1), random(-1, 1));
    location=l.get();
    lifeSpan=225;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifeSpan-=2;
  }

  void display() {
    stroke(255, lifeSpan);
    fill(255, lifeSpan);
    ellipse(location.x, location.y, diameter, diameter);
  }

  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
