class Day{
  
  int daycount=0;
  String earthDay;
  
  Day(){
    
    
  }
  
  void display(){
    daycount=frameCount/60;
    earthDay="earth's day is "+daycount;
    println(earthDay);
    textAlign(CENTER);
    textSize(16);
    text(earthDay,30,30);
  }
  
  
  
}
