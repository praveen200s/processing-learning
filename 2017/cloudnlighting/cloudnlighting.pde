/*
Extension of Cloud Sketch with lightening effect.
*/
float r1 = 200,r2 = 100,in,n,ns,a;
float step = TWO_PI/90,x,y,g,al;
float lx,ly,ox,oy,dx,dy;
float wx,wy;

void setup(){
size(600,600);
smooth();
//background(#31D7FF);
background(#59e3fc);
in = 0;
ns = 0;
frameRate(20);
}

void draw(){
background(#59e3fc);  
  
//Sea
//noStroke();
//fill(#232E52);
//for( int p=0;p<width;p++){
//wy += 0.01;
//  beginShape(); 
//   float wx = wy;
//  for (float a = 0; a <= width; a += 20) {
//   float b = map(noise(wx,wy), 0, 1, 550,590);
//    //vertex(a, b); 
//    wx += 0.09;
//  }
//   vertex(width, height);
//   vertex(0, height);
//   endShape(CLOSE);
//}

translate(width/2,height/2+map(sin(in),-1,1,50,-10));


//THUNDER

//if(random(1)< 0.067){
  
//ox =random(-20,20);oy =random(-10,10);
//dx =random(-200,200);
//dy =random(250,300);
//background(#A0FFF9);
//fill(255,255);
//ellipse(ox,oy,150,20);
//for(int a = 0; a<10;a++){
// lx = lerp(ox,dx , 0.03) + random(20);
// ly = lerp(oy,dy, 0.03) + random(20);
// strokeWeight(4);
// stroke(255);
// line(ox,oy,lx,ly);
// ox = lx;
// oy =ly;
//}
//}

//Cloud
r1 = 200;
r2 = 100;
ns = 0;

noStroke();
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
void mouseClicked(){
saveFrame("insta/cloud-########.png");

}