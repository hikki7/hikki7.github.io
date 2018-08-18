Mover mover;
PVector wind;
float t=0;

void setup() {
  fullScreen();
  mover=new Mover();
  wind=new PVector(0, 0);
}

void draw() {
  background(51);
  mover.update();
  mover.checkEdge();
  mover.display();
  wind.y=map(noise(t), 0, 1, -0.01, -0.001);
  mover.addForce(wind);
  t+=0.01;
}
