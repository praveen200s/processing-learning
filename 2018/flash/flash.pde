Streak s1;
PVector f,fv;
float no=0;
void setup(){
size(800,800);
  f = new PVector(width/2,height/2);
  fv = new PVector(4,3);
 s1 = new Streak();
 
background(0);
}

void draw(){
  noStroke();
  fill(0,0,0,2);
  rect(-1,-1,width+1,height+1);

   
  
  noStroke();
  fill(255,0,0,25);
  ellipse(f.x,f.y,30,30);
  if(random(1)<0.01)
    fv.x= -fv.x;
  f.x+=fv.x;
  f.y+=fv.y;
  if(f.x <0 || f.x>width)
    fv.x= -fv.x;
  if(f.y <0 || f.y>height)
    fv.y= -fv.y;

  
  s1.show(f,fv);
   s1.update();
  
  no+=0.05;
}