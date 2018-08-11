int[]randomCounts;

void setup(){
  fullScreen(P2D);
  randomCounts=new int[20];
}


void draw(){
  background(0);
  int index=int(random(randomCounts.length));
  randomCounts[index]++;
  stroke(0);
  fill(175);
  int w=int(width/randomCounts.length);
  for(int i=0;i<randomCounts.length;i++){
    rect(i*w,height-randomCounts[i],w,randomCounts[i]); 
  }
}
