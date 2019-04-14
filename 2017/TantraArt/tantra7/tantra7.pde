int n =0;
float c=2;
float px,py;

void setup(){
  size(800,800);
background(0);
px = width/2;
py = height/2;
//colorMode(HSB);
blendMode(LIGHTEST);
}

void draw(){
  float a;
  if(n%2 == 0)
    a = n * 167.2;
  else
    a = n* -167.2;
  float r = c * sqrt(n);
  //r+= random(50);
  float x = r* cos(a) + width/2;
  float y = r* sin(a) + height/2;
  //fill(255);
  //noStroke();
  stroke(255,100);
  if(n%9 == 0)
  line(width/2,height/2,px,py);
  
  //if(n%3== 0)
  // line(px,py,x,y);
  //line(x,py,x,y);
 
  px = x;
  py = y;
   //line(x,y,x-50,y-50);
  stroke(255);
  //strokeWeight(5);
  
  //point(x,y);
  //ellipse(x,y,5,5);
  n+=2;
  println(r);
  if(r > 200)
    noLoop();
}
void keyPressed(){
if (key == 's')
  saveFrame("frame-#####.jpg");
}