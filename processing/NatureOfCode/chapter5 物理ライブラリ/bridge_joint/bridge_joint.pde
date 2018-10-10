import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Box>boxes;
ArrayList<Particle> part;
Bridge b;

void setup() {
  fullScreen(P2D);
  smooth(8);

  //make box2d instance
  box2d=new Box2DProcessing(this);
  box2d.createWorld();

  //create ArrayList of boxes
  boxes=new ArrayList<Box>();
  part=new ArrayList<Particle>();
  b=new Bridge(width,width/20);
}


void draw() {
  background(21);

  //we must always step through time!
  box2d.step();

  if (mousePressed) {
    Box b=new Box(mouseX, mouseY);
    boxes.add(b);
  }

  for (Box b : boxes) {
    b.display();
  }

  for (int i=boxes.size()-1; i>=0; i--) {
    Box b=boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  b.display();
}
