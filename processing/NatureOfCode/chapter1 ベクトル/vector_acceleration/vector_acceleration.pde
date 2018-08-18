Mover[]mover=new Mover[2000];

void setup(){
  fullScreen();
  noCursor();
  for(int i=0;i<mover.length;i++){
    mover[i]=new Mover();
  }
}

void draw(){
  background(51);
  fill(255,0,0);
  ellipse(mouseX,mouseY,20,20);
  for(int i=0;i<mover.length;i++){
    mover[i].update();
    mover[i].checkEdge();
    mover[i].display();
  }
}
