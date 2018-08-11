import java.util.Random;
Random generator;
float hue;

void setup(){
  size(640,640);
  generator=new Random();
  background(0);
  colorMode(HSB,360,100,100,100);
  blendMode(ADD);
}

void draw(){
  //.nextGaussian()でこれでガウス分布のランダムを使える
  float num1=(float)generator.nextGaussian();
  float num2=(float)generator.nextGaussian();
  //分布の幅
  float sd=60;
  float mean=320;
  float x=sd*num1+mean;
  float y=sd*num2+mean;
  
  noStroke();
  hue=random(360);
  fill(hue,80,80,80);
  ellipse(x,y,8,8);
}
