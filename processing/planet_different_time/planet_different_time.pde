Clock clock;

float dir;//時計の半径
int day;//日
int count=0;
//水星、金星、火星、木星、土星、天王星、海王星、月
int choosePlanet=0;

void setup() {
  fullScreen(P2D);
  smooth();
  noCursor();
  dir=width/4;
  background(21);
}

void draw() {
  fill(21, 20);
  noStroke();
  rect(0, 0, width, height);
  count++;
  //1秒で1日にするため
  day=frameCount/60;
  //object指向
  clock=new Clock(dir, day, count, choosePlanet);
  //時計の外見を作る
  clock.setClock();
  //時計の位置の取得
  clock.drawDay();
  //textの表示
  clock.textDisplay();
}

void keyPressed() {
  if (key=='a'||key=='A') {
    //水星
    choosePlanet=0;
  } else if (key=='s'||key=='S') {
    //金星
    choosePlanet=1;
  } else if (key=='d'||key=='D') {
    //火星
    choosePlanet=2;
  } else if (key=='f'||key=='F') {
    //木星
    choosePlanet=3;
  } else if (key=='g'||key=='G') {
    //土星
    choosePlanet=4;
  } else if (key=='h'||key=='H') {
    //天王星
    choosePlanet=5;
  } else if (key=='j'||key=='J') {
    //海王星
    choosePlanet=6;
  } else if (key=='k'||key=='K') {
    //月
    choosePlanet=7;
  }
}
