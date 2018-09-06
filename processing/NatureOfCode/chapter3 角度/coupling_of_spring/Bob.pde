class Bob {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass=24;

  //空気抵抗の定数
  float damping=0.98;

  //mouseによるインタラクティブ
  PVector dragOffset;
  boolean dragging=false;

  //Constructor
  Bob(float x, float y) {
    location=new PVector(x, y);
    velocity=new PVector();
    acceleration=new PVector();
    dragOffset=new PVector();
  }

  //いつもの物理シュミレート
  void update() {
    velocity.add(acceleration);
    //空気抵抗を入れる
    velocity.mult(damping);
    location.add(velocity);
    acceleration.mult(0);
  }

  //力を当てはめる
  void applyForce(PVector force) {
    PVector f=force.get();
    f.div(mass);
    acceleration.add(f);
  }

  //見せます
  void display() {
    noStroke();
    fill(144);
    if (dragging) {
      fill(196);
    }
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  //clickしたら位置が変わる
  void clicked(int mx, int my) {
    float d=dist(mx,my,location.x,location.y);
    if(d<mass){
       dragging=true;
       dragOffset.x=location.x-mx;
       dragOffset.y=location.y-my;
    }
  }
  
  //dragが外れたらfalseにする
  void stopDragging(){
     dragging=false; 
  }
  
  //mouseの方向に持ってくる
  void drag(int mx,int my){
    if(dragging){
       location.x=mx+dragOffset.x;
       location.y=my+dragOffset.y;
    }
  }
}
