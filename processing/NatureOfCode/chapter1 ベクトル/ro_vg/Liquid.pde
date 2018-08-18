class Liquid {

  //水の範囲
  float x, y, w, h;

  float c;


  Liquid(float _x, float _y, float _w, float _h, float _c) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    c=_c;//抵抗の係数
  }

  //水のとこに入ってるかどうか判断
  boolean contains(Mover m) {
    PVector l=m.location;
    if(l.x>x&&l.x<w+x&&l.y>y&&l.y<y+h){
       return true; 
    }
    else{
       return false; 
    }
  }
  
  //浮力の計算
  PVector drag(Mover m){
      float speed=m.velocity.mag();
      //抵抗の係数*vの２乗の計算になる
      //これで抵抗力のスカラー量が求まった
      float dragMagnitude=c*speed*speed;
      
      //velocityの方向の摂取
      PVector dragForce=m.velocity.get();
      dragForce.mult(-1);
      dragForce.normalize();
      dragForce.mult(dragMagnitude);
      return dragForce;
  }
  
  void display(){
     noStroke();
     fill(0);
     rect(x,y,w,h);
  }
}
