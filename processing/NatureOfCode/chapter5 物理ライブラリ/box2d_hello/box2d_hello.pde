import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

void setup(){
  //ピクセルの世界に入れる全てのものを作成する
  box2d=new Box2DProcessing(this);
  //ピクセルの世界をBox2Dワールドに変換する
  //ここでデフォルトの設定でBox2Dワールドの初期化
  box2d.createWorld();
  
  size(500,500);
}

void draw(){
  
  background(21);
  
  box2d.setGravity(0,-10);
  
  //worldからpixelへ変更
  Vec2 mouseWorld=box2d.coordPixelsToWorld(mouseX,mouseY);
  
  //define body
  //これはbodyを作る前に定義しなければならない
  BodyDef bd=new BodyDef();
  
  //processingの世界での中心
  //Vec2 center =new Vec2(width/2,height/2);
  //それをworldへ返還
  Vec2 center=box2d.coordPixelsToWorld(width/2,height/2);
  //それにbodyをつける
  bd.position.set(center);
  
  //回転させたくない時は
  bd.fixedRotation=true;
  
  //摩擦係数の設定
  //線形減衰
  bd.linearDamping=0.8;
  //角度減衰
  bd.angularDamping=0.9;
  
  //高速で動くものは弾丸として設定します
  bd.bullet=true;
  
  //bodyを作成する
  Body body=box2d.createBody(bd);
  
  //bodyの初期状態を入れる
  //初期速度
  body.setLinearVelocity(new Vec2(0,3));
  //初期角速度
  body.setAngularVelocity(1.2);
  
  //シェイプを定義する
  //今回はpolygon
  PolygonShape ps=new PolygonShape();
  //大きさをworldのサイズに変更する
  float box2dw=box2d.scalarPixelsToWorld(150);
  float box2dh=box2d.scalarPixelsToWorld(100);
  
  //polygonを長方形として定義する
  ps.setAsBox(box2dw,box2dh);
  
  //フィクスチャを定義する
  //ここでbodyとshapeを合体させる
  FixtureDef fd=new FixtureDef();
  fd.shape=ps;
  //それぞれの物理現象を入れる
  fd.friction=0.3;
  fd.restitution=0.5;//反発係数
  fd.density=1.0;//密度(これで質量を判断する説、濃厚)
  //フィクスチャをbodyにタッチする
  body.createFixture(fd);
  
}
