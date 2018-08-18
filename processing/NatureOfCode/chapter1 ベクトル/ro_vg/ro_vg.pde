Mover[]mover=new Mover[10];

//浮力
Liquid liquid;

PVector gravity;

void setup() {
  fullScreen();
  for (int i=0; i<mover.length; i++) {
    mover[i]=new Mover(random(2, 5), random(-5, 5), random(-5, 5));
  }
  gravity=new PVector(0, 0);
  liquid=new Liquid(0, height/2, width, height/2, 0.1);
}


void draw() {
  background(51);
  smooth();
  liquid.display();
  for (int i=0; i<mover.length; i++) {
    
    //水の中に入っているかどうか
    if(liquid.contains(mover[i])){
      //水のベクトルがわかった
       PVector dragForce=liquid.drag(mover[i]);
       mover[i].addForce(dragForce);
    }
    
    mover[i].update();
    mover[i].draw();
    //重力
    gravity.y=mover[i].mass*0.98;
    mover[i].addForce(gravity);
    //跳ね返る
    mover[i].bounding();
  }
}


void mousePressed() {
  reset();
}  

void reset() {
  for (int i=0; i<mover.length; i++) {
    mover[i]=new Mover(random(1, 4), random(-5, 5), random(-5, 5));
  }
}
