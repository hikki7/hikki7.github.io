class Clock {

  PVector location;
  PVector hLoc;
  PVector mLoc;
  PVector sLoc;
  PVector hl;
  PVector ml;
  PVector sl;
  PVector dh;
  PVector dm;
  PVector ds;
  float diam;
  float h;
  float m;
  float s;
  float d=3;

  Clock(float hourT, float minuteT, float secondT,float diameter) {
    h=hourT;
    m=minuteT;
    s=secondT;
    diam=diameter;
    hl=new PVector(width/2+diameter*cos(h),height/2+diameter*sin(h));
    ml=new PVector(width/2+diameter*cos(m),height/2+diameter*sin(m));
    sl=new PVector(width/2+diameter*cos(s),height/2+diameter*sin(s));
    location=PVector.add(hl, ml, sl);
    location.div(3);
    hLoc=new PVector(location.x,location.y);
    mLoc=new PVector(location.x,location.y);
    sLoc=new PVector(location.x,location.y);
    dh=PVector.sub(hl, location);
    dh.normalize();
    dh.mult(5);
    dm=PVector.sub(ml, location);
    dm.normalize();
    dm.mult(5);
    ds=PVector.sub(sl, location);
    ds.normalize();
    ds.mult(5);
  }

  void diaplay() {
    noStroke();
    fill(196);
    ellipse(location.x, location.y, d, d);
    fill(255,0,0);
    ellipse(hl.x,hl.y,10,10);
    //for(int i=0;i<100;i++){
    //    ellipse(hLoc.x,hLoc.y,d,d);
    //    hLoc.add(dh);
        
    //}
  }
}
