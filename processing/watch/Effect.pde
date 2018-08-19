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
    startLoc=new PVector(width/2,height/2-diam);
  }

  void check() {
    if (second()==0) {
      secondEffect();
      checkSecond=true;
    }
  }

  //==============effectは取れるようになった
  void secondEffect() {
    fill(0,0,255);
    ellipse(width/2,height/2,100,100);
    
  }
}
