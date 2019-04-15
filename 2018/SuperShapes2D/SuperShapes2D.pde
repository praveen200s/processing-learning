float t=0.0;
int m=10;
void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  noFill();
  //frameRate(1);
  strokeWeight(2);
}

void draw() {
  background(15, 90, 98);

  translate(width/2, height/2);
  stroke(100, 100, 100, 80);

  shapeIt(1, 1);

  stroke(50, 100, 100, 50);
  shapeIt(5, 5);

  stroke(80, 80, 100, 90);
  shapeIt(8, 8);
  t+= 0.02;

  //if ((millis()/1000)%2 == 0) {
  //  m=millis()/1000;
  //}
}

void shapeIt(float a, float b) {
  beginShape();

  for (float theta =0.01; theta<=2*PI; theta+=0.01) {
    float rad = r(theta, 
      a, //a -- for sizing on cos axis
      b, //b -- for sizing on sin axis
      m, //m -- for number of nodes
      3, //n1 -- for smoothness or spikeness of nodes
      pow(cos(t),2), //n2 -- for shape of cos nodes
      cos(t/2) //n3 -- for shape of sin nodes
      );
    float x = rad * cos(theta) * 180;
    float y = rad * sin(theta) * 180;
    vertex(x, y);
  }


  endShape();
}



float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m*theta / 4.0)/a), n2)+
    pow(abs(sin(m*theta / 4.0)/b), n3), -1.0/n1);
}