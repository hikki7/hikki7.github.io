class Confetti extends Particle {

  Confetti(PVector l, float _hue,float _mass) {
    super(l, _hue,_mass);
  }

  void display() {
    rectMode(CENTER);
    fill(hue, 80, 80, lifeSpan);
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, mass*10, mass*10);
    popMatrix();
  }
}
