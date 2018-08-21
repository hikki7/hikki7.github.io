class Attractor {
  float mass;
  float G;
  PVector location;
  boolean dragging=false;
  boolean rollover=false;
  PVector dragOffset;
  float diameter;

  Attractor() {
    location=new PVector(width/2, height/2); 
    mass=20;
    G=1;
    dragOffset=new PVector(0,0);
    diameter=mass*2;
  }
  
  PVector attract(Mover m){
      PVector force=PVector.sub(location,m.location);
      float d=force.mag();
      //軌道から逸れないようにするため
      d=constrain(d,5.0,25.0);
      force.normalize();
      float strength=(G*mass*m.mass)/(d*d);
      force.mult(strength);
      return force;
  } 
  
  void display(){
     ellipseMode(CENTER);
     noStroke();
     fill(255);
     ellipse(location.x,location.y,diameter,diameter);
  }
  
  void clicked(float mx,float my){
      float d=dist(mx,my,location.x,location.y);
      //diameter=mass*2;
      if(d<mass){
          dragging=true;
          dragOffset.x=location.x-mx;
          dragOffset.y=location.y-my;
      }
  }
  
  void stopDragging(){
     dragging=false; 
  }
  
  void drag(){
    if(dragging){
       location.x=mouseX+dragOffset.x;
       location.y=mouseY+dragOffset.y;
    }
  }
}
