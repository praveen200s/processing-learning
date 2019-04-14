//float yoff = 0.0; // 2nd dimension of perlin noise //<>// //<>// //<>// //<>// //<>//
int num = 4;
color a,b,c,d;
color[] colorstack;
Wave[] ws = new Wave[num];
void setup() {
  randomSeed(0);
  frameRate(20);
  size(500, 500);
  colorMode(RGB,255,255,255,1);
  
  a = color(116,108,115);
  b = color(94,190,179);
  c = color(87,222,209);
  d = color(110,228,211);
  color[] colorstack = {d,c,b,a};
  for(int i =0;i<num;i++){
  ws[i] = new Wave(colorstack[i],i);
  ws[i].make();
  }
}

void draw() {
   background(255,1);
for (Wave w : ws){  
    w.update();
    w.make(); 
  }
  drawmask();
}

void drawmask(){

    stroke(255);
    strokeWeight(210);
    fill(255,0);
    int rad = 500;
    ellipse(250, 250, rad, rad);

}
 //<>//

class Wave{
int offset;
color c;
float yn;
 Wave(color ic, int x){
   c = ic;
   offset = x* 25;
   yn = random(0,1);
 } 
 
 void update(){ //<>// //<>// //<>// //<>//
 //yoff += 0.01;
 yn += 0.01;
 }
   //<>//
void make(){
   //<>//
  //yoff = iy; //<>// //<>//
   //<>//
  pushMatrix();
 
  noStroke();
  fill(c); //<>//
  // We are going to draw a polygon out of the wave points
  beginShape(); 
 
  //float xoff = 0;       // Option #1: 2D Noise
   float xoff = yn; // Option #2: 1D Noise //<>// //<>// //<>// //<>//
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 50) {
    // Calculate a y value according to noise, map to 
    //float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
     float y = map(noise(xoff), 0, 1, 200,270);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y + offset); 
    // Increment x dimension for noise
    xoff += 0.08;
  }
  // increment y dimension for noise
  //yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape();
  popMatrix();
}  
  
}