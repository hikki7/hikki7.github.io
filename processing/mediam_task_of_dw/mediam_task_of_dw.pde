import controlP5.*;
ControlP5 cp5;
Clock clock;

float dir;//時計の半径
float day;//日
int count=0;
//水星、金星、火星、木星、土星、天王星、海王星、月
int choosePlanet=0;

void setup() {
  fullScreen(P2D);
  smooth();
  background(21);
  colorMode(HSB, 360, 100, 100);
  dir=width/20;
  cp5=new ControlP5(this);
}


void draw() {
  fill(21, 80);
  noStroke();
  rect(0, 0, width, height);
  count++;

  //1秒で1日にするため
  day=count/float(60);

  //object指向
  clock=new Clock(dir, day, count, choosePlanet);

  //下のplanetを出力
  clock.selectedPlanets();

  //下のplanetsの部分を出す
  clock.borderPlanets();

  //下の部分のplanetsのtextの部分
  clock.informPlanets();

  //earthのtext
  clock.textEarth();

  //planetのtext
  clock.textPlanets();

  //earthのgui的な部分
  clock.guiEarth();

  //planetのgui的な部分
  clock.guiplanets();

  //上のtextの表示
  clock.drawSpeed();

  //earthのbasic
  clock.basicEarth();

  //planetsのbasic
  clock.basicPlanets();

  //earthの針
  clock.drawEarth();

  //planetsの針
  clock.drawPlanet();
}

void keyPressed() {

  if (key=='a'||key=='A') {
    //水星
    choosePlanet=0;
    count=0;
  } else if (key=='s'||key=='S') {
    //金星
    choosePlanet=1;
    count=0;
  } else if (key=='d'||key=='D') {
    //火星
    choosePlanet=2;
    count=0;
  } else if (key=='f'||key=='F') {
    //木星
    choosePlanet=3;
    count=0;
  } else if (key=='g'||key=='G') {
    //土星
    choosePlanet=4;
    count=0;
  } else if (key=='h'||key=='H') {
    //天王星
    choosePlanet=5;
    count=0;
  } else if (key=='j'||key=='J') {
    //海王星
    choosePlanet=6;
    count=0;
  } else if (key=='k'||key=='K') {
    //月
    choosePlanet=7;
    count=0;
  }
}
