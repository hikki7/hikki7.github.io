PImage Penguin;
PImage tako;
PImage hitodeRight;
PImage hitodeLeft;
PImage aseRight;
PImage aseLeft;


boolean peng=false;
boolean takoBool=false;
boolean hitodeR=false;
boolean hitodeL=false;
boolean aseR=false;
boolean aseL=false;

float pengLength=500;
float takoLength=200;
float hitodeRLength=200;
float hitodeLLength=150;
float aseRLength=150;
float aseLLength=150;

void setup(){
  Penguin=loadImage("pengin.jpg");
  tako=loadImage("tako.jpg");
  hitodeRight=loadImage("hitode-Light.jpg");
  hitodeLeft=loadImage("hitodeLeft.jpg");
  aseRight=loadImage("aseRight.jpg");
  aseLeft=loadImage("aseLeft.jpg");
  fullScreen();
  imageMode(CENTER);
  
}


void draw(){
  background(255);
  //ペンギンのやつ---------------------
  if(peng==true){
    tint(255,255);
    image(Penguin,width/2,height/2,pengLength,pengLength);
  }else{
    tint(255,50);
    image(Penguin,width/2,height/2,pengLength,pengLength);
  }
  
  //タコのやつ--------------------------
  if(takoBool==true){
    tint(255,255);
    image(tako,width*3/4,height/4,takoLength,takoLength);
  }else{
    tint(255,50);
    image(tako,width*3/4,height/4,takoLength,takoLength);
  }
  //ヒトデの右のやつ----------------------
  if(hitodeR==true){
    tint(255,255);
    image(hitodeRight,width/4,height*3/4,hitodeRLength,hitodeRLength);
  }else{
    tint(255,50);
    image(hitodeRight,width/4,height*3/4,hitodeRLength,hitodeRLength);
  }
  //ヒトデの左のやつ----------------------
  if(hitodeL==true){
    tint(255,255);
    image(hitodeLeft,width/8,height*5/6,hitodeLLength,hitodeLLength);
  }else{
    tint(255,50);
    image(hitodeLeft,width/8,height*5/6,hitodeLLength,hitodeLLength);
  }
  //汗の右のやつ----------------------
  if(aseR==true){
    tint(255,255);
    image(aseRight,width*7/8,height*5/6,aseRLength,aseRLength);
  }else{
    tint(255,50);
    image(aseRight,width*7/8,height*5/6,aseRLength,aseRLength);
  }
  //汗の左のやつ----------------------
  if(aseL==true){
    tint(255,255);
    image(aseLeft,width/8,height/6,aseLLength,aseLLength);
  }else{
    tint(255,50);
    image(aseLeft,width/8,height/6,aseLLength,aseLLength);
  }
}

void mouseReleased(){
  //ペンギンのやつ------------------------
  if(width/2-pengLength/2<mouseX&&mouseX<width/2+pengLength/2&&height/2-pengLength/2<mouseY&&mouseY<height/2+pengLength/2){
     if(peng==false){
        peng=true; 
     }
  }
  
  //タコのやつ--------------------------------------
  if(width*3/4-takoLength/2<mouseX&&mouseX<width*3/4+takoLength/2&&height/4-takoLength/2<mouseY&&mouseY<height/4+takoLength/2){
     if(takoBool==false){
        takoBool=true; 
     }
  }
  
  //ヒトデ右のやつ--------------------------------------
  if(width/4-hitodeRLength/2<mouseX&&mouseX<width/4+hitodeRLength/2&&height*3/4-hitodeRLength/2<mouseY&&mouseY<height*3/4+hitodeRLength/2){
     if(hitodeR==false){
        hitodeR=true; 
     }
  }
  //ヒトデ左のやつ--------------------------------------
  if(width/8-hitodeLLength/2<mouseX&&mouseX<width/8+hitodeLLength/2&&height*5/6-hitodeLLength/2<mouseY&&mouseY<height*5/6+hitodeRLength/2){
     if(hitodeL==false){
        hitodeL=true; 
     }
  }
  //汗右のやつ--------------------------------------
  if(width*7/8-aseRLength/2<mouseX&&mouseX<width*7/8+aseRLength/2&&height*5/6-aseRLength/2<mouseY&&mouseY<height*5/6+aseRLength/2){
     if(aseR==false){
        aseR=true; 
     }
  }
  //汗左のやつ--------------------------------------
  if(width/8-aseLLength/2<mouseX&&mouseX<width/8+aseLLength/2&&height/6-aseLLength/2<mouseY&&mouseY<height/6+aseRLength/2){
     if(aseL==false){
        aseL=true; 
     }
  }
}
