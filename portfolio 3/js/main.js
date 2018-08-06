

var x;
var y;
var speedX;
var speedY;

function setup(){
    var canvas = createCanvas(windowWidth,windowHeight);
    canvas.parent('canvas-header');
    background(0);
    fill('#FF0000');

    x = width/2;
    y = height/2;
    speedX = random(-4,4);
    speedY = random(-4,4);
    ellipse(x,y,50,50);
}

function draw(){
    background(0);
    x += speedX;
    y += speedY;
    if(x > width || x < 0){
        speedX *= -1;
    }
    if(y > height || y < 0){
        speedY *= -1;
    }
    ellipse(x,y,50,50);

}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
