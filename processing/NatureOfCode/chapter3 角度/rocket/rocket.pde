Ship ship;


void setup() {
  fullScreen(P2D);
  //size(600,600,P2D);
  smooth();
  noCursor();
  ship=new Ship();
}


void draw() {
  background(21);

  ship.update();
  ship.warpEdge();
  ship.display();

  if (keyPressed) {
    if (key==CODED&&keyCode==RIGHT) {
      ship.turn(0.03);
    }
    if (key==CODED&&keyCode==LEFT) {
      ship.turn(-0.03);
    }
    if (key=='z'||key=='Z') {
      ship.thrust();
    }
  }
}
