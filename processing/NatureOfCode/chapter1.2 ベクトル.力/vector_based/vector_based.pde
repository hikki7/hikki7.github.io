PVector center;
PVector mouse;


void setup(){
  size(600,600);
  stroke(0);
  center=new PVector(width/2,height/2);
}


void draw(){
  mouse=new PVector(mouseX,mouseY);
  background(255);
  //ベクトルの引き算
  mouse.sub(center);
  //ベクトルの積
  mouse.mult(0.5);
  
  //ベクトルの絶対値
  float m=mouse.mag();
  rect(0,0,m,m);
  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
  
  
}
