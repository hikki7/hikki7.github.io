class Effect {
  int count;
  float diam;
  PVector center;
  boolean checkSecond;
  PVector loc;
  PVector startLoc;
  Effect(float diameter) {
    diam=diameter;
    count=0;
    center=new PVector(width/2, height/2);
    checkSecond=false;
    startLoc=new PVector(width/2, height/2-diam);
  }

  void check() {
    if (second()==0) {
      secondEffect();
      checkSecond=true;
    }
  }

  //==============effectは取れるようになった
  void secondEffect() {
    float noise=random(100);
    float[]h=new float[width/4];
    for (int i=0; i<h.length; i+=4) {
      h[i]=map(noise(noise), 0, 1, 0, width/4);
      stroke(200, 10, 10);
      line(i, height/2, i, height/2-h[i]);
      line(width-i, height/2, width-i, height/2-h[i]);
      stroke(196);
      line(i, height/2, i, height/2+h[i]);
      line(width-i, height/2, width-i, height/2+h[i]);
      noise+=0.01;
    }
  }
}
