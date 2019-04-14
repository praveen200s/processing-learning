import com.hamoid.*;
VideoExport videoExport;


float px, py, pz, h=100, rmax, a =0, r=0;
color c;
int n=0, count=0;

PFont mono;
String s = "Happy X-mas";

void setup() {
  size(800, 800, P3D);
  colorMode(HSB, 100);
  background(0);
  noStroke();
  px = width/2;
  py=height/2;
  pz= height;
  c = color(30, h, 100);
  rmax = width/2;
  r = rmax;
  //frameRate(60);

  mono = createFont("mm.TTF", 92);

  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw() {
  //get new angle for each iteration of n  
  a = n * 10;

  //starting point for curve is px,py, first control point -100,+100.

  //ending point comes from r*cos(a)+px, control point shifted to same -100, +100
  float x = r*cos(a) + px;
  float y = r*sin(a) + py;
  pz -= 0.6+ random(1);
  //fix colors and strokes
  translate(0, pz, 0);
  pushMatrix();
  rotateX(-1.8);

  noStroke();

  if (r < width/4)
    c = color(40, h, 100);
  else if (r > width/6 && r < width/4)
    c = color(40, h, 100);
  else
    c = color(40, h, 100);

  if (r > width/3 && r < width/2)
  { 
    //fill(c, 30);
    fill(color(random(80, 100), 100, 100), 60);
    float rr= random(5, 20);

    //ellipse(x, y, 2, 2);  
    //fill(100, 10);
    //ellipse(x, y, 5, 5);
    ellipse(x, y, rr, rr);
  } else {
    fill(random(50, 80), 100, 100);
    float rr= random(10, 15);
    ellipse(x, y, rr, rr);
  }


  noFill();
  stroke(c, 80);
  if (random(1)> 0.95)
    strokeWeight(3);
  else
    strokeWeight(1);

  curve(px-width/4, py+width/4, px, py, x, y, x-width/8, y+width/4);
  //update the variables
  n++;
  h+=0.1;
  r-=0.5;
  if (h>90)
    h=60;
  if (r < 5) {
    count++;
    r = rmax;
    pz= height;
  }
  popMatrix();


  videoExport.saveFrame();
  if (count == 1) {
    textFont(mono);
    textSize(92);
    textAlign(CENTER, CENTER);
    fill(100);
    text(s, width/2, height/2-100); 
    
    //noLoop();
    //saveFrame("frame-#####.jpg");
  }
}

void keyPressed() {
  if (key == 's')
    //saveFrame("frame-#####.jpg");
    videoExport.endMovie();
}