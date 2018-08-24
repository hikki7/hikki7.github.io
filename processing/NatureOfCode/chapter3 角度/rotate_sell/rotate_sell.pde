Mover mover;

PVector navPosition;
float diameter=20;

void setup() {
  //fullScreen(P2D);
  size(600, 600, P2D);
  smooth();
  noCursor();
  background(21);
  navPosition=new PVector(random(width), random(height));
}

void draw() {
  mover=new Mover(navPosition);
  rectMode(CORNER);
  noStroke();
  fill(21, 20);
  rect(0, 0, width, height);

  //============navPositionの制御
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==RIGHT) {
        navPosition.x+=5;
      }
      if (keyCode==LEFT) {
        navPosition.x-=5;
      }
      if (keyCode==UP) {
        navPosition.y-=5;
      }
      if (keyCode==DOWN) {
        navPosition.y+=5;
      }
    }
  }

  if (navPosition.x>width) {
    navPosition.x=0;
  } else if (navPosition.x<0) {
    navPosition.x=width;
  }
  if (navPosition.y>height) {
    navPosition.y=0;
  } else if (navPosition.y<0) {
    navPosition.y=height;
  }

  //===============navPositionの表示
  fill(180, 20, 20);
  ellipse(navPosition.x, navPosition.y, diameter, diameter);


  //===============moverの可視化
  mover.update();
  mover.display();
  mover.checkEdge();
}
