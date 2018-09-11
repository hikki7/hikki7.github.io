class Triangle extends Particle{
  
  Triangle(PVector l,float _hue,float _mass){
     super(l,_hue,_mass); 
  }
  
  void display(){
     fill(hue,80,80,lifeSpan);
     noStroke();
     pushMatrix();
     translate(location.x,location.y);
     rotate(theta);
     triangle(0,-mass*10,mass*10*cos(PI/6),mass*10*sin(PI/6),-mass*10*cos(PI/6),mass*10*sin(PI/6));
     popMatrix();
  }
}
