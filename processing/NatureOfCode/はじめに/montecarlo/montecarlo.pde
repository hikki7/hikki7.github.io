walker w;

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
    x=width/2;
    y=height/2;
   }
  
  void display(){
    stroke(0); 
    point(x,y);    
  }
  
  void step(){
    float stepSize=montecarlo()*10;
    x+=random(-stepSize,stepSize);
    y+=random(-stepSize,stepSize);
  }
  
  float montecarlo(){
    while(true){
      float r1=random(1);
      float r2=random(1);
      
      if(r2<r1){
        return r1; 
      }
    }
  }
}
