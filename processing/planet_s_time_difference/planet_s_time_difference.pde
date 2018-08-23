import ddf.minim.*;

Minim minim;
AudioPlayer backMusic;

Clock clock;
Calc calc;

int planet=0;
int earthTime=0;
float dir;//時計の半径

void setup() {
  fullScreen(P2D);
  smooth();
  noCursor();
  dir=width/4;
  background(21);
  
  minim=new Minim(this);
  backMusic=minim.loadFile("communication_of_aliens.mp3");
  backMusic.loop();
}


void draw() {
  fill(21, 10);
  rect(0, 0, width, height);
  //秒の計算
  calc=new Calc(planet);
  //秒数を取得する
  earthTime=frameCount/60;
  //秒の角度の取得
  float earthTheta=radians(earthTime*6);
  float beforeEarthTheta=radians((earthTime-1)*6);

  //時計の外側を作る
  float theta;
  PVector[]clockLoc=new PVector[360];
  stroke(144);

  for (int i=0; i<clockLoc.length; i++) {
    theta=radians(i);
    clockLoc[i]=new PVector(width/2+dir*cos(theta), height/2+dir*sin(theta));
    strokeWeight(2);
    point(clockLoc[i].x, clockLoc[i].y);
  }
  clock=new Clock(earthTheta, dir, beforeEarthTheta);
  clock.display();
}
