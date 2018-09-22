class Particle{
  
  Body body;
  float r;
  
  Particle(float x,float y,float _r){
    r=_r;
    makeBody(x,y,r);
  }
  
  void killBody(){
    box2d.destroyBody(body); 
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.x > width+r*2||pos.x<-r*2) {
      killBody();
      return true;
    }
    return false;
    
  }
  
  void display(){
    Vec2 pos=box2d.getBodyPixelCoord(body);
    
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(121);
    noStroke();
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
  
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));
  }

  
  
}
