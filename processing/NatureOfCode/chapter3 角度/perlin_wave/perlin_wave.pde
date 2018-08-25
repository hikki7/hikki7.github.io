
float start=0;
float angleval=0.1;
float diam=30;
float yoff=0;

void setup(){
  fullScreen(P2D);
  smooth();
}

void draw(){
  background(51);
  
  noStroke();
  fill(196,50);
  for(int x=0;x<width;x+=24){
    float y=map(noise(yoff),0,1,0,height);
    ellipse(x,y,diam,diam);
    yoff+=0.01;
  }
}
