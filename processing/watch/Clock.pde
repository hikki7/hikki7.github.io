class Clock {

  //=========中点の位置
  PVector location;
  //=========それぞれの時間の方に伸びる時の位置ベクトル
  PVector hLoc;
  PVector mLoc;
  PVector sLoc;
  //=========時間の位置ベクトル
  PVector hl;
  PVector ml;
  PVector sl;
  //中点からの方向ベクトル
  PVector dh;
  PVector dm;
  PVector ds;
  //==========時計の部分の円
  float diam;
  //==========それぞれの時間の角度
  float h;
  float m;
  float s;
  //==========中の直径
  float d=3;
  //==========時計の中心
  PVector center;
  //==========使い捨てのloc
  PVector loc;
  PVector loc2;

  Clock(float hourT, float minuteT, float secondT, float diameter) {
    h=hourT-PI/2;
    m=minuteT-PI/2;
    s=secondT-PI/2;
    diam=diameter;
    center=new PVector(width/2, height/2);
    hl=new PVector(width/2+diam*cos(h), height/2+diam*sin(h));
    ml=new PVector(width/2+diam*cos(m), height/2+diam*sin(m));
    sl=new PVector(width/2+diam*cos(s), height/2+diam*sin(s));
    location=new PVector((hl.x+ml.x+sl.x)/3, (hl.y+ml.y+sl.y)/3);
    hLoc=new PVector(location.x, location.y);
    mLoc=new PVector(location.x, location.y);
    sLoc=new PVector(location.x, location.y);
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
    //==========時計の役割
    noStroke();
    fill(196);
    for (int i=0; i<width/4; i++) {
      ellipse(hLoc.x, hLoc.y, d, d);
      hLoc.add(dh);
      ellipse(mLoc.x, mLoc.y, 2, 2);
      mLoc.add(dm);
      ellipse(sLoc.x, sLoc.y, 1, 1);
      sLoc.add(ds);
    }
    fill(200, 10, 10);
    ellipse(location.x, location.y, d, d);
    ellipse(sl.x, sl.y, d, d);
    ellipse(ml.x, ml.y, d, d);
    ellipse(hl.x, hl.y, d, d);

    //===========時計の下の部分
    //===========hourの部分
    for (int i=0; i<hour(); i++) {
      fill(200, 10, 10, 30);
      loc=new PVector(width/2+diam*cos(radians(i*30)-PI/2), height/2+diam*sin(radians(i*30)-PI/2));
      loc2=new PVector(width/2+diam*cos(radians((i+1)*30)-PI/2), height/2+diam*sin(radians((i+1)*30)-PI/2));
      triangle(center.x, center.y, loc.x, loc.y, loc2.x, loc2.y);
    }
    //===========minuteの部分
    for (int i=0; i<minute(); i++) {
      fill(200, 10, 10, 30);
      loc=new PVector(width/2+diam*cos(radians(i*6)-PI/2), height/2+diam*sin(radians(i*6)-PI/2));
      loc2=new PVector(width/2+diam*cos(radians((i+1)*6)-PI/2), height/2+diam*sin(radians((i+1)*6)-PI/2));
      triangle(center.x, center.y, loc.x, loc.y, loc2.x, loc2.y);
    }
    //===========secondの部分
    for (int i=0; i<second(); i++) {
      fill(200, 10, 10, 30);
      loc=new PVector(width/2+diam*cos(radians(i*6)-PI/2), height/2+diam*sin(radians(i*6)-PI/2));
      loc2=new PVector(width/2+diam*cos(radians((i+1)*6)-PI/2), height/2+diam*sin(radians((i+1)*6)-PI/2));
      triangle(center.x, center.y, loc.x, loc.y, loc2.x, loc2.y);
    }
  }
}
