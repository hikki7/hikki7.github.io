class Bridge {

  float totalLength;
  int numPoints;

  ArrayList<Particle>particles;

  //Chain Bridge constructor
  Bridge(float l, int n) {
    totalLength=l;
    numPoints=n;

    particles=new ArrayList();

    float len=totalLength/numPoints;

    for (int i=0; i<numPoints+1; i++) {
      Particle p=null;
      if (i==0||i==numPoints) {
        p=new Particle(i*len, height/4, true);
      } else {
        p=new Particle(i*len, height/4, false);
      }
      particles.add(p);

      //connect the particles
      if (i>0) {
        //これがjointの定義
        DistanceJointDef djd = new DistanceJointDef();
        Particle previous=particles.get(i-1);
        //connection between previous with a distance joint
        djd.bodyA=previous.body;
        djd.bodyB=p.body;

        //2点間の距離をworldへ変換
        djd.length=box2d.scalarPixelsToWorld(len);
        //ポヨンポヨンさせる
        djd.frequencyHz=0;
        //最初のポヨン
        djd.dampingRatio=0;

        //make joint
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    for(Particle p:particles){
       p.display(); 
    }
  }
}
