class Clock {

  //===========それぞれの向かっているときの惑星の位置ベクトル
  PVector earthLocation;
  //===========時間の位置ベクトル
  PVector el;
  //===========中心からの方向ベクトル
  PVector de;
  //===========時計の直径
  float diam;
  //==========角度
  float eTheta;
  //===========円の大きさ
  float d;
  //===========中心
  PVector center;
  //===========1秒前の位置ベクトル
  PVector be;
  
  Clock(float earthT, float diameter,float beforeTheta) {
    earthLocation=new PVector(width/2,height/2);
    eTheta=earthT-PI/2;
    diam=diameter;
    el=new PVector(width/2+diam*cos(eTheta), height/2+diam*sin(eTheta));
    be=new PVector(width/2+diam*cos(beforeTheta-PI/2), height/2+diam*sin(beforeTheta-PI/2));
    d=3;
    center=new PVector(width/2,height/2);
    de=PVector.sub(el,center);
    de.normalize();
    de.mult(5);
  }

  void display() {
    //==============時計の役割
    noStroke();
    fill(10,10,200);
    for(int i=0;i<width/4;i++){
        ellipse(earthLocation.x,earthLocation.y,d,d);
        earthLocation.add(de);
    }

    noStroke();
    fill(10, 10, 200,60);
    ellipse(el.x, el.y, d, d);
    
    //=============時計の下の部分
    fill(10,10,200);
    triangle(center.x,center.y,el.x,el.y,be.x,be.y);
    
    
  }
}
