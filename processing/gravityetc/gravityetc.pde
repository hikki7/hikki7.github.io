Mover[]mover= new Mover[100];
PVector wind;
PVector gravity;
PVector godPower;
float t=0;
float dist;
float c=0.01;
float normal=1;
//摩擦の大きさ
float frictionMag=c*normal;

void setup() {
  fullScreen();
  for(int i=0;i<mover.length;i++){
    mover[i]=new Mover(random(0.1,5),random(300)+width/2,random(300));
  }
  wind=new PVector(0.01, 0);
  gravity=new PVector(0, 0.98);
  godPower=new PVector(0,0);
}

void draw() {
  background(51);
  for(int i=0;i<mover.length;i++){
    mover[i].update();
    mover[i].checkEdge();
    mover[i].display();
    mover[i].addForce(wind);
    gravity.y=0.98*mover[i].mass;
    mover[i].addForce(gravity);
    dist=width/2-mover[i].location.x;
    godPower.x=map(dist,-width/2,width/2,-10,10);
    //mover[i].addForce(godPower);
    //ここから摩擦
    PVector friction=mover[i].velocity.get();
    friction.normalize();
    //動摩擦力は逆に力が向くから
    friction.mult(-1);
    //摩擦力の完成
    friction.mult(frictionMag);
    mover[i].addForce(friction);
  }
  t+=0.01;
}
