class Clock {

  //==============右上のtext用
  PFont fontType;
  int daycount=0;
  String earthDay;

  //===========それぞれの向かっているときの惑星の位置ベクトル
  PVector earthLocation;
  PVector planetLocation;
  //===========時間の位置ベクトル
  PVector el;
  PVector pl;
  //===========中心からの方向ベクトル
  PVector de;
  PVector dp;
  //===========時計の直径
  float diam;
  //==========角度
  float eTheta;
  float pTheta;
  //===========円の大きさ
  float d;
  //===========中心
  PVector center;


  Clock(float earthT, float diameter, float planetT) {
    fontType=loadFont("Stellar-Light-48.vlw");
    earthLocation=new PVector(width/2, height/2);
    planetLocation=new PVector(width/2, height/2);
    eTheta=earthT-PI/2;
    pTheta=planetT-PI/2;
    diam=diameter;
    el=new PVector(width/2+diam*cos(eTheta), height/2+diam*sin(eTheta));
    pl=new PVector(width/2+diam*cos(pTheta), height/2+diam*sin(pTheta));
    d=3;
    center=new PVector(width/2, height/2);
    de=PVector.sub(el, center);
    de.normalize();
    de.mult(5);
    dp=PVector.sub(pl, center);
    dp.normalize();
    dp.mult(5);
  }

  void display() {
    //==============時計の役割
    noStroke();
    for (int i=0; i<width/4; i++) {
      fill(10, 10, 200);
      ellipse(earthLocation.x, earthLocation.y, d, d);
      earthLocation.add(de);
      fill(200, 10, 10);
      ellipse(planetLocation.x, planetLocation.y, d, d);
      planetLocation.add(dp);
    }

    noStroke();
    fill(10, 10, 200, 60);
    ellipse(el.x, el.y, d, d);
    fill(200, 10, 10, 60);
    ellipse(pl.x, pl.y, d, d);
  }

  void textDiaplay() {
    daycount=frameCount/60;
    earthDay="earth's day is ";
    textFont(fontType, 30);
    textAlign(RIGHT);
    fill(0, 102, 153);
    text(earthDay, width-50, 60);
    text(daycount, width-10, 60);
  }
}
