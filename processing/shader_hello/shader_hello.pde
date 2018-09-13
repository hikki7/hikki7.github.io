import com.amd.aparapi.*;

KernelP5 kernel;

long generations = 0;
long start = System.currentTimeMillis();

void setup() {
  size(1280, 768);
  frameRate(240);
  background(0);

  fill(255);
  loadPixels();

  kernel = new KernelP5(width, height, pixels);
  //lifeKernel.setExecutionMode(Kernel.EXECUTION_MODE.CPU);
  updatePixels();
}
void draw() {
  //background(0);
  //ここで書いたshaderを貼り付ける
  kernel.nextGeneration();
  updatePixels();

  fill(0);
  rect(0, 0, 100, 20);
  fill(255);
  text(frameRate, 10, 10);
  println(this.kernel.getExecutionMode());
}

void mouseMoved() {
  kernel.mx = mouseX;
  kernel.my = mouseY;
}

boolean GPUUsageflag = true;
void mousePressed() {
  if (GPUUsageflag==true) {
    //なんかこれにするとすごく早くなる
    kernel.setExecutionMode(Kernel.EXECUTION_MODE.JTP);
  } else {
    kernel.setExecutionMode(Kernel.EXECUTION_MODE.GPU);
  }
  GPUUsageflag = !GPUUsageflag;
  println(GPUUsageflag);
}

class KernelP5 extends Kernel {

  int[] imageData;
  Range range;
  int width;
  int height;
  float time;
  float timed;

  int mx = 0;
  int my = 0;

  KernelP5(int _width, int _height, int[] pixels) {
    width = _width;
    height = _height;
    imageData = pixels;
    range = Range.create(width * height);
    println(getExecutionMode());

    setExplicit(true); 
    clear();
  }

  void setImage(int[] pixels) {
    imageData = pixels;
  }

  @Override
    void run() {
    int gid = getGlobalId();

    int tx = gid % width;
    int ty = gid / width;
    int red = 0;
    int green = 0;
    int blue = 0;
    for (int i = 0; i < 12; i++) {  
      float xx = cos(toRadians(i * 30) + (time)) * my + width / 2;
      float yy = sin(toRadians(i * 30) + (time)) * my + height / 2;
      float dx = tx - xx;
      float dy = ty - yy;

      float dx2 = dx * dx;
      float dy2 = dy * dy;

      float dist = sqrt(dx2 + dy2);

      if (dist > 512) {
        continue;
      } else {
        dist = (512 - dist) / 2;
      }
      float r = 0;
      r = abs(sin((mx / 500.0) * toRadians(dist * 5) + -time * 3) * dist);
      if (i % 3 == 0) {
        red += r;
      } else if (i % 3 == 1) {
        green += r;
      } else {
        blue += r;
      }
    }

    red = min(red, 255);
    green = min(green, 255);
    blue = min(blue, 255);
    imageData[gid] = 0xEE000000 + (red << 16) + (green << 8) + (blue);
  }

  void nextGeneration() {
    time -= abs(sin(toRadians(timed))) * 0.01;
    timed += 1;
    execute(range);
  }

  int[] getImageData() {
    return imageData;
  }
}
