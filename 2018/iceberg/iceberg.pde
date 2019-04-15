import peasy.*;

PeasyCam cam;

float R =160, a=0, t=0, nS=5;
color bg, c1;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 500);
  smooth();
  colorMode(HSB, 100);
  c1 = color(map(186, 0, 360, 0, 100), 71, 74); //color water for earth - 186,71,74
  bg = color(0, 0, 0);
  background(bg);
}

void draw() {
  //translate(width/2, height/2);
  rotateX(a); 
  
  staticForm(c1);
  
  c1 = color(map(t, 0, 360, 0, 100), 100+t, 100+t); //hue sections 100

  t+=0.15; //for color gradient
  if (t>=100)
    t = 0;
    
  a+=0.01; //for rotation angle
  if (a>=PI/2) {
    //saveFrame(random(1000)+"Image-########.jpg");
    noLoop();
  }
}

void staticForm(color C) {
  noFill();
  stroke(C, 25);
  
  float x, y, nxx=0, nyy=0;
  
  beginShape();
  
  for (float theta =PI/2; theta< TWO_PI-PI/2; theta+=0.001) {
    
    x = cos(theta)*(R-40)+map(noise(nxx,nyy), 0, 1, -1, 1)*nS;
    y = sin(theta)*R+map(noise(nyy,nxx), 0, 1, -1, 1)*nS;
    
    vertex(x, y);
    
    nxx+=0.02; //for close points on curves, good range 0.02 to 0.05
    
  }
  endShape();
  nyy+=0.01; 
  nS+=0.05; //for edges on the surface - good range 0.1 to 0.01 
}

void keyPressed() {
  if (key == 's')
    saveFrame("Image-########.jpg");
}