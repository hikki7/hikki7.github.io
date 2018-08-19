Clock clock;
Effect effect;

int hour;
int minute;
int second;
float dir;

void setup() {
  fullScreen(P2D);
  smooth();
  effect=new Effect(dir);
  dir=width/4;
}


void draw() {
  background(21);

  //時計の数値を取得
  hour=hour();
  minute=minute();
  second=second();

  //それぞれの時間の角度を出しておく
  float hourTheta=radians(hour*30);
  float minuteTheta=radians(minute*6);
  float secondTheta=radians(second*6);


  //時計の外側の部分を作る
  float theta;
  PVector[]clockLoc=new PVector[360];
  stroke(144);

  for (int i=0; i<width/4; i+=2) {
    point(i, height/2);
  }
  for (int i=width*3/4; i<width; i+=2) {
    point(i, height/2);
  }
  for (int i=0; i<360; i++) {
    theta=radians(i);
    clockLoc[i]=new PVector(width/2+dir*cos(theta), height/2+dir*sin(theta));
    point(clockLoc[i].x, clockLoc[i].y);
  }

  clock=new Clock(hourTheta, minuteTheta, secondTheta, dir);
  clock.diaplay();
  effect.check();
  
  
}
