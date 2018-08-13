Landscope land;
float theta=0.0;

void setup() {
  fullScreen(P3D);
  land=new Landscope(20, 800, 400);
}


void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2+20, -160);
  rotateX(PI/3);
  rotateZ(theta);
  land.render();
  popMatrix();
  land.calculate();
  theta+=0.0025;
}

class Landscope {
  int scl;//それぞれのcellの大きさ
  int w, h;//width and height of thingie
  int rows, cols;//横と縦の番号
  float zoff=0;//perlin noise argument
  float[][]z;//それぞれのcellのzの高さ

  Landscope( int _scl, int _w, int _h) {
    scl=_scl;
    w=_w;
    h=_h;
    cols=w/scl;
    rows=h/scl;
    z=new float[cols][rows];
  }

  void calculate() {
    float xoff=0;
    for (int i=0; i<cols; i++) {
      float yoff=0;
      for (int j=0; j<rows; j++) {
        z[i][j]=map(noise(xoff, yoff, zoff), 0, 1, -120, 120);
        yoff+=0.1;
      }
      xoff+=0.1;
    }
    zoff+=0.01;
  }

  void render() {
    for (int x=0; x<z.length-1; x++) {
      for (int y=0; y<z[x].length-1; y++) {
        stroke(255);
        fill(100, 100);
        pushMatrix();
        //四角形を作るってこと
        beginShape(QUADS);
        translate(x*scl-w/2, y*scl-h/2, 0);
        vertex(0, 0, z[x][y]);
        vertex(scl, 0, z[x+1][y]);
        vertex(scl, scl, z[x+1][y+1]);
        vertex(0, scl, z[x][y+1]);
        endShape();
        popMatrix();
      }
    }
  }
}
