// setup the sound library and audio player
import processing.sound.*;     // import the sound libraries into Processing
SoundFile sf;
Amplitude amp;
int num = 50;
float x,lx,ly;

void setup(){
size(600 ,600);

background(0);
fill(255);
stroke(255);
strokeWeight(2);
frameRate(60);
amp = new Amplitude(this);
sf = new SoundFile(this, "ghanta.wav");
sf.play();
amp.input(sf);

}

void draw(){


background(0);
 
  x = map(amp.analyze(),0,1,0,100);
  noFill();
  stroke(255,map(x,0,20,255,100));
  strokeWeight(x);
  ellipse(width/2,height/2,x+200,x+200);
  blendMode(SCREEN);
  for(float i = 0; i <= TWO_PI; i+=TWO_PI/10){
    
    ellipse(width/2,height/2,x+20,x+20);
    //ellipse(width/2+cos(i),height/2+sin(i),x+20,x+20);  
  if(x>50){
    stroke(255,255);
    strokeWeight(1);
    lx = random(width);
    ly = random(height);
    line( lx,ly,lx+cos(lx)*50, random(width)+sin(lx)*50 );
  }
  if(millis() >= 48000){
    sf.stop();
    noLoop();
  }else{
  
  //saveFrame("vdo/frame-###########.tga");
  
  }
} 

}