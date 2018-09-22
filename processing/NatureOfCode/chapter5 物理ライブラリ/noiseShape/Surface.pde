class Surface{
  
  ArrayList<Vec2>surface;
  
  Surface(){
    surface=new ArrayList<Vec2>();
    //==========shapeの宣言
    ChainShape chain=new ChainShape();
    float noise=0.0;
    float theta=0;
    
    for(float x=width+10;x>-10;x-=5){
      float y=map(noise(noise),0,1,height/4,height-50);
      theta+=0.15;
      //shapeの頂点に設定
      surface.add(new Vec2(x,y));
      noise+=0.01;
    }
    
    Vec2[]vertices=new Vec2[surface.size()];
    for(int i=0;i<vertices.length;i++){
       Vec2 edge=box2d.coordPixelsToWorld(surface.get(i)); 
       vertices[i]=edge;
    }
    
    //create Chain
    chain.createChain(vertices,vertices.length);
    
    //==============bodyの宣言
    BodyDef bd =new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body=box2d.createBody(bd);
    body.createFixture(chain,1);
  }
  
  void display(){
    stroke(144);
    noFill();
    beginShape();
     for(Vec2 v:surface){
         vertex(v.x,v.y);
     }
     endShape();
  }
}
