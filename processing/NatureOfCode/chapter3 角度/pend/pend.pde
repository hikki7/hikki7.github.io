Pendulum p;

void setup() {
  fullScreen(P2D);
  p=new Pendulum(new PVector(width/2, 10), height*3/4);
}

void draw() {
  background(51); 
  p.update();
  p.drag();
  p.display();
}

void mousePressed(){
   p.clicked(mouseX,mouseY);
}

void mouseReleased(){
   p.stopDrag(); 
}
