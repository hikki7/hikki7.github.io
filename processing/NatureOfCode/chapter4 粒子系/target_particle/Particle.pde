class Particle {
  float hue;
  PVector target;
  PVector location;
  PVector velocity;
  float diam;
  float lifeSpan;

  Particle(float _hue, PVector _target, float _x, float _y) {
    hue=_hue;
    target=_target;
    diam=10;
    location=new PVector(_x+random(-20, 20), _y+random(-20, 20));
    velocity=new PVector();
    lifeSpan=225;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity=new PVector().sub(target, location);
    velocity.normalize();
    velocity.mult(5);
    location.add(velocity);

    lifeSpan-=2;
  }

  void display() {
    fill(hue, 80, 80, lifeSpan);
    noStroke();
    ellipse(location.x, location.y, diam, diam);
  }

  boolean isDead() {
    if (lifeSpan<0.0) {
      return true;
    } else {
      return false;
    }
  }
}
