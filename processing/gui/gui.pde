import controlP5.*;
ControlP5 cp5;
//スライダーは3つ宣言する
Slider boxSize;
//Slider rotateX;
//Slider rotateY;

void setup() {
  fullScreen(P3D); 
  cp5=new ControlP5(this);
  //スライダーに追加
  boxSize=cp5.addSlider("BOX SIZE")
    .setPosition(20,20)
    .setRange(0,1000)
    .setValue(200);
}

void draw(){
  background(0);
  pushMatrix();
  lights();
  translate(width/2,height/2,0);
  fill(255);
  noStroke();
  box(boxSize.getValue());
  popMatrix();
}
