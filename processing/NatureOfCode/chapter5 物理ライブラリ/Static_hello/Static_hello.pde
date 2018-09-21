import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box>boxes;
ArrayList<Boudary>boudaries;
Box2DProcessing box2d;


void setup() {
  fullScreen();
  smooth();
  boxes=new ArrayList<Box>();
  boudaries=new ArrayList<Boudary>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);

  //add a bunch of fixed boundaries
  boudaries.add(new Boudary(width/4, height*3/4, width/2-50, 10));
  boudaries.add(new Boudary(width*3/4, height/2, width/2-50, 10));
}


void draw() {
  background(21);

  box2d.step();

  if (random(1)<0.2) {
    Box p=new Box(width/2, 30);
    boxes.add(p);
  }

  for (Box b : boxes) {
    b.display();
  }

  for (Boudary b : boudaries) {
    b.display();
  }

  //box remove
  for (int i=boxes.size()-1; i>=0; i--) {
    Box b=boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
