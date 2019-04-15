import ddf.minim.*;
import ddf.minim.analysis.*;

import com.hamoid.*;
VideoExport videoExport;

Minim minim;
AudioPlayer song;
FFT fft;
float t=0,z=0.001;

void setup()
{
  size(800, 800);
  // always start Minim first!

  frameRate(30);
  colorMode(HSB, 100);
 background(0);
 smooth();
  minim = new Minim(this);

  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("E.mp3", 512);
  song.play();

  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());

  videoExport = new VideoExport(this);
  videoExport.setFrameRate(30);
  videoExport.startMovie();
}

void draw()
{
  //background(0);
  fill(0, 10);
  rect(-1, 0, width+1, height);
  // first perform a forward fft on one of song's buffers
  // I'm using the mix buffer
  //  but you can use any one you like
  fft.forward(song.mix);

  //stroke(100, 0, 0, 128);
  // draw the spectrum as a series of vertical lines
  // I multiple the value of getBand by 4 
  // so that we can see the lines better
  //for(int i = 0; i < fft.specSize(); i++)
  //{
  //  line(i, height, i, height - fft.getBand(i)*4);
  //}


  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  float r = 5;
  float theta = 0;
  translate(width/2, height/2);
  rotate(-t);
  if (random(1)<0.5) {
    //noFill();
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < song.left.size() - 1; i++)
    {
      //fill(map(theta,0,TWO_PI,0,100),0,100);
      //noFill();
      stroke(map(theta, 0, TWO_PI, 0, 10), 80*sin(t/23), 100);
      //line(i, 50 + song.left.get(i)*50,  i+1, 50 + song.left.get(i+1)*50);
      //line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
      //noFill();
      //line(width/2,height/2,r*song.left.get(i),r*song.right.get(i));
      //rect(width/2,height/2,r*song.right.get(i),r*song.left.get(i));
      //fill(0);
      //ellipse(width/2,height/2,r*song.left.get(i),r*song.right.get(i));
      //vertex(r*cos(theta)*song.left.get(i), r*sin(theta)*song.left.get(i));
      vertex(r*cos(theta)+song.left.get(i)*25, r*sin(theta)+song.right.get(i)*25);
      theta+=z;
      r=map(i, 0, song.left.size() - 1, 5, 200);
      
    }
    endShape();
   
  }
  t+=0.1;
  z+=0.001*sin(t/12);
  if (t>99) t = 0;

  videoExport.saveFrame();
  if (millis() >= 25000) {
    noLoop();
    videoExport.endMovie();
  }
}

void keyPressed() {
  if (key == 's')
    //saveFrame("frame-#####.jpg");
    videoExport.endMovie();
}