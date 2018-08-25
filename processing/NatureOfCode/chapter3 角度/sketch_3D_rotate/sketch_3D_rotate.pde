Mover[]mover=new Mover[20];

Attractor a;

void setup() {
  fullScreen(P3D);
  smooth();
  noCursor();
  background(51);
  for (int i=0; i<mover.length; i++) {
    mover[i]=new Mover(random(0.1, 2), random(width), random(height), random(height/2));
  }
  a=new Attractor();
}



void draw() {
  rectMode(CORNER);
  noStroke();
  fill(51, 50);
  rect(0, 0, width, height);

  a.display();

  for (int i=0; i<mover.length; i++) {
    PVector force=a.attract(mover[i]); 
    mover[i].addForce(force);
    mover[i].update();
    mover[i].display();
  }
}
