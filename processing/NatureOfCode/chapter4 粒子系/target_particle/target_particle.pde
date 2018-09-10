int total=20;
PVector target;
int targetSize=30;
float t=0;

ArrayList<Particle> ps=new ArrayList<Particle>();

void setup() {

  fullScreen(P2D);
  //noCursor();
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(ADD);
  target=new PVector(random(targetSize,width-targetSize),random(targetSize,height-targetSize));
}

void draw() {
  background(21);
  if (frameCount%20==0) {
    for (int i=0; i<total; i++) {
      ps.add(new Particle(random(360)));
    }
  }
  for (int i=ps.size()-1; i>0; i--) {
    Particle p=ps.get(i);
  }
  //saveFrame("frames/#####.tif");
}
