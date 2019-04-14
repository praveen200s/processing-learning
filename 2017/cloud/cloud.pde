/*
Perlin Noise to create a fluff dynamic cloud.
*/

float r1 = 200,r2 = 100,in,n,ns,a;
float step = TWO_PI/90,x,y,g,al;

void setup(){
size(600,600);
smooth();
background(#31D7FF);
in = 0;
ns = 0;
//frameRate(10);
}

void draw(){
translate(width/2,height/2+map(sin(in),-1,1,-10,50));
background(#31D7FF);
noStroke();
r1 = 200;
r2 = 100;
ns = 0;
for(int i = 0; i<=20;i+=1)
{
ns += 0.1;
g = map(noise(ns),0,1,240,250);  
al = map(noise(ns),0,1,20,70); 

fill(g,al);
//stroke(g,al);
n = in;
in+=0.0001;
beginShape();
for(float j = 0; j <= TWO_PI; j+=step){
  a = map(noise(ns,n),0,1,-35,35);  
  n += 0.13;  
  x = r1 * cos(j)+ a + cos(ns);
  y = r2 * sin(j)+a + sin(ns);
  vertex(x,y);
}  
endShape(CLOSE);
r1 -= 5;
r2 -= 5;
//ellipse(0,0,r1,r2);
}
//noLoop();
}