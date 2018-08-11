import java.util.Random;
Random generator;
float hue=240;
float diameter=8;
walker w;

void setup() {
  fullScreen();
  generator=new Random();
  w=new walker();
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  fadeIn();
  w.draw();
  w.step();
}

void fadeIn(){
  fill(0,100,0,10);
  rect(0,0,width,height);
  
}

class walker {
  PVector loc;
  PVector velocity;

  walker() {
    loc=new PVector(width/2, height/2);
  }

  void draw() {
    fill(hue, 80, 80, 80);
    ellipse(loc.x, loc.y, diameter, diameter);
  }

  void step() {
    //ガウス分布にする
    float numX=(float)generator.nextGaussian();
    float numY=(float)generator.nextGaussian();
    float sd=10;

    velocity=new PVector(sd*numX, sd*numY);
    loc.add(velocity);
  }
}
