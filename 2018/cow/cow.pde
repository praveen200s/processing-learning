//import processing.sound.*;
import com.hamoid.*;


PImage cow,bl[],d[]; 
color bg,c1,c2,c3,c4;
Mob mob;
int time = millis(); 
float nFactor=0,theta =0,noise =0;
PVector cv;
int maxdead = 73;
//SoundFile ping;
VideoExport videoExport;

void setup() {
  size(800, 800);
  colorMode(HSB,100);
  
  bg = color(0,0,0);
  c1 = color(map(0,0,360,0,100),0,100);
  c2 = color(map(292,0,360,0,100),79,67);
  c3 = color(map(60,0,360,0,100),75,100);
  c4 = color(map(60,0,360,0,100),20,99);
  smooth();
  
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  cow = loadImage("cow.png");
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
  cv = new PVector(width/2,height/2);
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw() {

  fill(bg,10);
  rect(-1,-1,width+1,height+1);

if(mob.deathcount <maxdead){
  for(int j=0; j<10;j++){
  movecow();
  }
 mob.pointer(cv);
  mob.plot(cv);
  mob.connect(cv);
 
}else{
  reset();
  mob.plot(cv);
  mob.connect(cv);
  //mob.pointer(cv);
  
}
  //videoExport.saveFrame();
}
void movecow(){
  cv.x+=map(noise(nFactor,cv.y),0,1,3,-3) ;
  cv.y+=map(noise(nFactor,cv.x),0,1,-3,3) ;
  if(cv.x >width)
    cv.x = 0;
  if(cv.x <0)
    cv.x = width;
  if(cv.y >height)
    cv.y = 0;
  if(cv.y <0)
    cv.y = height;
}
void reset(){
  cv.x = width/2;
  cv.y = height/2;
}

void keyPressed() {
  if (key == 'q') {
    exit();
  }
  if(key == 's'){
   saveFrame("frame-#####.jpg");
  }
}