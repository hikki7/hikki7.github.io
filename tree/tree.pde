int _numChildren = 3;   // limit on number of branches
int _maxLevels = 3;    // the maximum depth

Branch _trunk;      // classの設定

// ======================= init

void setup() {
  size(750,500);
  background(255);
  fill(0);
  smooth();
  newTree();
}

//treeの生成
void newTree() {
  _trunk = new Branch(1, 0, width/2, 50);
  _trunk.drawMe();
}

// ======================= Branch object

class Branch {
  float level, index;  
  float x, y;
  float endx, endy;
  
  Branch [] children = new Branch[0];
  
  Branch(float lev, float ind, float ex, float why) {
   level = lev; 
   index = ind;
   updateMe(ex, why);
   
   //今の子供のlevelってイメージ
   //今回だったら3以上だったら
   if(level<_maxLevels){
     //子供の数だけ配列を用意
      children=new Branch[_numChildren];
      for(int i=0;i<_numChildren;i++){
        children[i]=new Branch(level+1,x,endx,endy);
      }
    }
  }
  
  
  
  //次の点が今のlevelによって位置が移動する
  void updateMe(float ex, float why) {
   x = ex;
   y = why;
   endx = x + (level*random(100)-50);
   endy = y + (level*random(50))+50;
  }
  
  void drawMe() { 
    line(x, y, endx, endy); 
    ellipse(x, y, 5, 5);
    //木をだんだん細くしていく
    strokeWeight(_maxLevels - level +1);
    for(int i=0;i<children.length;i++){
        children[i].drawMe();
    }
  }
}
