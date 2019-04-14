
int num = 2000, r = 200;

Point[] points = new Point[num];

void setup() {
  size(800, 800);

  noStroke();
  //stroke(255);
  //strokeWeight(2);
  //fill(255);
  //frameRate(15);

  for (int i = 0; i < num; i++) {

    points[i] = new Point();
  }
  background(0);
}

void draw() {

  translate(width/2, height/2);

  for ( Point p : points) {
    p.drawpoint();
    p.updatepoint();
  }
  if(random(1) <0.4)
    blendMode(SCREEN);
  else
    blendMode(BLEND);
  
  fill(0, 90);
  ellipse(0,0,600,600);
  
  //blendMode(BLEND);
  //fill(#FADD00,40);
  //ellipse(0,0,random(402,410),random(402,410));
  
  blendMode(BLEND);
  fill(0);
  //ellipse(0,0,400,400);
  //noLoop();
  
  //if(millis() < 12000)
  //  saveFrame("insta/frame-#######.tga");
}


class Point {
  float x, y, t, a,i,n =0;
  float speed;
  Point() {
    a = random(2*PI);


    if (random(1) < 0.3) {
      t = random(30, 60);
      speed = random(0.01, 0.03);
      i = random(100,200);
    } else if(random(1) < 0.5) {
      t = random(20, 40);
      speed = random(0.06, 0.5);
      i = random(150,200);  
  }else {
      t = random(0, 30);
      speed = random(0.04, 0.06);
      i = random(200,255);  
  }
    x = (r+t) * cos(a);
    y = (r+t) * sin(a);
  }


  void drawpoint() {
    fill(#FADD00,i);
    //noFill();
    //stroke(#FADD00,i);
    //ellipse(x, y, 3, 3);
    //line(x,y,x+random(-10,10),y + random(-10,10));
    triangle(x,y,x+random(-10,10),y + random(-10,10),x+random(-10,10),y + random(-10,10));
    noStroke();
  }


  void updatepoint() {
    a += speed * sin(n/5);
    x = (r+t) * cos(a);
    y = (r+t) * sin(a);
    n+= 0.04;
  }
}