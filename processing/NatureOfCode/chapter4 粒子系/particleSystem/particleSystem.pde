Particle ps;

void setup() {
  fullScreen();
  noCursor();
  ps=new Particle(new PVector(width/2, 10));
}


void draw() {
  background(21);
  ps.run();
  if(ps.isDead()){
     //println("dead"); 
  }
}
