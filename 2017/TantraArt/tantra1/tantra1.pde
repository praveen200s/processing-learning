float r1, r2, in, n, ns, a;
float step = TWO_PI/90, x, y, al;
color g = #ff69b4;

void setup() {
  size(600, 840);
  smooth();
  background(#fffdd0);
  in = 0;
  ns = 0;
}
void draw() {
  background(#fffdd0);
  drawCloud();  
  makeLinga();
}

void drawCloud() {
  pushMatrix();
  translate(width/2, height/2+map(sin(in), -1, 1, -20, 20));
  noStroke();
  r1 = 200;
  r2 = 300;
  ns = 0;
  for (int i = 0; i<=20; i+=1)
  {
    ns += 0.1;
    g = map(noise(ns), 0, 1, 240, 250);  
    al = map(noise(ns), 0, 1, 20, 70); 

    fill(g, al);
    //stroke(g,al);
    n = in;
    in+=0.0001;
    beginShape();
    for (float j = 0; j <= TWO_PI; j+=step) {
      a = map(noise(ns, n), 0, 1, -35, 35);  
      n += 0.13;  
      x = r1 * cos(j)+ a + cos(ns);
      y = r2 * sin(j)+a + sin(ns);
      vertex(x, y);
    }  
    endShape(CLOSE);
    r1 -= 5;
    r2 -= 5;
    //ellipse(0,0,r1,r2);
  }




  popMatrix();
}





void makeLinga() {
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(3);
  stroke(#F5027C); 
  fill(#111111);
  beginShape();
  vertex(-150, 0);
  bezierVertex(-150, 150, -100, 250, 0, 250);
  bezierVertex(100, 250, 150, 150, 150, 0);
  bezierVertex(150, -150, 100, -250, 0, -250);
  bezierVertex(-100, -250, -150, -150, -150, 0);

  endShape(CLOSE);
  popMatrix();
}