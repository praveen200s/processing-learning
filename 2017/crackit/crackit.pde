/*
Learning noise in processing.
*/
float r1,r2,w,nx,ny;
void setup() {
  size(800, 800);
  background(255);
  stroke(0);
  noFill();
   w = 1;
  nx = 100;
  ny = 100;
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (int i=0; i<10; i++) {
    strokeWeight(w);
    ellipse(0, 0, r1, r2);
    r1 = r1 + 50;
    r2 = r2 + 50;
    w = w + 1;
  }
  r1 = noise(nx)*10;
  r2 = noise(ny)*10;
  nx+=10;
  ny+=20;
  w = random(1,2);
  //noLoop();
}