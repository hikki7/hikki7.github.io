Mover mover;

void setup() {
  fullScreen(P2D);
  background(21);
  smooth();
  mover=new Mover();
}


void draw() {
  if (mousePressed) {
    rectMode(CORNER);
    noStroke();
    fill(21, 20);
    rect(0, 0, width, height);

    mover.update();
    mover.display();
    mover.checkEdge();
  }
}
