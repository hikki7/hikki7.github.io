

class Clock {

  //自転の時差
  float[]dDay={58.65, 243.0, 1.026, 0.408, 0.425, 0.746, 0.796, 27.32};
  //====================惑星のそれぞれの情報
  
  //planetsの質量
  float[]M={3.285, 48.67, 6.39, 18980, 5683, 868.1, 1024.3, 0.734581};
  //planetsの半径
  float[]R={2440, 6052, 3390, 69911, 58232, 25362, 24622, 1.737};
  //planetsの重力
  float[]G={3.7,8.87,3.711,24.79,10.44,8.87,11.15,1.62};
  //planetsの公転周期
  float[]RC={88,225,687,4380,10585,30660,60225,27};
  //planetsの自転周期
  float[]RP={58.6462,116.75,1.02595675,0.4135344,0.44403,0.71833,0.67125,27.32166};
  //planetsの表面積
  float[]SA={0.748,4.602,1.448,617.2,427,80.83,76.18,0.3793};
  //planetsの名前
  String[]planet={"Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Moon"};
  //planetsの色
  color[]col=new color[8];

  //==================地球の基本情報
  
  //地球の色
  color earthCol;
  //地球の質量
  float earthM=59.72 ;
  //地球の半径
  float earthR= 6371;
  //地球の重力
  float earthG=9.807;
  //地球の公転周期
  float earthRC=365;
  //地球の自転周期
  float earthRP=1;
  //地球の表面積
  float earthSA=5.101;

  //===============オブジェクト指向の部分
  float diam;//直径
  float day;//地球の日時
  float count;//resrt能力付きのframecount
  int choosePlanet;//何のplanetなのか

  //=================なんかみんなが使いそうなやつ
  float theta;//地球の時間の角度
  PVector centerEarth;//地球の真ん中
  PVector centerPlanets;//planetsの真ん中
  float diameter;//これは秒針みたいなイメージ
  float dayPlanets;

  Clock(float _diam, float _day, int _count, int _choosePlanet) {
    diam=_diam;
    day=_day;
    count=_count;
    choosePlanet=_choosePlanet;
    //それぞれの惑星の色
    col[0]=color(83, 83, 83);
    col[1]=color(237, 211, 111);
    col[2]=color(166, 133, 86);
    col[3]=color(128, 120, 104);
    col[4]=color(184, 163, 132);
    col[5]=color(104, 127, 135);
    col[6]=color(80, 120, 187);
    col[7]=color(162, 163, 152);

    centerEarth=new PVector(width/4+width/16, height/2); 
    centerPlanets=new PVector(width*3/4-width/16, height/2);
    earthCol=color(32, 62, 148);
    theta=radians(day*float(30))-PI/2;
    diameter=width/8;
    dayPlanets=day*dDay[choosePlanet];
  }

  //======================地球のbasicの実装
  void basicEarth() {
    stroke(earthCol);
    strokeWeight(2);
    for (int i=0; i<360; i++) {
      PVector basic=new PVector(centerEarth.x+diam*cos(radians(i)), centerEarth.y+diam*sin(radians(i)));
      point(basic.x, basic.y);
    }
  }

  //===================planetsのbasicの実装
  void basicPlanets() {
    stroke(col[choosePlanet]);
    //float dm=map(R[choosePlanet]/earthR, 0, 10, 0, 2);
    float dm=R[choosePlanet]/earthR;
    for (int i=0; i<360; i++) {
      PVector basic=new PVector(centerPlanets.x+diam*cos(radians(i))*dm, centerPlanets.y+diam*sin(radians(i))*dm);
      point(basic.x, basic.y);
    }
  }
  //===================地球の時間の部分
  void drawEarth() {
    stroke(144, 60);
    strokeWeight(2);
    for (int i=0; i<diameter; i+=5) {
      PVector locationEarth=new PVector(centerEarth.x+i*cos(theta), centerEarth.y+i*sin(theta)); 
      point(locationEarth.x, locationEarth.y);
    }
  }

  //===============planetの時間の部分
  void drawPlanet() {
    stroke(144, 60);
    strokeWeight(2);
    float planetTheta=theta*dDay[choosePlanet];
    for (int i=0; i<diameter; i+=5) {
      PVector locationPlanet=new PVector(centerPlanets.x+i*cos(planetTheta), centerPlanets.y+i*sin(planetTheta)); 
      point(locationPlanet.x, locationPlanet.y);
    }
  }

  //=================地球のtext
  void textEarth() {
    String EarthTime=int(day)+" days";
    fill(earthCol);
    textAlign(CENTER);
    textSize(20);
    text("Earth", centerEarth.x, centerEarth.y+diameter*3/2-60);
    textSize(30);
    text(EarthTime, centerEarth.x, centerEarth.y+diameter*3/2);
  }

  //===============planetsのtext
  void textPlanets() {
    String planetTime=int(dayPlanets)+" days";
    fill(col[choosePlanet]);
    textAlign(CENTER);
    textSize(20);
    text(planet[choosePlanet], centerPlanets.x, centerPlanets.y+diameter*3/2-60);
    textSize(30);
    text(planetTime, centerPlanets.x, centerPlanets.y+diameter*3/2);
  }

  //==============地球のgui的な部分
  void guiEarth() {
    noStroke();
    //=============地球の半径
    String radiusE="The radius of the earth is "+int(earthR)+" km";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(radiusE,10,30);
    fill(30);
    rect(10,50,width/6,15);
    float x=map(earthR/R[3],0,1,0,width/6);
    fill(earthCol);
    rect(10,50,x,15);
    
    //=============地球の質量
    String massE="The mass of the earth is "+int(earthM)+" ×10^23 kg";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(massE,10,120);
    fill(30);
    rect(10,140,width/6,15);
    x=map(earthM/M[3],0,1,0,width/6);
    fill(earthCol);
    rect(10,140,x,15);
    
    //=============地球の重力
    String gravityE="The gravity of the earth is "+earthG+" m/s^2";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(gravityE,10,210);
    fill(30);
    rect(10,230,width/6,15);
    x=map(earthG/G[3],0,1,0,width/6);
    fill(earthCol);
    rect(10,230,x,15);
    
    //============地球の公転周期
    String rcE="The revolution cycle of the earth is "+earthRC+" day";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(rcE,10,300);
    fill(30);
    rect(10,320,width/6,15);
    x=map(earthRC/RC[6],0,1,0,width/6);
    fill(earthCol);
    rect(10,320,x,15);
    
    //============地球の自転周期
    String rpE="The rotation period of the earth is "+earthRP+" day";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(rpE,10,390);
    fill(30);
    rect(10,410,width/6,15);
    x=map(earthRP/RP[1],0,1,0,width/6);
    fill(earthCol);
    rect(10,410,x,15);
    
    //============地球の表面積
    String saE="The surface area of the earth is "+earthSA+" ×10^8 km^2";
    textAlign(LEFT);
    textSize(13);
    fill(earthCol);
    text(saE,10,480);
    fill(30);
    rect(10,500,width/6,15);
    x=map(earthRP/RP[1],0,1,0,width/6);
    fill(earthCol);
    rect(10,500,x,15);
  }
}