int numVertives=8;//円状に複製する数
int weight=3;//線の太さ
color bgColor;//backgroundのcolor

void setup(){
 //blendModeを使いたいからp2dでやる
 fullScreen(P2D);
 //線を滑らかにするのだが8にすると最大らしい
 smooth(8);
 //色指定をHSBモードにする
 colorMode(HSB,360,100,100,100);
 bgColor=color(210,80,10);
 background(bgColor);
}

void draw(){
   //原点を画面の中心に変更
   translate(width/2,height/2);
   
   //moouse座標の位置調節
   int mouseX2=mouseX-width/2;
   int mouseY2=mouseY-height/2;
   //pmouseは一個前のmouseの位置らしい
   //正直よくわからない
   int pmouseX2=pmouseX-width/2;
   int pmouseY2=pmouseY-height/2;
   
   if(mousePressed){
     //色をフレーム数によって変更するといい感じ
     stroke(frameCount%360,80,80,50);
     strokeWeight(weight);
     
     //円状にnumVertivesだけ複製
     for(int i=0;i<360;i+=360/numVertives){
        //角度をradiansに変更
        float angle=radians(i);
        
        pushMatrix();
        rotate(angle);
        line(mouseX2,mouseY2,pmouseX2,pmouseY2);
        line(-mouseX2,mouseY2,-pmouseX2,pmouseY2);
        popMatrix();
     }
   }
   
  
}
