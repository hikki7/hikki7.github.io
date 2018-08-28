class Clock {
  int choosePlanet;
  //自転の時差
  float[]dDay={58.65, 243.0, 1.026, 0.408, 0.425, 0.746, 0.796, 27.32};
  //惑星のそれぞれの情報
  float[]M={3.285, 48.67, 6.39, 18980, 5683, 868.1, 1024.3, 0.734581};
  float[]R={2440, 6052, 3390, 69911, 58232, 25362, 24622, 1.737};

  //=============clockの外見の部分
  float diam;
  PVector clockLoc;
  //=============dayの針の表示
  float day;
  float secondTheta;
  PVector location;//時計の周りの部分の場所
  float secondDiameter=3;
  PVector halfLocation;//途中の位置ベクトル
  PVector direction;//方向ベクトル
  int count;

  //==========planetsの針の表示
  float planetsTheta;
  PVector planetLoc;
  PVector halfPlanets;
  PVector planetsDir;

  //============右上のtext
  PFont fontType;
  String earthDay;
  String wPlanet;
  String planetDay;
  String weightPlanet;
  String radiusPlanet;
  float dayCount;
  int planetCount;

  String[]planet={"Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Moon"};

  Clock(float _diam, float _day, int _count, int _choosePlanet) {
    diam=_diam;
    day=_day;
    choosePlanet=_choosePlanet;
    //fontType=loadFont("Stellar-Light-48.vlw");
    earthDay="earth's day is ";
    count=_count;
    dayCount=count/60;
  }

  //===============時計の基盤を作るもの
  void setClock() {
    stroke(144, 60);
    strokeWeight(2);
    pushMatrix();
    translate(width*5/8, height/2);
    for (int i=0; i<360; i++) {
      clockLoc=new PVector(diam*cos(radians(i)), diam*sin(radians(i)));
      point(clockLoc.x, clockLoc.y);
    }
    popMatrix();
  }

  //=============planetsが変更された時に中の後をなくす
  void drawEllipse() {
    noStroke();
    fill(21);
    ellipse(width*5/8, height/2, diam*2, diam*2);
  }

  //============地球の時間の表示
  void drawDay() {
    //ここにfloatを付けるとint/float扱いになり、floatになるっぽい
    dayCount=count/float(60);
    secondTheta=radians(dayCount*30);
    fill(0, 102, 153, 60);
    noStroke();
    pushMatrix();
    translate(width*5/8, height/2);
    location=new PVector(diam*cos(secondTheta-PI/2), diam*sin(secondTheta-PI/2));
    halfLocation=new PVector(0, 0);
    direction=location;
    direction.normalize();
    direction.mult(5);
    ellipse(location.x, location.y, secondDiameter, secondDiameter);
    for (int i=0; i<diam/5; i++) {
      ellipse(halfLocation.x, halfLocation.y, secondDiameter, secondDiameter);
      halfLocation.add(direction);
    }
    popMatrix();
  }

  //============任意のplanetsの時間の表示
  void planetsDay() {
    //ここで秒数の時差の取得
    dayCount=count/float(60)*dDay[choosePlanet];
    planetsTheta=radians(dayCount*30);
    fill(153, 102, 0, 60);
    noStroke();
    pushMatrix();
    translate(width*5/8, height/2);
    planetLoc=new PVector(diam*cos(planetsTheta-PI/2), diam*sin(planetsTheta-PI/2));
    halfPlanets=new PVector(0, 0);
    planetsDir=planetLoc;
    planetsDir.normalize();
    planetsDir.mult(5);
    ellipse(planetLoc.x, planetLoc.y, secondDiameter, secondDiameter);
    for (int i=0; i<diam/5; i++) {
      ellipse(halfPlanets.x, halfPlanets.y, secondDiameter, secondDiameter);
      halfPlanets.add(planetsDir);
    }
    popMatrix();
  }

  void textFuild() {
    fill(30);
    noStroke();
    rect(0, 0, width/4, height);
  }  

  void textDisplay() {
    dayCount=count/60;
    planetCount=int(dayCount*dDay[choosePlanet]);
    earthDay="earth's day is "+int(dayCount);
    wPlanet="The planet you chose is "+planet[choosePlanet];
    planetDay="The day of this planet is "+planetCount;
    weightPlanet="The mass of this planet is "+M[choosePlanet]+"× 10^23 kg";
    radiusPlanet="The radius of this planet is "+R[choosePlanet]+" km";
    //グラフの元の部分
    fill(51);
    rect(10, 255, width/4-20, 15);
    rect(10, 345, width/4-20, 15);
    //fontは後回し
    //textFont(fontType);
    textSize(15);
    textAlign(LEFT);
    fill(0, 102, 153);
    text(wPlanet, 10, 60);
    text(earthDay, 10, 120);
    text(planetDay, 10, 180);
    text(weightPlanet, 10, 240);
    float widM=map(M[choosePlanet]/18980, 0, 1, 0, width/4-20);
    float widR=map(R[choosePlanet]/69911, 0, 1, 0, width/4-20);
    rect(10, 255, widM, 15);
    text(radiusPlanet, 10, 330);
    rect(10, 345, widR, 15);
  }
}
