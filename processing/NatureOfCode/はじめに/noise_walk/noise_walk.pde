walker w;

float tx=0;
float ty=0;
float diameter=30;

void setup(){
  fullScreen(P2D); 
  w=new walker();
  background(255);
}

void draw(){
  w.display();
  w.step();
}


class walker{
   float x;
   float y;
   
   walker(){
     //時間変数は別でないとx=yになってしまうから
     tx=0;
     ty=1000;
   }
  
  void display(){
    ellipse(x,y,diameter,diameter);
  }
  
  void step(){
    //noiseはその時間の値を返すイメージだから毎回プラスしていかないといけない
    float sx=noise(tx);
    float sy=noise(ty);
    x=map(sx,0,1,0,width);
    y=map(sy,0,1,0,height);
    tx+=0.01;
    ty+=0.01;
  }
}
