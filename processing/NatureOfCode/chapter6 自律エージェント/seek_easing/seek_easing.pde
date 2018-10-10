
Vehicle v;

void setup(){
  fullScreen();
  smooth(8);
  colorMode(HSB,360,100,100,100);
  blendMode(ADD);
  v=new Vehicle(width/2,height/2);
}


void draw(){
  background(21);
  PVector mouse=new PVector(mouseX,mouseY);;
  
  colorMode(RGB);
  stroke(144);
  noFill();
  strokeWeight(2);
  ellipse(mouse.x,mouse.y,20,20);
  
  v.seek(mouse);
  v.update();
  v.display();
}
