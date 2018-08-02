PImage Penguin;
PImage tako;

boolean peng=false;
boolean takoBool=false;

float pengLength=500;
float takoLength=200;

void setup(){
  Penguin=loadImage("pengin.jpg");
  tako=loadImage("tako.jpg");
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
  
}
