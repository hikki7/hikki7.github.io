ArrayList<Particle> ps=new ArrayList<Particle>();
ArrayList<Confetti> cf=new ArrayList<Confetti>();
ArrayList<Triangle> ta=new ArrayList<Triangle>();

int num=20;
float hue;
PVector gravity=new PVector(0,0.1);

void setup() {
  fullScreen();
  background(21);
  smooth();
  noCursor();
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  for (int i=0; i<num; i++) {
    ps.add(new Particle(new PVector(width/4, 10), random(360),random(3)));
    cf.add(new Confetti(new PVector(width*3/4, 10), random(360),random(3)));
    ta.add(new Triangle(new PVector(width/2,10),random(360),random(3)));
  }
}

void draw() {
  background(21);

  if (frameCount%20==0) {
    for (int i=0; i<num; i++) {
      ps.add(new Particle(new PVector(width/4, 10), random(360),random(3)));
      cf.add(new Confetti(new PVector(width*3/4, 10), random(360),random(3)));
      ta.add(new Triangle(new PVector(width/2,10),random(360),random(3)));
    }
  }

  for (int i=ps.size()-1; i>0; i--) {
    Particle p=ps.get(i);
    Confetti c=cf.get(i);
    Triangle t=ta.get(i);
    p.applyForce(gravity);
    p.run();
    c.applyForce(gravity);
    c.run();
    t.applyForce(gravity);
    t.run();
    if (p.isDead()) {
      ps.remove(i);
      cf.remove(i);
      ta.remove(i);
    }
  }
}
