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
    x+=random(-1,1);
    y+=random(-1,1);
  }
}
