import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box>boxes;
Box2DProcessing box2d;

void setup() {
  fullScreen();
  smooth();
  boxes=new ArrayList<Box>();
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
}


void draw() {
  background(21);

  //なんかお決まりらしい
  box2d.step();

  Box p=new Box(mouseX, mouseY);
  boxes.add(p);

  //ArrayListがあるだけ繰り返す
  for (Box b : boxes) {
    b.display();
  }
}
