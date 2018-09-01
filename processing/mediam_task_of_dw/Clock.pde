

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
  float[]col=new float[8];
  color[]Col=new color[8];
  color[]backCol=new color[8];

  //==================地球の基本情報

  //地球の色
  float earthCol;
  color earthColor;
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
  float[]dm=new float[8];//下の部分比を求める
  float dia;//下の部分の直径を求める
  int dr=10;
  int fontSize=12; 


  Clock(float _diam, float _day, int _count, int _choosePlanet) {
    diam=_diam;
    day=_day;
    count=_count;
    choosePlanet=_choosePlanet;
    //それぞれの惑星の色
    col[0]=20.8;
    col[1]=34.5;
    col[2]=19.6;
    col[3]=32.0;
    col[4]=54.1;
    col[5]=193;
    col[6]=221;
    col[7]=83.4;
    
    for(int i=0;i<Col.length;i++){
       Col[i]=color(col[i],50,75); 
       backCol[i]=color(col[i],50,20);
    }

    centerEarth=new PVector(width/4+width/16, height/3); 
    centerPlanets=new PVector(width*3/4-width/16, height/3);
    earthCol=226;
    earthColor=color(earthCol,50,75);
    theta=radians(day*float(30))-PI/2;
    diameter=width/8;
    dayPlanets=day*dDay[choosePlanet];

    //=============ここから下のplanetsの一覧
    for (int i=0; i<location.length; i++) {
      location[i]=new PVector(width*(i+1)/9, height*5/6);
    }

    //=============ここからは下のplanetsのdの一覧
    dm[0]=R[0]/earthR;
    dm[1]=R[1]/earthR;
    dm[2]=R[2]/earthR;
    dm[3]=R[3]/earthR;
    dm[4]=R[4]/earthR;
    dm[5]=R[5]/earthR;
    dm[6]=R[6]/earthR;
    dm[7]=R[7]/earthR;

    //=============下の部分の直径を求める
    dia=50;
  }

  //======================地球のbasicの実装
  void basicEarth() {
    stroke(earthCol, 50, 75);
    strokeWeight(2);
    for (int i=0; i<360; i++) {
      PVector basic=new PVector(centerEarth.x+diam*cos(radians(i)), centerEarth.y+diam*sin(radians(i)));
      point(basic.x, basic.y);
    }
  }

  //===================planetsのbasicの実装
  void basicPlanets() {
    stroke(col[choosePlanet], 50, 75);
    float dm=R[choosePlanet]/earthR;
    for (int i=0; i<360; i++) {
      PVector basic=new PVector(centerPlanets.x+diam*cos(radians(i))*dm, centerPlanets.y+diam*sin(radians(i))*dm);
      point(basic.x, basic.y);
    }
  }
  //===================地球の時間の部分
  void drawEarth() {
    stroke(144, 60);
    strokeWeight(5);
    for (int i=0; i<diameter; i+=5) {
      PVector locationEarth=new PVector(centerEarth.x+i*cos(theta), centerEarth.y+i*sin(theta)); 
      point(locationEarth.x, locationEarth.y);
    }
  }

  //===============planetの時間の部分
  void drawPlanet() {
    stroke(144, 60);
    strokeWeight(5);
    float planetTheta=theta*dDay[choosePlanet];
    for (int i=0; i<diameter; i+=5) {
      PVector locationPlanet=new PVector(centerPlanets.x+i*cos(planetTheta), centerPlanets.y+i*sin(planetTheta)); 
      point(locationPlanet.x, locationPlanet.y);
    }
  }

  //=================地球のtext
  void textEarth() {
    String EarthTime=int(day)+" days";
    fill(earthCol, 50, 75);
    textAlign(CENTER);
    textSize(20);
    text("Earth", centerEarth.x, centerEarth.y+diameter*3/2-60);
    textSize(30);
    text(EarthTime, centerEarth.x, centerEarth.y+diameter*3/2);
  }

  //===============planetsのtext
  void textPlanets() {
    String planetTime=int(dayPlanets)+" days";
    fill(col[choosePlanet], 50, 75);
    textAlign(CENTER);
    textSize(20);
    text(planet[choosePlanet], centerPlanets.x, centerPlanets.y+diameter*3/2-60);
    textSize(30);
    text(planetTime, centerPlanets.x, centerPlanets.y+diameter*3/2);
  }

  //==============地球のgui
  void guiEarth() {
    noStroke();
    Slider earthRadius;
    earthRadius=cp5.addSlider("The radius of the earth")
      .setPosition(10,70)
      .setRange(0,R[3])
      .setValue(earthR)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);
      

    //=============地球の質量
    Slider earthMass;
    earthMass=cp5.addSlider("The mass of the earth")
      .setPosition(10,140)
      .setRange(0,M[3])
      .setValue(earthM)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);


    //=============地球の重力
    Slider earthGravity;
    earthGravity=cp5.addSlider("The gravity of the earth")
      .setPosition(10,210)
      .setRange(0,G[3])
      .setValue(earthG)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);

    //============地球の公転周期
    Slider earthRoC;
    earthRoC=cp5.addSlider("The revolution cycle of the earth")
      .setPosition(10,280)
      .setRange(0,RC[6])
      .setValue(earthRC)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);

    //============地球の自転周期
    Slider earthrp;
    earthrp=cp5.addSlider("The rotation period of the earth")
      .setPosition(10,350)
      .setRange(0,RP[1])
      .setValue(earthRP)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);

    //============地球の表面積
    Slider earthsa;
    earthsa=cp5.addSlider("The surface area of the earth")
      .setPosition(10,420)
      .setRange(0,SA[1])
      .setValue(earthSA)
      .setSize(100, 10)
      .setColorValueLabel(earthColor);
  }

  //==============planetsのgui的な部分
  void guiplanets() {
    noStroke();
    //=============planetsの半径
    Slider planetRadius;
    planetRadius=cp5.addSlider("The radius of the "+planet[choosePlanet])
      .setPosition(width-220,70)
      .setRange(0,R[3])
      .setValue(R[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);

    //=============planetsの質量
    Slider planetmass;
    planetmass=cp5.addSlider("The mass of the "+planet[choosePlanet])
      .setPosition(width-220,140)
      .setRange(0,M[3])
      .setValue(M[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);
    
    //=============planetsの重力
    Slider planetgravity;
    planetgravity=cp5.addSlider("The gravity of the "+planet[choosePlanet])
      .setPosition(width-220,210)
      .setRange(0,G[3])
      .setValue(G[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);

    //============planetsの公転周期
    Slider planetrc;
    planetrc=cp5.addSlider("The revolution cycle of the "+planet[choosePlanet])
      .setPosition(width-220,280)
      .setRange(0,RC[6])
      .setValue(RC[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);

    //============planetsの自転周期
    Slider planetrp;
    planetrp=cp5.addSlider("The rotation period of the "+planet[choosePlanet])
      .setPosition(width-220,350)
      .setRange(0,RP[1])
      .setValue(RP[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);

    //============planetsの表面積
    Slider planetsa;
    planetsa=cp5.addSlider("The surface area of the "+planet[choosePlanet])
      .setPosition(width-220,420)
      .setRange(0,SA[3])
      .setValue(SA[choosePlanet])
      .setSize(100, 10)
      .setColorForeground(Col[choosePlanet])
      .setColorBackground(backCol[choosePlanet])
      .setColorValueLabel(Col[choosePlanet]);
  }

  //======================上のtextのspeedが何倍かを表示
  void drawSpeed() {
    String speedX="×"+dDay[choosePlanet];
    textAlign(CENTER);
    fill(225);
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
    noFill();
    for (int i=0; i<location.length; i++) {
      fill(col[i], 50, 75);
      ellipse(location[i].x, location[i].y, dia, dia);
    }
  }

  //====================下の部分のそれぞれがどのplanetsかを表示
  void informPlanets() {
    textAlign(CENTER);
    textSize(fontSize);
    for (int i=0; i<location.length; i++) {
      fill(col[i], 50, 75);
      text(planet[i], location[i].x, location[i].y+dia*2);
    }
  }
}
