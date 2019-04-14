import com.hamoid.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

VideoExport videoExport;

float movieFPS = 30;
String audioFilePath = "papa50.mp3";

void setup()
{
  size(800, 800, P3D);
  frameRate(movieFPS);
  minim = new Minim(this);

  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile("pepa50.mp3", 1024);

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

}

void draw()
{
  translate(-230, -150);
  background(255);
  stroke(0);
  float x1=0,x1x=0, x2=0,x2x=0, y1=0,y1y=0, y2=0,y2y=0, mx=0;
  boolean p1 = true,p2 = true,p3 = true,p4 = true,m = true;
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );

  for (int i = 0; i < fft.specSize(); i=i+2)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    //line( i, height, i, height - fft.getBand(i)*8 );
    x1 = width * 0.42 + min(tan(radians(map(i, 0, 514, 0, 80)))*40, 300);
    x1x = width * 0.42 + min(tan(radians(map(i+1, 0, 514, 0, 80)))*40, 300);
    x2 = width*0.58 + min(tan(radians(map(i, 0, 514, 0, 80)))*30, 200) ;
    x2x = width*0.58 + min(tan(radians(map(i+1, 0, 514, 0, 80)))*30, 200) ;

    y1 = height/3 + map(i, 0, fft.specSize(), 0, 300);
    y1y = height/3 + map(i+1, 0, fft.specSize(), 0, 300);
    y2 = height/3 + map(i, 0, fft.specSize(), 0, 300);
    y2y = height/3 + map(i+1, 0, fft.specSize(), 0, 300);

    line(x1, y1, x1+min(map(fft.getBand(i), 0, 514, 0, width*0.8), width*0.16), y1);
    line(x1x, y1y, x1x+min(map(fft.getBand(i), 0, 514, 0, width*0.8), width*0.16), y1y);
    line(x2, y2, x2-min(map(fft.getBand(i), 0, 514, 0, width*0.8), width*0.16), y2);
    line(x2x, y2y, x2x-min(map(fft.getBand(i), 0, 514, 0, width*0.8), width*0.16), y2y);
    mx = max(mx, fft.getBand(i));
    if(fft.getBand(i) > 50 && i == 12)
      p1 = false;
  
    if(fft.getBand(i) > 50 && i == 18)
      p2 = false;
  
    if(fft.getBand(i) > 50 && i == 20)
      p3 = false;
  
    if(fft.getBand(i) > 50 && i == 38)
      p4 = false;
  
  if(fft.getBand(i) > 50 && i == 16)
      m = false;
  
   //20,16,18,12,38,78,46 >100
 }

  fill(ceil(mx));
  if(p1)
    ellipse(width-50, height/3 +310, 15, 10);
  if(p2)
    ellipse(width-75, height/3 +310, 15, 10);
  if(p3)
    ellipse(width-100, height/3 +310, 15, 10);
  if(p4)
    ellipse(width-125, height/3 +310, 15, 10);
  noStroke();
  if(m)
  rect(width-25, height/3 +300, 50, 30);
  stroke(ceil(mx));
  fill(0);
  //rect(width-150, height/3 +305, 130, 20);
  textSize(36);
  text("PEPA", width/2-100, height);
  textSize(18);
  text("ASSAM", width/2-100, height+30);

  videoExport.saveFrame();
  
  if (millis() > 50*1000) {
    noLoop();
    videoExport.endMovie();
    exit();
  }
}