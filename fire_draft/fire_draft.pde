int num = 1000;
float[] lineStarX1 = new float[num];
float[] lineStartY1 = new float[num];
float[] lineEndX1 = new float[num];
float[] lineEndY1 = new float[num];
color col;

void setup(){
  // 初期設定
  size(800, 800, P2D);
  blendMode(ADD);
  background(0);
  frameRate(60);
  // colorモードをHSBに変更：色相、彩度、明度、透明
  colorMode(HSB, 360, 100, 100, 100);
  col=color(20,100,100,50);
  
  // 線の初期位置
  for(int i=0; i < num; i++){
    lineStarX1[i] = width/2;
    lineStartY1[i] = height/2;
    lineEndX1[i] = width/2;
    lineEndY1[i] = height/2;
  }
}

void draw(){
  fill(0,0,0,30);
  noStroke();
  rect(0,0,width,height);
  
  for(int i=0; i < num; i++){
    stroke(col);
    line(lineStarX1[i],lineStartY1[i],lineEndX1[i],lineEndY1[i]);
    
    // 線のX2,Y2をX1,Y1に代入する
    lineStarX1[i] = lineEndX1[i];
    lineStartY1[i] = lineEndY1[i];
    
    lineEndX1[i] += random(-10, 10);
    lineEndY1[i] += random(-10, 10);
    
    // 壁枠に当たったら跳ね返る
    if(lineEndX1[i] > width){
      lineEndX1[i] = width;
    }else if(lineEndX1[i] < 0){
      lineEndX1[i] = 0;
    }else if(lineEndY1[i] > height){
      lineEndY1[i] = height;
    }else if(lineEndY1[i] < 0){
      lineEndY1[i] = 0;
    }
  }
}
