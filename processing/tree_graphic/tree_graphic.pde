//noiseInput
float n;
//Graphicの型
PGraphics tree;
ArrayList <PVector> leafs;

void setup() {
  fullScreen(P2D);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  //大きさだけど、基本的にはレイヤーとして使用するので全体の大きさ
  tree=createGraphics(width, height);
  leafs = new ArrayList<PVector>();
}

void draw() {
  createTree();
  //image(変数,startX,startY);
  image(tree, 0, 0);
}

void createTree() {
  //Graphicの書き始めの宣言
  tree.beginDraw();
  tree.noStroke();
  tree.background(0);
  for (int i=0; i<3; i++) {
    //上にいけば行くほど黒くなるように
    tree.fill(map(i, 0, 2, 60, 20));
    branch(width/2, height, 70, -HALF_PI, 150, 0);
  }
  //Graphicの書き終える
  tree.endDraw();
}
//画像の木の部分を作る================
void branch(float x, float y, float bsize, float theta, float bLength, float pos) {
  n+=0.1;
  //lerp(start,end,amt);amt is betweem 0.0 and 1.0 でその比で返す
  //ex)x=lerp(10,20,0.2);x=12;
  //ex)x=lerp(20,10,0.2);x=18;
  float diam=lerp(bsize, 0.7*bsize, pos/bLength);
  diam*=map(noise(n), 0, 1, 0.4, 0.6);
  tree.ellipse(x, y, diam, diam);

  
  if (bsize>1) {
    //lerpで1よりでかくなるから
    if (pos<bLength) {
      x+=cos(theta+random(-PI/10, PI/10));
      y+=sin(theta+random(-PI/10, PI/10));
      branch(x, y, bsize, theta, bLength, pos+1);
    } else {
      //maxで+-1ずれる
      leafs.add(new PVector(x, y));  // add a leaf at the intersection
      boolean drawleftBranch = random(1) > 0.1;
      boolean drawrightBranch = random(1) > 0.1;
      //左右の枝を作る
      if (drawleftBranch) branch(x, y, random(0.5, 0.7)*bsize, theta - random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0);
      if (drawrightBranch) branch(x, y, random(0.5, 0.7)*bsize, theta + random(PI/15, PI/5), random(0.6, 0.8)*bLength, 0);

      if (!drawleftBranch && !drawrightBranch) {  // if none of the branchs are drawn, draw a tip
        tree.pushMatrix();
        tree.translate(x, y);
        tree.rotate(theta);
        tree.quad(0, -diam/2, 2*diam, -diam/6, 2*diam, diam/6, 0, diam/2);
        tree.popMatrix();
      }
    }
  }
}
