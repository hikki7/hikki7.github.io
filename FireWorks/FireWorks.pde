//花火のarrayListの作成
ArrayList<Fireworks> fireworks=new ArrayList<Fireworks>();      

int power=180;

void setup () {
  fullScreen(P3D);
  frameRate(55); 
  hint(DISABLE_DEPTH_TEST);
  blendMode(ADD);
  imageMode(CENTER);
}

void draw () {
  background(0,0,30);
  for(int i=0;i<fireworks.size();i++){
     Fireworks art=fireworks.get(i);
     if(art.centerPosition.y-art.radius>height){
       fireworks.remove(i);
     }
     art.display();
     art.update();
   }
}

void mousePressed(){
  fireworks.add(new Fireworks(power));
}



//発光表現の元となるクラス
PImage createLight(float rPower,float gPower,float bPower){
  int side=64;
  float center=side/2.0;

  PImage img=createImage(side,side,RGB);

  for(int y=0;y<side;y++){
    for(int x=0;x<side;x++){
      float distance=(sq(center-x)+sq(center-y))/10.0;
      int r=int((255*rPower)/distance);
      int g=int((255*gPower)/distance);
      int b=int((255*bPower)/distance);
      img.pixels[x+y*side]=color(r,g,b);
    }
  }
  return img;
}


PImage createLightInside(float rPower,float gPower,float bPower){
  int side=64;
  float center=side/2.0;

  PImage imgInside=createImage(side,side,RGB);

  for(int y=0;y<side;y++){
    for(int x=0;x<side;x++){
      float distance=(sq(center-x)+sq(center-y))/10.0;
      int r=int((255*rPower)/distance);
      int g=int((255*gPower)/distance);
      int b=int((255*bPower)/distance);
      imgInside.pixels[x+y*side]=color(r,g,b);
    }
  }
  return imgInside;
}

//花火作るぞ〜〜
class Fireworks{
  //花火の火の数
  int num=512;
  //花火の中心の初期位置
  PVector centerPosition=new PVector(mouseX,mouseY,0);
  //花火の中心の初期速度
  PVector velocity=new PVector(0,0,0);
 
  PImage img;
  PImage imgInside;

  float radius;
  PVector accel=new PVector(0,0.5,0);
  PVector[] firePosition=new PVector[num];


  Fireworks(float r){
    float cosTheta;
    float sinTheta;
    float phi;
    float colorchange=random(0,5);

    radius=r;
    for (int i=0;i<num;i++){
      cosTheta = random(0,1) * 2 - 1;
      sinTheta = sqrt(1- cosTheta*cosTheta);
      phi = random(0,1) * 2 * PI;
      firePosition[i]=new PVector(radius * sinTheta * cos(phi),radius * sinTheta * sin(phi),0);
      firePosition[i]=PVector.mult(firePosition[i],random(1,1.25));
    }
    //色をランダムで初期化(綺麗な色が出やすいように調整)
    if(colorchange>=3.8){
      img=createLight(0.9,random(0.2,0.5),random(0.2,0.5));
    }else if(colorchange>3.2){
      img=createLight(random(0.2,0.5),0.9,random(0.2,0.5));
    }else if(colorchange>2){
      img=createLight(random(0.2,0.5),random(0.2,0.5),0.9);
    } else {
      img=createLight(random(0.5,0.8),random(0.5,0.8),random(0.5,0.8));
    }
    
    if(colorchange>=3.8){
      imgInside=createLightInside(0.9,random(0.2,0.5),random(0.2,0.5));
    }else if(colorchange>3.2){
      imgInside=createLightInside(random(0.2,0.5),0.9,random(0.2,0.5));
    }else if(colorchange>2){
      imgInside=createLightInside(random(0.2,0.5),random(0.2,0.5),0.9);
    } else {
      imgInside=createLightInside(random(0.5,0.8),random(0.5,0.8),random(0.5,0.8));
    }
  }

  void display(){
    for (int i=0;i<num;i++){
      pushMatrix();
      translate(centerPosition.x,centerPosition.y,centerPosition.z);
      translate(firePosition[i].x,firePosition[i].y,firePosition[i].z);
      image(img,0,0);
      popMatrix();
      
      if(i<num/2){
        pushMatrix();
        translate(centerPosition.x,centerPosition.y,centerPosition.z);
        translate(firePosition[i].x/2,firePosition[i].y/2,firePosition[i].z/2);
        image(imgInside,0,0);
        popMatrix();
      }
      firePosition[i]=PVector.mult(firePosition[i],1.015);
    }
  }

  void update(){
    radius=dist(0,0,0,firePosition[0].x,firePosition[0].y,firePosition[0].z);
    centerPosition.add(velocity);
    velocity.add(accel);
  }
}
