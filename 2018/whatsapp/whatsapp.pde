//import processing.sound.*;
import com.hamoid.*;


PImage wapp,bl[],d[]; 
color bg,c1,c2,c3,c4;
Mob mob;
int time = millis(); 
float nFactor=0,theta =0,noise =0;
int maxdead = 73;

//SoundFile ping;
//VideoExport videoExport;

void setup() {
  size(800, 800);
  colorMode(HSB,100);
  
  bg = color(0,0,100);
  c1 = color(map(112,0,360,0,100),50,80);
  c2 = color(map(292,0,360,0,100),79,67);
  c3 = color(map(355,0,360,0,100),79,67);
  c4 = color(map(60,0,360,0,100),20,99);
  smooth();
  noFill();
  strokeWeight(20);
  stroke(c1);
  
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  wapp = loadImage("PNG21.png");  // Load the image into the program  
  bl = new PImage[3];
  d = new PImage[3];
  bl[0]  = loadImage("b1.png");
  bl[1]  = loadImage("b2.png");
  bl[2]  = loadImage("b3.png");
  d[0]  = loadImage("d1.png");
  d[1]  = loadImage("d2.png");
  d[2]  = loadImage("d3.png");
  
  //ping = new SoundFile(this, "wapple.mp3");
  
  mob = new Mob();
  
  //frameRate(15);
  
  
       //videoExport = new VideoExport(this);
  //videoExport.startMovie();
}

void draw() {
  //background(bg);
  if(mob.deathcount < maxdead){
  fill(bg,10);
  rect(-1,-1,width+1,height+1);
  }else{
  fill(c4,10);
  rect(-1,-1,width+1,height+1);
  }
  
  
  if(mob.deathcount <maxdead){
    for(int j=0;j<10;j++){
    mob.plot(); 
    mob.pointer();
    }
    mob.connect();  
  }else{
  //theta+=0.009;
  //if(theta >= PI)
    //exit();
    
    
    
  //noise+=0.08;
  mob.connect();
  //noLoop();
  }
  //videoExport.saveFrame();
}
void keyPressed() {
  if (key == 'q') {
    exit();
  }
  if(key == 's'){
   saveFrame("frame-#####.jpg");
  }
}