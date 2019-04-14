/*
A ranom pattern generator for etching or engraving on marble products.
*/
int f = 2;
boolean[] c1,c2,c3;
void setup() {
  size(displayHeight, displayHeight);
  background(255);
  strokeWeight(2);
  stroke(0);
  fill(0);
  smooth();
  frameRate(f);
  c1 =new boolean[16];
  c2 =new boolean[16];
  c3 =new boolean[16];
}

void draw() {
  float start_angle, end_angle;
  background(255);
  noFill();
  pushMatrix();
  translate(width/2, height/2) ; 
  for (int i = 0; i < 16; i++) {
    strokeWeight(3);
    start_angle = QUARTER_PI/2*i;
    end_angle = start_angle + QUARTER_PI/2;
    if (i%2 == 0) {
      arc(0, 0, 540, 540, start_angle, end_angle );
      arc(0, 0, 700, 700, start_angle, end_angle);
    } else {
      arc(0, 0, 620, 620, start_angle, end_angle);
    }
    strokeWeight(2);
    if(random(1) < 0.1){
      line(230*cos(start_angle),230*sin(start_angle),270*cos(start_angle),270*sin(start_angle));
      c1[i] = true;
    }else{
      c1[i] = false;
    }
    
    
    if(c1[i] == false && random(1) < 0.4){
      line(270*cos(start_angle),270*sin(start_angle),310*cos(start_angle),310*sin(start_angle));
      c2[i] = true;
    }else{
      c2[i] = false;
    }
    
    
    if(c2[i] == false && c3[i] == false && random(1) < 0.4){
      
      line(310*cos(start_angle),310*sin(start_angle),350*cos(start_angle),350*sin(start_angle));
      c3[i] = true;
    }else{
      c3[i] = false;
    }
    
    
    if(c3[i] == false && random(1) < 0.4){
      line(350*cos(start_angle),350*sin(start_angle),400*cos(start_angle),400*sin(start_angle));      
    }
    
    
  }
  popMatrix();

  ellipse(width/2, height/2, 800, 800);
  fill(255);
  ellipse(width/2, height/2, 460, 460);
  noLoop();
  if (frameCount > 100) {
    noLoop();
  }

  if (frameCount%2 == 0) {
    //frameRate(f++);
    //saveFrame("vdo/frame-#####.jpg");
  }
}