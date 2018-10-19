
ArrayList<Vehicle> v=new ArrayList<Vehicle>();
int num=50;

float d=100;

void setup() {
  fullScreen();
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  noCursor();
  for (int i=0; i<num; i++) {
    v.add(new Vehicle(random(width), random(height)));
  }
}


void draw() {
  background(21);
  for (int i=v.size()-1; i>=0; i--) {
    Vehicle ve=v.get(i);
    ve.bounding();
    ve.update();
    ve.display();
  }
}
