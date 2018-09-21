class Boudary{
  float x;
  float y;
  float w;
  float h;
  
  Body b;
  
  Boudary(float _x,float _y,float _w,float _h){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    
    //======================create body
    BodyDef bd=new BodyDef();
    //staticなので固定された感じ
    bd.type=BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b=box2d.createBody(bd);
    
    //======================Define the polygon
    PolygonShape ps=new PolygonShape();
    float box2dw=box2d.scalarPixelsToWorld(w/2);
    float box2dh=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw,box2dh);
    
    //======================paste fixture
    //この方法だとfixtureでfrictionなどしなくても一気にfixtureとして貼り付けられる
    //主にstaticの時のみ
    b.createFixture(ps,1);
  }
  
  void display(){
    fill(225);
    noStroke();
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
