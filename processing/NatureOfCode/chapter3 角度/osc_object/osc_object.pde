Oscillator osc;

void setup(){
  fullScreen(P2D);
  background(21);
  osc=new Oscillator();
}


void draw(){
  fill(21,20);
  noStroke();
  rect(0,0,width,height);
  
  osc.oscillate();
  osc.display();
}
