import com.hamoid.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

VideoExport videoExport;

float movieFPS = 30;
String audioFilePath = "beenmusic1m.mp3";
int i =0;
float x, y, yi, xn, yn, A, mx;
float[] b = new float[500]; 
color c = color(0, 0, 0);
void setup()
{
  size(800, 800, P3D);
  frameRate(movieFPS);
  minim = new Minim(this);

  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile(audioFilePath, 1024);

  // loop the file indefinitely
  jingle.loop();

  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(movieFPS);
  videoExport.setAudioFileName("t5.wav");
  videoExport.startMovie();

  background(255);
  stroke(0);
  strokeWeight(1);
  smooth();
  x = 0;
  y = 550;
  yi = y;
  xn = 0;
  yn = 0;
  A = 0;
  mx =0;
}

void draw()
{
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );

  float r = fft.getBand(23);
  float g = fft.getBand(31);
  float b = fft.getBand(46);

  c = color(r, g, b);
  instrument();

  label();
  videoExport.saveFrame();

  if (millis() > 50*1000) {
    noLoop();
    videoExport.endMovie();
    //saveFrame("frames11.jpg");
    exit();
  }
}

void label() {
  fill(0);
  textSize(28);
  text("BEEN/PIPRI", 100, height-125);
  textSize(18);
  text("RAJASTHAN", 100, height-100);

}

void instrument() {
  noFill();
  stroke(c);
  beginShape();
  xn =0;
  for (x=50; x<550; x++) {
    y += map(noise(xn, yn), 0, 1, -1, 1);
    b[i] = y;
    i++;
    vertex(x, y);
    //curveVertex(x,y);
    xn += 0.009;
  }
  endShape();
  beenShape();
  //snake();  

  i =0;
  y=yi-1;
  if (y < 50)
    y = 550;
  yi = y;  
  yn += 0.01;





  drawCircle(530, 550, fft.getBand(23));
  drawCircle(560, 540, fft.getBand(31));
  drawCircle(550, 580, fft.getBand(46));
  drawCircle(580, 570, fft.getBand(62));
  drawCircle(570, 610, fft.getBand(77));
  drawCircle(600, 600, fft.getBand(8));
  drawCircle(590, 640, fft.getBand(56));
  drawCircle(620, 630, fft.getBand(131));
}
void snake() {

  fill(c);
  beginShape();
  for (i=0; i<500; i++) {
    vertex(i, b[i]);
  }
  for (i=500; i<0; i--) {
    vertex(i, b[i]-10);
  }
  endShape(CLOSE);


  //ellipse(550, b[499], 20, 15);
}



void drawCircle(float x, float y, float M) {

  mx = max(mx, M);
  if ( M > 40)
    fill(ceil(255 - mx));

  stroke(0);
  pushMatrix();
  translate(x, y);
  rotate(PI/4);
  ellipse(0, 0, 20, 10);
  popMatrix();
}

void beenShape() {

  fill(255);
  noStroke();
  beginShape();

  vertex(100, 100);
  vertex(0, 0);
  vertex(width, 0);
  vertex(width, height);
  vertex(0, height);
  vertex(0, 0);
  vertex(100, 100);
  bezierVertex(58, 135, 119, 169, 130, 175);
  bezierVertex(209, 210, 224, 202, 206, 280);
  bezierVertex(213, 257, 153, 458, 450, 500);
  bezierVertex(523, 507, 520, 464, 530, 425);
  bezierVertex(582, 73, 350, 134, 357, 131);
  bezierVertex(286, 139, 296, 175, 215, 144);
  bezierVertex(144, 101, 119, 86, 100, 100);
  endShape(CLOSE);
}