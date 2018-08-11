walker w;

void setup(){
  fullScreen(P2D);
  background(0);
  w=new walker();
}


void draw(){
  w.draw();
  w.step();
}


class walker{
  
  float x,y;
  
  walker(){
    x=width/2;
    y=height/2;
  }
  
  void draw(){
     stroke(255);
     point(x,y);
  }
  
  void step(){
    float r=random(1);
    if(0.4>r){
       x++;
    }else if(0.6>r){
       x--; 
    }else if(0.8>r){
       y++; 
    }else{
       y--; 
    }
  }
  
}
