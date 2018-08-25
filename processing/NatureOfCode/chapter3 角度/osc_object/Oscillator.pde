class Oscillator {

  PVector angle;
  PVector velocity;
  PVector amp;
  float diam=50;

  Oscillator() {
    angle=new PVector();
    velocity=new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    //振幅
    amp=new PVector(random(width/2), random(height/2));
  }

  void oscillate() {
    angle.add(velocity);
  }

  void display() {
    float x=sin(angle.x)*amp.x; 
    float y=sin(angle.y)*amp.y;

    pushMatrix();
    translate(width/2, height/2);
    stroke(144);
    fill(196);
    line(0, 0, x, y);
    ellipse(x, y, diam, diam);
    popMatrix();
  }
}
