walker w;

PVector t;
float diameter=30;

void setup(){
  fullScreen(P2D);
  w=new walker();
  background(255);
}

void draw(){
  w.step();
  w.display();
  w.check();
  
}

class walker{
  
  PVector loc;
  PVector velocity;
  PVector acceleration;
  
  walker(){
     t=new PVector(0,1000); 
     loc=new PVector(width/2,height/2);
  }
  
  void display(){ 
    ellipse(loc.x,loc.y,diameter,diameter);
  }
  
  void step(){
     PVector s=new PVector(noise(t.x),noise(t.y));
     acceleration=PVector.random2D();
     acceleration.mult(random(-3,3));
     velocity=new PVector(map(s.x,0,1,-10,10),map(s.y,0,1,-10,10));
     velocity.add(acceleration);
     t.add(0.01,0.01);
     loc.add(velocity);
  }
  
  void check(){
     if(loc.x>width){
        loc.x=0; 
     }else if(loc.x<0){
        loc.x=width; 
     }
     if(loc.y>height){
        loc.y=0; 
     }else if(loc.y<0){
        loc.y=height; 
     }
  }
}
