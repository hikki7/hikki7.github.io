int total=100;
//ArrayListの準備
ArrayList<Particle> ps=new ArrayList<Particle>();

void setup() {
  //size(500,500);
  fullScreen();
  //noCursor();
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
}


void draw() {
  background(21);
  if (frameCount%20==0) {
    for (int i=0; i<total; i++) {
      ps.add(new Particle(new PVector(mouseX, mouseY), random(360)));
    }
  }
  for (int i=ps.size()-1; i>0; i--) {
    Particle p=ps.get(i);
    p.run();
    if (p.isDead()) {
      ps.remove(i);
    }
  }
  saveFrame("frames/######.tif");
}

void mousePressed() {
  for (int i=0; i<total; i++) {
    ps.add(new Particle(new PVector(mouseX, mouseY), random(360)));
  }
}
