class Clock {
  int choosePlanet;
  //自転の時差
  float[]dDay={58.65, 243.0, 1.026, 0.408, 0.425, 0.746, 0.796, 27.32};
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

  //============右上のtext
  PFont fontType;
  String earthDay;
  String wPlanet;
  String planetDay;
  int dayCount;
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

  //時計の基盤を作るもの
  void setClock() {
    stroke(144, 60);
    strokeWeight(2);
    pushMatrix();
    translate(width/2, height/2);
    for (int i=0; i<360; i++) {
      clockLoc=new PVector(diam*cos(radians(i)), diam*sin(radians(i)));
      point(clockLoc.x, clockLoc.y);
    }
    popMatrix();
  }

  void drawDay() {
    dayCount=count/60;
    secondTheta=radians(dayCount*30);
    //if(secondTheta>TWO_PI) secondTheta-=TWO_PI;
    fill(0, 102, 153, 60);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
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

  void textDisplay() {
    dayCount=count/60;
    planetCount=int(dayCount*dDay[choosePlanet]);
    earthDay="earth's day is "+dayCount;
    wPlanet="The planet you chose is "+planet[choosePlanet];
    planetDay="planet's day is "+planetCount;
    //fontは後回し
    //textFont(fontType);
    textSize(30);
    textAlign(LEFT);
    fill(0, 102, 153);
    text(earthDay, 10, 120);
    text(wPlanet, 10, 60);
    text(planetDay,10,180);
  }
}
