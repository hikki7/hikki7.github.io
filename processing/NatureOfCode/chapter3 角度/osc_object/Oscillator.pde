class Oscillator {

  PVector angle;
  PVector velocity;
  PVector amp;
  float diam=50;
  
  PVector avelocity;
  PVector aacceleration;
  

  Oscillator() {
    angle=new PVector(0.1,0.4);
    //velocity=new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    velocity=new PVector(0.1,0.2);
    //振幅
    amp=new PVector(random(width/2), random(height/2));
    //角速度
    aacceleration=new PVector(random(0.001),random(0.001));
    avelocity=new PVector(0,0);
    
  }

  void oscillate() {
    angle.add(velocity);
    //角速度
    avelocity.add(aacceleration);
    angle.add(avelocity);
  }

  void display() {
    float x=sin(angle.x)*amp.x; 
    float y=sin(angle.y)*amp.y;

    pushMatrix();
    translate(width/2, height/2);
    stroke(144);
    fill(196);
    line(0, 0, x, y);
    ellipse(x, y, diam, diam);
    popMatrix();
  }
}
