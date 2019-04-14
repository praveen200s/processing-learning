import com.hamoid.*;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;

VideoExport videoExport;
float movieFPS = 15;
String audioFilePath = "morsing.wav";


float p = 400;
color bg,s,c;


void setup(){
size(800,800);

 minim = new Minim(this);
   // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  song = minim.loadFile(audioFilePath, 1024);
  song.loop();
   
  fft = new FFT( song.bufferSize(), song.sampleRate() );
   
  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS);
  videoExport.setAudioFileName(audioFilePath);
  videoExport.startMovie();




colorMode(HSB,360);
bg = color(0);
s = color(360);
c = color(200,360,360);
background(0);
smooth();
frameRate(15); 
}

void draw(){
  fill(0,40);
  rect(0,0,width,height);
  putText();
  c = color(random(360),360,360);
  
  fft.forward( song.mix );

  if(fft.getBand(9) > 1)
     mouth();
  if(fft.getBand(12) > 4)
     mouth();
  if(fft.getBand(13) > 20)
     mouth();
  if(fft.getBand(19) > 4)
     mouth();
  if(fft.getBand(32) > 10)
     mouth();
  if(fft.getBand(39) > 7)
     mouth();

  
  
  body();
  harp();

  
    videoExport.saveFrame();
  
  if (millis() > 24*1000) {
    noLoop();
    videoExport.endMovie();
    exit();
  }
}

void body(){
stroke(300);
strokeWeight(4);
noFill();
smooth();
beginShape();
curveVertex(width/2-p/2,height/2+p/4);
curveVertex(width/2-p/2,height/2);
curveVertex(width/2-p/3,height/2-p/5);
curveVertex(width/2-p/6,height/2-p/5);
curveVertex(width/2,height/2-p/20);
curveVertex(width-p/2.5,height/2-p/40);
curveVertex(width-p/2,height/2);
endShape();
beginShape();
curveVertex(width/2-p/2,height/2-p/4);
curveVertex(width/2-p/2,height/2);
curveVertex(width/2-p/3,height/2+p/5);
curveVertex(width/2-p/6,height/2+p/5);
curveVertex(width/2,height/2+p/20);
curveVertex(width-p/2.5,height/2+p/40);
curveVertex(width-p/2,height/2);
endShape();


}


void harp(){
noStroke();
//stroke(255);
//noFill();

fill(c,360);
smooth();

float L1 = random(width/2,width-p/4);
float L2 = random(p/8,p/5);
beginShape();
vertex(L2,height/2-p/30);

vertex(L1,height/2-p/100);
vertex(L1,height/2+p/100);

vertex(L2,height/2+p/30);
endShape(CLOSE);




fill(360);
smooth();

L1 = random(width/2,width-p/4);
L2 = random(p/8,p/5);
beginShape();
vertex(L2,height/2-p/30);

vertex(L1,height/2-p/100);
vertex(L1,height/2+p/100);

vertex(L2,height/2+p/30);
endShape(CLOSE);
}

void mouth(){
  
  
  if(random(1) < 0.8){
    noStroke();
    fill(c,300);  
}else{
    stroke(c,300);
    noFill();
  }
  float R = random(p);
  ellipse(random(p/2,width-p/2),random(p/2,height-p/2),R,R);

}
void putText(){
  fill(360);
  textFont(createFont("Helvetica", 16));
  textSize(36);
  text("MORCHANG", width/2-330, height-100);
  textSize(18);
  text("Rajasthan", width/2-330, height-70);
}
void keyPressed(){
if(key =='s')
  saveFrame("insta/frame-########.png");
}