int total=10;
PVector targetLoc;
PVector targetVec;
int targetSize=30;
float xnoise;
float ynoise;


ArrayList<Particle> ps=new ArrayList<Particle>();

void setup() {

  fullScreen(P2D);
  //noCursor();
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  targetLoc=new PVector(random(targetSize, width-targetSize), random(targetSize, height-targetSize));
  xnoise=0;
  ynoise=100;
  blendMode(ADD);
}

void draw() {
  background(21);
  targetVec=new PVector(map(noise(xnoise), 0, 1, -5, 5), map(noise(ynoise), 0, 1, -5, 5));
  targetLoc.add(targetVec);
  noStroke();
  fill(255);
  ellipse(targetLoc.x, targetLoc.y, 20, 20);
  xnoise+=0.001;
  ynoise+=0.001;

  if (targetLoc.x<10) {
    targetLoc.x=width-10;
  } else if (targetLoc.x>width-10) {
    targetLoc.x=10;
  }

  if (targetLoc.y>height-10) {
    targetLoc.y=10;
  } else if (targetLoc.y<10) {
    targetLoc.y=height-10;
  }

  for (int i=ps.size()-1; i>0; i--) {
    Particle p=ps.get(i);
    p.run();
    
    if(p.isDead()){
       ps.remove(i); 
    }
  }
  saveFrame("frames/#####.tif");
}

void mousePressed() {
  for (int i=0; i<total; i++) {
    ps.add(new Particle(random(360), targetLoc,mouseX,mouseY));
  }
}
