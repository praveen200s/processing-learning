//import com.hamoid.*;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;

//VideoExport videoExport;
float movieFPS = 60;
String audioFilePath = "basuri.wav";

float ca=45, s=80, b=99;
color c, bg,body;
float d1 = 0;
float[] d2 = {0,0,0,0,0,0};
void setup() {
  size(800, 800);
   minim = new Minim(this);
   // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  song = minim.loadFile(audioFilePath, 1024);
  song.loop();
   
  fft = new FFT( song.bufferSize(), song.sampleRate() );
   
  //videoExport = new VideoExport(this);
  //videoExport.setFrameRate(movieFPS);
  //videoExport.setAudioFileName(audioFilePath);
  //videoExport.startMovie(); 
   
  colorMode(HSB, 100);
  c = color(map(ca, 0, 360, 0, 100), s, b);
  body = color(0, 0, 99);
  bg = color(map(360-ca, 0, 360, 0, 100), s, b);
  background(body);
  smooth();
}


void draw() {
  noStroke();
  fill(body,2);
  rect(0,0,width,height);
  ca+= 0.09;
  if (ca > 360)
    ca =0;

  c = color(map(ca, 0, 360, 0, 100), s, b);
  bg = color(map(360-ca, 0, 360, 0, 100), s-10, b);
  shapeB();

   fft.forward( song.mix );
  
  if(fft.getBand(9)> 1 )
    soundin(d1);
  if(fft.getBand(11)< 5 )
  soundout(d2[0], 275, 225,0);
  if(fft.getBand(14)< 5 )
  soundout(d2[1], 325, 275,1);
  if(fft.getBand(27)< 5 )
  soundout(d2[2], 375, 325,2);
  if(fft.getBand(29)< 5 )
  soundout(d2[3], 440, 390,3);
  if(fft.getBand(41)< 5 )
  soundout(d2[4], 490, 440,4);
  if(fft.getBand(15)< 5 )
  soundout(d2[5], 555, 505,5);
  putText();
  
    //videoExport.saveFrame();
  
  //if (millis() > 30*1000) {
    //noLoop();
    //videoExport.endMovie();
    //exit();
  //}
  
  
}

void soundin(float dist) {
  pushMatrix();
  translate(150 - dist, 100 + dist);
  rotate(HALF_PI/2);
  noFill();
  stroke(c,50);
  ellipse(0, 0, 30+dist, 15);
  popMatrix();
  
  d1+=0.3;
}
void soundout(float dist, float x, float y,int i) {
  pushMatrix();
  translate(x + dist, y - dist);
  rotate(HALF_PI/2);
  noFill();
  stroke(c,50);
  ellipse(0, 0, 30+dist, 15+dist/5);

  popMatrix();
  
   d2[i]+=0.5;
   if ( d2[i] > 200 ){ d2[i] =0;}
  
}

void shapeB() {
  pushMatrix();
  translate(100, 50);
  rotate(HALF_PI/2);
  noFill();
  stroke(bg);
  //noStroke();
  rect(0, 0, 800, 60);
  if ( d1 > 40 ){ 
      d1 =5;
      //fill(body,20);
      //noStroke();
      //rect(35, -15, 85, 90);
  }
  fill(bg);
  noStroke();
  rect(20, 0, 15, 60);
  rect(120, 0, 15, 60);
  //fill(c,20);
  fill(c,50);
  arc(70, 0, 30, 20, 0, PI, OPEN);

  arc(250, 0, 30, 20, 0, PI, OPEN);
  arc(320, 0, 30, 20, 0, PI, OPEN);
  arc(390, 0, 30, 20, 0, PI, OPEN);

  arc(480, 0, 30, 20, 0, PI, OPEN);
  arc(550, 0, 30, 20, 0, PI, OPEN);
  arc(640, 0, 30, 20, 0, PI, OPEN);
  fill(bg);
  rect(750, 0, 15, 60);
  popMatrix();
}
void putText(){
  textFont(createFont("Helvetica", 16));
  textSize(36);
  text("BANSURI", width/2-330, height-100);
  textSize(18);
  text("INDIA", width/2-330, height-70);
}
void keyPressed(){
if(key =='s')
  saveFrame("insta/frame-########.png");
}