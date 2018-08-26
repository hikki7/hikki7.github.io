class Clock {
  int choosePlanet;
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
  int dayCount;
  String[]planet={"水星", "金星", "火星", "木星", "土星", "天王星", "海王星", "月"};

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
    //println(dayCount);
    //println(dayCount*30);
    //println(degrees(secondTheta));
    fill(0, 102, 153, 60);
    noStroke();
    pushMatrix();
    translate(width/2, height/2);
    location=new PVector(diam*cos(secondTheta-PI/2), diam*sin(secondTheta)-PI/2);
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
    earthDay="earth's day is ";
    dayCount=count/60;
    wPlanet="The planet you chose is ";
    //fontは後回し
    //textFont(fontType);
    textSize(30);
    textAlign(RIGHT);
    fill(0, 102, 153);
    text(earthDay, width-50, 60);
    text(dayCount, width-10, 60);
    text(wPlanet, width-50, 120);
    //なぜかここがでてこない、理由は不明
    text(planet[choosePlanet], width-10, 120);
    println(planet[choosePlanet]);
  }
}
