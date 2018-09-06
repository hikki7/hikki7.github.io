//objectの移動
Bob bob;

//objectの弾性力
Spring spring;

void setup() {
  fullScreen(P2D);
  smooth();
  spring=new Spring(width/2,10,height/3);
  bob=new Bob(width/2,100);
}

void draw(){
   background(21);
   PVector gravity=new PVector(0,2);
   
   //ma=fを作る
   bob.applyForce(gravity);
   
   //弾性力を入れる
   spring.connect(bob);
   
   //バネの長さの制限
   spring.constrainLength(bob,30,height*3/4);
   
   //ballの場所をaccelerationから更新
   bob.update();
   
   //mouseをドラッグして移動する情報を送る
   bob.drag(mouseX,mouseY);
   
   //支点を見せる
   spring.displayAnchor();
   
   //バネを見せる
   spring.displayLine(bob);
   
   //ballの場所を見せる
   bob.display();
  
}

void mousePressed(){
   bob.clicked(mouseX,mouseY); 
}

void mouseReleased(){
   bob.stopDragging(); 
}
