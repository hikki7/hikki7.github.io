import java.util.Random;
Random generator;

void setup(){
  size(640,360);
  generator=new Random();
  background(0);
}

void draw(){
  //.nextGaussian()でこれでガウス分布のランダムを使える
  float num=(float)generator.nextGaussian();
  //分布の幅
  float sd=60;
  float mean=320;
  float x=sd*num+mean;
  
  noStroke();
  fill(255,10);
  ellipse(x,height/2,16,16);
}
