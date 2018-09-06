class Spring {

  //支点
  PVector anchor;

  //自然長
  float len;
  float k=0.2;

  //Constructor
  Spring(float x, float y, int l) {
    anchor =new PVector(x, y);
    len=l;
  }
  
  void connect(Bob b){
    //方向ベクトルを取得
    PVector force=PVector.sub(b.location,anchor);
    //支点とballの距離の取得
    float d=force.mag();
    //dxを求める
    float stretch=d-len;
    
    force.normalize();
    force.mult(-1*k*stretch);
    //これをapplyForceに入れる
    bob.applyForce(force);
  }
  
  //支点の可視化
  void displayAnchor(){
      noStroke();
      fill(175);
      rectMode(CENTER);
      rect(anchor.x,anchor.y,50,30);
  }
  
  //バネの可視化
  void displayLine(Bob bob){
     strokeWeight(2);
     stroke(175);
     line(anchor.x,anchor.y,bob.location.x,bob.location.y);
  }
  
  //バネの長さの制限
  void constrainLength(Bob b,float minlen,float maxlen){
    PVector dir = PVector.sub(b.location,anchor);
    float d=dir.mag();
    //距離が短すぎたら
    if(d<minlen){
       dir.normalize();
       dir.mult(minlen);
       //長さのリセット
       b.location=PVector.add(anchor,dir);
       b.velocity.mult(0);
    }else if(d>maxlen){
       dir.normalize();
       dir.mult(maxlen);
       //長さのリセット
       b.location=PVector.add(anchor,dir);
       b.velocity.mult(0);
    }
  }
}
