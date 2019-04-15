import ddf.minim.analysis.*;
import ddf.minim.*;

int columns,rows,total;
int cell = 100;

Minim       minim;
AudioPlayer jingle;
FFT         fft;


void setup(){
size(800,800);
columns = width/cell;
rows = height/cell;
total = columns * rows;

strokeWeight(2);
stroke(0);
noFill();
background(255);
smooth();

minim = new Minim(this);
// specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile("E.mp3", 1024);

  // loop the file indefinitely
  //jingle.loop();
    jingle.play();
  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );


}

void draw(){
background(255);
    // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );
  
 // noLoop();
  float r =0f;
  int l =0;
for(int i=0; i<columns;i++){
  for(int j =0; j<rows;j++){
    
    l = (int)map(i+j*columns,0,total,0,fft.specSize()/2);
    
    r = map(fft.getBand(l)*8,0,fft.specSize()/2,cell/4,cell);
    //println(i+j*columns +" = " +total + ": "+ fft.specSize()+ " ++ "+l +" __ "+fft.getBand(l)+ "---" + r);

ellipse(i*cell+cell/2,j*cell+cell/2, r,r);
}}

}