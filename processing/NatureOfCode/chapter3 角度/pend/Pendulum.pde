class Pendulum {
  PVector location;//重りの位置
  PVector origin;//支点
  float r;
  float angle;
  float avelocity;
  float aacceleration;
  float damping;//減衰量
  float diam=50;
  
  boolean dragging=false;


  Pendulum(PVector _origin, float _r) {
    origin=_origin.get();
    location=new PVector();
    r=_r;
    angle=PI/3;
    avelocity=0.0;
    aacceleration=0.0;
    damping=0.995;
  }

  void update() {
    if(!dragging){
      float gravity=0.4;
      aacceleration=(-gravity/r)*sin(angle);
      avelocity+=(aacceleration);
      angle+=avelocity;
      avelocity*=damping;
    }
  }

  void display() {
    location.set(r*sin(angle), r*cos(angle));
    location.add(origin);

    stroke(121);
    line(origin.x, origin.y, location.x, location.y);
    fill(121);
    ellipse(location.x, location.y, diam, diam);
  }
  
  void clicked(float mx,float my){
    float d=dist(mx,my,location.x,location.y);
    if(d<diam){
      dragging=true;
    }
  }
  
  void stopDrag(){
     avelocity=0;
     dragging=false;
  }
  
  void drag(){
     if(dragging){
        PVector diff=PVector.sub(origin,new PVector(mouseX,mouseY));
        angle=-diff.heading2D()-PI/2;
     }
  }
}
