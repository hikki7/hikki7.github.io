import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Particle>particles;

Surface surface;

void setup(){
  fullScreen();
  smooth();
  noCursor();
  
  //物理空間作ります
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  particles=new ArrayList<Particle>();
  surface=new Surface();
  
}


void draw(){
  background(21);
  if(random(1)<0.5){
    float sz=random(2,12);
    particles.add(new Particle(width/2,10,sz));
  }
  
  
  box2d.step();
  
  surface.display();
  
  for(Particle p:particles){
    p.display();
  }
  
  for(int i=particles.size()-1;i>0;i--){
      Particle p=particles.get(i);
      if(p.done()){
          particles.remove(i);
      }
  }
}
