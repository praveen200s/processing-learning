/*
Translating A 3d box in the space.
*/

float x,y,z;
float v;
void setup(){
size(600,600,P3D);
  
smooth();
background(255);
x = random(width);
y = random(height);
z= random(-100,100);
v = 10;

frameRate(10);
}

void  draw(){
fill(255,20);
  rect(0,0,width,height);
stroke(0);
strokeWeight(2);
fill(88);
pushMatrix();

translate(x,y,z);

box(100);
popMatrix(); 
y+=v;
if( y > height || y < 0)
  y = 0;

}