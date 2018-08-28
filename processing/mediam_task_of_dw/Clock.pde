class Clock {

  //自転の時差
  float[]dDay={58.65, 243.0, 1.026, 0.408, 0.425, 0.746, 0.796, 27.32};
  //====================惑星のそれぞれの情報
  //planetsの質量
  float[]M={3.285, 48.67, 6.39, 18980, 5683, 868.1, 1024.3, 0.734581};
  //planetsの半径
  float[]R={2440, 6052, 3390, 69911, 58232, 25362, 24622, 1.737};
  //planetsの重力
  float[]G={3.7, 8.87, 3.711, 24.79, 10.44, 8.87, 11.15, 1.62};
  //planetsの公転周期
  float[]RC={88, 225, 687, 4380, 10585, 30660, 60225, 27};
  //planetsの自転周期
  float[]RP={58.6462, 116.75, 1.02595675, 0.4135344, 0.44403, 0.71833, 0.67125, 27.32166};
  //planetsの表面積
  float[]SA={0.748, 4.602, 1.448, 617.2, 427, 80.83, 76.18, 0.3793};
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
  PVector[]location=new PVector[8];//下のplanetの位置
  float[]dm=new float[8];//下の部分の直径

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

    centerEarth=new PVector(width/4+width/16, height/3); 
    centerPlanets=new PVector(width*3/4-width/16, height/3);
    earthCol=color(32, 62, 148);
    theta=radians(day*float(30))-PI/2;
    diameter=width/8;
    dayPlanets=day*dDay[choosePlanet];

    //=============ここから下のplanetsの一覧
    location[0]=new PVector(30, height*5/6);
    location[1]=new PVector(width/15+10, height*5/6);
    location[2]=new PVector(width/8+10, height*5/6);
    location[3]=new PVector(width/3-40, height*5/6);
    location[4]=new PVector(width/2+130, height*5/6);
    location[5]=new PVector(width*3/4+50, height*5/6);
    location[6]=new PVector(width*7/8+50, height*5/6);
    location[7]=new PVector(width-30, height*5/6);

    //=============ここからは下のplanetsのdの一覧
    dm[0]=R[0]/earthR;
    dm[1]=R[1]/earthR;
    dm[2]=R[2]/earthR;
    dm[3]=R[3]/earthR;
    dm[4]=R[4]/earthR;
    dm[5]=R[5]/earthR;
    dm[6]=R[6]/earthR;
    dm[7]=R[7]/earthR;
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
    text(radiusE, 10, 30);
    fill(30);
    rect(10, 50, width/6, 15);
    float x=map(earthR/R[3], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 50, x, 15);

    //=============地球の質量
    String massE="The mass of the earth is "+int(earthM)+" ×10^23 kg";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(massE, 10, 120);
    fill(30);
    rect(10, 140, width/6, 15);
    x=map(earthM/M[3], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 140, x, 15);

    //=============地球の重力
    String gravityE="The gravity of the earth is "+earthG+" m/s^2";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(gravityE, 10, 210);
    fill(30);
    rect(10, 230, width/6, 15);
    x=map(earthG/G[3], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 230, x, 15);

    //============地球の公転周期
    String rcE="The revolution cycle of the earth is "+earthRC+" day";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(rcE, 10, 300);
    fill(30);
    rect(10, 320, width/6, 15);
    x=map(earthRC/RC[6], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 320, x, 15);

    //============地球の自転周期
    String rpE="The rotation period of the earth is "+earthRP+" day";
    textAlign(LEFT);
    textSize(15);
    fill(earthCol);
    text(rpE, 10, 390);
    fill(30);
    rect(10, 410, width/6, 15);
    x=map(earthRP/RP[1], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 410, x, 15);

    //============地球の表面積
    String saE="The surface area of the earth is "+earthSA+" ×10^8 km^2";
    textAlign(LEFT);
    textSize(13);
    fill(earthCol);
    text(saE, 10, 480);
    fill(30);
    rect(10, 500, width/6, 15);
    x=map(earthSA/SA[1], 0, 1, 0, width/6);
    fill(earthCol);
    rect(10, 500, x, 15);
  }

  //==============planetsのgui的な部分
  void guiplanets() {
    noStroke();
    //=============planetsの半径
    String radiusP="The radius of "+planet[choosePlanet]+" is "+int(earthR)+" km";
    textAlign(RIGHT);
    textSize(15);
    fill(col[choosePlanet]);
    text(radiusP, width-10, 30);
    fill(30);
    rect(width*5/6-10, 50, width/6, 15);
    float x=map(R[choosePlanet]/R[3], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 50, x, 15);

    //=============planetsの質量
    String massP="The mass of the "+planet[choosePlanet]+" is "+int(earthM)+" ×10^23 kg";
    textAlign(RIGHT);
    textSize(15);
    fill(col[choosePlanet]);
    text(massP, width-10, 120);
    fill(30);
    rect(width*5/6-10, 140, width/6, 15);
    x=map(M[choosePlanet]/M[3], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 140, x, 15);

    //=============planetsの重力
    String gravityP="The gravity of the "+planet[choosePlanet]+" is "+earthG+" m/s^2";
    textAlign(RIGHT);
    textSize(15);
    fill(col[choosePlanet]);
    text(gravityP, width-10, 210);
    fill(30);
    rect(width*5/6-10, 230, width/6, 15);
    x=map(G[choosePlanet]/G[3], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 230, x, 15);

    //============planetsの公転周期
    String rcP="The revolution cycle of the "+planet[choosePlanet]+" is "+earthRC+" day";
    textAlign(RIGHT);
    textSize(15);
    fill(col[choosePlanet]);
    text(rcP, width-10, 300);
    fill(30);
    rect(width*5/6-10, 320, width/6, 15);
    x=map(RC[choosePlanet]/RC[6], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 320, x, 15);

    //============planetsの自転周期
    String rpP="The rotation period of the "+planet[choosePlanet]+" is "+earthRP+" day";
    textAlign(RIGHT);
    textSize(15);
    fill(col[choosePlanet]);
    text(rpP, width-10, 390);
    fill(30);
    rect(width*5/6-10, 410, width/6, 15);
    x=map(RP[choosePlanet]/RP[1], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 410, x, 15);

    //============planetsの表面積
    String saP="The surface area of the "+planet[choosePlanet]+" is "+earthSA+" ×10^8 km^2";
    textAlign(RIGHT);
    textSize(13);
    fill(col[choosePlanet]);
    text(saP, width-10, 480);
    fill(30);
    rect(width*5/6-10, 500, width/6, 15);
    x=map(SA[choosePlanet]/SA[3], 0, 1, 0, width/6);
    fill(col[choosePlanet]);
    rect(width-10-x, 500, x, 15);
  }

  //======================上のtextのspeedが何倍かを表示
  void drawSpeed() {
    String speedX="×"+dDay[choosePlanet];
    textAlign(CENTER);
    fill(51);
    noStroke();
    textSize(20);
    text("speed", width/2, height/8-50);
    textSize(30);
    text(speedX, width/2, height/8);
  }

  //====================下のplanetsを頑張る
  void borderPlanets() {
    noFill();
    stroke(51);
    strokeWeight(1);
    line(0, height*5/6, width, height*5/6);
  }

  //===================下の部分のplanetsの実装
  void selectedPlanets() {
    stroke(196);
    strokeWeight(3);
    //=====================水星
    fill(col[0]);
    ellipse(location[0].x, location[0].y, dm[0]*30, dm[0]*30);
    //=====================金星
    fill(col[1]);
    ellipse(location[1].x, location[1].y, dm[1]*30, dm[1]*30);
    //====================火星
    fill(col[2]);
    ellipse(location[2].x, location[2].y, dm[2]*30, dm[2]*30);
    //===================木星
    fill(col[3]);
    ellipse(location[3].x, location[3].y, dm[3]*30, dm[3]*30);
    //===================土星
    fill(col[4]);
    ellipse(location[4].x, location[4].y, dm[4]*30, dm[4]*30);
    //==================天王星
    fill(col[5]);
    ellipse(location[5].x, location[5].y, dm[5]*30, dm[5]*30);
    //=================海王星
    fill(col[6]);
    ellipse(location[6].x, location[6].y, dm[6]*30, dm[6]*30);
    //=================月
    fill(col[7]);
    ellipse(location[7].x, location[7].y, dm[7]*30, dm[7]*30);
  }
}
