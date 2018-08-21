Mover mover;

Attractor attract;

void setup(){
  fullScreen();
  smooth();
  mover=new Mover();
  attract=new Attractor();
}


void draw(){
  background(51);
  
  PVector force=attract.attract(mover);
  mover.addForce(force);
  mover.update();
  attract.drag();
  mover.display();
  attract.display();
  
  
}

void mousePressed(){
   attract.clicked(mouseX,mouseY); 
}

void mouseReleased(){
   attract.stopDragging(); 
}
