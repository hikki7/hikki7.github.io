class Box {

  float x, y;
  float w, h;

  Body body;

  Box(float _x, float _y) {
    x=_x;
    y=_y;
    w=16;
    h=16;
    //==================bodyを作成する
    BodyDef bd=new BodyDef();
    //動的である
    bd.type=BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    //bodyの作成
    body=box2d.createBody(bd);

    //=================shapeの作成
    PolygonShape ps=new PolygonShape();
    float box2dw=box2d.scalarPixelsToWorld(w/2);
    float box2dh=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);

    //==================fixtureを使ってがっちゃんこ
    FixtureDef fd=new FixtureDef();
    fd.shape=ps;
    fd.friction=0.3;
    fd.density=1;
    fd.restitution=0.5;
    body.createFixture(fd);
  }

  void display() {
    //角運動を入れる
    Vec2 pos=box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);//box2dの世界では逆周りらしい
    fill(175);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
    
    //落ちたら消す
    //if(pos.y>height){
    //   box2d.destroyBody(body); 
    //}
  }
}
