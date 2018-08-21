

class Attractor {
  float mass;
  PVector location;
  float diam;
  float g;

  Attractor() {
    location=new PVector(width/2, height/2);
    mass=20;
    g=0.4;
    diam=96;
  }

  void display() {
    stroke(121);
    strokeWeight(2);
    fill(96);
    pushMatrix();
    translate(location.x, location.y);
    sphere(diam);
    //ellipse(location.x, location.y, diam, diam);
    popMatrix();
  }

  PVector attract(Mover m) {
    PVector force=PVector.sub(location, m.location);
    float distance=force.mag();
    distance=constrain(distance, 5, 25);
    force.normalize();
    float strength=(g*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
  }
}
