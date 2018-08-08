//Graphicの型
PGraphics tree;


void setup(){
  fullScreen(P2D);
  colorMode(HSB,360,100,100,100);
  noStroke();
  //大きさだけど、基本的にはレイヤーとして使用するので全体の大きさ
  tree=createGraphics(width,height);
}

void draw(){
  createTree();
  //image(変数,startX,startY);
  image(tree,0,0);
  
}

void createTree(){
  //Graphicの書き始めの宣言
  tree.beginDraw();
  tree.noStroke();
  tree.background(0);
  for(int i=0;i<3;i++){
    //上にいけば行くほど黒くなるように
    tree.fill(map(i,0,2,60,20));
    branch(width/2,height,70,-HALF_PI,150,0);
  }
  //Graphicの書き終える
  tree.endDraw();
}
