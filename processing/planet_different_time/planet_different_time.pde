Clock clock;

float dir;//時計の半径
float day;//日
int count=0;
//水星、金星、火星、木星、土星、天王星、海王星、月
int choosePlanet=0;

void setup() {
  fullScreen(P2D);
  smooth();
  noCursor();
  dir=width/5;
  background(21);
}

void draw() {
  fill(21, 40);
  noStroke();
  rect(0, 0, width, height);
  count++;
  //1秒で1日にするため
  day=count/60;
  //object指向
  clock=new Clock(dir, day, count, choosePlanet);
  //時計の外見を作る
  clock.setClock();
  //時計の位置の表示
  clock.drawDay();
  //plenetsの位置の表示
  clock.planetsDay();
  //textのbackgroundの表示
  clock.textFuild();
  //textの表示
  clock.textDisplay();
}

void keyPressed() {
  
  clock.drawEllipse();
  
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
