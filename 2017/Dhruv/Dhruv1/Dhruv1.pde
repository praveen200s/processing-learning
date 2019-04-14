/*
A Random Pattern generator for etching or engraving on metal heads of metaling plates.

*/
int num = 30, D = 600;
Point[] points = new Point[num];

void setup(){

  size(800,800);
  background(255);
  
  for( int i = 0 ;  i< num ; i++){
    points[i] = new Point();
  }

frameRate(8);
}

void draw(){
Point p1,p2;  
//translate(width/2,height/2);
background(255);
noFill();
stroke(0);
strokeWeight(2);
  for(int i = 0; i < num ; i++){   
    p1 = points[i];
    p2 = points[(int)random(0,num)];
    p1.update();
    p2.update();
    curve(p1.cx,p1.cy,p1.x,p1.y,p2.x,p2.y,p2.cx,p2.cy);
  }
  strokeWeight(4);
  ellipse(width/2,height/2,D,D);
  fill(255);
  ellipse(width/2,height/2,D/3,D/3);
 
  //saveFrame("insta/frame-#######.tga");
 //noLoop(); 
}
void mouseClicked(){
  saveFrame("dhruv1/frame-#######.png");
}


class Point{
float x,y,a,cx,cy, r = PI/90;
  
Point(){
a = random(0,TWO_PI);  
x = width/2 + D/2* cos(a) ;
y = height/2 + D/2* sin(a) ;
cx = width/2 + D* cos(a);
cy = height/2 + D* sin(a);
}

void update(){
 
a += r;
x = width/2 + D/2* cos(a) ;
y = height/2 + D/2* sin(a) ;
cx = width/2 + D* cos(a);
cy = height/2 + D* sin(a);
}


}