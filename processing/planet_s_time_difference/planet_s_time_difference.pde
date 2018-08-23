import ddf.minim.*;

Minim minim;
AudioPlayer backMusic;

Clock clock;
Calc calc;

//今のとこmax7
int planet=4;
int earthTime=0;
float planetTime=0;
float dir;//時計の半径
float coe;

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
  //惑星の時差の係数を取得
  calc=new Calc(planet);
  coe=calc.calculation();
  //時数を取得する
  earthTime=frameCount*60;
  planetTime=earthTime*coe;
  println("earth="+earthTime);
  println("planet="+planetTime);
  //時間の角度の取得
  //1秒で1時間進むようにしている
  float earthTheta=radians(earthTime*30/60/60);
  float planetTheta=radians(planetTime*30/60/60);


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
  clock=new Clock(earthTheta, dir, planetTheta);
  clock.display();
}
