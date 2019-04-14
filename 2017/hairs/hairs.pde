//referenced from https://www.openprocessing.org/sketch/238882
/*
recreating the referenced sketch.
*/

int num = 150,count = 1; //numbers of hairs.
//define array
Hair[] hairs = new Hair[num];
// define animation and capture variables.
float timer = 0,limit = 200, r = 50,NL,NS;


void setup() {  
  size(600, 600);
  smooth();
  background(0);
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2, 300, 300);
  NL = (int)random(20,40);
    NS = (int)random(100,300);
  // initialize array
  for (int i =0; i< hairs.length; i++)
    hairs[i] = new Hair();
  // noLoop();
}
void mousePressed(){
//loop();
}
void draw() {
  //reposition center
  translate(width/2, height/2);
  //draw
  if ( (timer = (timer + .5)) > limit) {
     //this is for that quick fade at the end of a cycle
    fill(0,40);
    rect(0,0, width, height);
  }
  
  for (int i =0; i< hairs.length; i++) {
    hairs[i].update();
    hairs[i].display();
  }
  // reset parameters every time 'limit' is hit
  if ( (timer = (timer + .5) % limit) == 0 ) {
    if(count >=9)
      noLoop();
    
    count++;
    fill(0);
    rect(0,0,width,height);
    fill(255);
    rect(0, 0, 300, 300);
    r = random(40,80);
    NL = (int)random(20,40);
    NS = (int)random(100,300);
    for (int i = 0; i < hairs.length; i++) {
      hairs[i].reDraw();
    }
      
}
  saveFrame("fb/hairs-########.tga");
}

class Hair {
  // define source ,new and destination points
  float x, y, nx, ny, dx, dy;
  //define Noise, noise Strength,angle,length of line and explode
  float a=0, l=3;
  int N;
  boolean explode;

  Hair() {
    explode =random(1) < 0.2; // change value from 0 to 1 to move from 0 probability to 1
    N = (int)random(360); // get an angle
    x = cos(N)*r; 
    y = sin(N)*r;
    dx = cos((int)random(360)) * 300;
    dy = sin((int)random(360)) * 300;
    nx = x+ cos(a)*l;
    ny = y+ sin(a)*l;
  }
  //update the cordinate and check if out of box and if explode is true or false.
  void update() {
    //update new angle
    a = noise(x/NS, y/NS)* NL;
    //update cordinates
    if ( explode && ( x > 150 || x < -150 || y >150 || y <-150)) {
      nx = lerp(nx, dx, 0.03) + cos(a)*l;
      ny = lerp(ny, dy, 0.03) + sin(a)*l;
    } else {
      nx += cos(a)*l;
      ny += sin(a)*l;
    }
  }
  ///display the line
  void display() {
    //change color as per outside or inside box
    if ( x > 150 || x < -150 || y >150 || y <-150)
      stroke(255);
    else
      stroke(0);
      
    //draw line  
    line(x, y, nx, ny); 
    //update old coordinate
    x = nx;
    y = ny;
  }
  
  void reDraw(){
    // background reset
   
    
    a= 0;
    l = 3;
    explode =random(1) < 0.2; // change value from 0 to 1 to move from 0 probability to 1
    N = (int)random(360); // get an angle
    x = cos(N)*r; 
    y = sin(N)*r;
    dx = cos((int)random(360)) * 300;
    dy = sin((int)random(360)) * 300;
    nx = x+ cos(a)*l;
    ny = y+ sin(a)*l;  
  }
  
}