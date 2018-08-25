Oscillator osc;

void setup() {
  fullScreen(P2D);
  noCursor();
  osc=new Oscillator();
}


void draw() {
  background(21);

  osc.oscillate();
  osc.display();
}
