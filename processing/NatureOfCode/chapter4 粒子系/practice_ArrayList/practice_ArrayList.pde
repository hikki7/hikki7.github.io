int total=100;
//ArrayListの準備
ArrayList<Particle> ps=new ArrayList<Particle>();

void setup() {
  //size(500,500);
  fullScreen();
  noCursor();
  colorMode(HSB,360,100,100,100);
  blendMode(ADD);
  for (int i=0; i<total; i++) {
    ps.add(new Particle(new PVector(width/2, 10),random(360)));
  }
}


void draw() {
  background(21);
  if(frameCount%30==0){
    for (int i=0; i<total; i++) {
    ps.add(new Particle(new PVector(width/2, 10),random(360)));
  }
  }
  for (int i=ps.size()-1; i>0; i--) {
    Particle p=ps.get(i);
    p.run();
    if (p.isDead()) {
      ps.remove(i);
    }
  }
  
}

void mousePressed() {
  for (int i=0; i<total; i++) {
    ps.add(new Particle(new PVector(width/2, 10),random(360)));
  }
}
