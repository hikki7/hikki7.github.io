Mover mover;

void setup() {
  fullScreen();
  mover=new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.display();
  mover.check();
}


class Mover {

  PVector location;
  PVector velocity;
  float diameter=50;
  PVector acceleration;
  float topSpeed=20;

  Mover() {
    location=new PVector(width/2, height/2);
    velocity=new PVector(random(10)-5, random(10)-5);
    velocity.normalize();
    velocity.mult(5);
  }

  void update() {
    //random2Dでrandomな方向にスカラー1で返す
    acceleration=PVector.random2D();
    velocity.add(acceleration);
    //limitで最大はここまでというようになる
    velocity.limit(topSpeed);
    location.add(velocity);
  }

  void display() {
    fill(51);
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);
  }

  void check() {
    if (width<location.x) {
      location.x=0;
    } else if (0>location.x) {
      location.x=width;
    }

    if (height<location.y) {
      location.y=0;
    } else if (location.y<0) {
      location.y=height;
    }
  }
}
