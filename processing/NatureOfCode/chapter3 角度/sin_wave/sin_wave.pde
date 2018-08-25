float startTheta=0;
float angleVal=0.1;
float diameter=30;

void setup() {
  fullScreen(P2D);
  smooth();
  
}

void draw() {
  background(51);

  float angle=startTheta;
  noStroke();
  fill(196,50);
  for (int x=0; x<width; x+=24) {
    float y=map(sin(angle), -1, 1, 0, height);
    ellipse(x, y, diameter, diameter);
    angle+=angleVal;
  }
}
